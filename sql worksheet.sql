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



