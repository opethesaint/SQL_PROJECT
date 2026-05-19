
use universitydb;
select * from universitydb.courses;
select * from universitydb.departments;
select * from universitydb.enrollments;
select * from universitydb.grades;
select * from universitydb.professors;
select * from universitydb.students;


/* 1.Retrieve the full names and emails of all students in the Computer Science department */
-- 1.	Retrieve the full names and emails of all students in the Computer Science department.
select   fi.first_name, fi.last_name,
fi.email, de.dept_name
from universitydb.students fi
join universitydb.departments de
on fi.department_id=de.department_id
where de.dept_name = 'Computer Science'
order by first_name;

-- 2.	List all professors who were hired after the year 2015.
select po.department_id,
po.first_name, po.last_name, po.hire_date
from universitydb.professors po
where  year(po.hire_date) > 2015
order by department_id;

-- 3.	Show the names of courses offered in the Fall semester of 2025.
select co.course_name as offered_courses, co.semester, co.year
from universitydb.courses co
where co.semester = 'Fall' and co.year = 2025
order by co.course_name;

-- 4. Find the number of students enrolled in each course.
SELECT uc.course_name,
       COUNT(ue.student_id) AS num_students
FROM UniversityDB.Enrollments ue
JOIN UniversityDB.Courses uc
  ON ue.course_id = uc.course_id
GROUP BY uc.course_name
ORDER BY num_students DESC;


-- 5.	Display the students who received a grade of “A” in any course.
select su.student_id, su.first_name, su.last_namE, ug.grade
from universitydb.students su
join universitydb.grades ug
on su.student_id=ug.student_id
where ug.grade = 'A'
order by student_id;

-- 6. List all courses taught by Professor Ada Lovelace.
SELECT uc.course_id,
       uc.course_name
FROM UniversityDB.Courses uc
JOIN UniversityDB.Professors up
  ON uc.professor_id = up.professor_id
WHERE up.first_name = 'Ada'
  AND up.last_name = 'Lovelace'
ORDER BY uc.course_id;




-- 7. Retrieve the names of students who are not enrolled in any course.
SELECT us.student_id,
       us.first_name,
       us.last_name
FROM UniversityDB.Students us
LEFT JOIN UniversityDB.Enrollments ur
  ON us.student_id = ur.student_id
WHERE ur.enrollment_id IS NULL
ORDER BY us.student_id;

-- 8.	Show the average grade per course.
select cs.course_id, cs.course_name,
avg(ug.grade) AS AVR
from universitydb.courses cs
join universitydb.grades ug
on cs.course_id=ug.course_id
group by course_id
order by AVR;

-- 8. Show the average grade per course.
SELECT cs.course_id,
       cs.course_name,
       AVG(
         CASE ug.grade
           WHEN 'A' THEN 4
           WHEN 'B' THEN 3
           WHEN 'C' THEN 2
           WHEN 'D' THEN 1
           WHEN 'F' THEN 0
         END
       ) AS avg_grade
FROM UniversityDB.Courses cs
JOIN UniversityDB.Grades ug
  ON cs.course_id = ug.course_id
GROUP BY cs.course_id, cs.course_name
ORDER BY avg_grade DESC;

-- 10.	Display all enrollments for the Spring semester of 2026.
select ue.enrollment_id, ue.student_id,
ue.enrollment_date, uc.semester, ue.year
from universitydb.enrollments ue
join universitydb.courses uc
on ue.course_id=uc.course_id
where uc.semester = 'Spring' and uc.year = 2026
order by student_id;

-- 11.	List the students along with the courses they are enrolled in.
select us.student_id,
us.first_name,
us.last_name, cc.course_name
 from
universitydb.students us 
join universitydb.enrollments uu 
on us.student_id= uu.student_id
join universitydb.courses cc
on uu.course_id= cc.course_id
order by us.student_id;

-- 12.	Retrieve the professors who teach more than one course.
select universitydb.professors.professor_id,
universitydb.professors.first_name,
universitydb.professors.last_name,
count(ui.course_id) as no_of_courses
from universitydb.professors 
join universitydb.courses ui on
universitydb.professors.department_id=ui.department_id
group by professor_id
having count(ui.course_id) > 1
order by no_of_courses;

-- 12. Retrieve the professors who teach more than one course.
SELECT up.professor_id,
       up.first_name,
       up.last_name,
       COUNT(ui.course_id) AS no_of_courses
FROM UniversityDB.Professors up
JOIN UniversityDB.Courses ui
  ON up.professor_id = ui.professor_id
GROUP BY up.professor_id, up.first_name, up.last_name
HAVING COUNT(ui.course_id) > 1
ORDER BY no_of_courses DESC;

-- 13.	Show the courses with more than 3 credits.
select co.course_id,
co.course_name, co.credits as co_credit
from universitydb.courses co
where co.credits > 3
order by co_credit desc;

-- 14. Find the students who are enrolled in both Fall 2025 and Spring 2026 semesters.
SELECT us.student_id,
       us.first_name,
       us.last_name
FROM UniversityDB.Students us
WHERE EXISTS (
    SELECT 1
    FROM UniversityDB.Enrollments e
    JOIN UniversityDB.Courses c ON e.course_id = c.course_id
    WHERE e.student_id = us.student_id
      AND c.semester = 'Fall'
      AND c.year = 2025
)
AND EXISTS (
    SELECT 1
    FROM UniversityDB.Enrollments e
    JOIN UniversityDB.Courses c ON e.course_id = c.course_id
    WHERE e.student_id = us.student_id
      AND c.semester = 'Spring'
      AND c.year = 2026
)
ORDER BY us.student_id;


-- 15.	Display the grades table with student names, course names, professor names, and their grades.
select us.first_name as student_first_name,
 us.last_name as student_last_name,
 ug.grade,
uc.course_name,
up.first_name as prof_first_name,
 up.last_name as prof_last_name
from universitydb.students us 
join universitydb.grades ug on
us.student_id= ug.student_id
join universitydb.courses uc on
ug.course_id= uc.course_id
join universitydb.professors up on
uc.professor_id=up.professor_id
order by us.first_name;



