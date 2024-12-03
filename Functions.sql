-- Skill 4
-- Procedures and Functions in MYSQL
Use Company;
Create Table Employee(Id int primary key, ename varchar(30), Basic_salary float, HRA float, DA float, TA float, PF float, Service_Tax float, Dept_Name varchar(30)); 
Insert into Employee values (1,"Ram",15000, 6000,3000,1000,1800,1600,"Sales"),(2,"Rajaesh",25000, 6000,4000,5000,1800,1600,"IT"),(3,"Marketing",20000, 6000,4500,2000,1800,1600,"Sales"),(4,"Harsh",30000, 8000,3000,1000,1800,1600,"HR"),(5,"Ramesh",22000, 5000,4000,2000,2000,1800,"Sales");
Select * from Employee;

-- Function
delimiter && 
Create Function Payslip2(dname varchar(30)) returns int deterministic
Begin	
	declare R int ;
    declare length int;
    declare counter int default 0;
    set counter = 0;
    Select count(*) from Employee into length;
    while counter < length do
		select Dept_Name,Basic_salary + HRA + DA + TA - PF 	- Service_Tax into R from Employee
		group by Dept_Name having Dept_Name like dname;
        set counter = counter + 1;
	end while;
    return counter;
end; && 
delimiter ;
select Payslip2('IT');