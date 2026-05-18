select * from COURSES;
select * from DEPARTMENTS;
select * from ENROLLMENTS;
select * from PROFESSORS;
select * from students;



-- Retrieve the names of all students in the Computer Science department
SELECT s.student_id, s.name
FROM Students s
JOIN Departments d
  ON s.department_id = d.department_id
WHERE d.dept_name = 'Computer Science'
ORDER BY s.student_id, s.name;

-- 2.	List all courses with more than 3 credit hours.
-- Since you’re just filtering rows based on a column value (credits), you should use a WHERE clause instead.
select co.course_id, co.course_name
from courses co
where co.credits >= 3
order by co.course_id, co.course_name;

-- 3  Find the average age of students enrolled in Mathematics courses
SELECT AVG(s.age) AS average_age
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Departments d ON c.department_id = d.department_id
WHERE d.dept_name = 'Mathematics';

-- 4.	Show all professors who are heads of departments.
select de.department_id, de.dept_name, de.head
from professors po
join departments de
on po.department_id=de.department_id
order by department_id;

-- 5.	Retrieve the names of students who scored an "A" in any course.
select su.student_id, su.name
from students su
join enrollments co
on su.student_id = co.student_id
join courses cu 
on co.course_id=cu.course_id
where co.grade = 'A'
order by student_id;

--  6.	Count the total number of students in each department.
select de.department_id, de.dept_name,
count(su.student_id) total
from departments de
join students su
on de.department_id=su.department_id
group by department_id
order by total desc;

-- 7.	List all courses taught by professors in the "Engineering" department.
select co.course_id, co.course_name,
po.name, de.dept_name
from courses co 
join professors po 
on co.department_id=po.department_id
join departments de
on po.department_id=de.department_id
where dept_name = 'Engineering'
order by course_id;

-- 8.	Find students enrolled in more than 3 courses.

SELECT s.student_id, s.name,
       COUNT(e.course_id) AS total_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 3
ORDER BY total_courses DESC;

-- 9.	Display the department name and building for each professor.
select de.dept_name, de.building,
po.name as professor_name
from departments de
join professors po 
on de.department_id=po.department_id
order by de.dept_name;


-- 10.	Retrieve the names of students along with the courses they are enrolled in.
select su.student_id, su.name,
co.course_name
from students su
join enrollments eo 
on su.student_id= eo.student_id
join courses co
on eo.course_id = co.course_id
order by su.student_id;


