-- 14.10.24
Use Company;
Create table Students (stud_id int primary key, name varchar (15), class varchar(10),S1 int, S2 int, S3 int);
Insert into Students values(1,'Ram','FyBsc',70,80,90),(2,'Rohan','SyBsc',80,76,80),(3,'Prathamesh','FyBsc',77,80,89),(4,'Soham','FyMsc',75,81,89),(5,'John','SyMsc',91,83,86);
Select * from Students;
DELIMITER &&
CREATE PROCEDURE display_marks(INOUT var1 INT)
-- IN OUT INOUT
BEGIN
	SELECT S1+S2+S3 AS VAR1 FROM students WHERE stud_id = var1;
    END &&
DELIMITER ;

Set @M = 200;
select @M;
Call display_marks(@M);
select @M;

-- 21.10.24


-- Create procedure to take input as student name and print marks of 3 subjects
DELIMITER &&
Create Procedure display_M(In sname varchar (15))
Begin
	Select S1,S2,S3 FROM Students where name like sname ;
END && 
DELIMITER ;
Call display_M('Ram');

-- Create procedure to take input as student name and print percentage as  Out Variable
DELIMITER &&
Create Procedure display_MM(In sname varchar (15),INOUT P float )
Begin
	Select (S1+S2+S3)/3 into P FROM Students where name like sname ;
END && 
DELIMITER ;
Set @Per = 0.0;
Call display_MM('Ram',@Per);
Select @Per;