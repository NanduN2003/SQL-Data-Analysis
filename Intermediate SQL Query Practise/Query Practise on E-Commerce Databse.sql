CREATE DATABASE e_commerce;
USE e_commerce;
CREATE TABLE Customers(C_id INTEGER PRIMARY KEY,C_Name VARCHAR(20) NOT NULL,Age INTEGER,Email VARCHAR(30),Phone_No INTEGER NOT NULL,Address VARCHAR(30));
ALTER TABLE Customers ADD Age INTEGER NOt NULL ;
INSERT INTO Customers VALUES (1,"John Smith","john.smith@email.com",555-1234,"123
Main St, Anytown USA",25),(2,"Sarah Johnson,","sarah.johnson@email.com,",555-5678,"123
456 Oak St, Anytown USA",30),(3,"Michael Lee","michael.lee@email.com",555-4321,"789
Maple St, Anytown USA",22),(4,"Emily Davis","emily.davis@email.com",555-8765,"1010
Elm St, Anytown USA",18),(5,"David Kim","david.kim@email.com",555-9876,"1212
Pine St, Anytown USA",28);

CREATE TABLE orders(O_id INTEGER PRIMARY KEY,C_id INTEGER NOT NULL ,Product_id INTEGER NOT NULL,Quantity INTEGER,Price FLOAT,Order_Date DATE );

CREATE TABLE products(Product_id INT PRIMARY KEY NOT NULL,Product_Name VARCHAR(30),Descriptions VARCHAR(60),Price FLOAT,Stock FLOAT);

-- Rename the orders table into customers orders 
ALTER TABLE orders RENAME TO Customer_orders;

-- Delete the products table
DROP TABLE products;

-- QUERY01
SELECT C_Name,Email FROM Customers LIMIT 03;

-- QUERY02
SELECT C_Name,Email FROM Customers;

-- QUERY03
SELECT C_Name,Phone_No FROM Customers WHERE Address LIKE '%Main St%';

-- QUERY04
SELECT C_Name,Age FROM Customers ORDER BY Age DESC;

-- QUERY05
UPDATE Customers SET email="sarah.johnson123@email.com" WHERE C_id=2;

-- QUERY06
UPDATE Customers SET Phone_No=555-555-5555 WHERE C_id=2;

-- QUERY07
DELETE FROM Customers WHERE Age < 18;

-- Inserting values into Orders table
INSERT INTO Customer_orders VALUES (1, 1, 0, 0, 0, '2023-01-01'),
(2, 2, 3, 1, 250.99, '2023-02-15'),
(3, 3, 2, 3, 239.99, '2023-03-19'),
(4, 4, 1, 1, 509.99, '2023-03-15'),
(5, 5, 4, 2, 140.99, '2023-03-10');

-- QUERY08
DELETE FROM Customer_orders WHERE Quantity = 0;

-- QUERY09
SELECT Email, C_Name FROM Customers LIMIT 03;

-- QUERY10
SELECT * FROM customer_orders WHERE order_date >= DATE_SUB(NOW(), INTERVAL 1 WEEK);

-- QUERy11
SELECT c_id, SUM(price * quantity) AS total_spent FROM customer_orders GROUP BY c_id HAVING SUM(price * quantity) > 500;
