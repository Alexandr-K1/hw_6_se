--Список курсів, які певному студенту читає певний викладач.

SELECT 
	sub.name AS course_name
FROM subjects sub
JOIN grades g ON sub.id = g.subject_id 
JOIN teachers t ON sub.teacher_id = t.id 
WHERE g.student_id = ? AND t.id = ?
GROUP BY sub.name 
ORDER BY sub.name 
