WITH source_transactions AS (
    SELECT
        transaction_id,
        customer_id,
        product_id,
        transaction_date,
        quantity,
        total_amount,
        payment_method
    FROM transactions
)

SELECT
    transaction_id,
    customer_id,
    product_id,
    CAST(transaction_date AS DATE) AS transaction_date,
    CAST(quantity AS INT) AS quantity,
    CAST(total_amount AS DECIMAL(10,2)) AS total_amount,
    INITCAP(TRIM(payment_method)) AS payment_method
FROM source_transactions
WHERE transaction_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND product_id IS NOT NULL
  AND quantity > 0
  AND total_amount >= 0;
