-- 2.1 Categories
-- =====================================================
-- 2. CATEGORIES TABLE
-- =====================================================

CREATE TABLE categories (
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (category_id)
);

-- 2.2 Customers
-- =====================================================
-- 3. CUSTOMERS TABLE
-- =====================================================

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(50) DEFAULT NULL,
    email_id VARCHAR(50) DEFAULT NULL,
    phone VARCHAR(15) DEFAULT NULL,
    city VARCHAR(50) DEFAULT NULL,
    state VARCHAR(50) DEFAULT NULL,
    signup_date DATE DEFAULT NULL,
    PRIMARY KEY (customer_id)
);

-- 2.3 Products
-- -- =====================================================
-- 4. PRODUCTS TABLE
-- =====================================================

CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(50) DEFAULT NULL,
    category_id INT DEFAULT NULL,
    price DECIMAL(10,2) DEFAULT NULL,
    stock_quantity INT DEFAULT NULL,
    PRIMARY KEY (product_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

-- 2.4 Orders
-- =====================================================
-- 5. ORDERS TABLE
-- =====================================================

CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT DEFAULT NULL,
    order_date DATE DEFAULT NULL,
    order_status VARCHAR(50) DEFAULT NULL,
    total_amount DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (order_id),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 2.5 Order Items
-- =====================================================
-- 6. ORDER ITEM TABLE
-- =====================================================

CREATE TABLE order_item (
    order_item_id INT NOT NULL AUTO_INCREMENT,
    order_id INT DEFAULT NULL,
    product_id INT DEFAULT NULL,
    quantity INT DEFAULT NULL,
    unit_price DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (order_item_id),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- 2.6 Payments
-- =====================================================
-- 7. PAYMENTS TABLE
-- =====================================================

CREATE TABLE payments (
    payment_id INT NOT NULL AUTO_INCREMENT,
    order_id INT DEFAULT NULL,
    payment_date DATE DEFAULT NULL,
    amount DECIMAL(10,2) DEFAULT NULL,
    payment_method VARCHAR(50) DEFAULT NULL,
    payment_status VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (payment_id),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- 2.7 Reviews
-- =====================================================
-- 8. REVIEWS TABLE
-- =====================================================

CREATE TABLE reviews (
    review_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT DEFAULT NULL,
    rating INT DEFAULT NULL,
    product_id INT DEFAULT NULL,
    PRIMARY KEY (review_id),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CHECK (rating BETWEEN 1 AND 5)
);
