create Index IX_Employee_Salary
ON Employee (Salary asc)

sp_Helpindex Employee

drop index Employee.IX_Employee_Salary

create table tblEmp
(Id int Primary key ,
Name varchar(50),
Salary int,
Gender varchar(50),
City varchar(80));

execute sp_helpindex tblEmp

Insert into tblEmp values(3, 'John', 4500, 'Male', 'New York'),
(1, 'Sam', 2500, 'Male', 'London'),
(4, 'Sara', 5500, 'Female', 'Tokyo'),
(5, 'Todd', 3100, 'Male', 'Toronto'),
(2, 'Pam', 6500, 'Female', 'Sydney');

select * from tblEmp

---clusterd
create clustered index IX_tblEmp_Gender_salary
on tblEmp (Gender Desc, Salary asc)

drop index tblEmp.IX_tblEmp_Gender_salary

---non-clustered
create nonClustered index IX_tblEmp_Name
on tblEmp (Name)

Alter table tblEmp
add constraint UQ_City
UNIQUE clustered (City)

---unique, non-clustered
create unique nonclustered index
UIX_tblEmp_Name
on tblEmp (Name)







