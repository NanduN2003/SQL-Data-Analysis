CREATE DATABASE JOB;
USE JOB;

-- Query01
SELECT * FROM naukri;

-- Query02
SELECT COUNT(DISTINCT job_role) AS job_listing FROM naukri;

SELECT DISTINCT job_role AS job_listing FROM naukri;

-- Query03
SELECT AVG(job_experience) AS avg_experience_required FROM naukri;

-- Query04
SELECT Company FROM naukri
order by job_experience DESC LIMIT 1;

SELECT company FROM naukri 
WHERE job_experience = (SELECT job_experience FROM naukri ORDER BY job_experience DESC LIMIT 1);

SELECT company FROM naukri 
WHERE job_experience = (SELECT MAX(job_experience) FROM naukri );

-- Query05
SELECT job_role, COUNT(*) AS no_of_jobs 
FROM naukri GROUP BY job_role ;


-- Query06
SELECT location, COUNT(*) AS job_count 
FROM naukri GROUP BY location 
ORDER BY job_count ASC LIMIT 1 ;


-- Query07
SELECT job_role, AVG(job_experience) AS average_experience 
FROM naukri GROUP BY job_role 
ORDER BY average_experience DESC LIMIT 1;

-- Query08
SELECT COUNT(job_role) FROM naukri 
WHERE skills_description IN ('java','sql');

-- Query09
SELECT DISTINCT(company), AVG(job_experience) AS average_experience 
FROM naukri GROUP BY company 
ORDER BY average_experience DESC ;

-- Query10

 
 -- Query11
 SELECT company, AVG(job_experience) AS average_experience
 FROM naukri GROUP BY company
 ORDER BY average_experience DESC LIMIT 1;




