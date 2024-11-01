-- "ECommerse".payment_method definition

-- Drop table

-- DROP TABLE "ECommerse".payment_method;

CREATE TABLE "ECommerse".payment_method (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT payment_method_pkey PRIMARY KEY (id)
);