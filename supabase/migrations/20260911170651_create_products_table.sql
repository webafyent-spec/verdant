-- Products table for Trees of Jar admin-managed inventory

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  category text not null check (category in ('flower', 'edibles', 'concentrates', 'accessories', 'other')),
  strain_type text check (strain_type in ('indica', 'sativa', 'hybrid') or strain_type is null),
  price numeric(10,2) not null,
  weight_options text[],
  thc_percentage numeric(4,1),
  image_url text,
  in_stock boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists products_category_idx on products(category);
create index if not exists products_in_stock_idx on products(in_stock);

-- Keep updated_at current on every row update
create or replace function set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists products_set_updated_at on products;
create trigger products_set_updated_at
  before update on products
  for each row
  execute function set_updated_at();

-- ── Row Level Security ──────────────────────────────────────────────
alter table products enable row level security;

create policy "Public can view products"
  on products for select
  using (true);

create policy "Authenticated users can insert products"
  on products for insert
  to authenticated
  with check (true);

create policy "Authenticated users can update products"
  on products for update
  to authenticated
  using (true)
  with check (true);

create policy "Authenticated users can delete products"
  on products for delete
  to authenticated
  using (true);
