WITH CTE AS (
    SELECT
        player_id,
        event_date,
        ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS num
    FROM Activity
)

SELECT 
    ROUND(COUNT(*) / (
        SELECT COUNT(DISTINCT player_id)
        FROM Activity
    ), 2) AS fraction
FROM CTE c1
JOIN CTE c2 
    ON c1.player_id = c2.player_id 
    AND c1.num = 1 
    AND c2.num = 2 
    AND DATE_ADD(c2.event_date, INTERVAL -1 DAY) = c1.event_date;