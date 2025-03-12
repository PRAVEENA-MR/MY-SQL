create database library;
use library;

## creating table Branch
create table Branch (
Branch_no int primary key,
Manager_id int,
Branch_Address varchar(50),
contact_no int
);

## creating table Employee
create table Employee(
Emp_id int primary key,
Emp_name varchar(20),
Position varchar(50),
salary int,
Branch_no  int,
 foreign key (Branch_no) references branch(Branch_no)
);

## creating table Book
create table Books(
ISBN int primary key,
Book_title varchar(50),
category varchar(30),
Rental_price int,
book_status ENUM('Yes', 'No'),
Author varchar(30),
Publisher varchar(30)
);

## creating tableb Customer
create table Customer(
customer_id int primary key,
customer_name varchar(25),
customer_address varchar(50),
Reg_date date
);

## creating table IssueStatus
create table  Issue_status(
issue_id int primary key,
issued_custID int,
issued_book_name varchar(50),
issued_date date,
isbn_book int,
foreign key (issued_custID) references customer(customer_id),
foreign key (isbn_book) references books(ISBN)
);

##  creating table ReturnStatus
create table ReturnStatus(
return_id int primary key,
return_cust varchar(20),
return_book_name varchar(50),
return_date date,
isbn_book2 int,
foreign key (isbn_book2) references books(isbn)
);

## inserting values branch table
insert into branch (Branch_no, Manager_id, Branch_Address, contact_no)  
value 
(1, 101, '7500 Elm St, Dallas, TX', 91478523),  
(2, 102, '303 Willow Lane, Chicago, IL', 83478569),  
(3, 103, '789 Pine Rd, TX', 74125984),
(4, 104, '123 Main St, NY', 98712367),  
(5, 105, '789 Pine Rd, TX', 94565324),
(6, 106, '1200 Sunset Blvd, Los Angeles, CA', 83215001),  
(7, 107, '1420 Cedar Rd, Seattle, WA', 87469831),  
(8, 108, '360 Aspen Ave, Denver, CO', 77852000),  
(9, 109, '555 Oakwood Dr, Boston, MA', 78847598),  
(10, 110, '789 Redwood St, Phoenix, AZ',85697410);
select *  from branch;

## inserting values to Employee table
insert into Employee (Emp_id, Emp_name, Position, Salary, Branch_no) 
values 
(1001, 'Alice Johnson', 'Manager', 75000, 1),
(1002, 'Bob Smith', 'Asst. Librarian', 50000, 2),
(1003, 'Charlie Davis', 'Archivist', 55000, 1),
(1004, 'David Brown', 'Library Clerk', 42000, 3),
(1005, 'Ella White', 'Cataloguer ', 38000, 4),
(1006, 'Frank Green', 'Cataloguer ', 38000, 5),
(1007, 'Grace Miller', 'Cataloguer', 38000, 6),
(1008, 'Henry Wilson', 'Technician', 35000, 5),
(1009, 'Isla Adams', 'Manager', 55000, 8),
(1010, 'Jack Carter', 'Technician', 55000, 9),
(1011, 'Daniel Parker', 'Manager', 68000, 7),
(1012, 'Evelyn White', 'library cleark', 43000, 10),
(1013, 'Henry Collins', 'library clerk', 55000, 9),
(1014, 'Alexander Hall', 'Manager', 78000, 2),
(1015, 'Isabella Young', 'Event Coordinator', 50000, 10),
(1016, 'Samuel King', 'library clerk', 56000, 3);
select* from employee;

## inserting values to book table
insert into Books (ISBN, Book_title, Category, Rental_price, Book_status,author,Publisher) 
value
(100001, 'The Great Gatsby', 'Fiction', 50, 'yes','F. Scott Fitzgerald', 'Scribner'),
(100002, 'Introduction to SQL', 'Education', 70, 'yes','John Doe','Tech Press'),
(100003, 'Data Science Handbook', 'Technology', 90, 'no','Jake VanderPlas','O’Reilly Media'),
(100004, 'Harry Potter', 'Fantasy', 60, 'yes','J.K. Rowling','Bloomsbury'),
(100005, 'Atomic Habits', 'Self-Help', 55, 'yes','James Clear','Avery'),
(100006, 'The Lean Startup', 'Business', 75, 'no','Eric Ries','Crown Business'),
(100007, 'A Brief History of Time', 'Science', 80, 'yes','Stephen Hawking','Bantam Books'),
(100008, 'To Kill a Mockingbird', 'Fiction', 45, 'yes','Harper Lee','J.B. Lippincott & Co.'),
(100009, 'The Psychology of Money', 'Finance', 65,'no','Morgan Housel','Harriman House'),
(100010, 'The Art of War', 'History', 50, 'yes','Sun Tzu','Oxford University Press'),
(100011, 'Digital Marketing 101', 'Business', 60, 'Yes','Jane Smith','Business World'),
(100012, 'Machine Learning Basics', 'Technology', 90, 'No', 'Andrew Ng','O’Reilly Media'),
(100013, 'SQL for Beginners', 'Education', 70, 'yes','Chris Fehily','Peachpit Press'), 
(100014, 'The Art of Leadership', 'Self-Help', 50, 'no','John C. Maxwell','HarperCollins'),
(100015, 'The 7 Habits of Highly Effective People', 'Self-Help', 65, 'Yes','Stephen R. Covey','Free Press'),
(100016, 'The Innovator\'s Dilemma', 'Business', 55, 'No', 'Clayton M. Christensen','Harvard Business Review Press'),
(100017, 'Thinking, Fast and Slow', 'Psychology', 75, 'Yes', 'Daniel Kahneman','Farrar, Straus and Giroux'),
(100018, 'Educated', 'Biography', 70, 'Yes','Tara Westover','Random House','Alex Michaelides','Celadon Books'),
(100019, 'Becoming', 'Biography', 80, 'No','Michelle Obama','Crown Publishing'),
(100020, 'The Silent Patient', 'Thriller', 85, 'Yes','Alex Michaelides','Celadon Books'),
(100021, 'Where the Crawdads Sing', 'Fiction', 65, 'Yes','Delia Owens','G.P. Putnam’s Sons'),
(100022, 'The Night Circus', 'Fantasy', 70, 'No','Erin Morgenstern','Doubleday'),
(100023, 'The Four Winds', 'Historical Fiction', 60, 'Yes','Kristin Hannah','St. Martin’s Press'),
(100024, 'Dune', 'Science Fiction', 90, 'Yes','Frank Herbert','Ace Books');
select * from books;


## inserting values to customer table
insert into customer (customer_id,customer_name,customer_address,Reg_date) values
(10001, 'Alice Johnson', '123 Maple St, Springfield', '2023-01-15'),
(10002, 'Bob Smith', '456 Oak St, Shelbyville', '2020-02-20'),
(10003, 'Charlie Davis', '789 Pine St, Capital City', '2023-01-30'),
(10004, 'Daisy White', '321 Elm St, Springfield', '2022-03-05'),
(10005, 'Ethan Brown', '654 Birch St, Shelbyville', '2023-01-10'),
(10006, 'Fiona Green', '147 Cedar St, Capital City', '2019-02-25'),
(10007, 'Grace Black', '258 Willow St, Springfield', '2022-03-10'),
(10008, 'Henry Blue', '369 Spruce St, Capital City', '2022-01-20'),
(10009, 'Isla Gray', '159 Maple St, Shelbyville', '2018-03-15'),
(10010, 'Jack White', '753 Oak St, Springfield', '2023-02-18'),
(10011, 'Liam Harris', '987 Maple St, Springfield', '2020-02-01'),
(10012, 'Mia Thompson', '654 Oak St, Shelbyville', '2022-03-12'),
(10013, 'Noah Clark', '321 Birch St, Capital City', '2022-01-25'),
(10014, 'Olivia Lewis', '147 Cedar St, Springfield', '2023-02-20'),
(10015, 'Sophia Walker', '258 Pine St, Shelbyville', '2023-01-30'),
(10016, 'William Young', '369 Willow St, Capital City', '2023-02-15'),
(10017, 'Emma King', '159 Spruce St, Springfield', '2021-03-05'),
(10018, 'Ava Scott', '753 Maple St, Shelbyville', '2021-01-18'),
(10019, 'James Green', '852 Oak St, Capital City', '2020-03-20'),
(10020, 'Isabella Martinez', '369 Birch St, Springfield', '2023-02-28'),
(10021, 'Jackson Baker', '135 Pine St, Springfield', '2023-01-22'),
(10022, 'Aiden Nelson', '246 Elm St, Shelbyville', '2023-02-05'),
(10023, 'Grace Carter', '357 Willow St, Capital City', '2023-03-01'),
(10024, 'Henry Adams', '468 Maple St, Springfield', '2023-01-12'),
(10025, 'Ella Phillips', '579 Oak St, Shelbyville', '2023-02-15'),
(10026, 'Lucas Cooper', '680 Birch St, Capital City', '2023-03-10'),
(10027, 'Mason Reed', '791 Cedar St, Springfield', '2023-01-28'),
(10028, 'Lily Rivera', '802 Spruce St, Shelbyville', '2023-02-18'),
(10029, 'Zoe Mitchell', '913 Maple St, Capital City', '2023-03-25'),
(10030, 'Logan Bennett', '024 Oak St, Springfield', '2022-01-01');
select * from customer;

## inserting values to issue_status
insert into issue_status (issue_id,issued_custID,issued_book_name,issued_date,isbn_book) values (50001,10004,'Introduction to SQL','2023-12-28',100002),
(5002,10001,'The Great Gatsby','2024-07-28',100001),
(5003,10002,'Harry Potter','2024-07-20',100004),
(5004,10003,'Atomic Habits','2024-11-8',100005),
(5005,10005,'The Lean Startup','2024-10-02',100006),
(5006,10006,'The Psychology of Money','2023-12-28',100009),
(5007,10007,'A Brief History of Time','2023-06-10',100007),
(5008,10008,'To Kill a Mockingbird','2023-06-03',100008);
select * from issue_status;

## Inserting values to returnstatus

insert into returnstatus(return_id,return_cust,return_book_name,return_date,isbn_book2) values(501,'james','Becoming','2024-12-24',100019),
(502,'Bob','The Great Gatsby','2024-09-20',100001),
(503,'Charlie','Harry Potter','2024-08-21',100004),
(504,'Daisy','Introduction to SQL','2024-12-30',100002),
(509,'Ethan','The Lean Startup','2024-11-15',100006),
(505,'Fiona','The Psychology of Money','2024-03-13',100009),
(506,'Grace','A Brief History of Time','2024-03-03',100007),
(507,'Noah','Digital marketing 101','2025-01-04',100011),
(508,'Mia','Machine learning basics','2025-02-18',100012);
select * from returnstatus;

###   1. Retrieve the book title, category, and rental price of all available books
select Book_title,category,Rental_price,book_status from books where book_status='yes';

###   2. List the employee names and their respective salaries in descending order of salary. 
select  Emp_name,salary from employee order by salary desc;

###   3. Retrieve the book titles and the corresponding customers who have issued those books
select issue_status.issued_book_name,customer.customer_name from issue_status inner join customer on issue_status.issued_custID = customer.customer_id;

###   4. Display the total count of books in each category.
select category,count(*) from books group by category;

###   5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select Emp_name,position,salary from employee where salary>50000;

###   6. List the customer names who registered before 2022-01-01 and have not issued any books yet
select customer.customer_name from customer left join issue_status on customer.customer_id=issue_status.issued_custID  where customer.Reg_date = '2022-01-01';

###  7. Display the branch numbers and the total count of employees in each branch.
select branch.Branch_no,count(employee.Emp_id) as 'No.of employee'from employee inner join branch on employee.Branch_no = branch.Branch_no group by branch.Branch_no;

###   8. Display the names of customers who have issued books in the month of June 2023.
select customer.customer_name from customer inner join issue_status on customer.customer_id=issue_status.issued_custID where issue_status.issued_date between '2023-06-01' and '2023-06-30';
###   9. Retrieve book_title from book table containing history.
select Book_title from books where category='History';

### 10.Retrieve the branch numbers along with the count of employees for branches having more than 2 employees
 select branch.Branch_no,count(employee.Emp_id)  from branch inner join employee on branch.branch_no=employee.branch_no group by branch.branch_no having count(employee.Emp_id) >=2;

### 11. Retrieve the names of employees who manage branches and their respective branch addresses.
select employee.Emp_name,employee.position,branch.Branch_Address from branch left join employee on employee.Branch_no=branch.Branch_no where employee.position='manager';
 
###  12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
 select customer_name from customer where customer_id in(select issued_custID from issue_status where isbn_book in (select ISBN from books where Rental_price>25));