  ###  Consider the Country table and Persons table that created earlier and perform the following: 
  use world;
  
  ###  1. Find the number of persons in each country. 
      select count(*),country_name from persons group by country_name;
      
  ###    2. Find the number of persons in each country sorted from high to low. 
  select country_name,count(*) as "No.of person"  from persons  group by country_name order by count(*) desc;
   
  ###    3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
     select avg(Rating),country_name from persons group by country_name having avg(Rating)>3.0  ;
     
  ###  4. Find the countries with the same rating as the USA. (Use Subqueries)
   select country_name,Rating from persons where Rating =(select Rating from persons where country_name='united states');
   
   ###  5. Select all countries whose population is greater than the average population of all nations.
    select country_name,Population from persons where Population>(select avg(Population) from persons);
    
    
    ### Create a database named Product and create a table called Customer with the following fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country
     create database product;
     use product;
     create table customer (
     Customer_Id int PRIMARY KEY,
     First_name varchar(25),
     Last_name varchar(25),
     Email varchar(30),
     Phone_no varchar(20),
     Address varchar(30),
     City varchar(15),
     State varchar(15),
     Zip_code int,
     Country varchar(20));
     
     ### inserting values
     insert into Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) 
values
(101, 'Alice', 'Johnson', 'alice.johnson@email.com', '1256890', '123 Maple St', 'New York', 'CA', '10001', 'USA'),
(102, 'Bob', 'Smith', 'bob.smith@email.com', '23456891', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
(103, 'Charlie', 'Brown', 'charlie.brown@email.com', '4569012', '789 Pine St', 'Chicago', 'CA', '60601', 'USA'),
(104, 'Daisy', 'Miller', 'daisy.miller@email.com', '4678123', '321 Elm St', 'Houston', 'CA', '77001', 'USA'),
(105, 'Sophia', 'Turner', 'sophia.turner@email.com', '2344566', '89 Queen St', 'Toronto', 'Ontario', '15724', 'Canada'),
(106, 'Noah', 'Wang', 'noah.wang@email.com', '3345567', '56 Orchard Rd', 'Singapore', '-', '238845', 'Singapore'),
(107, 'Olivia', 'Schmidt', 'olivia.schmidt@email.com', '4566788', '12 Bahnhof', 'Zurich', 'Zurich', '8001', 'Switzerland'),
(108, 'Lucas', 'Garcia', 'lucas.garcia@email.com', '5567899', '33 Gran Via', 'Madrid', 'Madrid', '28013', 'Spain'),
(109, 'Emma', 'Dubois', 'emma.dubois@email.com', '6678900', '77 Champs-Élysées', 'Paris', 'Île-de-France', '75008', 'France'),
(110, 'William', 'Kim', 'william.kim@email.com', '7789011', '88 Gangnam St', 'Seoul', 'Seoul', '06022', 'South Korea');

insert into Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) 
values
(111, 'Fiona', 'Wilson', 'fiona.wilson@email.com', '6701345', '147 Cedar St', 'Philadelphia', 'CA', '19101', 'USA'),
(112, 'Grace', 'Anderson', 'grace.anderson@email.com', '78012456', '258 Willow St', 'San Antonio', 'CA', '78201', 'USA'),
(113, 'Henry', 'Thomas', 'henry.thomas@email.com', '8124567', '369 Spruce St', 'San Diego', 'CA', '92101', 'USA');

     select * from customer;
###   1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view.
   create view customer_info as select First_name,Last_name,Email from customer;
   select * from customer_info ;
   
###  2. Create a view named US_Customers that displays customers located in the US. 
create  view US_Customer as select Customer_Id,First_name,Last_name,Email,Phone_no,Address,City,State,Zip_code,Country from customer ;
select * from US_Customer where Country='USA';

### 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
create view Cust_view as select concat(First_name," ",Last_name),Email,Phone_no,State from Customer;
select * from cust_view;

###  4. Update phone numbers of customers who live in South Korea for Customer_details view
create view customer_details  as select First_name,Last_name,Phone_no,state,Country from customer;
update customer_details set Phone_no=9754823 where country='South Korea';
select * from customer_details;
SET SQL_SAFE_UPDATES = 0;

### 5. Count the number of customers in each state and show only states with more than 5 customers.
select count(*),state from cust_view  group by State having count(*)>5;

### 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view
select count(*),state from customer_details group by state;

###   7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state;

