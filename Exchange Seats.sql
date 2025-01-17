SELECT 
    s1.id,
    COALESCE(s2.student, s1.student) AS student
FROM Seat s1
LEFT JOIN Seat s2 ON (s1.id % 2 AND s2.id = s1.id + 1) OR (s1.id % 2 = 0 AND s2.id = s1.id - 1);