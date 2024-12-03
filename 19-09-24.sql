create database Demo;
CREATE TABLE EMP (EMP_id INT PRIMARY KEY,E_name VARCHAR(250),designation varchar(50),Salary long,city varchar(50), age int not null );
INSERT INTO EMP(EMP_id, E_name,designation, Salary,city,age)
VALUES
    (101, 'Deepak', 'Manager', 50000,'Pune',25),
    (102, 'CHETAN', 'H.R', 60000,'Mumbai',40),
    (103, 'SANTOSH', 'DE', 70000,'Mumbai',50),
    (104, 'Shubham', 'DE', 50000,'Pune',40),
    (105, 'Rahul', 'DE', 75000,'Delhi',25),
    (106, 'Arpit', 'DE', 72000,'Goa',40);
select * from EMP;
-- display age wise count of employees
select count(*) from EMP group by age;

-- display average salary of pune employee
select avg(Salary) from EMP where city like 'Pune' ;

-- display name of emp earning highest salary
select * from EMP order by salary desc limit 1;
select E_name from EMP where Salary in (select max(Salary) from EMP);

-- Display count of emplyees having same name
SELECT E_name, COUNT(*) AS count FROM EMP GROUP BY E_name HAVING COUNT(*) > 1;

-- Find Employee names earning Maximum and minimum Salary

SELECT E_name, Salary FROM EMP WHERE Salary = (SELECT MAX(Salary) FROM EMP)
OR Salary = (SELECT MIN(Salary) FROM EMP);

-----------------------------------------------------------------------------------
-- concept of alies
-- recursive relationship
INSERT INTO EMP(EMP_id, E_name,designation, Salary,city,age)
VALUES
    (107, 'Deepak', 'Manager', 50000,'Pune',25);
-- find ids of employees having same name

SELECT DISTINCT T.EMP_id
FROM EMP AS T, EMP AS S
WHERE T.E_name = S.E_name AND T.EMP_id != S.EMP_id;

-- find the employee having same age
SELECT DISTINCT T.EMP_id
FROM EMP AS T, EMP AS S
WHERE T.age = S.age AND T.EMP_id != S.EMP_id;

-- 
create table emp1 (empid int primary key, ename varchar(50),address varchar(20),DOB date,
 fk_empid int, foreign key(fk_empid) references emp1(empid));

INSERT INTO emp1(empid, ename,address,DOB,fk_empid)
VALUES
    (10, 'Deepak', 'Pune','2024-09-24',10);
INSERT INTO emp1(empid, ename,address,DOB,fk_empid)
VALUES
    (20, 'Arpit', 'Mumbai','2024-09-20',10),
    (30, 'Shubham', 'Mumbai','2023-08-20',20),
    (40, 'Chetan', 'Delhi','2025-02-20',20),
    (50, 'Santosh', 'Pune','2022-09-20',30),
    (60, 'Shoam', 'Delhi','2021-05-20',40);


select * from emp1;


-- consider the schema emp(empid,ename,age,designation,deptid) -- Dept(deptid,dname)
-- find employee names working in IT dept
-- find count of emp working in sales  



