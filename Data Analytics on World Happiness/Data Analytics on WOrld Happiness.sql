CREATE DATABASE HappinessDB;
USE HappinessDB;
SELECT * FROM HappinessTable LIMIT 5;

-- 1) Find top ten country with happiness rank and Happiness Score

SELECT * FROM happinessTable
ORDER BY Score DESC
LIMIT 10;

 -- 2) Find happiness rank of India
SELECT Overall_Rank FROM happinessTable
Where Country = 'India';

 -- 3) Find difference in happiness score of Ireland and Spain.

SELECT
(SELECT Score FROM happinessTable WHERE Country = 'Ireland') -
(SELECT Score FROM happinessTable WHERE Country = 'Spain')
AS HappinessScoreDifference;

-- 4) Find bottom five country with least happiness score.
SELECT * FROM happinessTable
ORDER BY Score ASC
LIMIT 10;

-- 5) Count the total number of countries with happiness score more than 5.25
SELECT COUNT(*) FROM happinessTable
WHERE Score > 5.25;

-- 6) Count the total number of countries with happiness score less than 5.25

SELECT COUNT(*) FROM happinessTable 
WHERE Score < 5.25;
-- 7) Find the happiness rank of country Kenya.

SELECT Overall_Rank FROM happinessTable
WHERE Country = 'Kenya';
-- 8) Find the happiness score of the country Senegal
SELECT Score FROM happinessTable
WHERE Country = 'Senegal';

-- 9) Find the total number of country participated in Happiness contest.
SELECT COUNT(DISTINCT(Country)) FROM happinessTable;
-- 10) Find the average happiness score of the country participated in Happiness Contest.
SELECT AVG(Score) FROM happinessTable;