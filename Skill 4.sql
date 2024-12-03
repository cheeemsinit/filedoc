-- Q1 Write create table query for student.
CREATE TABLE Student (
    PRN INT PRIMARY KEY,Name VARCHAR(50),Class VARCHAR(10),S1 INT,S2 INT,S3 INT
);

-- Q2 Write single insert query to insert at least 5 records in the student table. 
INSERT INTO Student (PRN, Name, Class, S1, S2, S3) VALUES
(101, 'Alice', '10A', 85, 90, 80),(102, 'Bob', '10B', 78, 88, 84),(103, 'Charlie', '10A', 92, 85, 89),(104, 'Daisy', '10C', 76, 80, 70),(105, 'Ethan', '10B', 88, 86, 90);
Select * from Student;

-- Q3 Write a procedure to display total marks of student where Student PRN is given parameter.
DELIMITER //
CREATE PROCEDURE GetTotalMarks(IN studentPRN INT)
BEGIN
    SELECT PRN, Name, (S1 + S2 + S3) AS TotalMarks
    FROM Student
    WHERE PRN = studentPRN;
END //
DELIMITER ;

-- Q4 Write procedure to print details of student where student name is given Student name is given as parameter. The parameter type should be in out.
DELIMITER //
CREATE PROCEDURE GetStudentDetails(INOUT studentName VARCHAR(50))
BEGIN
    SELECT PRN, Name, Class, S1, S2, S3
    FROM Student
    WHERE Name = studentName;
END //
DELIMITER ;

-- Q5 Alter the procedure to add the message about printing sum of marks.
DELIMITER //
CREATE PROCEDURE GetTotalMarksMessage(IN studentPRN INT)
BEGIN
    SELECT CONCAT('The total marks of the student with PRN ', studentPRN, ' are displayed below:') AS Message;
    SELECT PRN, Name, (S1 + S2 + S3) AS TotalMarks
    FROM Student
    WHERE PRN = studentPRN;
END //
DELIMITER ;

-- Q6 Define a function which will take PRN as input and return percentage of student.
DELIMITER //
CREATE FUNCTION GetPercentage(studentPRN INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE totalMarks INT;
    DECLARE percentage FLOAT;

    SELECT (S1 + S2 + S3) INTO totalMarks
    FROM Student
    WHERE PRN = studentPRN;

    SET percentage = (totalMarks / 300) * 100;
    RETURN percentage;
END //
DELIMITER ;

-- Q7 Create a function to print class wise result of all Students.
DELIMITER //
CREATE FUNCTION GetClassWiseResults()
RETURNS TEXT
DETERMINISTIC
BEGIN
    RETURN 'Use the following query: SELECT Class, Name, (S1 + S2 + S3) AS TotalMarks FROM Student ORDER BY Class;';
END //
DELIMITER ;

-- Execute the query mentioned in the function:
SELECT Class, Name, (S1 + S2 + S3) AS TotalMarks
FROM Student
ORDER BY Class;
