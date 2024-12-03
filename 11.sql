create database db1;
use db1;
create table emp(Emp_name varchar(10),Emp_id int(10),TA int,DA int,Total int , Branch varchar(10)); 

insert into emp values('abc',10,1200,1345,NULL,'Delhi');
insert into emp values('xyc',11,1230,1545,NULL,'Mumbai');
insert into emp values('pqr',12,1800,1200,NULL,'Chandigarh');
select * from emp;
DELIMITER //

CREATE PROCEDURE GetStudentDetails(INOUT student_name VARCHAR(50))
BEGIN
    -- Declare variables to hold student details
    DECLARE student_id INT;
    DECLARE student_age INT;
    DECLARE student_grade VARCHAR(10);

    -- Fetch student details based on the given name
    SELECT Emp_id, TA, DA
    INTO student_id, student_age, student_grade
    FROM emp
    WHERE Emp_id = 10;

    -- Print student details
    SELECT CONCAT('Student ID: ', student_id) AS Student_ID,
           CONCAT('Student Name: ', student_name) AS Student_Name,
           CONCAT('Age: ', student_age) AS Age,
           CONCAT('Grade: ', student_grade) AS Grade;
END //

DELIMITER ;
select * from emp;
SET @Emp_id = 10; CALL GetStudentDetails(@student_name);