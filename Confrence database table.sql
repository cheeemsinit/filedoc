-- CONFRENCE DATABASE -----DEEPAK PURANMAL KUMAWAT-- PRN NUMBER-2401208006
create database RDBMSSKILL;
CREATE TABLE Authors (author_id INT PRIMARY KEY AUTO_INCREMENT, email_id VARCHAR(50), first_name VARCHAR(50),last_name VARCHAR(50));
CREATE TABLE Papers (paper_id INT PRIMARY KEY auto_increment  ,  title VARCHAR(  50)  , abstract TEXT, file_name VARCHAR(50),  
  contact_author_id INT,FOREIGN KEY (contact_author_id) REFERENCES Authors(author_id));
CREATE TABLE PaperAuthors (paper_author_id INT PRIMARY KEY auto_increment,  paper_id INT,  author_id INT, 
FOREIGN KEY (paper_id) REFERENCES Papers(paper_id), FOREIGN KEY (author_id) REFERENCES Authors(author_id));
CREATE TABLE Reviewers ( reviewer_id INT PRIMARY KEY auto_increment ,  email_id VARCHAR(50), first_name VARCHAR(50),
last_name VARCHAR(50), phone_number VARCHAR(20),   affiliation VARCHAR( 50),   topics_of_interest TEXT);
CREATE TABLE Reviews (review_id INT PRIMARY KEY  auto_increment,   paper_id INT, reviewer_id INT, 
 technical_merit INT CHECK (technical_merit BETWEEN 1 AND 10),readability INT CHECK (readability BETWEEN 1 AND 10), originality INT CHECK
 (originality BETWEEN 1 AND 10), relevance_to_conference INT CHECK (relevance_to_conference BETWEEN 1 AND 10)
 ,overall_recommendation VARCHAR(50),  committee_comments TEXT,    author_feedback TEXT,  
 FOREIGN KEY (paper_id) REFERENCES Papers(paper_id), FOREIGN KEY (reviewer_id) REFERENCES Reviewers(reviewer_id));
CREATE TABLE PaperReviewers (paper_reviewer_id INT PRIMARY KEY auto_increment  , paper_id INT, reviewer_id INT, 
  FOREIGN KEY (paper_id) REFERENCES Papers(paper_id), FOREIGN KEY (reviewer_id) REFERENCES Reviewers(reviewer_id));
INSERT INTO Authors (email_id, first_name, last_name)
VALUES
('deepakkumawat.com', 'Deepak', 'Kumawat'),('arpitdhaneria.com', 'Arpit', 'Dhaneria'),('chetankumar.com', 'Chetan', 'Kumar');
SELECT * FROM Authors;
INSERT INTO Papers (title, abstract, file_name, contact_author_id)
VALUES
    ('AI in Healthcare', 'This paper discusses the applications of AI in healthcare.', 'ai_healthcare.pdf', 1),
    ('Blockchain Technology', 'An overview of blockchain technology and its potential applications.', 'blockchain.pdf', 2),
    ('Quantum Computing', 'Exploring the future of quantum computing.', 'quantum_computing.pdf', 3);
INSERT INTO PaperAuthors (paper_id, author_id)
VALUES
    (1, 1),(2,2),(3,3),(1,2);
INSERT INTO Reviewers (email_id, first_name, last_name, phone_number, affiliation, topics_of_interest)
VALUES
    ('ninad@gmail.com', 'Ninad', 'H', '7804684468', 'Tech University', 'AI, Healthcare'),
    ('shubham@gmail.com', 'Shubham', 'K', '5425489547', 'Blockchain Institute', 'Blockchain, Security'),
    ('abc@gmail.com', 'Dev', 'abc', '9586526451', 'Quantum Labs', 'Quantum Computing, Physics');
INSERT INTO PaperReviewers (paper_id, reviewer_id)
VALUES
    (1, 1),(1,2),(2,2),(2,3),(3,3);
INSERT INTO Reviews (paper_id, reviewer_id, technical_merit, readability, originality,
 relevance_to_conference, overall_recommendation, committee_comments, author_feedback)
VALUES
    (1, 1, 9, 8, 7, 10, 'Accept', 'Well-written, very relevant.', 'Great paper, but could use more examples.'),
    (1, 2, 8, 7, 8, 9, 'Accept with minor revisions', 'Strong paper, needs minor tweaks.', 'Consider adding more data.'),
    (2, 2, 7, 8, 9, 8, 'Accept', 'Innovative ideas, well-presented.', 'Interesting concepts.'),
    (2, 3, 8, 8, 8, 9, 'Accept', 'Thorough and comprehensive.', 'Good job, keep it up.'),
    (3, 3, 10, 9, 10, 10, 'Accept', 'Cutting-edge research.', 'Excellent work, no changes needed.');
SELECT * FROM Reviews;
SELECT * FROM Authors;



