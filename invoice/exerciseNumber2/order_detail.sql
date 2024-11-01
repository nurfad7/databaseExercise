-- "ECommerse".order_detail definition

-- Drop table

-- DROP TABLE "ECommerse".order_detail;

CREATE TABLE "ECommerse".order_detail (
	id serial4 NOT NULL,
	order_id int4 NOT NULL,
	product_id int4 NOT NULL,
	product_name_snapshot varchar(100) NOT NULL,
	price_snapshot numeric(10, 2) NOT NULL,
	weight_snapshot numeric(10, 2) NOT NULL,
	quantity int4 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT order_detail_pkey PRIMARY KEY (id),
	CONSTRAINT order_detail_quantity_check CHECK ((quantity > 0))
);


-- "ECommerse".order_detail foreign keys

ALTER TABLE "ECommerse".order_detail ADD CONSTRAINT order_detail_order_id_fkey FOREIGN KEY (order_id) REFERENCES "ECommerse"."order"(id);
ALTER TABLE "ECommerse".order_detail ADD CONSTRAINT order_detail_product_id_fkey FOREIGN KEY (product_id) REFERENCES "ECommerse".product(id);