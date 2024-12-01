use my_training_db;
-- DDL : Data Definition Language 
create table employee
	(id int primary key auto_increment, 
     name varchar(255) not null, 
     city varchar(255) not null, 
     salary double default 0, 
     department varchar(255) not null);
   
describe employee;

#drop table employee
drop table employee; 

#display all tables 
show tables; 

#change column name - Alter table table_name CHANGE old_column new_column defination 
Alter table employee CHANGE department dept varchar(255) not null; 

#change column defination - alter table table_name MODIFY attr_name defination 
alter table employee MODIFY dept varchar(55) default 'IT';

#ADD new column 
alter table employee ADD contact varchar(255) not null;

#DROP column 
alter table employee DROP column contact;

#Insert records in employee table

insert into employee(name,city,salary,dept) values ('harry potter', 'london', 90000, 'IT');


insert into employee(name,city,salary,dept) values 
('ronald weasley', 'surrey', 75000, 'TESTING'),
('hermione granger', 'london', 95000, 'IT');

#delete a particular record 
delete from employee where id=1;

#delete all records 
delete from employee; -- not recommended 
truncate employee ; -- recommended if deletion of all records is needed. no where clause 

#display all records 
select * from employee; 
-- https://github.com/Wiz-TechSkillsIT/SQL-Programming/blob/main/employee_insertions.txt
INSERT INTO employee (name, city, salary, dept) VALUES
('John Smith', 'New York', 55000, 'Sales'),
('Jane Doe', 'Los Angeles', 72000, 'Marketing'),
('Emily Davis', 'Chicago', 65000, 'Finance'),
('Michael Brown', 'Houston', 61000, 'HR'),
('Jessica Johnson', 'Phoenix', 58000, 'Sales'),
('David Wilson', 'Philadelphia', 53000, 'IT'),
('Sarah Lee', 'San Antonio', 71000, 'Marketing'),
('James Miller', 'San Diego', 50000, 'Finance'),
('Laura Martin', 'Dallas', 67000, 'HR'),
('Robert Anderson', 'San Jose', 62000, 'IT'),
('Sophia Hernandez', 'Austin', 69000, 'Sales'),
('Daniel Thompson', 'Jacksonville', 75000, 'Marketing'),
('Olivia Garcia', 'Fort Worth', 54000, 'Finance'),
('Christopher Martinez', 'Columbus', 61000, 'HR'),
('Mia Robinson', 'Charlotte', 63000, 'IT'),
('William Clark', 'San Francisco', 80000, 'Sales'),
('Isabella Rodriguez', 'Indianapolis', 67000, 'Marketing'),
('Benjamin Lewis', 'Seattle', 55000, 'Finance'),
('Ava Walker', 'Denver', 71000, 'HR'),
('Lucas Hall', 'Boston', 59000, 'IT');
/* Q1. display all records that work in dept: IT */
select * 
from employee 
where dept='IT';
/* Q2. display all records that work in dept: 'IT' & live in city 'london' */
select *
from employee
where dept='IT' AND city='london';
/* Q3. display all employees that work in dept: 'Finance' OR have salary > 80000 */
select * 
from employee
where dept='finance' OR salary>80000;
/*Q4. Display all employees that work in following departments ['finance','sales'] */
select *
from employee 
where dept='finance' OR dept='sales';
-- better alternative
select * 
from employee
where dept IN ('finance','sales');

/*Q5. Display all employees having salary greater than 65000 but less than 70000 */
select *
from employee 
where salary between 65000 AND 70000;

/*Q6. Display all employees whose name matches the given search keyword: on */
select *
from employee 
where name LIKE '%on%';

select *
from employee 
where name LIKE '%davis%';

/*Q7. Display all employees whose name matches given keyword. the name should start with this keyword */
select * 
from employee
where name like 'harry%';

-- ending with keyword
select * 
from employee
where name like '%son';

/*Q8. Display employee whose city is NULL */
select * 
from employee 
where city IS NOT NULL; 

/* Grouping Functions 
1. Count
2. Min
3. Max
4. Avg
5. Sum 
*/
select count(*) as number_of_employees
from employee 
where salary between 65000 AND 70000;

select MIN(salary) 
from employee; 

select MAX(salary) 
from employee; 

select AVG(salary) 
from employee;

select SUM(salary) 
from employee; 

/* Display number of employees from each department */
select dept,count(*)
from employee
group by dept;

/* Display max salary of employee from each department */ 
 
select dept, max(salary) as MAX_SALARY
from employee
group by dept; 

/*
dept=IT
 1 | harry potter         | london        |  90000 | IT        |
 3 | hermione granger     | london        |  95000 | IT        |
 9 | David Wilson         | Philadelphia  |  53000 | IT        |
13 | Robert Anderson      | San Jose      |  62000 | IT        |

 dept=Sales
 4 | John Smith           | New York      |  55000 | Sales     |
 8 | Jessica Johnson      | Phoenix       |  58000 | Sales     |
*/

/*
SQL Structure
 select 
 from 
 where <condition on attributes> <optional>
 group by <optional>
 having <condition on grouping function>
 order by attribute/grouping function ASC** | DESC -- numerical attribute values 
 limit <value>, <i,j>
*/

-- Q.display all dept having employees more than 2 and display in ASC order 

select dept, count(*) as NUMBER_OF_EMPLOYEES
from employee
group by dept 
having NUMBER_OF_EMPLOYEES > 2
order by NUMBER_OF_EMPLOYEES DESC;

select * 
from employee
order by salary DESC
limit 5;
/*
+----+------------------+---------------+--------+-----------+
| id | name             | city          | salary | dept      |
+----+------------------+---------------+--------+-----------+
|  3 | hermione granger | london        |  95000 | IT        |
|  1 | harry potter     | london        |  90000 | IT        |
| 19 | William Clark    | San Francisco |  80000 | Sales     |
|  2 | ronald weasley   | surrey        |  75000 | TESTING   |
| 15 | Daniel Thompson  | Jacksonville  |  75000 | Marketing |
+----+------------------+---------------+--------+-----------+
*/
select * 
from employee
order by salary DESC
limit 5,5;
-- start point: 5 
-- number of records: 5
/*
+----+------------------+-------------+--------+-----------+
| id | name             | city        | salary | dept      |
+----+------------------+-------------+--------+-----------+
|  5 | Jane Doe         | Los Angeles |  72000 | Marketing |
| 10 | Sarah Lee        | San Antonio |  71000 | Marketing |
| 22 | Ava Walker       | Denver      |  71000 | HR        |
| 14 | Sophia Hernandez | Austin      |  69000 | Sales     |
| 12 | Laura Martin     | Dallas      |  67000 | HR        |
+----+------------------+-------------+--------+-----------+
*/
select * 
from employee
order by salary DESC
limit 10,5;
/*
+----+--------------------+--------------+--------+-----------+
| id | name               | city         | salary | dept      |
+----+--------------------+--------------+--------+-----------+
| 20 | Isabella Rodriguez | Indianapolis |  67000 | Marketing |
|  6 | Emily Davis        | Chicago      |  65000 | Finance   |
| 18 | Mia Robinson       | Charlotte    |  63000 | IT        |
| 13 | Robert Anderson    | San Jose     |  62000 | IT        |
|  7 | Michael Brown      | Houston      |  61000 | HR        |
+----+--------------------+--------------+--------+-----------+
*/