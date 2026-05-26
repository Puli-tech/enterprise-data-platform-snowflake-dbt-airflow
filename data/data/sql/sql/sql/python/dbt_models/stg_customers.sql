WITH source_customers AS (
    SELECT
        customer_id,
        customer_name,
        email,
        city,
        state,
        signup_date
    FROM customers
)

SELECT
    customer_id,
    INITCAP(TRIM(customer_name)) AS customer_name,
    LOWER(TRIM(email)) AS email,
    INITCAP(TRIM(city)) AS city,
    UPPER(TRIM(state)) AS state,
    CAST(signup_date AS DATE) AS signup_date
FROM source_customers
WHERE customer_id IS NOT NULL;
