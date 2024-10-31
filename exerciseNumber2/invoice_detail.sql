CREATE TABLE "ECommerse".invoice_snapshot_detail (
    id serial PRIMARY KEY,
    header_id integer NOT NULL REFERENCES "ECommerse".invoice_snapshot_header(id),
    product_name varchar(100) NOT NULL,
    price numeric(10, 2) NOT NULL,
    weight numeric(10, 2) NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
	  deleted_at timestamp NULL
);