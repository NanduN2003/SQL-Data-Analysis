-- Creating the Database
CREATE DATABASE BoatClub;

-- Using the Database
USE BoatClub;

-- Creating Sailors Table
CREATE TABLE Sailors (
    sid INT,
    sname VARCHAR(255),
    rating INT,
    age FLOAT
);
-- Inserting data into the Sailors table
INSERT INTO Sailors (sid, sname, rating, age)
VALUES
    (22, 'Rahul', 10, 25.0),
    (29, 'Anand', 9, 26.0),
    (31, 'Niket', 7, 45.0),
    (32, 'Neha', 5, 56.6),
    (58, 'Bijay', 4, 23.5),
    (64, 'Thomas', 8, 35.0),
    (71, 'Rusty', 8, 29.5),
    (74, 'Venky', 6, 63.5),
    (85, 'Alfred', 1, 42.5),
    (95, 'Vikky', 9, 24.5);

-- Creating Boat Table
CREATE TABLE Boats (
    bid INT,
    bname VARCHAR(255),
    color VARCHAR(255)
);
-- Inserting data into Boat Table
INSERT INTO Boats (bid, bname, color)
VALUES
    (101, 'WaterKing', 'Red'),
    (102, 'WaterKing', 'Blue'),
    (103, 'Marine', 'Red'),
    (104, 'Seaway', 'Green');

-- Creating Reserve Table
CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE
);
-- Inserting data into Reserve Table
INSERT INTO Reserves (sid, bid, day)
VALUES
    (22, 101, '2017-10-10'),
    (22, 102, '2017-10-10'),
    (22, 103, '2017-10-08'),
    (22, 104, '2017-10-07'),
    (31, 102, '2017-11-10'),
    (31, 103, '2017-11-06'),
    (31, 104, '2017-11-12'),
    (64, 101, '2017-09-05'),
    (64, 102, '2017-09-05'),
    (74, 103, '2017-09-05');


-- We have now created the BoatClub database and 
-- inserted the provided data into the Sailors, Boats, and Reserves tables.
