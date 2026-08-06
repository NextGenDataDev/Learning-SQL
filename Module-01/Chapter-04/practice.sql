CREATE TABLE Enrollments (
	Enrollment_ID SERIAL PRIMARY KEY,
	Student_ID INT REFERENCES Students(Student_ID),
	Course_Name VARCHAR(100)
);

INSERT INTO Enrollments (Student_ID, Course_Name) VALUES
(1, 'Database Systems'),
(1, 'Algorithms'),
(2, 'Compiler Design');

-- INNER JOIN: Only students who ARE enrolled.
SELECT s.Full_Name, e.Course_Name
FROM Student s
INNER JOIN Enrollments e ON s.Student_ID = e.Student_ID;

-- LEFT JOIN: ALL students, enrolled or not
SELECT s.Full_Name, e.Course_Name
FROM Student s
LEFT JOIN Enrollments e ON s.Student_ID = e.Student_ID;