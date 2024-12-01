-----  HR Analytics Employee Insights and Trends Analysis -----
create database HR;
use HR;

-- creating the  Empolyee table;
create table EMP(
emp_no int primary key,
gender varchar(50),
marital_status varchar(100),
age_band varchar(50),
age int,
department varchar(100),
education varchar(200),
education_field varchar(200),
job_role varchar(200),
business_travel varchar(150),
employee_count int,
attrition varchar(50),
attrition_label varchar(100),
job_satisfaction int,
active_employee int);

-- Insert the values in the emp table using HR_Data.csv file through import function from mysql sever.

----------------------------- Project Begins  ---------------------
-- 1. Fetch the data from emp
SELECT * FROM EMP;

-- 2. Count the number of employees in each department
SELECT DEPARTMENT, COUNT(*) AS 'Employee_Count' 
FROM EMP 
GROUP BY DEPARTMENT;

-- 3. Calculate the average age for each department
SELECT DEPARTMENT, AVG(AGE) AS 'Average_Age' 
FROM EMP
GROUP BY DEPARTMENT;

-- 4. Identify the most common job roles in each department
SELECT DEPARTMENT, JOB_ROLE, COUNT(*) AS 'Role_Count'
FROM EMP
GROUP BY DEPARTMENT,JOB_ROLE
ORDER BY DEPARTMENT,Role_Count DESC;

-- 5. Calculate the average job satisfaction for each education level
SELECT EDUCATION, AVG(JOB_SATISFACTION) AS 'Avg_Rating'
FROM EMP
GROUP BY EDUCATION;

-- 6. Determine the average age for employees with different levels of job satisfaction
SELECT AGE_BAND, AVG(JOB_SATISFACTION) AS 'Avg_Rating'
FROM EMP
GROUP BY AGE_BAND
ORDER BY Avg_rating DESC;

-- 7. Calculate the attrition rate for each age band
SELECT AGE_BAND, 
SUM(CASE WHEN ATTRITION = 'YES' THEN 1 ELSE 0 END)/COUNT(*)*100 AS 'ATTRACTION RATE' 
FROM EMP
GROUP BY AGE_BAND;
 
 -- 8. Identify the departments with the highest and lowest average job satisfaction
 SELECT DEPARTMENT, 
 AVG(job_satisfaction) AS 'Average_Sastifaction'
 FROM EMP
 GROUP BY DEPARTMENT
 ORDER BY Average_Sastifaction;
 
-- 9. Find the age band with the highest attrition rate among employees with a specific education level 
SELECT AGE_BAND, EDUCATION,
SUM(CASE WHEN ATTRITION = 'YES' THEN 1 ELSE 0 END) AS 'ATTRACTION_RATE'
FROM EMP
GROUP BY AGE_BAND, EDUCATION
ORDER BY ATTRACTION_RATE DESC LIMIT 1;

-- 10. Find the education level with the highest average job satisfaction among employees who travel frequently
SELECT EDUCATION, AVG(job_satisfaction) AS 'Avg_job_satisfaction'
FROM EMP
WHERE BUSINESS_TRAVEL = 'Travel_Frequently'
GROUP BY EDUCATION
ORDER BY Avg_job_satisfaction DESC 
LIMIT 1;

-- 11. Identify the age band with the highest average job satisfaction among married employees
SELECT AGE_BAND, AVG(job_satisfaction) AS 'Avg_job_satisfaction'
FROM EMP
WHERE MARITAL_STATUS = 'Married'
GROUP BY AGE_BAND
ORDER BY Avg_job_satisfaction DESC 
LIMIT 1;