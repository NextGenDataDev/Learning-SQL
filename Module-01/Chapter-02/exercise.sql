-- From your Books table, find all books published after 2015.
SELECT *
FROM Books
WHERE Year_published > 2015;

-- Find all books whose title contains the word "the" (case insensitive).
SELECT *
FROM Books
WHERE Title ILIKE '%the%';

-- Get the 3 most recently published books.
SELECT *
FROM Books
ORDER BY Year_published DESC LIMIT 3;