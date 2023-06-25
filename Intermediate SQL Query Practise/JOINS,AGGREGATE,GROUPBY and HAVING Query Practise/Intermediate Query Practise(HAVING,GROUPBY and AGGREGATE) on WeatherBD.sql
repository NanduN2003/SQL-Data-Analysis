USE weatherdb;

-- 1.Retrieve the average temperature for each city, with city names -- 
SELECT  c.name,AVG(w.temperature)  FROM city as c,  weather as w 
WHERE c.id=w.city_id
GROUP BY c.name;

-- 2.Retrieve the maximum temperature for each city, with city names, only for cities where the maximum temperature is greater than 80

SELECT  c.name,MAX(w.temperature)  FROM city as c,  weather as w 
WHERE c.id=w.city_id and w.temperature>80
GROUP BY c.name;

-- 3.Retrieve the sum of precipitation for each city, with city names -- 
SELECT  c.name,SUM(w.precipitation)  FROM city as c,  weather as w 
WHERE c.id=w.city_id
GROUP BY c.name;

-- 4.Retrieve the average temperature for each month, with month names -- 
SELECT DATE_FORMAT(f.date, '%M') AS month_name, AVG(w.temperature)
FROM weather as w, forecast as f
GROUP BY MONTH(date);



