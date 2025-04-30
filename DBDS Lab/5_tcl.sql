create database exp5;
CREATE TABLE customers (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);
INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);
select * from customers;

-- TCL operations
-- delete those records from the table which have age = 25 and then COMMIT the changes in the database
DELETE FROM customers WHERE AGE = 25;
SHOW VARIABLES LIKE 'sql_safe_updates';
SET SQL_SAFE_UPDATES = 0;
DELETE FROM customers WHERE AGE = 25;
COMMIT;

-- delete those records from the table which have the age=25 and then ROLLBACK the changes in the database.
drop table customers;
CREATE TABLE customers (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);
INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);
select * from customers;
DELETE FROM customers WHERE AGE=25;
ROLLBACK;

drop table customers;

-- Step 1: Create the customers table
CREATE TABLE customers (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);

-- Step 2: Insert data into the customers table
INSERT INTO customers (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

-- Step 3: Begin the transaction
START TRANSACTION;

-- Step 4: Set a savepoint after the first deletion
SAVEPOINT s1;

-- Step 5: Delete customer with ID = 1
DELETE FROM customers WHERE ID = 1;

-- Step 6: Set another savepoint after the second deletion
SAVEPOINT s2;

-- Step 7: Delete customer with ID = 2
DELETE FROM customers WHERE ID = 2;

-- Step 8: Set a third savepoint after the third deletion
SAVEPOINT s3;

-- Step 9: Delete customer with ID = 3
DELETE FROM customers WHERE ID = 3;

-- Step 10: Rollback to savepoint s2, undoing the deletion of customer with ID = 3
ROLLBACK TO s2;

-- Step 11: Commit the transaction to save the changes
COMMIT;

-- Step 12: Check the resulting table
SELECT * FROM customers;
