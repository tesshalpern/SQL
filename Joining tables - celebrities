CREATE TABLE Stars
(id INTEGER PRIMARY KEY,
Name TEXT,
occupation_id INTEGER);

INSERT INTO Stars VALUES (1, "Leonardo Dicaprio", 1);
INSERT INTO Stars VALUES (2,"Iliza Shlesinger", 4);
INSERT INTO Stars VALUES (3,"Jerry Seinfeld", 4);
INSERT INTO Stars VALUES (4, "Cary Grant", 1);
INSERT INTO Stars VALUES (5, "Daniel Radcliff", 1);
INSERT INTO Stars VALUES (6, "JK Rowling", 5);
INSERT INTO Stars VALUES (7, "Reese Witherspoon", 1);
INSERT INTO Stars VALUES (8, "Jennifer Aniston", 1);

CREATE TABLE Profession
(ID INTEGER PRIMARY KEY,
Occupation TEXT); 
INSERT INTO Profession VALUES (1, "Actor");
INSERT INTO Profession VALUES (2, "Musician");
INSERT INTO Profession VALUES (3, "Model");
INSERT INTO Profession VALUES (4, "Comedian"); 
INSERT INTO Profession VALUES (5, "Authors");


CREATE TABLE works_of_art
(id INTEGER PRIMARY KEY, title_of_work TEXT);


INSERT INTO works_of_art VALUES (1, "The Wolf Of Wall Street");
INSERT INTO works_of_art VALUES (2, "Elder Millenial");
INSERT INTO works_of_art VALUES (3, "Seinfeld");
INSERT INTO works_of_art VALUES (4, "Harvey");
INSERT INTO works_of_art VALUES (5, "Harry Potter");
INSERT INTO works_of_art VALUES (6, "The Morning Show");


CREATE TABLE collab
(workofart_id INTEGER, star_id INTEGER);

INSERT INTO collab VALUES (5, 5);
INSERT INTO collab VALUES (5, 6);
INSERT INTO collab VALUES (6, 7);
INSERT INTO collab VALUES (6, 8);

-- Show the name of celebrities & project they collaborated on by pulling data from three tables
SELECT title_of_work AS Collaborations, s.name
FROM collab
JOIN works_of_Art w ON w.id = collab.workofart_id
JOIN Stars s ON S.id = collab.star_id;

-- Show the name & occupation of celebrities by pulling data from two tables
SELECT Occupation, Name
FROM Stars s
JOIN Profession ON Profession.id = S.occupation_id;

-- Show the name of celebrity & title of one of their projects by pulling data from two tables
SELECT Name, title_of_work 
FROM Stars 
JOIN works_of_art ON works_of_art.id = Stars.id;

