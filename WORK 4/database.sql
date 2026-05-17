-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Nationality VARCHAR(50),
    BirthYear INT
);

-- Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150),
    Genre VARCHAR(50),
    PublishedYear INT,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    MembershipDate DATE
);

-- Loans Table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Authors (Name, Nationality, BirthYear) VALUES
('Chinua Achebe', 'Nigerian', 1930),
('Wole Soyinka', 'Nigerian', 1934),
('George Orwell', 'British', 1903),
('Jane Austen', 'British', 1775),
('Mark Twain', 'American', 1835),
('J.K. Rowling', 'British', 1965),
('Stephen King', 'American', 1947),
('Ngugi wa Thiong\'o', 'Kenyan', 1938),
('Haruki Murakami', 'Japanese', 1949),
('Toni Morrison', 'American', 1931);
-- Continue until you reach ~50 authors

INSERT INTO Books (Title, Genre, PublishedYear, AuthorID) VALUES
('Things Fall Apart', 'Historical Fiction', 1958, 1),
('Animal Farm', 'Political Satire', 1945, 3),
('Pride and Prejudice', 'Romance', 1813, 4),
('Harry Potter and the Philosopher\'s Stone', 'Fantasy', 1997, 6),
('The Shining', 'Horror', 1977, 7),
('Norwegian Wood', 'Drama', 1987, 9),
('Beloved', 'Historical Fiction', 1987, 10),
('Adventures of Huckleberry Finn', 'Adventure', 1884, 5),
('Death and the King\'s Horseman', 'Drama', 1975, 2),
('Devil on the Cross', 'Political Fiction', 1980, 8);
-- Continue until you reach ~200 books

INSERT INTO Members (Name, Email, MembershipDate) VALUES
('Rilwan Adeyemi', 'rilwan@example.com', '2024-01-15'),
('Sarah Johnson', 'sarahj@example.com', '2023-11-02'),
('Michael Smith', 'mike.smith@example.com', '2025-02-20'),
('Aisha Bello', 'aisha.b@example.com', '2025-03-10'),
('David Brown', 'david.brown@example.com', '2024-07-25'),
('Chidera Okafor', 'chidera.ok@example.com', '2025-01-05'),
('Emily Davis', 'emily.d@example.com', '2023-09-12'),
('John Doe', 'john.doe@example.com', '2024-05-30'),
('Fatima Yusuf', 'fatima.y@example.com', '2025-04-18'),
('James Wilson', 'james.w@example.com', '2023-12-01');
-- Continue until you reach ~100 members


INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 1, '2025-01-20', '2025-02-05'),
(2, 2, '2025-02-10', NULL),
(3, 3, '2025-03-01', '2025-03-15'),
(4, 4, '2025-03-12', NULL),
(5, 5, '2025-04-01', '2025-04-20'),
(6, 6, '2025-04-05', NULL),
(7, 7, '2025-04-10', '2025-04-25'),
(8, 8, '2025-04-15', NULL),
(9, 9, '2025-04-18', '2025-05-02'),
(10, 10, '2025-05-01', NULL);
-- Continue until you reach ~150 loans


DELIMITER //
CREATE PROCEDURE PopulateMembers()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 100 DO
    INSERT INTO Members (Name, Email, MembershipDate)
    VALUES (CONCAT('Member ', i), CONCAT('member', i, '@example.com'), CURDATE());
    SET i = i + 1;
  END WHILE;
END;
//
DELIMITER ;
CALL PopulateMembers();
