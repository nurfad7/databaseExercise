-- "ECommerse".payment_method_order definition

-- Drop table

-- DROP TABLE "ECommerse".payment_method_order;

CREATE TABLE "ECommerse".payment_method_order (
	order_id int4 NOT NULL,
	payment_method_id int4 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT payment_method_order_pkey PRIMARY KEY (order_id, payment_method_id)
);


-- "ECommerse".payment_method_order foreign keys

ALTER TABLE "ECommerse".payment_method_order ADD CONSTRAINT payment_method_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES "ECommerse"."order"(id);
ALTER TABLE "ECommerse".payment_method_order ADD CONSTRAINT payment_method_order_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES "ECommerse".payment_method(id);