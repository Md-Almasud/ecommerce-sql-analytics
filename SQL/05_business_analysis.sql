-- Q1. Total Number of Customers
  
SELECT COUNT(*) AS total_customers
FROM customers;

-- Q2. Total Number of Products
  
SELECT COUNT(*) AS total_products
FROM products;

-- Q3. Total Orders
  
SELECT COUNT(*) AS total_orders
FROM orders;

-- Q4. Total Revenue
  
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM order_item;

-- Alternative using payments:

SELECT 
    SUM(amount) AS total_payment
FROM payments;

-- Q5. Average Order Value
  
SELECT 
    SUM(quantity * unit_price) / COUNT(DISTINCT order_id) AS average_order_value
FROM order_item;

-- Q6. Orders by Status
  
SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- Q7. Payment Methods
  
SELECT 
    payment_method,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_method;

-- Q8. Revenue by Month
  
SELECT 
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

-- Q9. Revenue by Category
  
SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories c

JOIN products p
    ON c.category_id = p.category_id

JOIN order_item oi
    ON p.product_id = oi.product_id

GROUP BY c.category_name
ORDER BY total_revenue DESC;

-- Q10. Revenue by Product
  
SELECT 
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p

JOIN order_item oi
    ON p.product_id = oi.product_id

GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Q11. Top-Selling Products
  
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM products p

JOIN order_item oi
    ON p.product_id = oi.product_id

GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- Q12. Top Customers
  
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_revenue
FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

GROUP BY c.customer_name
ORDER BY total_revenue DESC;

-- Q13. Customers with Multiple Orders
  
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

GROUP BY c.customer_name

HAVING COUNT(o.order_id) > 1

ORDER BY total_orders DESC;

-- Q14. Average Product Rating
  
SELECT 
    p.product_name,
    AVG(r.rating) AS average_rating
FROM products p

JOIN reviews r
    ON p.product_id = r.product_id

GROUP BY p.product_name

ORDER BY average_rating DESC;

-- Q15. Stock Available After Sales
  
SELECT
    p.product_name,
    p.stock_quantity - SUM(oi.quantity) AS stock_available
FROM products p

JOIN order_item oi
    ON p.product_id = oi.product_id

GROUP BY
    p.product_id,
    p.product_name,
    p.stock_quantity

ORDER BY stock_available ASC;

-- Q16. Top 5 Highest-Value Orders
  
SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    p.product_name,
    o.order_date,
    o.order_status,
    o.total_amount
FROM orders o

JOIN customers c
    ON o.customer_id = c.customer_id

JOIN order_item oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id

ORDER BY o.total_amount DESC

LIMIT 5;
