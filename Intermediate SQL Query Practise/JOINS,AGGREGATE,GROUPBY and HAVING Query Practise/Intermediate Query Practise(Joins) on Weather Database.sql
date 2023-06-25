CREATE DATABASE weatherdb;
USE weatherdb;

CREATE TABLE city (
id INT PRIMARY KEY,
name VARCHAR(255),
state VARCHAR(255)
);

CREATE TABLE weather (
id INT PRIMARY KEY,
temperature FLOAT,
humidity FLOAT,
precipitation FLOAT,
city_id INT,
FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE forecast (
id INT PRIMARY KEY,
date DATE,
high FLOAT,
low FLOAT,
city_id INT,
FOREIGN KEY (city_id) REFERENCES city(id)
);

INSERT INTO city (id, name, state) VALUES
(1, 'New York', 'New York'),
(2, 'Los Angeles', 'California'),
(3, 'Chicago', 'Illinois'),
(4, 'Houston', 'Texas');
INSERT INTO weather (id, temperature, humidity, precipitation, city_id) VALUES
(1, 64.2, 60.1, 0.0, 1),
(2, 75.6, 45.3, 0.0, 2),
(3, 55.3, 80.2, 0.3, 3),
(4, 88.9, 35.6, 0.0, 4);
INSERT INTO forecast (id, date, high, low, city_id) VALUES
(1, '2023-04-06', 73.2, 57.1, 1),
(2, '2023-04-06', 81.2, 64.4, 2),
(3, '2023-04-06', 60.1, 45.3, 3),
(4, '2023-04-06', 92.1, 75.6, 4);

SHOW TABLES;

-- 1. Retrieve all weather data and city names for each record, using natural join.
SELECT *
FROM weather
NATURAL JOIN city;
-- Here the natural join will display the unique n matching records based on common column city_id  from both weather and city tables

-- 2.Retrieve all forecast data and city names for each record, using a natural join
SELECT * FROM forecast NATURAL JOIN city;
-- Here the natural join will display the unique n matching records based on common column city_id  from both forecast and city tables

-- 3.Retrieve all weather data, forecast data, and city names for each record, using a theta join on city_id
SELECT *
FROM weather as w, forecast as f, city as c
WHERE w.city_id = c.id AND f.city_id = c.id;
-- Here theta join will displays records of three tables which are matching the given condition.

-- 4.Retrieve all weather data for New York city, using a left outer join
SELECT c.name, w.*
FROM city as c
LEFT OUTER JOIN weather as w ON c.id = w.city_id
WHERE c.name = 'New York';


-- 5.Retrieve all forecast data for Los Angeles city, using a left outer join
SELECT f.*,c.name
FROM city as c 
LEFT OUTER JOIN forecast as f ON c.id=f.city_id 
WHERE c.name='Los Angeles';

-- 6.Retrieve all weather and forecast data for Chicago city, using a left outer join
SELECT w.*, f.*, c.name AS city_name
FROM weather as w
LEFT OUTER JOIN forecast as f ON w.city_id = f.city_id
LEFT OUTER JOIN city as c ON w.city_id = c.id
WHERE c.name = 'Chicago';

-- 7.Retrieve all weather data and city names for each record, using an inner join
SELECT w.*, c.name 
FROM weather as w
INNER JOIN city as c ON w.city_id = c.id;

-- 8.Retrieve all forecast data and city names for each record, using an inner join
SELECT f.*, c.name 
FROM forecast as f
INNER JOIN city as c ON f.city_id = c.id;

-- 9.Retrieve all weather data, forecast data, and city names for each record, using a cross join
SELECT w.*,f.*,c.name
FROM weather as w ,forecast as f
CROSS JOIN city as c;

-- 10.Retrieve all weather data and city names for each record, using a right outer join:
SELECT w.*,c.name 
FROM weather as w  
RIGHT OUTER JOIN  city as c
ON w.city_id=c.id;