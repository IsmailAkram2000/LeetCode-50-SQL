SELECT results 
FROM (
    SELECT 
        u.name AS results, 
        COUNT(mr.movie_id) AS movie_count
    FROM MovieRating mr
    JOIN Users u ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY movie_count DESC, u.name ASC
    LIMIT 1
) AS MostRatedUser

UNION ALL

SELECT results 
FROM (
    SELECT 
        m.title AS results,
        AVG(mr.rating) as average_rating
    FROM MovieRating mr
    JOIN Movies m ON m.movie_id = mr.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id
    ORDER BY average_rating DESC, m.title ASC
    LIMIT 1
) AS HighestRatedMovie;