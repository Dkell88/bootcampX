SELECT students.name AS student, avg(assignment_submissions.duration) AS assignement_duration_avg, avg(assignments.duration) as average_est_duration
FROM students 
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
GROUP BY student