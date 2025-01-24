
-----------Cursor----------
declare @ProductName varchar(50), @price money

declare CursorDemo CURSOR
for select ProductName, Price from ProductDetails;

open CursorDemo

fetch next from CursorDemo into @ProductName, @Price

begin 
print @ProductName +' ' + cast(@Price as varchar)
fetch next from CursorDemo into @ProductName, @Price
end;
close CursorDemo;
deallocate CursorDemo;


------------2------------

declare @ProductName varchar(50), @Price money
declare cursorProduct CURSOR
for 
select ProductName, Price from ProductDetails

open cursorProduct
fetch next from cursorProduct into @ProductName, @Price

while @@FETCH_STATUS=0
 BEGIN
   print @ProductName +' '+cast(@Price as varchar(50));
   fetch next from cursorProduct into @ProductName, @Price

 End;

 close cursorProduct;
 deallocate cursorProduct;



 -----------3-----------
 create table Students  
    (  
      Id INT ,  
      RollNo INT ,  
      EnrollmentNo NVARCHAR(15) ,  
      Name NVARCHAR(50) ,  
      Branch NVARCHAR(50) ,  
      University NVARCHAR(50)  
    ) 

INSERT  INTO Students( Id, RollNo, EnrollmentNo, Name, Branch, University )  
VALUES  ( 1, 1, N'', N'Nikunj Satasiya', N'CE', N'RK University' ),  
        ( 2, 2, N'', N'Hiren Dobariya', N'CE', N'RK University' ),  
        ( 3, 3, N'', N'Sapna Patel', N'IT', N'RK University' ),  
        ( 4, 4, N'', N'Vivek Ghadiya', N'CE', N'RK University' ),  
        ( 5, 5, N'', N'Pritesh Dudhat', N'CE', N'RK University' ),  
        ( 5, 5, N'', N'Hardik Goriya', N'EC', N'RK University' ),  
        ( 6, 6, N'', N'Sneh Patel', N'ME', N'RK University' )  

declare @Id int, @RollNo int, @Branch nvarchar(50), @Year as int
set @Year = Right(Year(Getdate()), 2)

declare my_data CURSOR
for 
select Id, Branch, RollNo, @Year  FROM Students

open my_data
fetch next from my_data into @Id, @Branch, @RollNo, @Year

while @@FETCH_STATUS=0
Begin
Declare @EnrollmentNo NVARCHAR(15)
set @EnrollmentNo = '2KA' +cast(@Year as varchar(2)) + cast(@Branch as Nvarchar(50))
+ '0' +cast(@RollNo as nvarchar(10))

update Students set EnrollmentNo = @EnrollmentNo where Id = @Id
fetch next from my_data into @Id, @Branch, @RollNo, @Year
end
close my_data
deallocate my_data;

select * from Students
















