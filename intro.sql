create DATABASE company_db;
show databases;
use company_db;
CREATE TABLE employee (
    empl_id INT PRIMARY KEY,
    empl_name VARCHAR(100),
    empl_age INT,
    salary DECIMAL(10, 2)
);
show tables;
Insert into employee(empl_id,empl_name,empl_age,salary)Values
(001, 'Sandra', 26, 30000),
(002, 'Andria', 50, 100),
(003, 'Vaidra', 28, 500),
(004, 'ravi', 30, 2000);
select * from employee;
Update employee set empl_name = 'Vaiga' where empl_id = 003;
delete from employee where empl_id = 004;
drop table if exists employee;
show tables;
drop database if exists company_db;
CREATE DATABASE college;
SHOW DATABASES;
USE COLLEGE;
CREATE TABLE students (
course_id int primary key,
student_name varchar(100),
course varchar(100),
student_age int,
fees decimal);
Insert into students(course_id,student_name,course, student_age, fees)Values
(001, 'Sandra', 'Java',26, 300.00),
(002, 'Andria', 'data',50, 100.89),
(003, 'Vaidra', 'java', 28, 500.60),
(004, 'ravi', 'java', 30, 2000.00);

