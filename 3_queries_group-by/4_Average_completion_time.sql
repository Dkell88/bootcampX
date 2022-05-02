SELECT students.name AS student, avg(assignment_submissions.duration) AS assignement_duration_avg
FROM students 
JOIN assignment_submissions ON students.id = student_id
WHERE end_date IS NULL
GROUP BY student
ORDER BY avg(assignment_submissions.duration) DESC;