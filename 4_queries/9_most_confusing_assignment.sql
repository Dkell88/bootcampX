-- SELECT assignments.id as id, assignments.name as name, assignments.day as day, assignments.chapter as chapter COUNT()
-- FROM assignments

-- SELECT COUNT(assistance_requests.assignment_id) as total_requests, assistance_requests.assignment_id 
-- FROM assistance_requests
-- GROUP BY assistance_requests.assignment_id 
-- ORDER BY total_requests DESC

SELECT assignments.id as id, assignments.name as name, assignments.day as day, assignments.chapter as chapter, COUNT(assistance_requests.assignment_id) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC

-- SELECT assignments.id, name, day, chapter, count(assistance_requests) as total_requests
-- FROM assignments
-- JOIN assistance_requests ON assignments.id = assignment_id
-- GROUP BY assignments.id
-- ORDER BY total_requests DESC;