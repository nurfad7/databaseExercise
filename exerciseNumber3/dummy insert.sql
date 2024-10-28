-- Buyer data
INSERT INTO "ECommerse".buyer (name, created_at, updated_at) VALUES 
    ('Sum Ting Wong', NOW(), NOW());

-- Address data
INSERT INTO "ECommerse".address (buyer_id, city, street, phone_number, created_at, updated_at) VALUES 
    (1, 'Batam', 'Digital Park', '6281312341234', NOW(), NOW());

-- Seller data
INSERT INTO "ECommerse".seller (name, created_at, updated_at) VALUES 
    ('COC Komputer', NOW(), NOW());

-- Product data
INSERT INTO "ECommerse".product (name, seller_id, price, weight, created_at, updated_at) VALUES 
    ('SAPPHIRE NITRO+ Radeon RX 7900 XTX 24GB', 1, 20500000.00, 5.0, NOW(), NOW());

-- Expedition data (Courier Service)
INSERT INTO "ECommerse".expedition (name, created_at, updated_at) VALUES 
    ('J&T - Reguler', NOW(), NOW());

-- Order data
INSERT INTO "ECommerse"."order" (buyer_id, address_id, expedition_id, created_at, updated_at) VALUES 
    (1, 1, 1, '2024-05-22', NOW());

-- Order Detail data
INSERT INTO "ECommerse".order_detail (order_id, product_id, quantity, created_at, updated_at) VALUES 
    (1, 1, 1, NOW(), NOW());

-- Payment Method data
INSERT INTO "ECommerse".payment_method (name, created_at, updated_at) VALUES 
    ('BCA Virtual Account', NOW(), NOW()),
    ('GoPay Coins', NOW(), NOW());

-- Payment Method Order data (indicating which payment methods were used for this order)
INSERT INTO "ECommerse".payment_method_order (order_id, payment_method_id, created_at, updated_at) VALUES 
    (1, 1, NOW(), NOW()),
    (1, 2, NOW(), NOW());
