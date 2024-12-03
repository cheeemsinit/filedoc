CREATE TABLE Doctor1 (D_id INT PRIMARY KEY,D_name VARCHAR(250),address varchar(50),Exp varchar(50),degree varchar(50), Specialization varchar(50) );
CREATE table Patient(P_id int primary key,pname varchar(50),P_add varchar(50));
create table  D_P4(fkD_id INT,fkP_id INT,Disease varchar(50),Date_of_Treat text,FOREIGN KEY (fkD_id) REFERENCES Doctor1(D_id),FOREIGN KEY (fkP_id) REFERENCES Patient(P_id));

INSERT INTO Doctor1 (D_id, D_name, address,Exp,degree,Specialization) VALUES
(1, 'Dr.Joshi', 'nashik',5, 'MBBS', 'Heart'),
(2, 'Dr.Deepak','pune', 18, 'MBBS', 'Brain'),
(3, 'Dr.Cheten', 'Mumbai',7, 'BAMS', 'EYE'),
(4, 'Dr.Arpit', 'Delhi', 6, 'BHMS', 'Ortho'),
(5, 'Dr.Santosh', 'Navi Mumbai', 12, 'BDS', 'Dental');

select * from Doctor1;
INSERT INTO Patient (P_id, pname, P_add) VALUES
(101, 'Joshi', 'nashik'),
(102, 'Deepak','pune'),
(103, 'heten', 'Mumbai'),
(104, 'rpit', 'Delhi'),
(105, 'antosh', 'Navi Mumbai');

INSERT INTO D_P4 (fkD_id,fkP_id, Disease,Date_of_Treat) VALUES
(1,101, 'Fiver', '07-10-24'),
(1,102, 'Blood Pressure low','22-09-24'),
(2,103, 'Diabeties', '11-10-23'),
(2,104, 'Cancer', '5-5-22'),
(3,105, 'Jondies','1-10-24');

select * from D_P4;

select count(P_id) from Doctor1,D_P3 where D_name like 'Dr.Joshi' and fkD_id=fkD_id;



SELECT pname 
FROM Patient 
JOIN D_P4 ON Patient.P_id = D_P4.fkP_id 
JOIN Doctor1 ON Doctor1.D_id = D_P4.fkD_id 
WHERE Doctor1.D_name = 'Dr.Joshi';


SELECT D_P4.Disease, D_P4.Date_of_Treat 
FROM Doctor1 
JOIN D_P4 ON Doctor1.D_id = D_P4.fkD_id 
WHERE Doctor1.D_name = 'Dr.Joshi';

select count(fkP_id) from Doctor1 innner join D_P4 on fkD_id=D_id where D_name like 'Dr.Joshi'

-- find the doctor name who are not treating any patient
