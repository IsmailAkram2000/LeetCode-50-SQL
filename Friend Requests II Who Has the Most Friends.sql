WITH CTE AS(
    SELECT 
        requester_id,
        COUNT(requester_id) AS sum_request
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT 
        accepter_id as requester_id,
        COUNT(accepter_id) AS sum_request
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT 
    requester_id AS id,
    SUM(sum_request) AS num
FROM CTE
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1;