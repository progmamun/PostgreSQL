-- Active: 1691125289244@@127.0.0.1@5432@test1
--## create DATABASE
-- CREATE DATABASE test2;

-- ## RENAME DATABASE
-- ALTER DATABASE test1 RENAME TO test3;


-- ## Delete DATABASE
-- DROP DATABASE test1;

-- ## CREATE a student TABLE

/* CREATE TABLE student (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cgpa NUMERIC(1,2)
) */

-- ## Rename a table
-- ALTER TABLE student RENAME TO learners;

## Delete a table
-- DROP TABLE learners;

-- ## Create a table with CONSTRAINTS
-- CREATE TABLE "user1"(
--     user_id SERIAL,
--     username VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL,
--     PRIMARY KEY(user_id, username),
--     UNIQUE(username, email)
-- )
CREATE TABLE "user1"(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INT DEFAULT 18
)

INSERT INTO user1 (user_id, username, email, age) VALUES (1, 'Mamun', 'mamun@gmail.com', 23);

INSERT INTO user1 (username, email) VALUES (1, 'khan', 'khan@gmail.com'), (2, 'khan2', 'khan2@gmail.com')

-- ## Delete all rows in a table without deleting the table
TRUNCATE TABLE user1;

-- add a COLUMN
ALTER TABLE user1
add COLUMN password VARCHAR(255) DEFAULT 'admin123' not NULL;

--## Delete a COLUMN
ALTER TABLE user1
drop COLUMN age;

ALTER TABLE user1 add COLUMN demo INT;

ALTER TABLE user1
    Alter COLUMN demo type text;

-- Set DEFAULT value
ALTER TABLE user1
    alter COLUMN demo set DEFAULT 'bangladesh';

-- Remove DEFAULT Value
ALTER TABLE user1
    alter COLUMN demo drop DEFAULT;
    
-- Rename a COLUMN
ALTER TABLE user1
RENAME COLUMN demo to country;

-- add a constraint
ALTER TABLE user1
alter COLUMN country set not null;

-- Drop a constraint
ALTER TABLE user1
alter COLUMN country drop not null;

-- add a CONSTRAINTS
ALTER TABLE user1
ADD CONSTRAINT unique_email UNIQUE(email);

-- Delete a CONSTRAINT
ALTER TABLE user1
DROP CONSTRAINT unique_email;

INSERT into user1 values (3, 'Mamun3', 'mamun3@gmail.com');


SELECT * from user1;

-- Department Table
-- Each Department has many employees
CREATE TABLE Department(
    deptID SERIAL PRIMARY KEY,
    deptName VARCHAR(50)
);

DELETE FROM Department WHERE deptID = 1;

SELECT * FROM Department;

-- Employee Table
-- Each Employee belongs to a department
CREATE TABLE Employee(
    empID SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentID INT,
    CONSTRAINT fk_constraint_dept
        FOREIGN KEY (departmentID)
        REFERENCES Department(deptID)
)

insert into Employee values (1, 'Mamun', 1);

DELETE FROM Employee WHERE empID = 1;


SELECT * FROM Employee;

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_date DATE
)

SELECT * FROM courses;

-- Date formate - YYYY-MM-DD

INSERT INTO courses(course_name, description,  published_date) VALUES('PostgreSQL for developers', 'A complete PostgreSQL for Developers', '2020-07-13'),('PostgreSQL system admin', 'A Guide for DBA', NULL),('PostgreSQL High Performance', NULL, NULL),('PostgreSQL Bootcamp', 'Learn PostgreSQL via bootcamp', '2023-07-13'),('Mastering PostgreSQL', 'Mastering PostgreSQL in 60 Days', '2023-05-18'),

-- UPDATE
update courses 
set 
course_name = 'Postgres',
description = 'Dummy text'
WHERE course_id > 1 AND course_id < 5;

DELETE FROM courses
WHERE course_id = 1;


-- SELECT
SELECT * FROM employees
ORDER BY name
ASC LIMIT 10 OFFSET 2;

-- Highest salary from employees table
SELECT * FROM employees ORDER BY salary DESC LIMIT 1;

-- Third Highest salary
SELECT * from employees ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- IN, NOT IN, BETWEEN, LIKE
SELECT * FROM employees WHERE empid IN (2, 100, 5);
SELECT * FROM employees WHERE empid NOT IN (2, 100, 5);
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 15000;
SELECT * FROM employees WHERE name LIKE '%a%'; -- name where a include 
SELECT * FROM employees WHERE name LIKE 'A%'; -- name where first letter start with a 

--  SPECIFIC position
SELECT * FROM employees WHERE name LIKE '_m%'; -- name where 2nd position start with m
SELECT * FROM employees WHERE name LIKE 'G%a'; -- name start with G end with a

-- join Left,  right, full
SELECT * FROM employee
FULL JOIN department ON department.department_id = employee.department_id;

-- natural, cross JOIN
SELECT *
FROM employee
NATURAL JOIN department;

-- AGGREGATE FUNCTION
SELECT MAX(salary) from employees;
-- aliases 
SELECT MAX(salary) AS HeightSalary from employees;

SELECT d.name, avg(e.salary), sum(e.salary), max(e.salary) from employees e  FULL JOIN department d on e.deptid = d.deptid GROUP BY d.name;
SELECT d.name, avg(e.salary), sum(e.salary), max(e.salary) from employees e  FULL JOIN department d on e.deptid = d.deptid GROUP BY d.name HAVING avg(e.salary) > 60000;

SELECT d.name, sum(salary), avg(salary), min(salary), count(*) from department FULL JOIN employees e on e.deptid = d.deptid GROUP BY d.deptid;