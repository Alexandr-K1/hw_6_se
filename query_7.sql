--Знайти оцінки студентів у окремій групі з певного предмета.

SELECT 	
	s.group_id,
	s.fullname AS student_name,
	g.grade
FROM grades g
JOIN students s ON g.student_id = s.id 
JOIN subjects sub ON g.subject_id = sub.id 
WHERE sub.id = ? AND s.group_id = ?
ORDER BY s.fullname  
