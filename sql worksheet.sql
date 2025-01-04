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
 
show databases; 
use my_training_db;
show tables;
describe student_course;

INSERT INTO address (id, address_line, city) VALUES (1, '7298 Sarah Freeway
Port Michael, NM 84154', 'Jennamouth');
INSERT INTO address (id, address_line, city) VALUES (2, '5598 Matthew Route Suite 116
Harrismouth, NJ 80851', 'Port Amyside');
INSERT INTO address (id, address_line, city) VALUES (3, '813 Alvarez Street Suite 451
Michaelborough, MO 84456', 'Lake Richard');
INSERT INTO address (id, address_line, city) VALUES (4, '310 Scott Branch
South Mario, IN 97610', 'Geraldport');
INSERT INTO address (id, address_line, city) VALUES (5, '271 Walters Mission
Burkeshire, MO 28897', 'Lake Monicashire');
INSERT INTO address (id, address_line, city) VALUES (6, '27650 James Flats
Charlesview, NY 58920', 'South Brentville');
INSERT INTO address (id, address_line, city) VALUES (7, '7405 Sherman Fall
East Austin, DE 52703', 'North Lauraburgh');
INSERT INTO address (id, address_line, city) VALUES (8, '4994 Tonya Knolls
New Joshua, SC 42122', 'West Taylor');
INSERT INTO address (id, address_line, city) VALUES (9, '215 Marcus Crossing Suite 590
Christopherton, NE 32229', 'Lake Lisahaven');
INSERT INTO address (id, address_line, city) VALUES (10, '960 Chelsea Prairie
New Barry, IN 25050', 'Michaelville');
INSERT INTO address (id, address_line, city) VALUES (11, '948 Thompson Fork
New Miabury, NC 03010', 'Michellefort');
INSERT INTO address (id, address_line, city) VALUES (12, '6153 Robert Streets
North Derek, NJ 76509', 'Lake Sarah');
INSERT INTO address (id, address_line, city) VALUES (13, '5724 Villarreal Island
Lake Tina, NM 17585', 'Wardtown');
INSERT INTO address (id, address_line, city) VALUES (14, '87538 Morgan Crossroad
Moyermouth, AL 93536', 'Brightshire');
INSERT INTO address (id, address_line, city) VALUES (15, '86292 Warner Tunnel
Abigailstad, ID 69737', 'New Amandachester');
INSERT INTO address (id, address_line, city) VALUES (16, '6863 Lambert Stravenue Apt. 793
West Zacharystad, TN 32496', 'Mirandafort');
INSERT INTO address (id, address_line, city) VALUES (17, '55833 Daniel Courts Suite 978
Patrickmouth, SD 99728', 'North Rogerfort');
INSERT INTO address (id, address_line, city) VALUES (18, '80854 Mcdonald Path
New Elizabethberg, AK 96243', 'Choiberg');
INSERT INTO address (id, address_line, city) VALUES (19, '1648 Craig Skyway
Atkinsside, OH 59542', 'West Gregoryport');
INSERT INTO address (id, address_line, city) VALUES (20, '180 Smith Ville Apt. 211
Fisherberg, LA 15502', 'Karenmouth');
INSERT INTO department (id, name) VALUES (1, 'Computer Science');
INSERT INTO department (id, name) VALUES (2, 'Electrical Engineering');
INSERT INTO department (id, name) VALUES (3, 'Mechanical Engineering');
INSERT INTO course (id, name, credit, department_id) VALUES (1, 'Data Structures', 3, 1);
INSERT INTO course (id, name, credit, department_id) VALUES (2, 'Algorithms', 4, 1);
INSERT INTO course (id, name, credit, department_id) VALUES (3, 'Circuits', 3, 2);
INSERT INTO course (id, name, credit, department_id) VALUES (4, 'Thermodynamics', 4, 3);
INSERT INTO course (id, name, credit, department_id) VALUES (5, 'Operating Systems', 3, 1);
INSERT INTO course (id, name, credit, department_id) VALUES (6, 'Control Systems', 4, 2);
INSERT INTO course (id, name, credit, department_id) VALUES (7, 'Fluid Mechanics', 3, 3);
INSERT INTO student (id, name, email, address_id) VALUES (1, 'Brian Ramirez MD', 'kennethscott@hotmail.com', 18);
INSERT INTO student (id, name, email, address_id) VALUES (2, 'Melinda Wilson DDS', 'carpenterscott@yahoo.com', 11);
INSERT INTO student (id, name, email, address_id) VALUES (3, 'Willie Gray', 'brett37@hotmail.com', 5);
INSERT INTO student (id, name, email, address_id) VALUES (4, 'George Simmons', 'jasminewatts@king.com', 12);
INSERT INTO student (id, name, email, address_id) VALUES (5, 'Jesse Boyle', 'timothyschroeder@gmail.com', 1);
INSERT INTO student (id, name, email, address_id) VALUES (6, 'Todd Lee', 'frostlisa@yahoo.com', 17);
INSERT INTO student (id, name, email, address_id) VALUES (7, 'Jose Hurley', 'pfox@jones-peters.org', 13);
INSERT INTO student (id, name, email, address_id) VALUES (8, 'Alexis Mcbride', 'nicolefuller@carroll.net', 7);
INSERT INTO student (id, name, email, address_id) VALUES (9, 'Andrew Porter', 'cody30@hotmail.com', 20);
INSERT INTO student (id, name, email, address_id) VALUES (10, 'Curtis Gallagher', 'murphychristopher@thomas-martin.com', 1);
INSERT INTO student (id, name, email, address_id) VALUES (11, 'Kristen Watson', 'zward@yahoo.com', 3);
INSERT INTO student (id, name, email, address_id) VALUES (12, 'Sarah Sanchez', 'kimberly30@roman.org', 2);
INSERT INTO student (id, name, email, address_id) VALUES (13, 'George Rivera', 'dcraig@thomas-butler.com', 17);
INSERT INTO student (id, name, email, address_id) VALUES (14, 'Travis Marshall', 'cassandraharper@gmail.com', 1);
INSERT INTO student (id, name, email, address_id) VALUES (15, 'Stuart Harris', 'yhoffman@gmail.com', 9);
INSERT INTO student (id, name, email, address_id) VALUES (16, 'Taylor Chapman', 'daniellecameron@davis.info', 8);
INSERT INTO student (id, name, email, address_id) VALUES (17, 'Laura Williams', 'elliottsara@gmail.com', 1);
INSERT INTO student (id, name, email, address_id) VALUES (18, 'Phyllis Cook', 'sanchezkeith@barajas.biz', 8);
INSERT INTO student (id, name, email, address_id) VALUES (19, 'Derrick Williams', 'gilmoreryan@hotmail.com', 5);
INSERT INTO student (id, name, email, address_id) VALUES (20, 'Gregory Best', 'daniel64@anthony.com', 12);
INSERT INTO instructor (id, name, salary) VALUES (1, 'Daryl Vaughn', 66219);
INSERT INTO instructor (id, name, salary) VALUES (2, 'Ryan Gonzales', 63286);
INSERT INTO instructor (id, name, salary) VALUES (3, 'William Mann', 78944);
INSERT INTO instructor (id, name, salary) VALUES (4, 'Jillian Charles', 60162);
INSERT INTO instructor (id, name, salary) VALUES (5, 'Travis Taylor', 60048);
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (1, 6, '2023-12-06');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (1, 1, '2024-01-15');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (1, 4, '2023-06-10');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (1, 2, '2024-01-05');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (2, 1, '2024-11-12');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (2, 7, '2024-12-02');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (3, 5, '2024-10-11');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (3, 7, '2024-11-26');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (3, 2, '2023-04-26');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (3, 1, '2023-02-24');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (4, 6, '2024-05-11');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (4, 1, '2024-02-28');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (4, 7, '2024-07-23');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (4, 3, '2024-06-20');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (5, 1, '2024-05-21');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (5, 2, '2023-12-18');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (5, 3, '2024-04-19');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (6, 4, '2023-04-05');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (6, 2, '2024-01-03');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (6, 6, '2023-07-03');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (6, 5, '2023-07-26');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (7, 5, '2024-11-28');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (7, 4, '2023-10-07');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (7, 6, '2024-12-17');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (8, 5, '2024-07-27');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (8, 3, '2024-08-06');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (9, 7, '2023-08-05');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (9, 5, '2024-08-25');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (9, 4, '2023-08-31');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (9, 1, '2023-07-15');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (10, 4, '2023-08-22');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (10, 6, '2023-11-04');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (10, 2, '2024-07-06');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (11, 6, '2023-12-14');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (11, 4, '2023-01-13');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (12, 3, '2024-11-04');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (12, 6, '2024-07-13');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (12, 4, '2023-06-04');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (13, 7, '2024-02-07');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (13, 1, '2024-05-19');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (13, 2, '2024-05-03');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (13, 5, '2023-11-16');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (14, 3, '2023-07-16');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (14, 4, '2023-02-18');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (14, 7, '2023-09-16');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (15, 3, '2024-05-31');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (15, 4, '2023-10-27');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (16, 4, '2024-12-02');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (16, 5, '2023-01-02');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (17, 5, '2024-11-09');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (17, 1, '2024-07-13');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (17, 7, '2024-09-15');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (17, 6, '2024-12-10');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (18, 4, '2023-09-17');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (18, 7, '2024-10-17');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (18, 6, '2024-07-04');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (18, 5, '2024-01-21');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (19, 3, '2024-03-30');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (19, 5, '2023-03-14');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (19, 4, '2024-10-17');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (19, 1, '2023-12-05');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (20, 5, '2023-09-16');
INSERT INTO student_course (student_id, course_id, date_of_enrollment) VALUES (20, 1, '2023-06-30');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (1, 2, '2022');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (1, 1, '2023');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (2, 1, '2016');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (3, 5, '1985');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (3, 2, '1980');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (4, 5, '2003');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (4, 3, '2012');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (5, 5, '2019');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (5, 2, '1971');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (6, 3, '1973');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (7, 5, '1985');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (2, 3, '2024');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (3, 3, '1972');
INSERT INTO course_instructor (course_id, instructor_id, year) VALUES (7, 3, '2011');
 
select * from student;
select * from course; 
select * from student_course; 

/* Manual Mapping */

-- display list of courses belonging to particular department (Computer Science)
/*
 projection: courses info 
 condition: department 
*/
select c.*
from course c,department d
where c.department_id = d.id and d.name='Computer Science';

-- display courses taught by given instructor(s) [Daryl Vaughn,Travis Taylor]
/*
projection: courses info 
condition: instructor
*/

select * from instructor; 

select c.*
from course c,course_instructor ci,instructor i 
where c.id = ci.course_id 
AND ci.instructor_id = i.id 
AND i.name IN ('Daryl Vaughn');

-- display student info taught by given instructor(s) [Daryl Vaughn,Travis Taylor]

/*
projection: student
condition: instructor
*/
select distinct (s.id), s.name , a.city
from student s, student_course sc, course c, course_instructor ci, instructor i, address a
where s.id = sc.student_id 
AND sc.course_id = c.id 
AND c.id = ci.course_id 
AND ci.instructor_id = i.id 
AND s.address_id = a.id
AND i.name IN ('Daryl Vaughn');

-- display number of students associated with each instructor 

/*
projection: student
condition: instructor
*/

select i.name,count(distinct s.id)
from student s, student_course sc, course c, course_instructor ci, instructor i
where s.id = sc.student_id 
AND sc.course_id = c.id 
AND c.id = ci.course_id 
AND ci.instructor_id = i.id  
group by i.name; 
 
/*
JOINS 
*/
-- display list of courses belonging to particular department (Computer Science)

/*
 projection: courses info 
 condition: department 
*/
select c.*
from course c INNER JOIN department d ON c.department_id = d.id 
where d.name='Computer Science';

-- display courses taught by given instructor(s) [Daryl Vaughn,Travis Taylor]
/*
projection: courses info 
condition: instructor
*/

select c.*
from course c 
JOIN course_instructor ci ON c.id = ci.course_id
JOIN instructor i ON ci.instructor_id = i.id 
where i.name IN ('Daryl Vaughn');

-- display student info with city taught by given instructor(s) [Daryl Vaughn,Travis Taylor]

/*
projection: student,address 
condition: instructor
*/

select distinct s.id, s.name, a.city 
from instructor i 
JOIN course_instructor ci ON ci.instructor_id = i.id 
JOIN course c ON c.id = ci.course_id
JOIN student_course sc ON c.id = sc.course_id 
JOIN student s ON s.id = sc.student_id 
JOIN address a ON a.id = s.address_id
where i.name IN ('Daryl Vaughn');

/*
INNER JOIN / JOIN 
LEFT JOIN 
RIGHT JOIN 

t1 JOIN t2 
- instructor join student 
jillian charles 0 

instructor LEFT JOIN student 

*/

-- display number of students associated with each instructor 

/*
projection: student
condition: instructor
*/

(select i.name, count(distinct s.id) as number_of_students
from instructor i 
LEFT JOIN course_instructor ci ON ci.instructor_id = i.id 
LEFT JOIN course c ON c.id = ci.course_id
LEFT JOIN student_course sc ON c.id = sc.course_id 
LEFT JOIN student s ON s.id = sc.student_id 
group by i.name
order by number_of_students DESC)

UNION

(select i.name, count(distinct s.id) as number_of_students
from instructor i 
RIGHT JOIN course_instructor ci ON ci.instructor_id = i.id 
RIGHT JOIN course c ON c.id = ci.course_id
RIGHT JOIN student_course sc ON c.id = sc.course_id 
RIGHT JOIN student s ON s.id = sc.student_id 
group by i.name
order by number_of_students DESC) ;

/* Nested Queries */

-- display courses taught by given instructor(s) [Daryl Vaughn,Travis Taylor]
/*
projection: course
condition: instructor 
*/
-- =, IN, NOT IN , EXISTS, NOT EXISTS , > < 

select *
from course
where id NOT IN (select course_id 
			 from course_instructor 
             where instructor_id IN (select id 
									 from instructor 
                                     where name IN ('Daryl Vaughn')));

  
-- EXISTS 
-- Display all instructors that have taught course to atleast 1 student. 

select i.name
from instructor i
where NOT EXISTS (
				select 1
				from course_instructor ci 
				JOIN course c ON c.id = ci.course_id
				JOIN student_course sc ON c.id = sc.course_id 
				where ci.instructor_id = i.id 
                );

/*
customer -- apply loan 

--- loan (exists a loan )
*/




