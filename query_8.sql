--Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT 	
	t.fullname AS teacher_name,
	ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN subjects sub ON g.subject_id = sub.id 
JOIN teachers t ON sub.teacher_id = t.id 
WHERE t.id = ?
