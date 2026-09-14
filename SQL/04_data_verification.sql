-- =====================================================
-- DATA VERIFICATION
-- =====================================================

SELECT * FROM categories;

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_item;

SELECT * FROM payments;

SELECT * FROM reviews;

-- To check row counts:

SELECT COUNT(*) AS total_categories
FROM categories;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_item;

SELECT COUNT(*) AS total_payments
FROM payments;

SELECT COUNT(*) AS total_reviews
FROM reviews;
