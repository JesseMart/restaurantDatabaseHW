

-- CREATE TABLE restaurantTable (
--     restID SERIAL PRIMARY KEY NOT NULL,
--     name varchar(55) NOT NULL,
--     distanceMI float(2) NOT NULL,
--     stars integer NOT NULL,
--     category varchar(55) NOT NULL,
--     favoriteDish varchar(55) NOT NULL,
--     doesTakeout BOOLEAN NOT NULL,
--     lastVisit date NOT NULL

-- );


-- SELECT * FROM restaurantTable;

-- INSERT INTO restaurantTable VALUES
-- (DEFAULT, 'Abu Omar', 2.5, 5, 'Indian', 'Chicken Shwarma', 'yes', '3/2/2020'),
-- (DEFAULT, 'Whataburger', 2.2, 5, 'American', 'Patty Melt', 'yes', '3/4/2020'),
-- (DEFAULT, 'La Michoacana', 1.2, 5, 'Mexican', 'Lunch Palte', 'yes', '3/6/2020');

---GET QUERIES 
---1)2)  show 5 star restaurants names and dishes
SELECT name, favoriteDish FROM restaurantTable WHERE stars = 5;

---3) id of the restaurant by its specific name
SELECT name, restID FROM restaurantTable WHERE name = 'Whataburger';
---4) restaurant name by category
SELECT name, category FROM restaurantTable WHERE category = 'American';
---5) restaurant that do take out
SELECT name, doesTakeout FROM restaurantTable WHERE doesTakeout = 't';
---6) restaurant that do takkeout and category is american
SELECT name, doesTakeout, category FROM restaurantTable WHERE doesTakeout = 't' AND category = 'American';
---7) restaurant within two miles
SELECT name, distanceMI FROM restaurantTable WHERE distanceMI < 2;
---8) restaurant you havent ate in the last week
SELECT name, lastVisit FROM restaurantTable WHERE CURRENT_DATE - lastVisit > 7;
---9) restaurants you havnt ate at in the last wek and has 5 stars
SELECT name, lastVisit, stars FROM restaurantTable WHERE CURRENT_DATE - lastVisit > 7 AND stars = 5;


---AGGREGATION AND SORTING 

---1) list restaurants by the closest distance
SELECT name, distanceMI FROM restaurantTable ORDER BY distanceMI ASC;
---2) list the top 2 restaurants by distance
SELECT name, distanceMI FROM restaurantTable ORDER BY distanceMI ASC LIMIT 2;
---3) list the top 2 restaurants by stars
SELECT name, stars FROM restaurantTable ORDER BY stars ASC LIMIT 2;
---4) list the top 2 restaurants by stars where the distance is less than 2 miles
SELECT name, stars, distanceMI FROM restaurantTable WHERE distanceMI < 2 ORDER BY stars ASC LIMIT 2;
--5) count the number of restaurant in the db
SELECT COUNT(*) FROM restaurantTable;
--6) count the number of restaurants by category
SELECT category,COUNT(*) FROM restaurantTable GROUP by  category;
--7) get the average stars per restaurant by category
SELECT category,AVG(stars) FROM restaurantTable group by category;
---8) get the max stars of a restaurant by category
SELECT category, max(stars) FROM restaurantTable GROUP by  category ;


