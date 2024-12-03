CREATE TABLE Person (person_id INT NOT NULL , first_name VARCHAR(250)NOT NULL,last_name VARCHAR(250)NOT NULL,Age int);
desc Person;
ALTER TABLE Person modify Age int NOT NULL;
desc Person;
CREATE TABLE Person1(person_id INT NOT NULL , first_name VARCHAR(250)NOT NULL,last_name VARCHAR(250)NOT NULL,Age int ,UNIQUE(person_id));


-- create table department with attributes d_id,which is combination of carracter and numbers and fix width of 5 digits
-- department number  whose values cant be NULL
-- location which must have unique value write suitable command to appy above constraunts
CREATE TABLE Department  (d_id varchar(5) NOT NULL ,name varchar(50),location varchar(50),unique(location));
desc Department;
