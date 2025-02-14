##  1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows
use school;
create table teachers(
id int,
name varchar(20),
subject varchar(20),
experience float,
salary int
);
insert into teachers values(101,'Anu','maths',1.5,20000),
						   (102,'Meera','chemisry',5,28000),
                           (103,'Arun','CS',8,30000),
                           (104,'kavya','English',5,28000),
                           (105,'Varun','Physics',9,40000),
                           (106,'Neena','maths',4,25000),
                           (107,'Vasu','Maths',5,29000),
                           (108,'Jan','English',3,25000);
	select * from teachers;
    
##   2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 
                 delimiter &&
                   create trigger before_insert_teacher
                   before insert on teachers for each row
                   begin
                      if new.salary<0 then 
                      signal sqlstate '45000'
                      set message_text='Salary cannot be negative';
                      end if;
				   end &&
                   delimiter ;
                   
	 insert into teachers values(109,'Anusha','maths',1.5,-10000);
     
     
##    3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.  
       create table teacher_log(
        teacher_id int,
        action varchar(20),
        timestamp timestamp
         );
         
       delimiter &&
      create trigger after_insert_teacher
      after insert on teachers
      for each row 
      begin
        insert into teacher_log(teacher_id,action,timestamp) values(new.id,"inserting",now());
      end &&
      delimiter ;
      
      insert into teachers values(110,'Anusha','maths',1.5,20000);
      insert into teachers values(111,'Nancy','maths',11,45000);
      
      select * from teacher_log;
      
      ##  . 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years
      
	 delimiter &&
      create trigger before_delete_teacher
      before delete on teachers
      for each row 
      begin
        if old.experience >10 then signal sqlstate "45000"
        set message_text="can not delete employee with more than 10 years of experience";
        end if;
      end &&
      delimiter ;
      
     SET SQL_SAFE_UPDATES = 0;
	delete from teachers where id=111;
    
     ##  5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
     
       delimiter &&
      create trigger after_delete_teacher
      after delete on teachers
      for each row 
      begin
        insert into teacher_log(teacher_id,action,timestamp) values(old.id,"deleting",now());
      end &&
      delimiter ;
      
      delete from teachers where id=101;
      select * from teacher_log;
      