-- RAILWAY RESERVATION DATABASE -----DEEPAK PURANMAL KUMAWAT-- PRN NUMBER-2401208006
CREATE TABLE User ( user_id INT   PRIMARY KEY auto_increment, name VARCHAR(100)
   , phone VARCHAR(15), address TEXT);
CREATE TABLE Train ( train_id INT   PRIMARY KEY auto_increment, train_name VARCHAR(100)   ,source VARCHAR(100)
   ,destination VARCHAR(100)   , departure_time DATETIME   );
CREATE TABLE Ticket1 ( ticket_id INT   PRIMARY KEY auto_increment, user_id INT, train_id INT,ticket_number VARCHAR(20) UNIQUE  
 , issue_date DATETIME   ,status VARCHAR(20)   ,
 FOREIGN KEY (user_id) REFERENCES User(user_id), FOREIGN KEY (train_id) REFERENCES Train(train_id));
CREATE TABLE Payment1 (payment_id INT  PRIMARY KEY auto_increment,user_id INT,ticket_id INT,amount DECIMAL(10, 2),
payment_date DATETIME,payment_method VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User(user_id),FOREIGN KEY (ticket_id) REFERENCES Ticket1(ticket_id));
CREATE TABLE UPI1 ( upi_id INT   PRIMARY KEY, payment_id INT,upi_ids VARCHAR(50)   , 
FOREIGN KEY (payment_id) REFERENCES Payment1(payment_id));
CREATE TABLE Card (card_id INT   PRIMARY KEY, payment_id INT, card_number VARCHAR(20)   , card_expiry DATE   
, card_holder_name VARCHAR(100)   ,FOREIGN KEY (payment_id) REFERENCES Payment(payment_id));
INSERT INTO User (name, phone, address) VALUES
('Deepak Kumawat', '7066681995', 'flat-503-real street pune'),
('Arpit Dhaneria', '8888996238', 'flat-456 Oak Avenue,Mumbai');
INSERT INTO Train (train_name, source, destination, departure_time) VALUES
('Express 101', 'Delhi', 'Pune', '2024-09-15 08:00:00'),
('Express 202', 'Goa', 'Mumbai', '2024-09-15 12:00:00');
INSERT INTO Ticket1 (user_id, train_id, ticket_number, issue_date, status) VALUES
(1, 1, 'TCKT123456', '2024-09-01 10:00:00', 'Booked'),
(2, 2, 'TCKT654321', '2024-09-02 14:00:00', 'Booked');
INSERT INTO Payment1 (user_id, ticket_id, amount, payment_date, payment_method)
VALUES
    (1, 1, 50.00, '2024-09-01 10:15:00', 'Credit Card'),
    (2, 2, 75.00, '2024-09-02 14:15:00', 'Phonepay');
select * from Payment1;
select * from User;




















