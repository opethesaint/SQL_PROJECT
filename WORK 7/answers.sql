select * from courses;
select * from  departments;
select * from enrollments;
select * from lecturers;
select * from library;
select * from students;

-- 1. List all students in the Computer Science department.
select cs.student_id, cs.first_name,
cs.last_name, un.dept_name
from university.students cs 
join university.departments un on 
cs.department_id=un.department_id
where un.dept_name = 'Computer Science'
order by student_id desc;

-- 2.	Find the courses offered in the Fall semester with more than 80 capacity.
select uc.course_id,
uc.course_name,
uc.capacity,
 uc.course_code
from university.courses  uc
where uc.semester = 'Fall' and uc.capacity >= 80
order by uc.course_id;


-- 3.	Retrieve the names of lecturers hired before 2012.
select up.lecturer_id,
up.first_name,
up.last_name,
year(up.hire_date)
from university.lecturers up
where year(up.hire_date) = 2012
order by lecturer_id;

-- 4.	Show all students enrolled in "Database Systems".
select su.student_id,
concat_ws("-", su.first_name, su.last_name) as full_name,
-- concat(su.first_name," ", su.last_name) as student_full_name,
uc.course_name
from university.students su
join university.enrollments eu on
su.student_id= eu.student_id 
join university.courses uc on
eu.course_id=uc.course_id
where uc.course_name = 'Database Systems'
order by su.student_id;

-- 5.	Count the number of students in each department.
select cu.student_id,
cu.first_name,
cu.last_name,
count(up.department_id) as no_of_dept
from university.students cu
join university.departments up 
on cu.department_id=up.department_id
group by cu.student_id
order by no_of_dept;

-- 6.	Find the average grade of students in Physics courses.
select uss.student_id,
concat_ws('-', uss.first_name, uss.last_name) as full_name,
round(avg(case
when up.grade = 'A' then 4
when up.grade = 'B' then 3
when up.grade = 'C' then 2 end),0) as avg_grade
from university.students uss
join university.enrollments up on
uss.student_id=up.student_id
group by uss.student_id
order by avg_grade desc;

-- 7.	List all books available in the Library for the Chemistry department.
select lb.book_id,
lb.title,
lb.publisher,
unp.dept_name,
lb.year_published
from university.library lb
join university.departments unp on
lb.department_id=unp.department_id
where unp.dept_name = 'Chemistry'
order by lb.book_id;


-- 8.	Retrieve the details of students born after 2000.
select uss.student_id,
uss.dob as Date_of_Birth,
concat_ws("-", uss.first_name, uss.last_name) as full_name
from university.students uss 
where year(uss.dob) > 2000
order by uss.student_id;

-- 9.	Show the courses taught by Professor Alan Turing.
select ucc.course_id,
concat(ul.first_name, " ", ul.last_name) as prof_name,
ucc.course_name,
ucc.course_code
from university.courses ucc
join university.lecturers ul
on ucc.department_id=ul.department_id
where ul.first_name = 'Alan' and ul.last_name = 'Turing'
order by ucc.course_id, prof_name;

-- 10.	Find the department with the oldest establishment year.
select udp.department_id,
udp.dept_name,
udp.established_year as oldest_est
from university.departments udp
order by oldest_est asc
limit 1;

