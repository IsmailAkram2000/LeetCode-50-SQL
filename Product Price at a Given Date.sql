WITH CTE AS (
    SELECT 
        product_id,
        new_price AS price,
        change_date,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS num
    FROM Products 
    WHERE change_date <= '2019-08-16'
)

SELECT 
    product_id,
    price
FROM CTE
WHERE num = 1
UNION
SELECT 
    p.product_id,
    10 AS price
FROM Products p
LEFT JOIN CTE cte ON p.product_id = cte.product_id
WHERE cte.product_id IS NULL
GROUP BY p.product_id;