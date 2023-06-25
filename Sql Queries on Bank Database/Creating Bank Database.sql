CREATE DATABASE Bank;

USE Bank;



CREATE TABLE Branch (
branch_name VARCHAR(255),
branch_city VARCHAR(255),
assets INT
);

INSERT INTO Branch (branch_name, branch_city, assets)
VALUES
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 800000);



CREATE TABLE Customer (
customer_name VARCHAR(255),
customer_street VARCHAR(255),
customer_city VARCHAR(255)
);

INSERT INTO Customer (customer_name, customer_street, customer_city)
VALUES
('Adams', 'Spring', 'Pittsfield'),
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sand Hill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Jackson', 'Lake', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassau', 'Princeton');



CREATE TABLE Loan (
loan_number VARCHAR(255),
branch_name VARCHAR(255),
amount INT
);

INSERT INTO Loan (loan_number, branch_name, amount)
VALUES
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500);


CREATE TABLE Borrower (
customer_name VARCHAR(255),
loan_number VARCHAR(255)
);

INSERT INTO Borrower (customer_name, loan_number)
VALUES
('Adams', 'L-16'),
('Curry', 'L-93'),
('Hayes', 'L-15'),
('Jackson', 'L-14'),
('Jones', 'L-17'),
('Smith', 'L-11'),
('Smith', 'L-23'),
('Williams', 'L-17');



CREATE TABLE Account (
account_number VARCHAR(255),
branch_name VARCHAR(255),
balance INT
);

INSERT INTO Account (account_number, branch_name, balance)
VALUES
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'RoundHill', 350);



CREATE TABLE Depositor (
customer_name VARCHAR(255),
account_number VARCHAR(255)
);

INSERT INTO Depositor (customer_name, account_number)
VALUES
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Johnson', 'A-201'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305');


