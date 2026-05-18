-- Create Database
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 1. Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    department_id INT
);

-- 2. Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100),
    building VARCHAR(50),
    head VARCHAR(100)
);

-- 3. Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    credits INT,
    department_id INT
);

-- 4. Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade VARCHAR(2)
);

-- 5. Professors Table
CREATE TABLE Professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department_id INT,
    email VARCHAR(100)
);

-- Insert sample data into Departments (40 rows)
INSERT INTO Departments (dept_name, building, head) VALUES
('Computer Science','Block A','Dr. Smith'),
('Mathematics','Block B','Dr. Johnson'),
('Engineering','Block C','Dr. Brown'),
('Business','Block D','Dr. Taylor'),
('Medicine','Block E','Dr. White'),
('Law','Block F','Dr. Green'),
('Arts','Block G','Dr. Adams'),
('Education','Block H','Dr. Clark'),
('Physics','Block I','Dr. Lewis'),
('Chemistry','Block J','Dr. Hall'),
('Biology','Block K','Dr. Allen'),
('History','Block L','Dr. Young'),
('Philosophy','Block M','Dr. King'),
('Economics','Block N','Dr. Wright'),
('Political Science','Block O','Dr. Scott'),
('Psychology','Block P','Dr. Hill'),
('Sociology','Block Q','Dr. Baker'),
('Statistics','Block R','Dr. Nelson'),
('Geology','Block S','Dr. Carter'),
('Environmental Science','Block T','Dr. Mitchell'),
('Nursing','Block U','Dr. Perez'),
('Pharmacy','Block V','Dr. Roberts'),
('Dentistry','Block W','Dr. Turner'),
('Veterinary Medicine','Block X','Dr. Phillips'),
('Music','Block Y','Dr. Campbell'),
('Fine Arts','Block Z','Dr. Parker'),
('Architecture','Block AA','Dr. Evans'),
('Civil Engineering','Block AB','Dr. Edwards'),
('Electrical Engineering','Block AC','Dr. Collins'),
('Mechanical Engineering','Block AD','Dr. Stewart'),
('Aerospace','Block AE','Dr. Sanchez'),
('Marine Science','Block AF','Dr. Morris'),
('Agriculture','Block AG','Dr. Rogers'),
('Forestry','Block AH','Dr. Reed'),
('Anthropology','Block AI','Dr. Cook'),
('Linguistics','Block AJ','Dr. Morgan'),
('Media Studies','Block AK','Dr. Bell'),
('Public Health','Block AL','Dr. Murphy'),
('International Relations','Block AM','Dr. Bailey');

-- Insert sample data into Students (40 rows)
INSERT INTO Students (name, age, department_id) VALUES
('Alice Johnson',20,1),
('Bob Smith',22,2),
('Charlie Brown',21,3),
('David Taylor',23,4),
('Eva White',19,5),
('Frank Green',24,6),
('Grace Adams',20,7),
('Henry Clark',22,8),
('Ivy Lewis',21,9),
('Jack Hall',23,10),
('Kara Allen',20,11),
('Leo Young',22,12),
('Mia King',21,13),
('Noah Wright',23,14),
('Olivia Scott',19,15),
('Paul Hill',24,16),
('Quinn Baker',20,17),
('Ruby Nelson',22,18),
('Sam Carter',21,19),
('Tina Mitchell',23,20),
('Uma Perez',20,21),
('Victor Roberts',22,22),
('Wendy Turner',21,23),
('Xander Phillips',23,24),
('Yara Campbell',19,25),
('Zane Parker',24,26),
('Aaron Evans',20,27),
('Bella Edwards',22,28),
('Caleb Collins',21,29),
('Diana Stewart',23,30),
('Ethan Sanchez',20,31),
('Fiona Morris',22,32),
('George Rogers',21,33),
('Hannah Reed',23,34),
('Ian Cook',20,35),
('Jade Morgan',22,36),
('Kyle Bell',21,37),
('Lily Murphy',23,38),
('Mason Bailey',20,39),
('Nina Lopez',22,40);

-- Insert sample data into Professors (40 rows)
INSERT INTO Professors (name, department_id, email) VALUES
('Dr. Smith',1,'smith@university.edu'),
('Dr. Johnson',2,'johnson@university.edu'),
('Dr. Brown',3,'brown@university.edu'),
('Dr. Taylor',4,'taylor@university.edu'),
('Dr. White',5,'white@university.edu'),
('Dr. Green',6,'green@university.edu'),
('Dr. Adams',7,'adams@university.edu'),
('Dr. Clark',8,'clark@university.edu'),
('Dr. Lewis',9,'lewis@university.edu'),
('Dr. Hall',10,'hall@university.edu'),
('Dr. Allen',11,'allen@university.edu'),
('Dr. Young',12,'young@university.edu'),
('Dr. King',13,'king@university.edu'),
('Dr. Wright',14,'wright@university.edu'),
('Dr. Scott',15,'scott@university.edu'),
('Dr. Hill',16,'hill@university.edu'),
('Dr. Baker',17,'baker@university.edu'),
('Dr. Nelson',18,'nelson@university.edu'),
('Dr. Carter',19,'carter@university.edu'),
('Dr. Mitchell',20,'mitchell@university.edu'),
('Dr. Perez',21,'perez@university.edu'),
('Dr. Roberts',22,'roberts@university.edu'),
('Dr. Turner',23,'turner@university.edu'),
('Dr. Phillips',24,'phillips@university.edu'),
('Dr. Campbell',25,'campbell@university.edu'),
('Dr. Parker',26,'parker@university.edu'),
('Dr. Evans',27,'evans@university.edu'),
('Dr. Edwards',28,'edwards@university.edu'),
('Dr. Collins',29,'collins@university.edu'),
('Dr. Stewart',30,'stewart@university.edu'),
('Dr. Sanchez',31,'sanchez@university.edu'),
('Dr. Morris',32,'morris@university.edu'),
('Dr. Rogers',33,'rogers@university.edu'),
('Dr. Reed',34,'reed@university.edu'),
('Dr. Cook',35,'cook@university.edu'),
('Dr. Morgan',36,'morgan@university.edu'),
('Dr. Bell',37,'bell@university.edu'),
('Dr. Murphy',38,'murphy@university.edu'),
('Dr. Bailey',39,'bailey@university.edu');

-- Insert sample data into Courses (40 rows)
INSERT INTO Courses (course_name, credits, department_id) VALUES
('Intro to Programming',3,1),
('Data Structures',4,1),
('Algorithms',4,1),
('Calculus I',3,2),
('Calculus II',3,2),
('Linear Algebra',4,2),
('Engineering Mechanics',3,3),
('Thermodynamics',4,3),
('Business Management',3,4),
('Accounting',3,4),
('Microbiology',4,5),
('Anatomy',4,5),
('Criminal Law',3,6),
('Contract Law',3,6),
('Art History',3,7),
('Painting',4,7),
('Educational Psychology',3,8),
('Physics I',4,9),
('Organic Chemistry',4,10),
('Cell Biology',4,11),
('World History',3,12),
('Ethics',3,13),
('Macroeconomics',3,14),
('Political Theory',3,15),
('Cognitive Psychology',4,16),
('Social Theory',3,17),
('Probability',4,18),
('Mineralogy',3,19),
('Environmental Policy',3,20),
('Nursing Fundamentals',4,21),
('Pharmacology',4,22),
('Dental Anatomy',4,23),
('Veterinary Surgery',4,24),
('Music Theory',3,25),
('Sculpture',4,26),
('Architectural Design',4,27),
('Structural Engineering',4,28),
('Circuit Analysis',4,29),
('Machine Design',4,30),
('Aerospace Dynamics',4,31);

