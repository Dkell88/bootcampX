SELECT students.name AS student, avg(assignment_submissions.duration) AS assignement_duration_avg, avg(assignments.duration) as average_est_duration
FROM students 
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
GROUP BY student

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;