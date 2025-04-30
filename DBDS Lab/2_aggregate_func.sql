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

CREATE SYNONYM prod_m FOR product_m;
