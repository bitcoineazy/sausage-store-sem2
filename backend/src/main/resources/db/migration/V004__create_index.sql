-- Indexes for the reporting queries (orders by status / period, join table lookups)
CREATE INDEX IF NOT EXISTS orders_status_idx        ON orders (status);
CREATE INDEX IF NOT EXISTS orders_date_created_idx  ON orders (date_created);
CREATE INDEX IF NOT EXISTS order_product_product_idx ON order_product (product_id);
