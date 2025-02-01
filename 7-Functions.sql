##  Consider the Country table and Persons table that created earlier and perform the following:
use world;
##   1. Add a new column called DOB in Persons table with data type as Date.
alter table persons add  DOB date;
update persons set DOB='1985-11-10' where id=1000; 
SET SQL_SAFE_UPDATES = 0;
update persons set DOB='1990-10-1' where id=1001; 
update persons set DOB='1992-01-05' where id=1002; 
update persons set DOB='1995-09-19' where id=1003; 
update persons set DOB='1989-11-18' where id=1004; 
update persons set DOB='1997-10-17' where id=1005;
update persons set DOB='1996-02-20' where id=1006; 
update persons set DOB='1993-01-22' where id=1007;  
update persons set DOB='1999-03-29' where id=1008; 
update persons set DOB='1994-11-25' where id=1009; 
update persons set DOB='1989-11-17' where id=1013; 
update persons set DOB='1991-11-15' where id=1014; 
select * from persons;

##    2. Write a user-defined function to calculate age using DOB.
DROP FUNCTION IF EXISTS get_age;
delimiter ##
create function get_age(d date)
returns int
deterministic
   begin
		declare age int;
      set  age = timestampdiff(year,d,curdate());
      return age;
   end ##
delimiter ;
select get_age('1991-11-15') from persons;

##    3. Write a select query to fetch the Age of all persons using the function that has been created
       select Fname,get_age(DOB) as age from persons;

##    4. Find the length of each country name in the Country table
     select country_name,char_length(country_name)  as "Character length" from country;
     
##   5. Extract the first three characters of each country's name in the Country table.
      select country_name,substring(country_name,1,3) as "First 3 characters" from country;
      
##   6. Convert all country names to uppercase and lowercase in the Country table.
       select upper(country_name)  "COUNTRY NAMES IN UPPERECASE" from country;
       
     
     