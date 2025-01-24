create table EmpLog(
TrgId int identity(1,1),
Id int,
Name varchar(50),
Operation varchar(80),
UpdatedAt datetime)

select * from EmpLog

---------INSERT--------
alter trigger EmpTrg
on tblEmp
After insert
as
 begin
   set nocount on;
   insert into EmpLog(Id, Name, Operation, UpdatedAt)
   select i.Id, i.Name, 'Insert', getDate() from inserted i;
 end;


 insert into tblEmp(Id, Name, Salary, Gender, City)
 values(15, 'Anu', 34000, 'Female', 'Bangalore')

 ---------UPDATE---------
 create trigger EmpUpdate
 on tblEmp
 after update
 as
 begin
   insert into EmpLog(Id, Name, Operation, UpdatedAt)
   select i.Id, i.Name, 'Update', getDate() from inserted i;
 end;

 drop trigger EmpUpdate

 update tblEmp 
 set Name ='Druv' where id =3;

 select * from tblEmp

 ------DELETE-----
 create trigger EmpDelete
 on tblEmp
 after delete
 as
 begin
 set nocount on;
   insert into EmpLog(Id, Name, Operation, UpdatedAt)
   select d.Id, d.Name, 'Delete', getDate() from deleted d;
 end;

 delete from tblEmp
 where Id=5;

 
---------------------create triggers on ddl
create table tblEmpLogs(
log_id int Identity Primary key,
event_data xml,
changed_by sysname );

select * from tblEmpLogs


alter trigger trgEmp
on database
for
create_table, alter_table, drop_table
as
  begin
  set nocount on;
  insert into tblEmpLogs(event_data, changed_by)
  values(EVENTDATA(), USER);
  end;

  alter table Account
  add Balance int;

  select * from Account










