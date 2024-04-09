-- CREATE DATABASE myDatabase;
-- USE myDatabase;

-- DROP DATABASE myDatabase;

CREATE DATABASE mySQLPractice;

CREATE TABLE team_mate (
	id INT PRIMARY KEY AUTO_INCREMENT, -- integar
    name VARCHAR(25) NOT NULL, -- needs a number in parenthesis
    hobby VARCHAR(75) NOT NULL,
    happiness INT NOT NULL,
    left_hand TINYINT NOT NULL, -- represents 0 or 1 for true or false
    pie_pizza_noodles VARCHAR(20),
    date_started_coding DATE
);

ALTER TABLE team_mate
MODIFY COLUMN hobby VARCHAR(255) NOT NULL;

-- Insert
INSERT INTO team_mate(name, hobby, happiness, left_hand, pie_pizza_noodles, date_started_coding)
VALUE
	('Mitch', 'diving', 4, 1, 'pizza', '2024-02-05'),
	('Jose', 'soccer', 3, 0, 'pizza', '2024-02-15'),
	('Anjali', 'gardening',4,0,'pizza', '2024-02-05'),
	('Ryan', 'Gaming', 3, 0, 'pizza', '2018-02-28'),
	('Nicole', 'tennis', 7, 0, 'pie', '2024-02-05'),
	('Kaitlyn', 'reading', 3, 0, 'noodles', '2018-02-23'),
	('Alex', 'hockey', 3, 0, 'noodles', '2018-02-04'),
	('Andrei', 'Drawing', 4, 0, 'noodles', '2015-09-01'),
	('Tre', 'crossfit', 4, 1, 'pizza', '2024-02-05'),
	('Eunhye', 'walking', 8, 0, 'pizza', '2024-02-05'),
	('Pete', 'collecting stuff', 9, 0, 'pie', '2024-02-05'),
	('Kyra', 'animation', 2, 0, 'pie', '2022-01-01'),
	('Tama', 'learning', 4, 0, 'pizza', '2009-01-01');
    
    ALTER TABLE team_mate AUTO_INCREMENT = 1;
    
-- if we get an error on the id number we will need to delete the data then reset the auto increment back to 1 then insert data gain.

-- WHERE CLAUSE
SELECT name, happiness, hobby FROM team_mate
WHERE pie_pizza_noodles = 'pizza';
-- Comparison Operators
SELECT * FROM team_mate WHERE happiness < 9;
SELECT * FROM team_mate WHERE happiness >= 3;
-- Logical Operators
SELECT * FROM team_mate WHERE pie_pizza_noodles = 'pie' OR pie_pizza_noodles = 'noodles';
SELECT * FROM team_mate WHERE pie_pizza_noodles = 'pizza' AND happiness > 5;
-- happiness is between 4 and 5
SELECT * FROM team_mate WHERE happiness BETWEEN 4 AND 5;
-- where in
SELECT * FROM team_mate WHERE pie_pizza_noodles IN ('pie', 'noodles');
-- Where Like
SELECT name, hobby FROM team_mate WHERE hobby LIKE 'c%'; -- any words starting with g
SELECT * FROM team_mate WHERE pie_pizza_noodles LIKE 'pizz_';
-- underline => single character can be anyhting, but take up that specific position
-- Distinct -- distinguish different unique factor
SELECT DISTINCT pie_pizza_noodles FROM team_mate;
-- Order by
SELECT * FROM team_mate ORDER BY happiness DESC;
SELECT * FROM team_mate ORDER BY happiness DESC, date_started_coding;
-- LIMIT CLAUSE --select only the amount of data entered
SELECT * FROM team_mate LIMIT 3;
SELECT * FROM team_mate LIMIT 10, 5; -- first parameter is excluding and second is quantity to show, unless only one and then its quantity
-- Count function
SELECT COUNT(*) FROM team_mate
WHERE happiness = 3;
SELECT COUNT(DISTINCT happiness) FROM team_mate; -- count unique values
-- AS
SELECT COUNT(DISTINCT happiness) AS unique_emotion FROM team_mate;
SELECT COUNT(*) AS noodle_lover FROM team_mate
WHERE pie_pizza_noodles = 'noodles';
-- AVG
SELECT AVG(happiness) AS average_happiness FROM team_mate;
-- MIN
SELECT MIN(happiness) AS minimum_happiness FROM team_mate;
-- MAX
SELECT MAX(happiness) AS very_happy FROM team_mate;
-- CONCAT
SELECT CONCAT (name, ' likes ', hobby) AS 'name and hobby' FROM team_mate;
-- GROUP BY
SELECT pie_pizza_noodles, AVG(happiness) AS average_happiness
FROM team_mate
GROUP BY pie_pizza_noodles
HAVING average_happiness > 5 -- condition to filter final result
ORDER BY average_happiness DESC;
-- UPDATE 
UPDATE team_mate SET hobby = 'sleepy' WHERE name= 'Tre';