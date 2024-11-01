-- "ECommerse".seller definition

-- Drop table

-- DROP TABLE "ECommerse".seller;

CREATE TABLE "ECommerse".seller (
	id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT seller_pkey PRIMARY KEY (id)
);