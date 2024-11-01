-- "ECommerse".buyer definition

-- Drop table

-- DROP TABLE "ECommerse".buyer;

CREATE TABLE "ECommerse".buyer (
	id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT buyer_pkey PRIMARY KEY (id)
);