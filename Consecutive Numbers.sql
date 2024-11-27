SELECT DISTINCT(l1.num) AS ConsecutiveNums
FROM Logs l1 
JOIN Logs l2 ON l2.id = l1.id + 1 AND l1.num = l2.num 
JOIN Logs l3 ON l3.id = l2.id + 1 AND l2.num = l3.num;