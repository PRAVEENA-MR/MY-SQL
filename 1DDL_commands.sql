#creating database school and using database
#create database school;
use school;

#creating table named 'students' with coloumn 'Roll_No','Name','Marks','Grade'
create table students(
Roll_no int ,
Name varchar(20),
Marks int,
Grade char
);

#Insering values to table students

insert into students value(1,'Anu',95,'A');
insert into students value(2,'Binu',85,'B');
insert into students value(3,'Tom',78,'c');
insert into students value(4,'Jerry',96,'A');
insert into students value(5,'Manu',85,'B');
insert into students value(6,'Zinu',79,'C');

#  1. use select command to display table
select * from students;

# 2. Add column named 'contact' to student
alter table students add column Contact int;

# 3. Remove 'Grade' column from table students
alter table students drop column Grade;

# 4. Rename table students into CLASSTEN
 rename table students to CLASSTEN;

# 5. Delete all rows
 truncate table CLASSTEN;
 
 # 6. Remove table from database
 drop table CLASSTEN;

