---How to create stored procedure
create proc spProdList
as
begin
select * from ProductDetails where ProductId =3;
end;

---How to execute stored procedure
spProdList
execute spProdList
exec spProdList

---how to drop stored procedure
drop proc spProdList

---How to Alter stored procedure
Alter proc spProdList
as
begin
select * from ProductDetails where ProductId =3;
select * from ProductDetails where ProductId =1;
select * from ProductDetails where Price >43;
end;

---Parameters in stored procedure
---input parameters 
Alter proc spProdList
(
@ProductId int =1,  ---default value gets ignored
@Brand varchar(50)='Xiaomi'
)
as
begin
select * from ProductDetails where ProductId =@ProductId;
select * from ProductDetails where Brand = @Brand;
end;

spProdList 1, 'BLU'
spProdList @ProductId=1, @Brand= 'BLU'

---output parameters
create proc spAddDigit(
@Num1 int,
@num2 int,
@Result Int OUTPUT)
as
begin
set @Result= @Num1+@num2;
end;

Declare @Result int
Exec spAddDigit 3, 4, @Result OUTPUT;
select @Result

---with ENCRYPTION
Alter proc spAddDigit(
@Num1 int,
@num2 int,
@Result Int OUTPUT)
with Encryption
as
begin
set @Result= @Num1+@num2;
end;

sp_helptext spAddDigit ----gives encrypted msg

--------CREATE-------
create proc spEmp(
@DepartmentId tinyint
)
as
begin
select * from tempEmp where DepartmentId=@DepartmentId
end;

drop proc spUpdate

exec spEmp 3;

-------INSERT--------
create proc spInsert(
@Id int,
@Name varchar(50)
)
as
begin
insert into Person(id,Name)values(@id,@Name)
end;

exec spInsert 1,'Shri'

-------UPDATE-------
create proc spUpdate(
@Id int,
@Name varchar(50)
)
as
begin
update Person set Name=@Name where id =1;
end;

exec spUpdate 1, 'vaish'


-------Delete------
create proc spDelete(
@id int
)
as
begin
delete from Person where id = @id;
end;

exec spDelete 1

------Alter Procedure
alter proc spUpdate(
@id int,
@Name varchar(50),
@Gender char(1)
)
as
begin
begin try
     update Person set Name=@Name, Gender = @Gender where Id =@Id;
end try
begin catch
     select ERROR_LINE() as line, ERROR_MESSAGE() as message
end catch
end;

exec spUpdate  2,'shree', 'F'

---to assign result set to the variable
DECLARE @product_count INT;

SET @product_count = (
    SELECT 
        COUNT(*) 
    FROM 
        ProductDetails
);
SELECT @product_count;
PRINT @product_count;


---stored procedure takes one parameter and returns a list of products as a string
create proc spGetProdList(
@Ship_date date
)
as
begin
declare @product_list varchar(80);
set @product_list ='';
select @product_list= @product_list+ ProductName+char(10)
from ProductDetails
where Ship_date = @Ship_date
order by ProductName;
select @product_list
print @product_list
end;

exec spGetProdList '2022-01-04'











