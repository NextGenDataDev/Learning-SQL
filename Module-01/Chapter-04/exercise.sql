DROP TABLE IF EXISTS Borrowers;

-- Add a Borrowers table linked to your Books table (one borrower can borrow one book - simple 1:1 for practice),
CREATE TABLE Borrowers (
	Borrower_ID SERIAL PRIMARY KEY,
	Book_ID INT REFERENCES Books(Book_ID),
	Borrower_Name VARCHAR(100)
);

INSERT INTO Borrowers (Book_ID, Borrower_Name)
VALUES
(2, 'Qing Madi'),
(4, 'Afnan Khalifa'),
(5, 'Leila Hormozi');

-- Write an INNER JOIN showing which books have been borrowed.
SELECT bk.Title, br.Borrower_Name 
FROM Books bk
INNER JOIN Borrowers br 
ON bk.Book_ID = br.Book_ID;

-- Write a LEFT JOIN showing ALL books, borrowed or not - this is the query would actually want.
SELECT bk.Title, br.Borrower_Name
FROM Books bk
LEFT JOIN Borrowers br 
ON bk.Book_ID = br.Book_ID;

-- Trying out the RIGHT JOIN
SELECT bk.Title, br.Borrower_Name
FROM Books bk
RIGHT JOIN Borrowers br
ON bk.Book_ID = br.Book_ID;