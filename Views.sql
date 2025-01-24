
----create view
create view orderDetailsView
as
select Name, City, ProductId, OrderStatus
from Customers c join Orders o on c.CustomerID= o.CustomerID 
join OrderDetails od on od.OrderID = o.OrderID;

----Execute view
select * from orderDetailsView

---Renaming View
Exec sp_rename 'orderDetailsView', 'orderDetailsOfCustmer';

---Drop view
drop view if exists orderDetailsView


-----------2----------
create view EmpView
as
 select EmpId, Name, Department from school.Employee
 where MgrId>2;

 select * from EmpView


 -----Alter view----
alter view EmpView
as
 select EmpId, Name, Department, Salary from school.Employee
 where MgrId>1 and Department ='Development' ;


 -----i have added column to the table but it is not reflected in the view so i need to refresh the view
 create view Emp
 as
 select * from school.Employee

 select * from Emp

 alter table school.Employee
 add Bonus int;

 select * from school.Employee

 exec sp_refreshview Emp

 -------insert on view
 insert into Emp(DeptId, Bonus)
 values(1, 1000);


--------Update on view
update Emp
set EmpId=6, Name='Chandu', Department='Finance', MgrId=2, Salary=34000, City='Thailand'
where DeptId =1;

--------Delete on view
delete from Emp
where EmpId =1;











