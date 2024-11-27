WITH CTE AS (
    SELECT MAX(num) AS num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)

SELECT MAX(num) AS num FROM CTE;