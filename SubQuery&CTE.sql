Alter table school.Employee
add Salary int ;

---retrieve data of emp who r having salary greater than avg salary
select * from school.Employee where Salary>
(select avg(Salary) from school.Employee);

create table tempEmp(EmpId int, Name varchar(50),DepartmentId tinyint, Department varchar(60), MgrId int, Salary int)

---inserted data into a temp table where specific department is mentioned
insert into tempEmp(EmpId, Name, DepartmentId, Salary)
select EmpId, Name , DepartmentId, Salary from tempEmp e
where e.DepartmentId = (select DeptId from school.Department where DeptName ='Testing')

---CTE
with AvgSalCTE as(select EmpId, avg(Salary) as avgSal
from school.Employee group by EmpId)
select e.EmpId, e.Name, e.salary, e.Department from school.Employee e
join AvgSalCTE cte on e.EmpId = cte.EmpId
where e.Salary > cte.avgSal;

alter table school.Department
add City Varchar(80);

---increment salary of employees from a specific city(Chicago)
with ChicagoCTE as(
select DeptName from school.Department where City ='Chicago')
Update school.Employee set Salary= Salary+500 where Department in 
(select DeptName from ChicagoCTE)

---Find the names of students who have taken the course "Java" using a subquery.
select Name from school.Student where RollNo in (select RollNo from school.StudentCourse 
where courseName='Java')

---List all courses taken by the youngest student using a subquery.
select RollNo, courseName from school.StudentCourse where RollNo in(
select RollNo from school.Student
where Age =(select min(Age) as Youngest
from school.Student ));

alter table school.StudentCourse
add Marks int

---Retrieve the details of students who scored more than 90 in any course using a subquery.
select * from school.Student where RollNo in 
(select RollNo from school.StudentCourse where Marks >90);

---Write a query to find students who are enrolled in more than 1 course using a subquery.
select * from school.Student where RollNo in
(select RollNo from school.StudentCourse 
group by RollNo
having Count(CourseId)>1);

---Find students who have not taken any courses using a subquery.
select Name from school.Student
where RollNo in(select RollNo from school.StudentCourse
group by RollNo
having Count(CourseId)<1);

---List the students whose total marks across all courses are above the average total marks of all students.
select Name from school.Student where RollNo in (select RollNo from school.StudentCourse
group by RollNo
having sum(Marks) >(select avg(Marks) from school.StudentCourse));

---Retrieve the names of students who scored the highest marks in any course using a subquery.
select Name from school.Student where RollNo in
(select RollNo from school.StudentCourse
where Marks = (select Max(Marks) from school.StudentCourse));

---Find the courses where all enrolled students scored above 50 using a subquery.
select courseName from school.StudentCourse
where CourseId Not in (select CourseId from school.StudentCourse where Marks <=50);


---CTE
---List of Students with Age Filter
with EligibleStudents as (
select RollNo, Name, Age from school.Student
where Age>29)
select * from EligibleStudents

---CTE with aggregate function
with CourseAvgs as(
select CourseId, courseName, Avg(Marks) as avgMarks
from school.StudentCourse
group by CourseId, courseName)
select CourseId, coursename, avgMarks
from CourseAvgs
where avgMarks>75;

---Rank Students by Total Marks
---write a query to retrieve rank of the students by making total of marks of each student
with StudentTotals as(
select s.RollNo, s.Name, sum(sc.Marks) as TotMarks
from school.Student s join school.StudentCourse sc on s.RollNo = sc.RollNo
group by s.RollNo, s.Name)

select *, Rank() over (Order by TotMarks Desc) as Rank from StudentTotals;

---SELECT
with St_CTE as
(
select MobileId, MobileBrand from Mobile where MobileBrand = 'Oppo'
)
select * from St_CTE;


---INSERT
with St_CTE as
(
select * from Mobile
)
insert St_CTE values(10, 'Vivo');


---UPDATE
with St_CTE as
(
select * from Mobile
)
Update St_CTE set MobileBrand ='Redmi' where MobileId =10;

---DELETE
with St_CTE as
(
select * from Mobile
)
Delete St_CTE where MobileId =10;