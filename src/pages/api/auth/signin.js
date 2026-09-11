import { createServerSupabaseClient } from '../../../lib/supabase-server.js';

export const prerender = false;

export async function POST(context) {
  const form = await context.request.formData();
  const email = String(form.get('email') || '').trim();
  const password = String(form.get('password') || '');

  if (!email || !password) {
    return context.redirect('/admin/login?error=missing');
  }

  const supabase = createServerSupabaseClient(context);
  const { error } = await supabase.auth.signInWithPassword({ email, password });

  if (error) {
    return context.redirect('/admin/login?error=invalid');
  }

  return context.redirect('/admin/dashboard');
}
