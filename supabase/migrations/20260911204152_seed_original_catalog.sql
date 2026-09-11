-- Restore the 19 demo products that were previously hardcoded directly into
-- Products.astro, now that the storefront reads live from this table.
-- Category/strain_type/weight_options didn't exist in the old static data,
-- so values below are reasonable inferences from the original badge/type text.

insert into products (name, description, category, strain_type, price, weight_options, image_url, in_stock) values
  ('DURBAN POISON', 'Pure Sativa Flower — Anise · Citrus · Pine', 'flower', 'sativa', 180, array['1g','3.5g','7g'], '/images/durban-poison.jpg', true),
  ('LEMON HAZE', 'Sativa Flower — Lemon · Citrus · Spice', 'flower', 'sativa', 175, array['1g','3.5g','7g'], '/images/lemon-haze.jpg', true),
  ('GREEN CRACK', 'Sativa Flower — Mango · Citrus · Earthy', 'flower', 'sativa', 185, array['1g','3.5g','7g'], '/images/green-crack.jpg', true),
  ('BLUE DREAM', 'Sativa-Dominant Hybrid — Berry · Vanilla · Haze', 'flower', 'hybrid', 190, array['1g','3.5g','7g'], '/images/blue-dream.jpg', true),
  ('JACK HERER', 'Sativa-Dominant Hybrid — Pine · Spice · Earthy', 'flower', 'hybrid', 195, array['1g','3.5g','7g'], '/images/jack-herer.jpg', true),
  ('GELATO', 'Hybrid Flower — Sweet · Citrus · Lavender', 'flower', 'hybrid', 240, array['1g','3.5g','7g'], '/images/gelato.jpg', true),
  ('OG KUSH', 'Hybrid Flower — Pine · Fuel · Lemon', 'flower', 'hybrid', 200, array['1g','3.5g','7g'], '/images/og-kush.jpg', true),
  ('SUNSET SHERBET', 'Indica-Dominant Hybrid — Berry · Citrus · Sweet', 'flower', 'indica', 210, array['1g','3.5g','7g'], '/images/sunset-sherbet.jpg', true),
  ('WEDDING CAKE', 'Indica-Dominant Hybrid — Vanilla · Earth · Pepper', 'flower', 'indica', 220, array['1g','3.5g','7g'], '/images/wedding-cake.jpg', true),
  ('CRITICAL CURE', 'CBD-Rich Flower · 1:1 — Earthy · Floral · Woody', 'flower', null, 170, array['1g','3.5g','7g'], '/images/critical-cure.jpg', true),
  ('PMB PURPLE', 'Indica Flower · Local Grow — Grape · Berry · Floral', 'flower', 'indica', 160, array['1g','3.5g','7g'], '/images/pmb-purple.jpg', true),
  ('GRANDADDY PURPLE', 'Indica Flower — Grape · Berry · Sweet', 'flower', 'indica', 195, array['1g','3.5g','7g'], '/images/grandaddy-purple.jpg', true),
  ('GOLDEN HOUR', 'Hybrid Live Resin Vape — Tropical · Diesel · Sweet', 'concentrates', null, 350, array['1g'], '/images/golden-hour.jpg', true),
  ('MINT CONDITION', 'Indica Distillate Vape — Spearmint · Cream · Pine', 'concentrates', null, 280, array['1g'], '/images/mint-condition.jpg', true),
  ('DARK FOREST', '72% Dark Chocolate · 100mg — Cocoa · Sea Salt · Cherry', 'edibles', null, 120, array['100mg'], '/images/dark-forest-chocolate.jpg', true),
  ('HONEY DROPS', 'Mixed Berry Gummies · 50mg — Berry · Citrus · Sweet', 'edibles', null, 150, array['50mg'], '/images/gummies.jpg', true),
  ('EMBER DROPS', 'Full Spectrum CBD:THC 4:1 — Earthy · Herbal · Clean', 'concentrates', null, 380, array['30ml'], '/images/tincture.jpg', true),
  ('NIGHT CAP', 'CBD:CBN Sleep Tincture — Chamomile · Lavender · Herbal', 'concentrates', null, 420, array['30ml'], '/images/nightcap-tincture.jpg', true),
  ('THE TREES OF JAR KIT', 'Premium Starter Pack — Grinder · Papers · Case', 'accessories', null, 280, array[]::text[], '/images/verdant-kit.jpg', true);
