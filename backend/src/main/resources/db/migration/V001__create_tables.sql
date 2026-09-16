-- Initial (denormalized) schema of the sausage store
CREATE TABLE IF NOT EXISTS product (
    id          BIGSERIAL PRIMARY KEY,
    name        VARCHAR(80) NOT NULL,
    picture_url VARCHAR(300),
    price       DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    id           BIGSERIAL PRIMARY KEY,
    date_created DATE,
    status       VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS order_product (
    order_id   BIGINT,
    product_id BIGINT,
    quantity   INTEGER
);
