WITH CTE AS(
    SELECT     
        visited_on, 
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT 
    visited_on,
    amount,
    average_amount
FROM (
    SELECT 
        MAX(c2.visited_on) AS visited_on,
        SUM(c2.amount) AS amount,
        ROUND(AVG(c2.amount), 2) AS average_amount,
        ROW_NUMBER() OVER(PARTITION BY MAX(c2.visited_on) ORDER BY MAX(c2.visited_on) DESC) AS num
    FROM CTE c1
    JOIN CTE c2 ON c2.visited_on BETWEEN c1.visited_on AND DATE_ADD(c1.visited_on, INTERVAL 6 DAY)
    WHERE c1.visited_on <= c2.visited_on
    GROUP BY c1.visited_on
) AS alias
WHERE num = 1