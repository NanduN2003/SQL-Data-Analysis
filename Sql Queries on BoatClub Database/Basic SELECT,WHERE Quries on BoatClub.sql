CREATE DATABASE BoatClub;
USE BoatClub;
CREATE TABLE Sailors(Sid INTEGER PRIMARY KEY NOT NULL,Sname VARCHAR(20) NOT NULL,Rating INTEGER,Age FLOAT);
CREATE TABLE Boats(Bid INTEGER PRIMARY KEY NOT NULL,Bname VARCHAR(20) NOT NULL,Color VARCHAR(15));
CREATE TABLE Reserves(Sid INTEGER NOT NULL,Bid VARCHAR(20) NOT NULL,Day DATE);
INSERT INTO Sailors VALUES(22,'Rahul',10,25.0);
INSERT INTO Sailors(Sid,Sname,Rating,Age) VALUES(29,'Anand',9,26.0),(31,'Niket',7,45.0),(32,'Neha',5,56.6),(58,'Bijay',4,23.5),(64,'Thomas',8,35.0),(71,'Rusty',8,29.5),(74,'Venky',6,63.5),(85,'Alfred',1,42.5),(95,'Vikky',9,24.5);
INSERT INTO Boats VALUES(101,'WaterKing','Red'),(102,'WaterKing','Blue'),(103,'Marine','Red'),(104,'Seaway','Green');
INSERT INTO Reserves VALUES(22,101,'2017-10-10'),(22,102,'2017-10-10'),(22,103,'2017-08-10'),(22,104,'2017-07-10'),(31,102,'2017-10-11'),(31,103,'2017-06-11'),(31,104,'2017-12-11'),(64,101,'2017-05-09'),(64,102,'2017-05-09'),(74,103,'2017-05-09');

DESC SAILORS;

-- 01. Find the names and sids of sailors who have reserved a red or a Green boat?
SELECT Sailors.sname,Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid=Reserves.sid
JOIN Boats ON Boats.bid = Reserves.bid 
WHERE Boats.color = 'Red' OR Boats.color='Green';

-- 04. Find the names of sailors who have reserved boat 103?
SELECT Sailors.Sname FROM Sailors JOIN Reserves ON Sailors.Sid=Reserves.Sid WHERE Reserves.Bid=103;

-- 02. Find the names and sids of sailors who have reserved a red and a Green boat? 
SELECT Sailors.Sname,Sailors.Sid FROM Sailors JOIN Reserves ON Sailors.Sid=Reserves.Sid 
JOIN BOATS ON Boats.Bid=Reserves.Bid 
WHERE Boats.color='Red' AND Boats.color='Green';

-- 03. Find all sids of sailors who have a rating of 10 or reserved boat 104?
SELECT Sid FROM Sailors WHERE Sailors.Rating=10 UNION SELECT Sid FROM Reserves JOIN Boats ON Boats.Bid=Reserves.Bid WHERE Boats.Bid=104;

-- 05. Find the names of sailors who have reserved a red boat? 
SELECT Sailors.Sname FROM Sailors JOIN Reserves ON Sailors.Sid=Reserves.Sid 
JOIN Boats ON Boats.Bid=Reserves.Bid WHERE Boats.color='Red';

-- 06. Find the names of sailors who have not reserved a red boat?
SELECT Sname FROM Sailors JOIN Reserves ON Sailors.Sid=Reserves.Sid
JOIN Boats ON Boats.Bid=Reserves.Bid WHERE Boats.color<>'Red';

-- 07. Find sailors whose rating is better than some sailor called Horatio? 
-- SELECT * FROM Sailors WHERE Rating > 'Horatio'; 
SELECT * FROM Sailors WHERE rating > ANY (SELECT rating FROM Sailors WHERE sname='Horatio');

-- 08. Find the sailors with the highest rating?
SELECT * FROM Sailors WHERE Rating = ANY (SELECT MAX(rating) FROM Sailors);
SELECT * FROM Sailors ORDER BY rating DESC LIMIT 1;

-- 09. Find the names of sailors who have reserved both a red and a green boat? 
SELECT Sname FROM Sailors JOIN Reserves ON Reserves.Sid=Sailors.Sid 
JOIN Boats ON Boats.Bid=Reserves.Bid WHERE Boats.Color='Red' AND Boats.Color='Green';

-- 10. Find the names of sailors who have reserved boat no 103?
SELECT Sname FROM Sailors JOIN Reserves ON Reserves.Sid=Sailors.Sid WHERE Bid=103;

-- 11. Find the names of sailors who have reserved all boats ?
SELECT Sname FROM Sailors JOIN Reserves ON Sailors.Sid=Reserves.Sid GROUP BY Sname HAVING COUNT(Sname)=4;