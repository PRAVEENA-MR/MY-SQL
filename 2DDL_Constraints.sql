#create database "sales"
#create database sales;
use sales;
create table orders(order_id int primary key,
Customer_Name varchar(20) not null,
Product_Category varchar(20),
Ordered_item varchar(20),
Contact_no long unique );

## 1. Add a new column named "Order quantity" to order table.
 alter table orders add column Order_Quantity int;
 
 ## 2.Rename "orders" table in to "sales_orders"
 rename table orders to sales_orders;
 
 ## 3.insert 10 rows to sales_orders
 
 insert into sales_orders values(1001,'Bharath','furniture','chair',1236251478,4);
 insert into sales_orders values(1002,'saran','furniture','Table',1236258964,2);
 insert into sales_orders values(1003,'jerry','food','bread',1236212364,1);
 insert into sales_orders values(1004,'Alex','beverages','seven up',1236217412,10);
 insert into sales_orders values(1005,'Raj','dairy','egg',1236211596,25);
 insert into sales_orders values(1006,'Rajeev','Petcare','Dog food',1236211586,5);
 insert into sales_orders values(1007,'Baskar','house hold','fan',1786211586,5);
 insert into sales_orders values(1008,'Balu','house hold','clock',1786888586,1);
 insert into sales_orders values(1009,'Vishal','dairy','Milk',1786285216,3);
 insert into sales_orders values(1010,'john','vegitables','corn',1126211586,5);
 
 select * from sales_orders;
 
 ## 4. Retrieve customer_name and Ordered_Item from the sales_orders table
 select Customer_Name,Ordered_item from sales_orders;
 
 ## 5. Use the update command to change the name of the product for any row
 update sales_orders set Ordered_item='milk' where order_id=1005;
 
 ## 6. Delete the sales_orders table from the database.
 drop table sales_orders;
 
 