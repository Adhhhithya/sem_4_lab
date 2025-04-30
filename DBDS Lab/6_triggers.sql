create database exp6;
use exp6;
-- Create department table
CREATE TABLE department (
  dint INT PRIMARY KEY,
  dname VARCHAR(50),
  mgrssn INT,
  mgrstartdate DATE,
  total_salary INT
);

-- Create employee table
CREATE TABLE employee (
  ssn INT PRIMARY KEY,
  fname VARCHAR(50),
  minit CHAR(1),
  lname VARCHAR(50),
  bdate DATE,
  address VARCHAR(100),
  sex CHAR(1),
  salary INT,
  superssn INT,
  dno INT
);
-- TRIGGERS ----------------------------------------------------------------------
-- Create the Insert Trigger
DELIMITER //
CREATE TRIGGER emp_insert_trigger
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
  UPDATE department
  SET total_salary = total_salary + NEW.salary
  WHERE dint = NEW.dno;
END;
//
DELIMITER ;
-- Insert some department data
INSERT INTO department VALUES 
(5, 'Research', 333445555, '1988-05-22', 163000),
(4, 'Administration', 987654321, '1995-01-01', 93000),
(1, 'Headquarters', 888665555, '1981-06-19', 55000);
SELECT * FROM department;
-- Insert a new employee
INSERT INTO employee VALUES 
(765765765, 'Joy', 'A', 'Wong', '1966-01-10', 'Houston', 'M', 30000, 888665555, 5);
INSERT INTO employee VALUES (432432432,'John','B','Paul','1966-03-26','Brighton','M',300000,444556666,2);
SELECT * FROM department;


-- Create the Delete Trigger
DELIMITER //
CREATE TRIGGER emp_delete_trigger
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
  UPDATE department
  SET total_salary = total_salary - OLD.salary
  WHERE dint = OLD.dno;
END;
//
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM employee WHERE fname = 'Joy';
SELECT * FROM department;

-- Create the update trigger
DELIMITER //
CREATE TRIGGER emp_update_trigger
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
  -- Only do this if salary or department changes
  IF OLD.salary != NEW.salary OR OLD.dno != NEW.dno THEN
    -- Subtract old salary from old department
    UPDATE department
    SET total_salary = total_salary - OLD.salary
    WHERE dint = OLD.dno;
    -- Add new salary to new department
    UPDATE department
    SET total_salary = total_salary + NEW.salary
    WHERE dint = NEW.dno;
  END IF;
END;
//
DELIMITER ;
UPDATE employee SET salary = 40000 WHERE fname = 'John';
SELECT * FROM department;

-- create a instead of trigger
DELIMITER //
CREATE TRIGGER instead_trigger
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Deletion is not possible';
END;
//
DELIMITER ;
DELETE FROM employee WHERE fname = 'John';














