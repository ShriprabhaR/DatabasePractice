create schema school
go

create table school.Student(
RollNo int Not null unique,
Name Varchar(40),
Address Varchar(50),
Phone bigint,
Age int);

INSERT INTO school.Student(RollNo, Name, Address, Phone, Age)
VALUES
    (1, 'John Doe', 'Delhi', 9873367454, 23),
    (2, 'Jane Smith', 'Bihar', 3457976321, 11),
    (3, 'Sam Brown', 'Siliguri', 335579654, 21),
    (4, 'Lucy Green', 'Ramnagar', 229875343, 18),
	(5, 'Deep', 'Kolkata', 987767454, 29),
    (6, 'Dhanraj', 'Barabajar', 3457979321, 31),
    (7, 'Rohit', 'Balurghat', 335579354, 41),
    (8, 'Niraj', 'Alipur', 2298753412, 58);

	create table school.StudentCourse(
	CourseId int,
	RollNo int,
	courseName Varchar(50));

	insert into school.StudentCourse(CourseId, RollNo, CourseName)
	values
	(1, 2, 'Java'),
	(2, 2, 'Python'),
	(2, 3, 'Database'),
	(3, 4, 'C#'),
	(1, 5, 'HTML'),
	(4, 9, 'CSS'),
	(5, 10, 'Java'),
	(4, 11, 'C#');


	create table school.Department(
	DeptId int,
	DeptName varchar(50),
	CourseName varchar(60));

Insert into
     school.Department(DeptId, DeptName, CourseName)
values
	(1, 'Development', 'Java'),
	(2, 'Frontend', 'HTML'),
	(3, 'Testing', 'Database'),
	(4, 'Backend', 'C#');


	select * from school.Student;
	select * from school.StudentCourse;

	---Inner Join---
select Name, CourseId, CourseName
from school.Student s Inner join school.StudentCourse c
on s.RollNo = c.RollNo;

---using 3 tables---
select Name, c.CourseName, DeptName
from school.Student s Inner join school.StudentCourse c on s.RollNo = c.RollNo 
	              Inner join school.Department d on c.courseName = d.CourseName;

---left join---
select Name, CourseName
from school.Student s Left join school.StudentCourse c 
on s.RollNo = c.RollNo;

---using 3 tables---
select Name, c.CourseName, DeptName
from school.Student s Left join school.StudentCourse c
on s.RollNo = c.RollNo
left join school.Department d on c.courseName = d.CourseName;

---right join---
select Name,Address, CourseName
from school.Student s Right join school.StudentCourse c 
on s.RollNo = c.RollNo;

---using 3 tables---
select Name, c.CourseName, DeptName
from school.Student s Right join school.StudentCourse c
on s.RollNo = c.RollNo
Right join school.Department d on c.courseName = d.CourseName;

---full join---
select Name,Address, CourseName
from school.Student s Full join school.StudentCourse c 
on s.RollNo = c.RollNo;

---using 3 tables---
select Name, c.CourseName, DeptId, DeptName
from school.Student s full join school.StudentCourse c
on s.RollNo = c.RollNo
full join school.Department d on c.courseName = d.CourseName
where s.Name is NOT Null and c.courseName is not null;

---Cross join---
select Name, Address, CourseName
from school.Student s cross join school.StudentCourse c;

---using 3 tables---
select Name, c.CourseName, DeptId, DeptName
from school.Student s cross join school.StudentCourse c
cross join school.Department d ;

---Self join---
create table school.Employee(
EmpId int,
Name varchar(50),
Department varchar(60),
MgrId int);

insert into school.Employee(EmpId, Name, Department, MgrId)
values(1, 'Jackie','Hr', 2),
(2, 'Raghu', 'Development', 3),
(3, 'Lalita', 'Testing', 4),
(4, 'Chirag', 'Medical', 1);

SELECT e.EmpId as empid, e.Name as employee,
m.MgrId as mgrid, m.Name AS manager FROM 
school.Employee e JOIN school.Employee m
ON e.EmpId = m.MgrId;

drop table school.Employee






