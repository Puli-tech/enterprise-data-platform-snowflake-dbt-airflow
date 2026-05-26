WITH customers AS (
    SELECT *
    FROM stg_customers
),

products AS (
    SELECT *
    FROM stg_products
),

transactions AS (
    SELECT *
    FROM stg_transactions
)

SELECT
    t.transaction_id,
    t.transaction_date,
    t.customer_id,
    c.customer_name,
    c.city,
    c.state,
    t.product_id,
    p.product_name,
    p.category,
    t.quantity,
    p.price AS unit_price,
    t.total_amount,
    t.payment_method,
    DATE_TRUNC('month', t.transaction_date) AS sales_month
FROM transactions t
LEFT JOIN customers c
    ON t.customer_id = c.customer_id
LEFT JOIN products p
    ON t.product_id = p.product_id;
