-- "ECommerse".address definition

-- Drop table

-- DROP TABLE "ECommerse".address;

CREATE TABLE "ECommerse".address (
	id serial4 NOT NULL,
	buyer_id int4 NOT NULL,
	city varchar(20) NOT NULL,
	street varchar(20) NOT NULL,
	phone_number varchar(15) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT address_pkey PRIMARY KEY (id)
);


-- "ECommerse".address foreign keys

ALTER TABLE "ECommerse".address ADD CONSTRAINT address_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES "ECommerse".buyer(id);