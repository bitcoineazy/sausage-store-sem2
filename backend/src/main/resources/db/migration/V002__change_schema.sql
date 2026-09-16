-- Normalize the schema: composite key and foreign keys for the order_product join table,
-- mandatory columns, sane defaults and a status check constraint.
ALTER TABLE order_product
    ALTER COLUMN order_id   SET NOT NULL,
    ALTER COLUMN product_id SET NOT NULL,
    ALTER COLUMN quantity   SET NOT NULL;

ALTER TABLE order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_id, product_id),
    ADD CONSTRAINT order_product_order_fk   FOREIGN KEY (order_id)   REFERENCES orders (id)  ON DELETE CASCADE,
    ADD CONSTRAINT order_product_product_fk FOREIGN KEY (product_id) REFERENCES product (id),
    ADD CONSTRAINT order_product_quantity_positive CHECK (quantity > 0);

ALTER TABLE orders
    ALTER COLUMN date_created SET DEFAULT CURRENT_DATE,
    ALTER COLUMN date_created SET NOT NULL,
    ALTER COLUMN status SET NOT NULL;

ALTER TABLE product
    ADD CONSTRAINT product_price_non_negative CHECK (price >= 0);
