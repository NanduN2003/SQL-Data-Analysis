USE bank;

-- 1) Find the custoemr names,loan numbers and loan amounts for all loans at Perryridge branch.
SELECT b.customer_name, l.loan_number, l.amount 
FROM loan as l,borrower as b 
WHERE l.loan_number=b.loan_number AND branch_name="Perryridge";

SELECT b.customer_name,l.loan_number,l.amount
FROM loan as l JOIN Borrower as b
ON b.loan_number=l.loan_number WHERE l.branch_name="Perryridge";

-- 2.Find the names of all branches that have assets greater than atleast one branch located in Brooklyn
SELECT b.branch_name
FROM Branch b
JOIN
(SELECT MIN(assets) AS min_assets
FROM Branch
WHERE branch_city = 'Brooklyn') bb
ON b.assets > bb.min_assets
WHERE b.branch_city <> 'Brooklyn';

-- 3.Find the names of all customers whose street address includes the substring 'Main'
SELECT customer_name FROM customer WHERE customer_street LIKE '%Main%';

-- 4.To list in alphabetic order all customers who have a loan at the Peryridge branch.
SELECT b.customer_name 
FROM borrower as b , loan as l 
WHERE b.loan_number=l.loan_number AND l.branch_name='Perryridge' ORDER BY b.customer_name; 

SELECT b.customer_name 
FROM borrower as b JOIN loan as l 
ON b.loan_number=l.loan_number 
WHERE l.branch_name='Perryridge' ORDER BY b.customer_name; 

-- 5.To list the entire loan info in descending order of amount
SELECT * FROM loan ORDER BY amount DESC;

-- 6.To find all customers having a loan,an account or both at the bank,without duplicates.
SELECT DISTINCT(c.customer_name) FROM customer as c
JOIN Borrower as b ON b.customer_name=c.customer_name
UNION 
SELECT DISTINCT(c.customer_name) FROM customer as c
JOIN Depositor as d ON d.customer_name=c.customer_name;

SELECT DISTINCT(c.customer_name) FROM customer as c , depositor as d , borrower as b 
WHERE b.customer_name=c.customer_name OR d.customer_name=c.customer_name;
