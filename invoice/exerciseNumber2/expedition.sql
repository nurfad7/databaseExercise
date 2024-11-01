-- "ECommerse".expedition definition

-- Drop table

-- DROP TABLE "ECommerse".expedition;

CREATE TABLE "ECommerse".expedition (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT expedition_pkey PRIMARY KEY (id)
);