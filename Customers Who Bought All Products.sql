WITH CTE AS(
    SELECT
        customer_id,
        COUNT(DISTINCT product_key) AS distinct_product
    FROM Customer
    GROUP BY customer_id
)

SELECT customer_id 
FROM CTE 
WHERE distinct_product = (
    SELECT count(*) FROM Product
);