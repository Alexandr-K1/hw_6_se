--Знайти студента із найвищим середнім балом з певного предмета.

SELECT 
    s.id, 
    s.fullname AS student_name, 
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
WHERE g.student_id = 1
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 1;
