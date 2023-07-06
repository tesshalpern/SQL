--Create a grocery store database 

CREATE TABLE foodshop (id INTEGER PRIMARY KEY, Item TEXT, Department TEXT, Price INTEGER, Popularity INTEGER); 

INSERT INTO foodshop VALUES (1, "Sandwhich", "Premade", 5.42, 85);
INSERT INTO foodshop VALUES (2, "Fresh Bread", "Bakery", 8.69, 60);
INSERT INTO foodshop VALUES (3, "Salami", "Refridgerated", 4.99, 30);
INSERT INTO foodshop VALUES (4, "Tomatoes", "Produce", 1.44, 45);
INSERT INTO foodshop VALUES (5, "Onions", "Produce", 1.67, 24);
INSERT INTO foodshop VALUES (6, "salsa", "Pantry", 4.79, 15);
INSERT INTO foodshop VALUES (7, "Chicken Salad", "Grocery", 5.44, 35);
INSERT INTO foodshop VALUES (8, "Beef Stroganoff", "Hot bar", 9.89, 40);
INSERT INTO foodshop VALUES (9, "Popcorn", "Pantry", 2.99, 65);
INSERT INTO foodshop VALUES (10, "Pineapple", "Produce", 2.77, 10);
INSERT INTO foodshop VALUES (11, "Tofu", "Refridgerated", 6.99, 15);
INSERT INTO foodshop VALUES (12, "Brisket", "Hot bar", 18.69, 90);
INSERT INTO foodshop VALUES (13, "Sweet Potatoes", "Produce", 3, 50);
INSERT INTO foodshop VALUES (14, "Thyme", "Produce", 2.20, 65);
INSERT INTO foodshop VALUES (15, "Basil", "Produce", 3.66, 75);

--display the database ordered by price.
SELECT * FROM foodshop ORDER BY (price);

--display the database ordered by department 
SELECT * FROM foodshop ORDER BY (Department); 

--what are the most 5 popular items? 
SELECT item, price, popularity
FROM foodshop
order by popularity desc
limit 5; 
