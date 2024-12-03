-- JSON
CREATE TABLE Emp02 (EMP_id INT PRIMARY KEY auto_increment,E_name VARCHAR(250),address varchar(50),Dependants JSON,
Salary float );
DESC Emp02;
insert into Emp02(E_name,address,Dependants,Salary)
values('Deepak','Pune','{"Spouse": "ABC","Kid": "XYZ"}',50000),
('Arpit','Mumbai','{"Spouse": "Ram","Kid": "Sona"}',60000);
Select * from Emp02;
insert into Emp02(E_name,address,Dependants,Salary)
values('Chetan','Pune','{}',5000),
('Santosh','Delhi','{"Spouse": "A","Kid":{"kid1":"ABC","kid2":"Xyz"}}',5000);
Select * from Emp02;
select E_name,Dependants from Emp02 where EMP_id=1;

select E_name,Dependants->'$.Kid' from Emp02 where EMP_id=1;

select E_name,Dependants->"'$.Kid','$.Spouse'" from Emp02 where EMP_id=1;

select E_name,Dependants->'$.Kid.kid1' from Emp02 where EMP_id=4;

SELECT E_name, 
       JSON_UNQUOTE(JSON_EXTRACT(Dependants, '$.Kid.kid1')) AS Kid1
FROM Emp02
WHERE EMP_id = 3;

