-- Your first query
SELECT 'Hello, database' AS Students;

-- Create a simple table
CREATE TABLE Students (
	Student_ID SERIAL PRIMARY KEY,
	Full_name VARCHAR(100),
	Department VARCHAR(50),
	GPA NUMERIC(3,2)
);

-- Insert sample data
INSERT INTO Students (Full_name, Department, GPA) VALUES
('Ada Lovelace', 'Computer Science', 4.50),
('Grace Hopper', 'Computer Science', 4.20),
('Alan Turing', 'Mathematics', 4.80);

-- Retrieve it
SELECT * FROM Students;