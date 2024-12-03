CREATE database COMPANY;
USE COMPANY;
CREATE TABLE COMP(C_ID int primary key,Cname varchar(50),address varchar(50));
create table EMP(Empid int primary key,ename varchar(20),Eaddress varchar(20),fk_cid int references COMP(C_ID));
INSERT into COMP VALUES(120,'Bajaj','Mumbai'),(105,'TATA','Gujrat');
INSERT into COMP VALUES(101,'TATA','Gujrat');
INSERT into COMP VALUES(102,'BMW','Delhi');
INSERT into COMP VALUES(103,'Audi','Pune');
INSERT into COMP VALUES(104,'JIO','Jaipur');
insert into EMP values(1,'Deepak','Mumbai',100),(2,'Arpit','Nashik',101),(3,'Santosh','AP',102),(4,'Chetan','Pune',104),(5,'Shubham','Delhi',105),(6,'Rahul','Jaipur',120);
select * from COMP;
select * from EMP;
select * from COMP where C_ID = 100 and Cname like'B%'; 
select * from EMP where ename like'A%';
select Empid,ename,Eaddress from COMP,EMP where C_ID=fk_cid and Cname like 'Bajaj';
# display the names of employee working in IT department
select ename from EMP,COMP where C_ID=fk_cid and ename like 'BMW';
# find names of employee who are not working in pune 
# find names of emplyee who are working either in sales or computer depeartment
# find employee who name start with ab and ends with y
#  find details of all employee who are working in mumbai .
select ename from EMP where ename like "Ar%t";
select ename from EMP where Eaddress like "Mumbai";
select ename from EMP where Eaddress not like "Pune";
select ename from EMP ,COMP where Ename  like "Computer Department" or "Sales";