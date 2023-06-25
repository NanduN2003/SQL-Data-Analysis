USE Bank;

-- 1) To list all the fields from the table Customer.
SELECT * FROM Customer;

-- 2) To list all the fields after applying arithmetic operations on column amount (amount*100) in loan..
SELECT Loan_number,branch_name,(amount*100) as amount FROM Loan;

-- 3) Find all loan numbers for loans made at the Perryridge branch with loan amounts greater than Rs.1200
SELECT Loan_number FROM loan WHERE branch_name='Perryridge' AND amount > 1200;

-- 4) Find all loan numbers for loans with loan amounts between Rs90,000and Rs100,000.(amount*100)
SELECT loan_number FROM loan WHERE (amount*100) BETWEEN 90000 AND 100000;

-- 5)Find all loan numbers for loans with loan amounts, not between Rs 90,000 and Rs100,000.
SELECT loan_number,(amount*100) as amount FROM loan WHERE amount NOT BETWEEN 900 AND 1000;

-- 6) For all customers who have a loan from the bank, find their names, loan numbers, and loan amounts.
SELECT L.loan_number,customer_name,amount FROM Loan as l  JOIN Borrower as B ON l.loan_number=B.loan_number ; 