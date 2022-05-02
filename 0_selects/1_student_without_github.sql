SELECT id, name, email, cohort_id
FROM students
WHERE github IS NULL
Order BY cohort_id