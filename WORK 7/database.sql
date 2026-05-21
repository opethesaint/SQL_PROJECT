-- Create Database
CREATE DATABASE University;
USE University;

-- Table 1: Students
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(20),
    department_id INT
);

-- Table 2: Departments
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100),
    building VARCHAR(50),
    head_of_dept VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    established_year INT
);

-- Table 3: Courses
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(20),
    credits INT,
    department_id INT,
    semester VARCHAR(20),
    lecturer_id INT,
    capacity INT
);

-- Table 4: Lecturers
CREATE TABLE Lecturers (
    lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    hire_date DATE,
    department_id INT,
    designation VARCHAR(50)
);

-- Table 5: Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(5),
    status VARCHAR(20),
    semester VARCHAR(20),
    year INT
);

-- Table 6: Library
CREATE TABLE Library (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    publisher VARCHAR(100),
    year_published INT,
    category VARCHAR(50),
    available_copies INT,
    department_id INT
);

-- Insert Sample Data (200 rows total across tables)

-- Departments (10 rows)
INSERT INTO Departments (dept_name, building, head_of_dept, phone, email, established_year)
VALUES
('Computer Science','Block A','Dr. James','08011111111','cs@university.com',1995),
('Mathematics','Block B','Dr. Mary','08022222222','math@university.com',1980),
('Physics','Block C','Dr. John','08033333333','phy@university.com',1975),
('Chemistry','Block D','Dr. Alice','08044444444','chem@university.com',1985),
('Biology','Block E','Dr. David','08055555555','bio@university.com',1990),
('Economics','Block F','Dr. Sarah','08066666666','eco@university.com',1970),
('History','Block G','Dr. Paul','08077777777','hist@university.com',1965),
('English','Block H','Dr. Susan','08088888888','eng@university.com',1988),
('Philosophy','Block I','Dr. Henry','08099999999','phil@university.com',1992),
('Business','Block J','Dr. Emma','08100000000','bus@university.com',2000);

-- Students (50 rows sample)
INSERT INTO Students (first_name,last_name,gender,dob,email,phone,department_id)
VALUES
('John','Doe','Male','2000-05-12','john.doe@uni.com','08011112222',1),
('Jane','Smith','Female','2001-07-23','jane.smith@uni.com','08011113333',2),
('Michael','Brown','Male','1999-11-02','michael.brown@uni.com','08011114444',3),
('Emily','Davis','Female','2002-01-15','emily.davis@uni.com','08011115555',4),
('Daniel','Wilson','Male','2000-09-30','daniel.wilson@uni.com','08011116666',5),
('Sophia','Taylor','Female','2001-03-18','sophia.taylor@uni.com','08011117777',6),
('James','Anderson','Male','1998-12-25','james.anderson@uni.com','08011118888',7),
('Olivia','Thomas','Female','2002-06-10','olivia.thomas@uni.com','08011119999',8),
('William','Moore','Male','2001-04-05','william.moore@uni.com','08011120000',9),
('Isabella','Jackson','Female','2000-08-22','isabella.jackson@uni.com','08011121111',10);

-- (Repeat similar inserts until you reach 50 students)

-- Lecturers (20 rows sample)
INSERT INTO Lecturers (first_name,last_name,email,phone,hire_date,department_id,designation)
VALUES
('Alan','Turing','alan.turing@uni.com','08022223333','2010-09-01',1,'Professor'),
('Grace','Hopper','grace.hopper@uni.com','08022224444','2012-03-15',2,'Associate Professor'),
('Richard','Feynman','richard.feynman@uni.com','08022225555','2008-07-20',3,'Professor'),
('Marie','Curie','marie.curie@uni.com','08022226666','2015-11-10',4,'Lecturer'),
('Charles','Darwin','charles.darwin@uni.com','08022227777','2009-05-05',5,'Professor');

-- (Add more until 20 lecturers)

-- Courses (40 rows sample)
INSERT INTO Courses (course_name,course_code,credits,department_id,semester,lecturer_id,capacity)
VALUES
('Database Systems','CSC301',3,1,'Fall',1,100),
('Algorithms','CSC302',3,1,'Spring',1,120),
('Linear Algebra','MTH201',3,2,'Fall',2,80),
('Quantum Mechanics','PHY401',4,3,'Spring',3,60),
('Organic Chemistry','CHM301',3,4,'Fall',4,70);

-- (Add more until 40 courses)

-- Enrollments (60 rows sample)
INSERT INTO Enrollments (student_id,course_id,enrollment_date,grade,status,semester,year)
VALUES
(1,1,'2023-09-01','A','Active','Fall',2023),
(2,2,'2023-09-01','B','Active','Spring',2023),
(3,3,'2023-09-01','C','Active','Fall',2023),
(4,4,'2023-09-01','A','Active','Spring',2023),
(5,5,'2023-09-01','B','Active','Fall',2023);

-- (Add more until 60 enrollments)

-- Library (20 rows sample)
INSERT INTO Library (title,author,publisher,year_published,category,available_copies,department_id)
VALUES
('Introduction to Algorithms','Cormen','MIT Press',2009,'Computer Science',5,1),
('Advanced Mathematics','Stewart','Pearson',2015,'Mathematics',3,2),
('Physics Principles','Halliday','Wiley',2010,'Physics',4,3),
('Organic Chemistry','Morrison','McGraw Hill',2012,'Chemistry',6,4),
('Biology Today','Campbell','Pearson',2018,'Biology',2,5);

-- (Add more until 20 books)
