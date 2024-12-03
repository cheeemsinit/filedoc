CREATE DATABASE PLAYERS;
USE PLAYERS;
CREATE TABLE PLAYER1 (P_id INT PRIMARY KEY, P_name VARCHAR(100), age INT, Games_name VARCHAR(100), address VARCHAR(200), country VARCHAR(100));
CREATE TABLE MATCH1 (m_id INT PRIMARY KEY, m_title VARCHAR(100), m_startdate DATE, m_enddate DATE, location VARCHAR(100));
CREATE TABLE PLAYER_MATCHES (P_id INT, m_id INT, PRIMARY KEY (P_id, m_id), FOREIGN KEY (P_id) REFERENCES PLAYER1(P_id), FOREIGN KEY (m_id) REFERENCES MATCH1(m_id));
INSERT INTO PLAYER1 (P_id, p_name, age, Games_name, address, country) VALUES
(1, 'Virat Kohli', 34, 'Cricket', 'Delhi', 'India'),
(2, 'Steve Smith', 33, 'Cricket', 'Sydney', 'Australia'),
(3, 'Rohit Sharma', 34, 'Cricket', 'Mumbai', 'India'),
(4, 'David Warner', 32, 'Cricket', 'Sydney', 'Australia'),
(5, 'Jasprit Bumrah', 30, 'Cricket', 'Ahmedabad', 'India'),
(6, 'Kane Williamson', 33, 'Rugby', 'Tauranga', 'New Zealand'),
(7, 'KL Rahul', 31, 'Football', 'Bangalore', 'India'),
(8, 'Joe Root', 33, 'Tennis', 'Sheffield', 'England'),
(9, 'Pat Cummins', 30, 'Basketball', 'Sydney', 'Australia'),
(10, 'Ben Stokes', 32, 'Hockey', 'Christchurch', 'New Zealand');
INSERT INTO MATCH1 (m_id, m_title, m_startdate, m_enddate, location) VALUES
(1, 'IPL 2024', '2024-03-29', '2024-05-29', 'Mumbai'),
(2, 'IPL 2023', '2023-03-29', '2023-05-29', 'Delhi'),
(3, 'Ashes 2023', '2023-06-16', '2023-07-31', 'London'),
(4, 'World Cup 2023', '2023-10-05', '2023-11-19', 'Ahmedabad'),
(5, 'Big Bash 2023', '2023-12-20', '2024-02-04', 'Melbourne'),
(6, 'T20 World Cup 2022', '2022-10-16', '2022-11-13', 'Sydney'),
(7, 'Asia Cup 2023', '2023-09-01', '2023-09-17', 'Colombo'),
(8, 'Champions Trophy 2025', '2025-06-01', '2025-06-18', 'Birmingham'),
(9, 'CPL 2023', '2023-08-16', '2023-09-24', 'Port of Spain'),
(10, 'PSL 2024', '2024-02-13', '2024-03-19', 'Karachi');
INSERT INTO player_matches (P_id, m_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),  
(3, 1),
(5, 4),
(7, 2);
-- 1.	List Country wise name of the Players --
SELECT country, p_name FROM player1 ORDER BY country, p_name;
-- 2.	Given Start date and End date of a Particular match find the number of days for which the match is played --
SELECT m_id, m_title, m_startdate, m_enddate, DATEDIFF(m_enddate, m_startdate) AS duration_in_days FROM match1;
-- 3.	Find out the Player name who Played match title as IPL --
SELECT p.p_name FROM player1 p JOIN player_matches pm ON p.P_id = pm.P_id JOIN match1 m ON pm.m_id = m.m_id WHERE m.m_title LIKE 'IPL%';
-- 4.	List the matches which are being played in the same location Today --
  SELECT * FROM match1 m1,match1 m2 where m1.location = m2.location and m1.m_id !=m2.m_id and m1.m_startdate = m2.m_startdate;
-- 5.	Count how many Players are playing for INDIA --
SELECT COUNT(*) AS number_of_players FROM player1 WHERE country = 'India';
-- 6.	Find the players names who have not played a single match --
SELECT p.p_name FROM player1 p LEFT outer JOIN player_matches pm ON p.P_id = pm.P_id WHERE pm.P_id IS NULL;
-- 7.	Find the number of matches played in last two year --
SELECT COUNT(*) AS number_of_matches FROM MATCH1 WHERE m_startdate >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
-- 8. 	list all the players names except india --
SELECT P_name FROM PLAYER1 WHERE country != 'India';
-- 9. 	add constraint for age of players it must be above 18 and below 35 
ALTER TABLE PLAYER1 ADD CONSTRAINT age_check CHECK (age BETWEEN 18 AND 35);
-- 10.	store information about family members of players in player table (use JSON) 
-- Information can be no_of_members ,name,age,contact -no,(Retrive family members infomation of any one players) 
ALTER TABLE PLAYER1 ADD COLUMN family_members JSON;
INSERT INTO PLAYER1 (P_id, p_name, age, Games_name, address, country, family_members) VALUES
(101, 'Virat Kohli', 34, 'Cricket', 'Delhi', 'India', '{"no_of_members": 3, "members": [{"name": "Anushka", "age": 32, "contact_no": "1234567890"}, {"name": "Vamika", "age": 2, "contact_no": "9876543210"}]}');
SELECT p_name, family_members FROM PLAYER1 WHERE P_id = 1;