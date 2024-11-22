--Оцінки студентів у певній групі з певного предмета на останньому занятті.

SELECT 
	sub.name AS subject_name,
	s.fullname AS student_name,
	g.grade,
	MAX(g.grade_date) AS last_date
FROM grades g 
JOIN students s ON g.student_id = s.id 
JOIN subjects sub ON g.subject_id = sub.id 
WHERE s.group_id = ? AND sub.id = ?
