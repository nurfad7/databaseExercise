CREATE TABLE "ECommerse".insurance (
    id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    cost numeric(10, 2) NOT NULL CHECK (cost >= 0),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO "ECommerse".insurance (name, cost)
VALUES 
    ('Insuransi Pengiriman', 57700.00);