USE bank;

-- 1. To find all customers having a loan, an account or both at the bank, with duplicates.
SELECT  customer_name
FROM ( 
SELECT customer_name FROM Depositor
UNION ALL
SELECT customer_name FROM Borrower 
) AS customers_having_loan_or_account;

-- 2.To find all customers having both a loan and an account at the bank, without duplicates.
SELECT DISTINCT customer_name 
FROM (
SELECT customer_name FROM Depositor
INTERSECT 
SELECT customer_name FROM Borrower 
) AS customers_having_loan_and_account;

-- 4.To find all customers who have an account but no loan at the bank, without duplicates
SELECT DISTINCT customer_name 
FROM Depositor
WHERE customer_name NOT IN (SELECT customer_name FROM Borrower);


SELECT DISTINCT D.customer_name FROM Depositor as D 
LEFT JOIN Borrower as B ON D.customer_name = B.customer_name 
WHERE loan_number IS NULL;

-- 5.To find all customers who have an account but no loan at the bank, with duplicates.
SELECT customer_name 
FROM Depositor
WHERE customer_name NOT IN (SELECT customer_name FROM Borrower);


SELECT D.customer_name FROM Depositor as D
LEFT JOIN Borrower as B ON D.customer_name = B.customer_name 
WHERE loan_number IS NULL;

-- 6.Find the average account balance at the Perryridge branch:
SELECT AVG(balance) FROM Account 
WHERE branch_name='Perryridge';