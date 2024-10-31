--header
SELECT
    'INV/' || TO_CHAR(o.created_at, 'MMDDYYYY') || '/MPL/' || o.id as invoice_number,
    b.name AS buyer_name,
    a.city,
    a.street,
    a.phone_number,
    126.00 AS total_shipping_cost, -- Invoice example values
    57700.00 AS insurance_cost,
    1000.00 AS service_fee,
    1000.00 AS application_fee,
    e.name AS expedition_name,
    STRING_AGG(pm.name, ', ') AS payment_methods
FROM "ECommerse"."order" o
    JOIN "ECommerse".buyer b ON o.buyer_id = b.id
    JOIN "ECommerse".address a ON o.address_id = a.id
    JOIN "ECommerse".expedition e ON e.id = o.expedition_id
    JOIN "ECommerse".payment_method_order pmo ON pmo.order_id = o.id
    JOIN "ECommerse".payment_method pm ON pm.id = pmo.payment_method_id
WHERE o.id = 1
GROUP BY o.id, b.name, a.city, a.street, a.phone_number, e.name
--detail
SELECT 
    'INV/' || TO_CHAR(o.created_at, 'MMDDYYYY') || '/MPL/' || o.id as invoice_number,
    p.name AS product_name,
    p.price,
    p.weight,
    od.quantity
FROM "ECommerse"."order" o
	join "ECommerse".order_detail od on o.id = od.order_id 
    JOIN "ECommerse".product p ON od.product_id = p.id
WHERE od.order_id = 1;