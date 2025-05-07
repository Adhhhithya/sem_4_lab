create database exp2;

-- 1) Creating a view using aggregate functions to calculate age of the person
create table person_m(name varchar(20) primary key ,dob date,person_city varchar(20));
desc person_m;
insert into person_m values('abdulkalam','1931-10-15','rameshwaram');
insert into person_m values('maheshboobathy','1974-07-02','chennai');
insert into person_m values('sachin','1973-05-04','mumbai');
insert into person_m values('viswanathanand','1970-03-06','chennai');

create view personage_m as  select name,datediff(sysdate(),dob)/365.25 as age from person_m;
select * from personage_m;
insert into person_m values('jorden','1970-07-08','usa');
select * from personage_m;

-- 2) creating a sequence and design the dept table in given attribute
create table department_m(department_id int primary key auto_increment , department_name varchar(20));
desc department_m;
insert into department_m (department_name) values('it');
insert into department_m (department_name) values('aml');
insert into department_m (department_name) values('mechanical');
insert into department_m (department_name) values('aero');
select * from department_m;

-- 3) Creating a synonym for a table
CREATE TABLE product_m (
    product_name VARCHAR(25) PRIMARY KEY,
    product_price DECIMAL(4,2),
    quantity_on_hand DECIMAL(5,0),
    last_stock_date DATE
);
select * from product_m;
INSERT INTO product_m VALUES ('Product_1', 99.00, 1, '2003-01-15');
INSERT INTO product_m VALUES ('Product_2', 75.00, 1000, '2002-01-15');
INSERT INTO product_m VALUES ('Product_3', 50.00, 100, '2003-01-15');
INSERT INTO product_m VALUES ('Product_4', 25.00, 10000, '2003-01-14');
SELECT * FROM product_m;


-- Create the table
use exp2;
CREATE TABLE PRODUCT_MAST (
    PRODUCT VARCHAR(50),
    COMPANY VARCHAR(50),
    QTY INT,
    RATE DECIMAL(10, 2),
    COST DECIMAL(10, 2)
);

-- Insert the values

INSERT INTO PRODUCT_MAST (PRODUCT, COMPANY, QTY, RATE, COST) VALUES
('Item1', 'Com1', 2, 10, 20),
('Item2', 'Com2', 3, 25, 75),
('Item3', 'Com1', 2, 30, 60),
('Item4', 'Com3', 5, 10, 50),
('Item5', 'Com2', 2, 20, 40),
('Item6', 'Cpm1', 3, 25, 75),
('Item7', 'Com1', 5, 30, 150),
('Item8', 'Com1', 3, 10, 30),
('Item9', 'Com2', 2, 25, 50),
('Item10', 'Com3', 4, 30, 120);

-- COUNT ---------------
select count(*)
from PRODUCT_MAST;

select count(*)
from PRODUCT_MAST
where RATE>20;

select COMPANY,count(*)
from PRODUCT_MAST
group by COMPANY;

select COMPANY,count(*)
from PRODUCT_MAST
group by COMPANY
having count(*)>2;

-- SUM------------------------
select sum(cost)
from product_mast;

select sum(cost)
from product_mast
where qty>3;


select company,sum(cost)
from product_mast
group by company;

select company,sum(cost)
from product_mast
group by company
having sum(cost)>=170;

-- AVG()
select avg(cost)
from product_mast;

-- MAX and MIN
select min(rate)
from product_mast;

select max(rate)
from product_mast;

-- SYNONYMS once again-------------
CREATE TABLE product_ma (
    product_name VARCHAR(25) PRIMARY KEY,
    product_price DECIMAL(4,2),
    quantity_on_hand DECIMAL(5,0),
    last_stock_date DATE
);


INSERT INTO product_m VALUES ('Product1', 99,    1,    TO_DATE('15-JAN-2003', 'DD-MON-YYYY'));
INSERT INTO product_m VALUES ('Product2', 75, 1000,    TO_DATE('15-JAN-2002', 'DD-MON-YYYY'));
INSERT INTO product_m VALUES ('Product3', 50,  100,    TO_DATE('15-JAN-2003', 'DD-MON-YYYY'));
INSERT INTO product_m VALUES ('Product4', 25,10000,    TO_DATE('14-JAN-2003', 'DD-MON-YYYY'));
INSERT INTO product_m VALUES ('Product5',9.95,1234,    TO_DATE('15-JAN-2004', 'DD-MON-YYYY'));
INSERT INTO product_m VALUES ('Product6', 45,    1,    TO_DATE('31-DEC-2008', 'DD-MON-YYYY'));

