--Знайти середній бал у групах з певного предмета.

SELECT 
	g.name AS group_name,
	ROUND(AVG(gr.grade), 2) AS average_grade 
FROM grades gr 
JOIN students s ON s.id = gr.student_id 
JOIN groups g ON g.id = s.group_id 
WHERE gr.subject_id = ?
GROUP BY g.id
ORDER BY average_grade DESC;
