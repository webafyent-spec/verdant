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
  }
});
