-- Find all books published above the average publication year (subquery in WHERE)
SELECT Title FROM Books
WHERE Year_Published > (SELECT AVG(Year_Published) FROM Books);

-- Using your Students table, find departments where the average GPA 
-- beats the overall average GPA (subquery comparing group averages to
-- a grand average).
SELECT department, AVG(GPA) AS AVG_GPA
FROM Students
GROUP BY Department
HAVING AVG(GPA) > (
	SELECT AVG(GPA)
	FROM Students
);