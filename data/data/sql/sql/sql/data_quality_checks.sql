-- Check for duplicate customers
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check for null customer IDs
SELECT *
FROM customers
WHERE customer_id IS NULL;

-- Check for negative transaction amounts
SELECT *
FROM transactions
WHERE total_amount < 0;

-- Check for orphan customer references
SELECT t.*
FROM transactions t
LEFT JOIN customers c
ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Check for orphan product references
SELECT t.*
FROM transactions t
LEFT JOIN products p
ON t.product_id = p.product_id
WHERE p.product_id IS NULL;
