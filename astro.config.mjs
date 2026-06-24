import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://verdant-liard-seven.vercel.app',
  compressHTML: true,
  integrations: [sitemap()],
  vite: {
    plugins: [tailwindcss()]
  }
});
