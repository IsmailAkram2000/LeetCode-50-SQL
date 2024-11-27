WITH CTE AS (
    SELECT
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS first_order
    FROM Delivery
)

SELECT ROUND(SUM(order_date = customer_pref_delivery_date) / COUNT(*) * 100, 2) AS immediate_percentage
FROM CTE
WHERE first_order = 1;