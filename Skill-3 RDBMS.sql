create database Players;
use  Players;
CREATE TABLE player1 (P_id INT PRIMARY KEY,p_name VARCHAR(100),age INT,name_of_game VARCHAR(100),address VARCHAR(255),country VARCHAR(100));

CREATE TABLE match1 (m_id INT PRIMARY KEY,m_title VARCHAR(100),m_startdate DATE,m_enddate DATE,location VARCHAR(100));

CREATE TABLE player_matchs (P_id INT,m_id INT,PRIMARY KEY (P_id, m_id),FOREIGN KEY (P_id) REFERENCES player1(P_id),FOREIGN KEY (m_id) REFERENCES match1(m_id));

INSERT INTO player1 (P_id, p_name, age, name_of_game, address, country) VALUES
(1, 'Virat Kohli', 34, 'Cricket', 'Delhi', 'India'),
(2, 'Steve Smith', 33, 'Cricket', 'Sydney', 'Australia'),
(3, 'Rohit Sharma', 36, 'Cricket', 'Mumbai', 'India'),
(4, 'David Warner', 37, 'Cricket', 'Sydney', 'Australia'),
(5, 'Jasprit Bumrah', 30, 'Cricket', 'Ahmedabad', 'India'),
(6, 'Kane Williamson', 33, 'Rugby', 'Tauranga', 'New Zealand'),
(7, 'KL Rahul', 31, 'Football', 'Bangalore', 'India'),
(8, 'Joe Root', 33, 'Tennis', 'Sheffield', 'England'),
(9, 'Pat Cummins', 30, 'Basketball', 'Sydney', 'Australia'),
(10, 'Ben Stokes', 32, 'Hockey', 'Christchurch', 'New Zealand');


INSERT INTO match1 (m_id, m_title, m_startdate, m_enddate, location) VALUES
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



INSERT INTO player_matchs (P_id, m_id) VALUES
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

INSERT INTO match1 (m_id, m_title, m_startdate, m_enddate, location) VALUES
(11, 'Friendly Match', '2024-09-28', '2024-09-28', 'Mumbai');
INSERT INTO match1 (m_id, m_title, m_startdate, m_enddate, location) VALUES
(12, 'Friendly Match', '2024-09-28', '2024-09-28', 'Mumbai'),
(13, 'Friendly Match', '2024-09-28', '2024-09-28', 'Mumbai');

INSERT INTO player_matchs (P_id, m_id) VALUES
(1, 11);  

INSERT INTO player1 (P_id, p_name, age, name_of_game, address, country) VALUES
(13, 'Deepak', 34, 'Cricket', 'Delhi', 'India'),
(14, 'Chetan', 34, 'Cricket', 'Delhi', 'India');
INSERT INTO player1 (P_id, p_name, age, name_of_game, address, country) VALUES
(15, 'David Warner', 36, 'Cricket', 'London', 'U.K'),
(16, 'Rohit Sharma', 16, 'Cricket', 'Goa', 'India');
select * from player1;
select * from match1;
select * from player_matchs;



-----------------------------------------------------------------
-- query-1
SELECT country, p_name FROM player1 ORDER BY country, p_name;

-- query-2
SELECT m_id, m_title, m_startdate, m_enddate, DATEDIFF(m_enddate, m_startdate) AS duration_in_days FROM match1;

-- query -3

SELECT p.p_name FROM player1 p JOIN player_matchs pm ON p.P_id = pm.P_id JOIN match1 m ON pm.m_id = m.m_id WHERE m.m_title LIKE 'IPL%';

-- Query -4

  SELECT * FROM match1 m1,match1 m2 where m1.location = m2.location and m1.m_id !=m2.m_id and m1.m_startdate = m2.m_startdate;

  
-- Query-5
SELECT COUNT(*) AS number_of_players FROM player1 WHERE country = 'India';

-- Query-6
-- Find the players names who have not played a single match;

SELECT p.p_name FROM player1 p LEFT JOIN player_matchs pm ON p.P_id = pm.P_id  WHERE pm.P_id IS NULL;



-- Query -7 
-- Find the number of matches played in last two year 
SELECT COUNT(*) AS number_of_matches FROM match1 WHERE m_startdate >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);



-- Query-8
-- list all the players names except india
SELECT p_name FROM player1 WHERE country != 'India';


-- query-9 
-- add constraint for age of players it must be above 18 and below 35
ALTER TABLE player1 ADD CONSTRAINT chk_age CHECK (age < 18 AND age > 35);
SELECT * FROM player1 WHERE age <= 18 OR age >= 35;
UPDATE player1 SET age = 25 WHERE age <= 18 OR age >= 35;
DELETE FROM player1 WHERE age <= 18 OR age >= 35;



-- query-10
-- store information about family members of players in player table (use JSON)
-- information can be no_of_members ,name,age,contact -no,(Retrive family members infomation of any one players)

ALTER TABLE player1 ADD COLUMN family_info JSON;


UPDATE player1
SET family_info = '{"no_of_members": 4,"members": [{"name": "Rajesh Kumar", "age": 45, "contact_no": "9876543210"},{"name": "Sunita Kumar", "age": 42, "contact_no": "9876543211"},
        {"name": "Amit Kumar", "age": 20, "contact_no": "9876543212"},{"name": "Priya Kumar", "age": 18, "contact_no": "9876543213"}]}'WHERE P_id = 1;

SELECT JSON_EXTRACT(family_info, '$') AS family_info FROM player1 WHERE P_id = 1;

UPDATE player1
SET family_info = '{"no_of_members": 2,"members": [{"name1": "Rajesh Kumar", "age": 45, "contact_no": "9876543210"},{"name2": "Sunita Kumar", "age": 42, "contact_no": "9876543211"}]}'WHERE P_id = 2;

SELECT JSON_EXTRACT(family_info, '$') AS family_info FROM player1 WHERE P_id = 2;


SELECT m_id, COUNT(*)  
FROM player_matchs  
GROUP BY m_id; 

