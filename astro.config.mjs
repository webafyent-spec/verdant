import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';
import vercel from '@astrojs/vercel';

export default defineConfig({
  site: 'https://verdant-liard-seven.vercel.app',
  compressHTML: true,
  output: 'server',
  adapter: vercel(),
  integrations: [sitemap()],
  vite: {
    plugins: [tailwindcss()]
  },
  security: {
    // Astro's built-in Origin-header CSRF check misfires behind Vercel's
    // proxy layer (a known @astrojs/vercel friction point), rejecting the
    // admin login form's own same-origin POST. Safe to disable here: the
    // only POST routes are /api/auth/signin (gated by the password itself)
    // and /api/auth/signout (worst case of a forged cross-site POST is an
    // unwanted logout). All product CRUD writes go straight from the
    // browser to Supabase's REST API with a bearer token, not through an
    // Astro endpoint, so they were never covered by this check anyway.
    checkOrigin: false,
  },
});
