WITH CTE AS (
    SELECT
        product_id, 
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT 
    s.product_id,
    cte.first_year,
    s.quantity,
    s.price
FROM sales s
JOIN CTE cte ON s.product_id = cte.product_id AND s.year = cte.first_year;