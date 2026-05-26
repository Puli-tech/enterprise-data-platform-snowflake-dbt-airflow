WITH source_products AS (
    SELECT
        product_id,
        product_name,
        category,
        price
    FROM products
)

SELECT
    product_id,
    INITCAP(TRIM(product_name)) AS product_name,
    INITCAP(TRIM(category)) AS category,
    CAST(price AS DECIMAL(10,2)) AS price
FROM source_products
WHERE product_id IS NOT NULL
  AND price >= 0;
