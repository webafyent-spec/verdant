// Browser Supabase client — safe to import in client-side <script> blocks.
// Uses the publishable key only. All writes are still gated by Postgres RLS,
// which requires an authenticated session (see supabase/migrations).
import { createBrowserClient } from '@supabase/ssr';

export function createClient() {
  return createBrowserClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY
  );
}
