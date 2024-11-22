--Знайти список курсів, які відвідує студент.

SELECT 
	sub.name AS course_name
FROM subjects sub
JOIN grades g ON sub.id = g.subject_id 
WHERE g.student_id = ?
GROUP BY sub.name 
ORDER BY sub.name
