CREATE TABLE "ECommerse".promo (
    id serial PRIMARY KEY,
    code varchar(50) NOT NULL UNIQUE,
    discount_type_id Integer NOT NULL REFERENCES "ECommerse".discount_type(id),
    discount_value numeric(10, 2) NOT NULL CHECK (discount_value > 0),
    max_discount_value numeric(10, 2),
    start_date date NOT NULL,
    end_date date,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
	deleted_at timestamp NULL
);

CREATE TABLE "ECommerse".discount_type (
    id serial PRIMARY KEY,
    type varchar(20) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
	deleted_at timestamp NULL
);

INSERT INTO "ECommerse".discount_type (type)
VALUES 
    ('percentage'),
    ('flat');

INSERT INTO "ECommerse".promo (code, discount_type_id, discount_value, max_discount_value, start_date, end_date)
VALUES 
    ('DDDT845', 1, 5, 986385, '2024-05-01', '2024-05-30')