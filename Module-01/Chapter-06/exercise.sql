-- Rank all books by publication year, most recent first.
SELECT Title, Author, Year_Published,
	RANK() OVER (
		ORDER BY Year_Published DESC
	) AS Yr_Rank
FROM Books;

-- USING PARTITION BY, rank students within each department separately.
SELECT Full_Name, Department, GPA,
	RANK() OVER (
		PARTITION BY Department
		ORDER BY GPA DESC
	) AS Dept_rank
FROM Students;