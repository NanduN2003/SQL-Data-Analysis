CREATE DATABASE Intermediate_SQL;
USE Intermediate_SQL;

CREATE TABLE student (
sid INT PRIMARY KEY,
name VARCHAR(50),
login VARCHAR(50),
age INT,
gpa DECIMAL(3,2)
);
CREATE TABLE course(
cid INT PRIMARY KEY,
name VARCHAR(50)
);
CREATE TABLE enrolled (
sid INT,
cid INT,
PRIMARY KEY (sid, cid),
grade VARCHAR(10)
);
INSERT INTO student (sid, name, login, age, gpa) VALUES
(53666, 'Kanye', 'kanye@cs', 44, 4.0),
(53688, 'Bieber', 'jbieber@cs', 27, 3.9),
(53655, 'Tupac', 'shakur@cs', 25, 3.5),
(53659, 'samual', 'shamual@me', 30, 3.8);

SELECT * FROM student;
INSERT INTO course (cid, name) VALUES
(15445, 'Database Systems'),
(15721, 'Advance Database Systems'),
(15826, 'Data Mining'),
(15823, 'Advance Topics in Databases');
INSERT INTO enrolled (sid, cid, grade) VALUES
(53826, 15455, 'C'),
(53688, 15721, 'A'),
(53688, 15826, 'B'),
(53655, 15445, 'B'),
(53666, 15721, 'C');
SELECT * FROM enrolled;
SELECT * FROM course;


-- AGGREGATE FUNCTIONS --
-- 1.Get the names and GPAs of all the students who are older than 25 Years
SELECT name,gpa FROM student WHERE Age > 25;

-- 2.Which student got an A in Course 15721
SELECT name FROM student,enrolled WHERE student.sid=enrolled.sid AND enrolled.grade='A' AND enrolled.cid=15721;

-- 3.Get the Number of students with @cs Login
SELECT COUNT(*) FROM student WHERE login LIKE '%@cs';

-- 4.Get the number of students and average of their GPA that have @cs Login [ Multiple Aggregate ]
SELECT COUNT(*),AVG(gpa) FROM student,enrolled WHERE student.sid=enrolled.sid AND login LIKE '%@cs';

-- 5.Get the number of Unique Students that have an @cs login
SELECT COUNT(DISTINCT login) as unique_mail FROM student WHERE login LIKE '%@cs';

-- NESTED QUERIES --
-- 1.Write a query to find the names of students who are enrolled in "Advance Database Systems"
SELECT name FROM student WHERE sid IN ( SELECT sid FROM enrolled  WHERE cid=15721);

SELECT name FROM student WHERE sid IN ( SELECT sid FROM enrolled  WHERE cid IN (SELECT cid FROM course  WHERE name='Advance Database Systems' ));

-- 2.Write a query to find the names of courses that have no enrolled students.
SELECT name FROM course WHERE NOT EXISTS ( SELECT * FROM enrolled WHERE enrolled.cid=course.cid );

--  3.Write a query to find the names of courses that have at least one student with a grade of "A".
SELECT name FROM course
WHERE cid IN (
  SELECT DISTINCT cid
  FROM enrolled
  WHERE grade = 'A'
);

-- 4.Write a query to find the names of students who have the highest GPA.
SELECT name FROM student
WHERE gpa = (
  SELECT MAX(gpa)
  FROM student
);