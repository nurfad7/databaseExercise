-- "ECommerse"."order" definition

-- Drop table

-- DROP TABLE "ECommerse"."order";

CREATE TABLE "ECommerse"."order" (
	id serial4 NOT NULL,
	buyer_id int4 NOT NULL,
	address_id int4 NOT NULL,
	expedition_id int4 NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT order_pkey PRIMARY KEY (id)
);


-- "ECommerse"."order" foreign keys

ALTER TABLE "ECommerse"."order" ADD CONSTRAINT order_address_id_fkey FOREIGN KEY (address_id) REFERENCES "ECommerse".address(id);
ALTER TABLE "ECommerse"."order" ADD CONSTRAINT order_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES "ECommerse".buyer(id);
ALTER TABLE "ECommerse"."order" ADD CONSTRAINT order_expedition_id_fkey FOREIGN KEY (expedition_id) REFERENCES "ECommerse".expedition(id);