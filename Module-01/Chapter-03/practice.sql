-- Basic aggregates
SELECT COUNT(*) FROM Students;
SELECT AVG(GPA) FROM Students;

-- Group by department
SELECT Department, COUNT(*) AS Num_Students, AVG(GPA AS Avg_GPA
FROM Students
GROUP BY Department;

-- Filter groups (not rows!) with HAVING
SELECT Department, AVG(GPA) AS Avg_GPA
FROM Students
GROUP BY Department
HAVING AVG(GPA) > 4.0;