CREATE TABLE customers (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(10),
    signup_date DATE
);

CREATE TABLE products (
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(10),
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    transaction_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(50)
);
