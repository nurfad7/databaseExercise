CREATE TABLE "ECommerse".invoice_snapshot_header (
    id serial NOT NULL PRIMARY KEY,
    order_id int4 NOT NULL UNIQUE,
    buyer_name varchar(100) NOT NULL,
    city varchar(20) NOT NULL,
    street varchar(20) NOT NULL,
    phone_number varchar(15) NOT NULL,
    total_shipping_cost numeric(10, 2) NOT NULL,
    insurance_cost numeric(10, 2) NOT NULL,
    service_fee numeric(10, 2) NOT NULL,
    application_fee numeric(10, 2) NOT NULL,
    expedition_name varchar(50) NOT NULL,
    payment_methods varchar(100) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
	  deleted_at timestamp NULL
);