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
