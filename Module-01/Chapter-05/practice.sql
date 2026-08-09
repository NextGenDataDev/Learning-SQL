-- Subquery in WHERE
SELECT Full_Name FROM Students
WHERE GPA > (SELECT AVG(GPA) FROM Students);

-- Subquery in FROM (treated like a temporary table)
SELECT Dept_Summary.Department, Dept_Summary.AVG_GPA
FROM (
	SELECT Department, AVG(GPA) AS AVG_GPA
	FROM Students
	GROUP BY Department
) AS Dept_Summary
WHERE Dept_Summary.AVG_GPA > 4.0;

-- UNION
SELECT Full_Name FROM Students
WHERE Department = 'Computer Science'
UNION
SELECT Full_Name FROM Students 
WHERE GPA > 4.5;