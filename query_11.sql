--Середній бал, який певний викладач ставить певному студентові.

SELECT 
	t.fullname AS teacher_name,
	s.fullname AS student_name,
	ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN students s ON g.student_id = s.id 
JOIN subjects sub ON g.subject_id = sub.id 
JOIN teachers t ON sub.teacher_id = t.id 
WHERE t.id = ? AND s.id = ?
