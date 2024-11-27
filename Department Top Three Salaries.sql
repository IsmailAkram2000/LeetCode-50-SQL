WITH CTE AS(
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rk
    FROM Department d
    JOIN Employee e ON e.departmentId = d.id
)

SELECT 
    Department,
    Employee,
    Salary
FROM CTE 
WHERE rk <= 3;