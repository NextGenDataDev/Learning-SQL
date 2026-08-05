-- Count how many books each author has in your Books table.
SELECT Author, COUNT(*) AS Num_Books
FROM Books
GROUP BY Author;

-- Find the average publication year of all books.
SELECT COUNT(*) AS Num_Books, AVG(Year_Published) AS Avg_Publication_Year
FROM Books;

-- Find only the authors who have more than 1 book (this requires HAVING).
SELECT Author, COUNT(*)
FROM Books
GROUP BY Author
HAVING COUNT(*) > 1;