// Plain anonymous Supabase client for public, unauthenticated reads
// (the storefront product grid). No cookie/session handling needed here —
// RLS already allows public SELECT on products.
import { createClient } from '@supabase/supabase-js';

export function createPublicClient() {
  return createClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY
  );
}
