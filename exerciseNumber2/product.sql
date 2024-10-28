-- "ECommerse".product definition

-- Drop table

-- DROP TABLE "ECommerse".product;

CREATE TABLE "ECommerse".product (
	id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	seller_id int4 NOT NULL,
	price numeric(10, 2) NOT NULL,
	weight numeric(10, 2) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id),
	CONSTRAINT product_price_check CHECK ((price > (0)::numeric)),
	CONSTRAINT product_weight_check CHECK ((weight > (0)::numeric))
);


-- "ECommerse".product foreign keys

ALTER TABLE "ECommerse".product ADD CONSTRAINT product_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES "ECommerse".seller(id);