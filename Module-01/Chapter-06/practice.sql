-- Rank students by GPA within their department
SELECT Full_Name, Department, GPA,
	RANK() OVER (PARTITION BY Department
	ORDER BY GPA DESC) AS Dept_Rank
FROM Students;

-- Running total example (imagine a sales table with date, amount)
-- SUM(amount) OVER (ORDER BY Sale_Date) AS Running_Total

-- ROW_NUMBER vs RANK vs DENSE_RANK
SELECT Full_Name, GPA, 
	ROW_NUMBER() OVER (ORDER BY GPA 
DESC) AS Row_Num,
	RANK() OVER (ORDER BY GPA DESC) AS
RNK,
	DENSE_RANK() OVER (ORDER BY GPA
DESC) AS Dense_RNK
FROM Students;
	