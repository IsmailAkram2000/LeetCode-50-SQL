SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
Group BY teacher_id;