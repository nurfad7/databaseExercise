CREATE TABLE "ECommerse".expedition_price (
    id serial PRIMARY KEY,
    expedition_id integer NOT NULL REFERENCES "ECommerse".expedition(id),
    city_from varchar(20) NOT NULL,
    city_to varchar(20) NOT NULL,
    price numeric(10, 2) NOT NULL CHECK (price >= 0),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp NULL
);

INSERT INTO "ECommerse".expedition_price (expedition_id, city_from, city_to, price)
VALUES 
    (1, 'Tanah Abang', 'Batam', 20500.00);