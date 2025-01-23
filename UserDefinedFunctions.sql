--------Scalar function
create function calculateTax(
@Price smallint,
@Tax smallint
)
returns smallint
as
begin
return @Price+(@Price*@Tax/100)
end;

----Execution-----
select Name, Type, dbo.calculateTax(Price,10) as priceWithTax from Wine

----2----
create function udfNetSale(
@quantity int,
@list_price Dec(10,2),
@discount Dec(4,2)
)
returns Dec(10,2)
as
begin
return @quantity * @list_Price *(1-@discount);
end;

select dbo.udfNetSale(10,100,0.1) as net_sale;

  ---Modifying a scalar function
create or alter function udfNetSale(
@quantity int,
@list_price Dec(10,2),
@discount Dec(6,2)
)
returns Dec(10,2)
as
begin
return @quantity * @list_Price *(1-@discount);
end;

---Removing a scalar function
drop function udfNetSale;


-------table valued function
create function getMostCostlyProduct
(@minPrice smallint)
returns table 
as
return 
(select Name, Type, Price from Wine where Price> @minPrice);
---in table valued function begin & end is not mandatory

-----Execution
select * from getMostCostlyProduct(26);

----2-----
create function getHeighestSalary(
@Salary int)
returns table
as
return (select EmpId, Salary from tempEmp where Salary> @Salary);

select * from dbo.getHeighestSalary(22000);


alter function udfProductInYear(
@start_year date,
@end_year date)
returns table
as
return select ProductName, Release_date, Price from ProductDetails
where Release_date between @start_year AND @end_year;

select * from udfProductInYear('2017-01-03','2020-03-05');





















