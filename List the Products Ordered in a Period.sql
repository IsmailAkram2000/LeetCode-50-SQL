SELECT
    product_name,
    SUM(unit) AS unit
FROM Products p
JOIN Orders o ON o.product_id = p.product_id AND order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY o.product_id
HAVING SUM(unit) >= 100;