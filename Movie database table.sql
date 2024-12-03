-- MOVIE DATABASE -----DEEPAK PURANMAL KUMAWAT-- PRN NUMBER-2401208006
CREATE TABLE ProductionCompany ( CompanyName VARCHAR(50) PRIMARY KEY, Address VARCHAR(50));
CREATE TABLE Movie (Title VARCHAR(50),Year INT, LengthMinutes INT, PlotOutline VARCHAR(50),   
ProductionCompanyName VARCHAR(50),PRIMARY KEY (Title, Year),FOREIGN KEY (ProductionCompanyName) REFERENCES ProductionCompany(CompanyName));
CREATE TABLE Actor (Name VARCHAR(  50) PRIMARY KEY,  DateOfBirth DATE);
CREATE TABLE Director ( Name VARCHAR(50) PRIMARY KEY, DateOfBirth DATE);
CREATE TABLE MovieActor (Title VARCHAR(50), Year INT, ActorName VARCHAR(50), Role VARCHAR(50),
PRIMARY KEY (Title, Year, ActorName),FOREIGN KEY (Title, Year) REFERENCES Movie(Title, Year),
 FOREIGN KEY (ActorName) REFERENCES Actor(Name));
CREATE TABLE MovieDirector (Title VARCHAR(50), Year INT, DirectorName VARCHAR(50),  PRIMARY KEY (Title, Year, DirectorName),
FOREIGN KEY (Title, Year) REFERENCES Movie(Title, Year),   FOREIGN KEY (DirectorName) REFERENCES Director(Name));
INSERT INTO ProductionCompany (CompanyName, Address) VALUES
('Universal Pictures', '100 Universal City Plaza,Nashik 91608'),
('Dharma', 'Dimond street  MUmbai 91522'),
('Pictures', ' Gold road  Hollywood road,  922038');
INSERT INTO Movie (Title, Year, LengthMinutes, PlotOutline, ProductionCompanyName) VALUES
('Jurassic Park', 1993, 127, 'Dinosaurs brought back theme park.', 'Universal Pictures'),
('The Matrix', 1999, 136, 'A computer hacker ', 'Dharma'),
('Titanic', 1997, 195, 'A love story at Titanic.', 'Pictures');
INSERT INTO Actor (Name, DateOfBirth) VALUES
('Prabhas', '1947-09-14'),('Rocky', '1964-09-02'),('Akshay kumar', '1974-11-11'),
('Dhanush', '1967-02-10'),('Allu arjun', '1967-08-21'),('Raghav', '1975-10-05');
INSERT INTO Director (Name, DateOfBirth) VALUES
('S.S. Rajamouli', '1946-12-18'),('Anurag Kashyap', '1965-06-21'),('Prashanth Neel', '1954-08-16');
INSERT INTO MovieActor (Title, Year, ActorName, Role) VALUES
('Jurassic Park', 1993, 'Prabhas', 'Dr.Devid'),('Jurassic Park', 1993, 'Dhanush', 'Stuntman'),('The Matrix', 1999, 'Rocky', 'Villen'),
('The Matrix', 1999, 'Allu arjun', 'Lover'),('Titanic', 1997, 'Akshay kumar', 'Businessman'),('Titanic', 1997, 'Raghav', 'Comedian');
INSERT INTO MovieDirector (Title, Year, DirectorName) VALUES
('Jurassic Park', 1993, 'S.S. Rajamouli'),('The Matrix', 1999, 'Anurag Kashyap'),('Titanic', 1997, 'Prashanth Neel');
SELECT * FROM Movie;














