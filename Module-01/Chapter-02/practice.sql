-- Filter
SELECT * 
FROM Students 
WHERE GPA > 4.30;
-- "gpa > 4.30" is the condition.

-- Multiple conditions
SELECT *
FROM Students
WHERE Department = 'Computer Science' AND GPA >= 4.0;

-- Pattern Matching
SELECT *
FROM Students
WHERE Full_name LIKE 'A%';
-- starts with an A

-- Sorting
SELECT *
FROM students 
ORDER BY GPA DESC;

-- Top N
SELECT * 
FROM Students
ORDER BY GPA DESC
LIMIT 2;

-- Unique values only
SELECT DISTINCT department
FROM Students;