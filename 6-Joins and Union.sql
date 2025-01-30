###  Consider the Country table and Persons table that created earlier and perform the following.

### (1)Perform inner join, Left join, and Right join on the tables. 
  ###   Inner join
      select country.country_name,country.Population,persons.Fname,persons.Lname,persons.Rating from country inner join persons on country.Id=persons.country_id;
  ###   Left join 
       select country.country_name,country.Population,persons.Fname,persons.Lname,persons.Rating from country left join persons on country.Id=persons.country_id;
  ###  Right join
		select country.country_name,country.Population,persons.Fname,persons.Lname,persons.Rating from country Right join persons on country.Id=persons.country_id;
        
###    (2)List all distinct country names from both the Country and Persons tables.
	      select distinct country.country_name,persons.country_name from country inner join persons on persons.country_id=country.Id;
          
###    (3)List all country names from both the Country and Persons tables, including duplicates.
           select  country.country_name,persons.country_name from country inner join persons on persons.country_id=country.Id;
           
###    (4)Round the ratings of all persons to the nearest integer in the Persons table.
        select Fname,round(Rating) from persons;
         