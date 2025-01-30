###   Insert 10 rows into both tables, as given below. Create a table named Country with fields: Id Country_name Population Area ###  Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name

 create database world;
 use world;
 create table country( Id int primary key,
 country_name varchar(50),
 Population int,
  Area_kmsqr bigint);
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
  insert into persons values(1000,'Ananya','shekhar',1450935791,4.6,100,'India'),
  (1001,'Bradley','Justin ',345426571,4.6,102,'united states'),
  (1003,'George','Oliver',69138192,4.5,103,'United Kingdom'),
  (1004,'Mason','Jackson',39742430,4,104,'Canada'),
  (1005,'Jack','Charlotte',26713205,3.9,105,'Australia'),
  (1007,'Jack','Charlotte',26713205,3.9,105,'Australia'),
  (1008,'Zhang','Wei',1419321278,4,101,'china'),
  (1009,'Joyo','Kesuma',35557673,3.8,106,'Malaysia');
  select * from persons;
  
##   1. Write an SQL query to print the first three characters of Country_name from the Country table. 
 select substring(country_name,1,3) from country;
   
##  2. Write an SQL query to concatenate first name and last name from Persons table.  
   select concat(Fname,' ',Lname) from persons;
   
##  3. Write an SQL query to count the number of unique country names from Persons table.
    select count(distinct country_name) from country;
    
##  4. Write a query to print the maximum population from the Country table.
       select max(Population) from country;
       
##  5. Write a query to print the minimum population from Persons table.
        select min(Population) from country;
        
##   6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
          insert into persons values(1013,'Anand',null,1450935791,4.6,100,'India'),
								    (1014,'Anu',null,1450935791,4.6,100,'India');
		  select count(Lname) from persons;
          
##   7. Write a query to find the number of rows in the Persons table. 
     select count(*) from persons;    
     
##   8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
        select country_name,Population from country limit 3;
        
##    9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
       select * from country order by rand() limit 3;
       
##     10. List all persons ordered by their rating in descending order.  
       select Fname,Rating from persons order by Rating desc;
       
##     11. Find the total population for each country in the Persons table.  
         select country_name,Population from persons;
         
##     12. Find countries in the Persons table with a total population greater than 50,000 
          select country_name,Population from persons where Population>50000;
          
##      13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
            select country_name,count(*),avg(Rating) from persons   group by country_name having count(*)>2 order by avg(Rating) ;
            



