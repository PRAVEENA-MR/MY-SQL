create database emp;
use emp;
create table worker(Worker_Id INT,
 FirstName CHAR(25),
 LastName CHAR(25),
 Salary INT,
 JoiningDate DATETIME,
 Department CHAR(25));
 desc worker;
 
 
 --  1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
 
 delimiter #
 create procedure insert_values(IN id int,
 IN F_name char(25),
 IN L_name char(25),
 IN sal int,
 IN J_date datetime,
 IN dept char(25)
 )
 begin
    insert into worker (Worker_Id,FirstName,LastName,Salary,JoiningDate,Department) values (id,F_name,L_name,sal,J_date,dept);
  end #
  delimiter ;
  
  call insert_values(101,'John','Antony',45000,'2020-02-01 09:01:05','HR');
  call insert_values(102,'Mathew','Smith',55000,'2022-10-01 09:01:08','Sales');
  call insert_values(103,'Arun','Raj',50000,'2019-10-01 09:01:05','IT');
call insert_values(104,'Anu','Thomas',35000,'2023-09-01 09:05:05','Administration');
call insert_values(105,'Nila','Aravind',35000,'2022-09-01 09:01:05','HR');
call insert_values(106,'Meera','Vasu',30000,'2023-08-01 09:08:05','IT');

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call

delimiter #
create procedure get_salary(IN id int,OUT p_salary int)
 Begin 
     select FirstName,Salary from worker where Worker_Id=id;
 end #
delimiter ;

call get_salary(101,@s);
call get_salary(102,@s);
call get_salary(103,@s);
call get_salary(104,@s);
call get_salary(105,@s);
call get_salary(106,@s);

--  3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.
   
     delimiter #
     create procedure update_Dpt(IN id int,IN dept varchar(25))
     begin
       update worker set Department=dept where Worker_Id=id;
     end #
     delimiter ;
     
     SET SQL_SAFE_UPDATES = 0;
     call update_Dpt(106,'HR');
	 call update_Dpt(106,'IT');
     
     -- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.
     
     delimiter #
     create procedure worker_Count(IN p_dpt varchar(25),OUT p_workerCount int)
       begin 
           select count(*) from worker where Department=p_dpt;
	   end #
       delimiter ;
       
       call worker_Count('IT',@c);
       call worker_Count('HR',@c);
       call worker_Count('Administration',@c);
	   call worker_Count('Sales',@c);
       
 -- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.      
       
       delimiter #
       create procedure avg_salary(IN Dept varchar(25),OUT p_avgSalary int)
       begin
           select avg(Salary) from worker where Department=Dept;
       end #
       delimiter ;
     
     call avg_salary('IT',@s);
     call avg_salary('Sales',@s);
     call avg_salary('HR',@s);
     call avg_salary('Administration',@s);
     
  select * from worker;
  
  