import { defineMiddleware } from 'astro:middleware';
import { createServerSupabaseClient } from './lib/supabase-server.js';

export const onRequest = defineMiddleware(async (context, next) => {
  const { pathname } = context.url;

  if (!pathname.startsWith('/admin')) {
    return next();
  }

  // Login page itself must stay reachable — everything else under /admin
  // requires a valid session, checked server-side before any markup renders.
  if (pathname === '/admin/login') {
    return next();
  }

  const supabase = createServerSupabaseClient(context);
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return context.redirect('/admin/login');
  }

  context.locals.user = user;
  context.locals.supabase = supabase;

  return next();
});
