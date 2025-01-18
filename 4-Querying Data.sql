###  Create a table named Country with fields: Id Country_name Population Area
 create database world;
 use world;
 create table country( Id int primary key,
 country_name varchar(50),
 Population int,
  Area_(kmsqr) bigint);
  ### insert 10 rows into table
  
  insert into country values(100,'India',1450935791,2973190);
  insert into country values(101,'China',1419321278,9388211);
  insert into country values(102,'United States',345426571,9147420);
  insert into country values(103,'United Kingdom',69138192,241930);
  insert into country values(104,'Canada',39742430,9093510);
  insert into country values(105,'Australia',26713205,7682300);
  insert into country values(106,'Malaysia',35557673,328550);
  insert into country values(107,'Eswatini',1242822,17200);
  insert into country values(108,'Guam',167777,540);
  insert into country values(109,'Grenada',117207,340);
  insert into country values(110,'United Arab Emirates',11027129,83600);
 
  select * from country;
  
 ### Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name
 
 create table persons(
  id int,
  Fname varchar(20),
  Lname varchar(20),
  Population int,
  Rating decimal(3,2),
  country_id int,
  country_name varchar(20) );
  
  ### inserting 10 rows to person table
  insert into persons values(1000,'Ananya','shekhar',1450935791,4.6,100,'India');
  insert into persons values(1001,'Bradley','Justin ',345426571,4.6,102,'united states');
  insert into persons values(1003,'George','Oliver',69138192,4.5,103,'United Kingdom');
  insert into persons values(1004,'Mason','Jackson',39742430,4,104,'Canada'); 
  insert into persons values(1005,'Jack','Charlotte',26713205,3.9,105,'Australia'); 
 insert into persons values(1006,'david','george',156245685,3.9,112,'null'); 
  insert into persons values(1007,'Jack','Charlotte',26713205,3.9,105,'Australia'); 
  insert into persons values(1008,'Zhang','Wei',1419321278,4,101,'china');
  insert into persons values(1009,'Joyo','Kesuma',35557673,3.8,106,'Malaysia');

  select * from persons;
  
  ###  (1)List the distinct country names from the Persons table 
   select distinct country_name from persons;
   
   ###  (2)Select first names and last names from the Persons table with aliases. 
  select concat( Fname,' ', Lname) as full_name from persons;
  
  ###(3)Find all persons with a rating greater than 4.0.
  select Fname from persons where Rating>4.0;

  ### (4)Find countries with a population greater than 10 lakhs.
  select country_name from country where Population>1000000;
  
  ### (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
  select Fname from persons where country_name='united states' and Rating>4.5;
  
  ### (6)Find all persons where the country name is NULL.
  select Fname from persons where country_name='null';
  
  ###(7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
  select Fname from persons where country_name in('united states','canada','united kingdom');
  
  ### (8)Find all persons not from the countries 'India' and 'Australia'.
  select Fname from persons where country_name not in('India','Australia');
  
  ###  (9)Find all countries with a population between 5 lakhs and 20 lakhs.
  select country_name from country where Population between 500000 and 2000000;
  
  ###  (10)Find all countries whose names do not start with 'C'.
  select country_name from  country where country_name not like 'C%' ;
  