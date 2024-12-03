-- select * from emp left outer join dept on dept  on  deptid = fk_deptid;
-- select * from emp right outer join dept on dept  on  deptid = fk_deptid;
-- 

select * from emp full join dept on deptid = fk_deptid ;
-- cross join same as taking cartesion  product 
-- select * from emp 
-- self join talking join on the same table
-- here E1 and 
-- consider company DATABASE which has tables employee with attributes empid ,ename, desgnation,salary,fk_deptid
#  and department with colums deptid,dname perform the following join opertation on the followiung table
select ename ,salary,designation from emp inner join dept on deptid = fk_deptid;
-- left outer join 

select * from emp left outer join dept on   deptid = fk_deptid;

-- right outer join 
 select * from emp right outer join dept on dept  on  deptid = fk_deptid;
-- full join 
select * from emp full from department on deptid=fk_feptid


cartition product(cross )
select * from emp deptid


select * from emp  E1 inner join Emp E2 on E1.empid= E2.empid

-- Consider company DATABASE which has tables employee with attributes empid ,ename, desgnation,salary,fk_deptid
-- and department with colums deptid,dname perform the following join opertation on the followiung table
-- find the emplyoee who have not assignd any department
-- find department names in which not a single emplyoee is weorking
-- find details of emplyoee working in finnance department
-- find emplyoee names earning same salary
-- find the salaries of the emplyoeee who are having same name
create table EMP1 
--  

INSERT INTO EMP1 (empid, ename, designation, salary, fk_deptid) VALUES
(1, 'John Doe', 'Manager', 75000, 101),
(2, 'Jane Smith', 'Developer', 60000, 102),
(3, 'Alice Brown', 'Analyst', 55000, 103),
(4, 'Bob White', 'Developer', 62000, 102),
(5, 'Carol Black', 'Manager', 80000, 101);
-- 3) select * from emp E1 innner join emp E2 on E.name=E2.name and E1.empid !=E2.empid;

select E1.salary from emp E1 innner join emp E2 on E1.ename = E2.ename and E1.empid != E2.empid;
select * from emp;