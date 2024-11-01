CREATE OR REPLACE FUNCTION manage_invoice_snapshot(p_order_id int4)
RETURNS TABLE (
    header_id int4,
    buyer_name varchar,
    city varchar,
    street varchar,
    phone_number varchar,
    total_shipping_cost numeric,
    insurance_cost numeric,
    service_fee numeric,
    application_fee numeric,
    expedition_name varchar,
    payment_methods varchar,
    product_name varchar,
    price numeric,
    weight numeric,
    quantity int4,
    created_at timestamp
) AS $$
BEGIN
    -- Check if the invoice snapshot for the order already exists
    IF EXISTS (SELECT 1 FROM "ECommerse".invoice_snapshot_header WHERE order_id = p_order_id) THEN
        -- If exists, return the existing record with details
        RETURN QUERY
        SELECT 
            h.id AS header_id,
            h.buyer_name,
            h.city,
            h.street,
            h.phone_number,
            h.total_shipping_cost,
            h.insurance_cost,
            h.service_fee,
            h.application_fee,
            h.expedition_name,
            h.payment_methods,
            d.product_name,
            d.price,
            d.weight,
            d.quantity,
            h.created_at
        FROM "ECommerse".invoice_snapshot_header h
        JOIN "ECommerse".invoice_snapshot_detail d ON h.id = d.header_id
        WHERE h.order_id = p_order_id;
    ELSE
        -- Otherwise, create a new header snapshot
        INSERT INTO "ECommerse".invoice_snapshot_header (
            order_id, buyer_name, city, street, phone_number,
            total_shipping_cost, insurance_cost, service_fee,
            application_fee, expedition_name, payment_methods
        )
        SELECT 
            o.id,
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
        WHERE o.id = p_order_id
        GROUP BY o.id, b.name, a.city, a.street, a.phone_number, e.name
        RETURNING id INTO header_id;

        -- Insert product details for the order into the detail snapshot
        INSERT INTO "ECommerse".invoice_snapshot_detail (
            header_id, product_name, price, weight, quantity
        )
        SELECT 
            header_id,
            p.name AS product_name,
            p.price,
            p.weight,
            od.quantity
        FROM "ECommerse".order_detail od
        JOIN "ECommerse".product p ON od.product_id = p.id
        WHERE od.order_id = p_order_id;

        -- Return the newly created snapshot with details
        RETURN QUERY
        SELECT 
            h.id AS header_id,
            h.buyer_name,
            h.city,
            h.street,
            h.phone_number,
            h.total_shipping_cost,
            h.insurance_cost,
            h.service_fee,
            h.application_fee,
            h.expedition_name,
            h.payment_methods,
            d.product_name,
            d.price,
            d.weight,
            d.quantity,
            h.created_at
        FROM "ECommerse".invoice_snapshot_header h
        JOIN "ECommerse".invoice_snapshot_detail d ON h.id = d.header_id
        WHERE h.order_id = p_order_id;
    END IF;
END;
$$ LANGUAGE plpgsql;
