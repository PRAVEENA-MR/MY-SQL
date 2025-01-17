use sales;
create table Managers(
 Manager_Id int,
 First_name varchar(10),
 Last_name varchar(10),
 DOB date,
 Age int check (Age>=35),
 Gender varchar(2),
 Department varchar(25),
 Salary int not null
 );
 
 select * from Managers;
 ##  1. Insert 10 rows
 insert into managers values(1,'John','Antony','1985-11-10',40,'M','IT',35000);
 insert into managers values(2,'Aaliya','bahu','1990-01-12',35,'M','Sales',45000);
 insert into managers values(3,'Merry','John','1985-11-10',40,'F','IT',25000);
 insert into managers values(4,'arun','Raghav','1990-07-20',35,'M','sales',40000);
 insert into managers values(5,'Ishani','Dhanesh','1990-04-09',35,'F','HR',45000);
 insert into managers values(6,'Lisna','john','1988-01-18',37,'F','HR',45000);
 insert into managers values(7,'Albin','Antony','1988-01-22',38,'M','IT',40000);
 insert into managers values(8,'Jerry','bose','1982-11-10',44,'M','sales',25000);
 insert into managers values(9,'Abu','Arakkal','1989-11-10',36,'M','IT',35000);
 insert into managers values(10,'John','Antony','1985-11-10',40,'M','IT',30000);
 
 select * from managers;
 
 ## 2.Write a query that retrieve the name and DOB of manager with manager_id
 
 select Manager_Id,First_name,Last_name,DOB from managers;
 
 ## 3. write a query to display annual income of all managers
 
 select First_name,Salary*12  as "Annual income" from managers;
 
 ##  4.write query to display records of all managers except 'Aaliya'
 
 select * from managers where First_name <> 'Aaliya'  ;
 
 ## 5. write a query to display details of managers whose depatment id IT and earns more than 25000 per month
 
 select * from managers where Department='IT' and Salary>25000;
 
 ## 6. Write a query to display details of managers  whose salary is between 10000 and 35000.
 
 select * from managers where Salary between 10000 and 35000;
 