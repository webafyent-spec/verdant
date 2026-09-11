// Server-side Supabase client for Astro SSR (middleware + .astro frontmatter).
// Reads/writes the auth session via HTTP-only cookies so route protection
// can be enforced server-side, before any page markup is sent to the client.
import { createServerClient } from '@supabase/ssr';

function parseCookieHeader(header) {
  if (!header) return [];
  return header.split(';').map((pair) => {
    const idx = pair.indexOf('=');
    const name = decodeURIComponent(pair.slice(0, idx).trim());
    const value = decodeURIComponent(pair.slice(idx + 1).trim());
    return { name, value };
  });
}

export function createServerSupabaseClient(context) {
  return createServerClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY,
    {
      cookies: {
        getAll() {
          return parseCookieHeader(context.request.headers.get('cookie'));
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => {
            context.cookies.set(name, value, { ...options, path: '/' });
          });
        },
      },
    }
  );
}
