create table employee(ID int primary key,ename varchar(50),Basic_salary int,HRA int,DA int ,TA int,PF int,service_tax int,dept_name varchar(50));
INSERT INTO employee (ID, ename, Basic_salary,HRA,DA,TA,PF,service_tax,dept_name) VALUES
(1, 'Rohit', 500000,6000,8552,7545,85456,12000,'IT'),
(2, 'Deepak', 650000,7000,7852,2451,6524,1000,'sales'),
(3, 'Cheten', 785000,5000,8582,6251,56525,13000,'IT'),
(4, 'Arpit', 798200,6005,8585,3525,5288,18000,'sales'),
(5, 'Santosh', 985800,68000,5455,1245,6521,12000,'sales');
delimiter &&
create function Payslip3(dname varchar(50)) returns int deterministic
begin
     declare R int;
     declare length int;
     declare counter int default 0;
     set counter =0;
     select count(*) from employee into length;
     while counter < length do
        select dept_name,SUM(Basic_salary+HRA+DA+TA+-PF-service_tax) into R from employee
        group by dept_name having dept_name like dname;
        set counter=counter+1;
	 end while;
 return counter;
end; &&
delimiter ;   
set @R=0;
select Payslip2('IT');
DELIMITER &&

CREATE FUNCTION Payslip4(dname varchar(50)) RETURNS int DETERMINISTIC
BEGIN
    DECLARE total_salary int;
    
    SELECT SUM(Basic_salary + HRA + DA + TA - PF - service_tax)
    INTO total_salary
    FROM employee
    WHERE dept_name = dname;
    
    RETURN total_salary;
END
&&

DELIMITER ;
select Payslip4('IT');
-- we can write only 1 trigger on 1 statement and there are 6 types of trigger in mysql
CREATE TRIGGER before_insert_empworkinghours
BEFORE INSERT ON employee
FOR EACH ROW 
BEGIN
	IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0; 
    END IF;
    END//
delimeter ;
INSERT INTO employee values ('robin','scientist','2020-12-20');
select * from employee;