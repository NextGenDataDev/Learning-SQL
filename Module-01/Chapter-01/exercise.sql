-- Exercise One
DROP TABLE IF EXISTS Books;

-- Create a table 'Books' with columns for Book_ID, Title, Author, Year_Published, Genre.
CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(30),
	Year_Published NUMERIC(4,0),
	Genre VARCHAR(20)
);

-- Insert 5 books of your choice.
INSERT INTO Books(Title, Author, Year_Published, Genre) VALUES
('Atomic Habits', 'James Clear', 2018, 'Self-development'),
('The Night Circus', 'Erin Morgenstern', 2011, 'Fantasy'),
('Omniscient Reader''s Viewpoint', 'Sing Shong', 2018, 'Fantasy'),
('Solo Leveling', 'Chugong', 2016, 'Action'),
('The Psychology Of Money', 'Morgan Housel', 2020, 'Finance');

-- Write a query to select only the 'Title' and 'Author'.
SELECT Title, Author
FROM Books;


-- Exercise Two
DROP TABLE IF EXISTS Anime_List;

-- Create a table 'Anime_List' with columns for Anime_ID, Title, Producer, Year_Released, Genres.
CREATE TABLE Anime_List(
	Anime_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Producer VARCHAR(30),
	Year_Released NUMERIC(4),
	Genres VARCHAR(30)
);

-- Insert 5 anime of your choice.
INSERT INTO Anime_List (Title, Producer, Year_Released, Genres) VALUES
('Frieren: Beyond Journey''s End', 'Madhouse', 2023, 'Fantasy, Adventure, Drama'),
('Violet Evergarden', 'Kyoto Animation', 2016, 'Drama, Slice of Life, Fantasy'),
('Mob Psycho 100', 'Bones', 2016, 'Action, Comedy, Supernatural'),
('Psycho-Pass', 'Production I.G', 2012, 'Sci-Fi, Psychological, Crime'),
('Haikyuu!!', 'Production I.G', 2014, 'Sports, Comedy, Drama');

-- Write a query to select only the 'Title' and 'Genres'.
SELECT Title, Genres
FROM Anime_List;