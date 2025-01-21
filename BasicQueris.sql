----section 1 - querying data
---select *---
select * from dbo.ProductDetails;
---select list---
select ProductName, Release_date
from dbo.ProductDetails;

-----section 2 - sorting data
---ASC---
select ProductName, Release_date 
from dbo.ProductDetails 
order by ProductName, Release_date;

---DESC---
select ProductName, Brand 
from dbo.ProductDetails order by Brand DESC;

---LEN---
select Brand from dbo.ProductDetails 
order by LEN(Brand) ASC;

-----section 3 -limiting rows

---Offset Fetch
select ProductId, ProductName
from dbo.ProductDetails
order by ProductName
OFFSET 5 rows
fetch next 5 rows only;

---ONLY OFFSET
select ProductId, ProductName
from dbo.ProductDetails
order by ProductName
OFFSET 5 rows;

---select Top
select TOP 10 ProductName
from dbo.ProductDetails
order by ProductName DESC;

---PERCENT---
select TOP 2 percent ProductName
from dbo.ProductDetails
order by ProductName;

---TIES---
select top 3 with ties ProductName
from dbo.ProductDetails
order by ProductName;

---section 4 - Filtering data

---Distinct---
select distinct Brand, Price, Release_date
from dbo.ProductDetails;

---Where---
select Ship_date, ProductName
from dbo.ProductDetails 
where Ship_date > '2020-02-21';

---AND---
select ProductName, Release_date, Brand 
from dbo.ProductDetails
where ProductId >400 and Brand = 'Google';

---OR---
select ProductName 
from dbo.ProductDetails
where Release_date > '2023-01-08'  OR Ship_date > '2024-08-05';

---IN---
select ProductName, price 
from dbo.ProductDetails
where Price in(22.7, 27.75, 6.90);

---NOT IN---
select ProductName, price 
from dbo.ProductDetails
where Price not in(22.7, 27.75, 6.90);

---BETWEEN---
select ProductName, Price 
from dbo.ProductDetails
where Price between 17.44 and 33.54;

---LIKE---
SELECT Brand from dbo.ProductDetails
where Brand like '_t%';

---AS---
select Brand as brand_m from dbo.ProductDetails;

---Section 6 - Grouping data

---GROUP BY---
select Brand 
from dbo.ProductDetails
group by Brand;

---HAVING---
select ProductId, max(Price) as price
from dbo.ProductDetails
group by ProductId
having max(Price) > 22.79;

---Section 8 - set operators
---UNION---
select Brand 
from dbo.ProductDetails
union
select MobileBrand 
from dbo.Mobile

---INTERSECT---
select Brand 
from dbo.ProductDetails
intersect
select MobileBrand 
from dbo.Mobile

---EXCEPT---
select Brand 
from dbo.ProductDetails
except
select MobileBrand 
from dbo.Mobile




---Retrieve all rows from a table where a specific column has a value greater than a given threshold. Example: Select records where ColumnA > 100.
---1---
select * from dbo.ProductDetails where Price > 27.75;

---Fetch all rows from a table and order them by a specific column in ascending or descending order
---2---
select * from dbo.ProductDetails 
order by Brand DESC;

select * from dbo.ProductDetails 
order by Brand;

---Retrieve the top 5 rows from a table based on a column's value.
---3---
select TOP 5 ProductName, Price 
from dbo.ProductDetails
where Price > 22.7;

---Fetch 10 rows starting from the 5th row in a table.
---4---
select * from dbo.ProductDetails
order by ProductName
offset 5 rows
fetch next 10 rows only;

---Retrieve rows where values in ColumnD are between 50 and 100, and ColumnE contains the word "Active".
---5---
select * from dbo.ProductDetails
where Price between 20.48 and 30.68 and Brand = 'Nokia';

---Fetch rows where a column matches any value from a specified list.
---6---
select * from dbo.ProductDetails
where Productname like 'Samsung%';

select ProductName from dbo.ProductDetails
where Productname like '_t%';













