create database review
use review
select * from dbo.Customers
select * from dbo.Employees
select * from dbo.OrderDetails
select * from dbo.orders
select * from dbo.Products

---1-Retrieve the Name, Email, and the total number of orders each customer has placed, even if they haven't placed any, from the Customers table.
select c.Name, c.Email, count(orderId) as totalOreders
from dbo.Customers c left join dbo.Orders o on c.CustomerID = o.CustomerID
group by c.Name, c.Email;

---2-Retrieve all Products where the price is greater than 100, sorted first by Category in ascending order and then by Price in descending order.
select * from dbo.Products
where Price>100 
order by Category Asc, Price Desc;

---3-Retrieve the second page of customers, where each page contains 2 customers, sorted alphabetically by their Name.
select * from dbo.Customers 
ORDER BY Name asc
OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY;

---4-Retrieve the top 2 customers with the highest total spending on orders. Include their Name and the total spending, 
---calculated by summing the TotalAmount from the Orders table
select TOP 2 c.Name, SUM(o.TotalAmount) as TotalSpending
from dbo.Customers c inner join dbo.Orders o 
on c.CustomerID = o.CustomerID
group by c.Name;

---5-Retrieve all Orders where the TotalAmount is between 1000 and 5000, and the customer is from a city other than "Chicago".
select o.TotalAmount from Orders o 
Inner join Customers c 
on c.CustomerID = o.CustomerID
where o.TotalAmount between 1000 and 5000 and c.City ='Chicago';

---6-Calculate the average Price of products for each Category, and include only categories where the average price is greater than 500.
select avg(Price), Category as AvgPrice from Products 
group by Category
having avg(Price) > 500;

---7-Retrieve all Orders along with the corresponding Customer Name and Product Name. Assume an additional OrderDetails table,
---which maps Orders to Products with columns OrderID, ProductID, and Quantity.
select o.OrderId, c.Name, p.Name
from dbo.Orders o Inner join dbo.Customers c
on o.CustomerID = c.CustomerID Inner join dbo.OrderDetails od
on od.OrderID = o.OrderID Inner join dbo.Products p 
on od.ProductID = p.ProductID;

---8-Retrieve all customers whose Name starts with the letter "A".
select * from dbo.Customers
where Name like 'A%';

---9-Retrieve all products where the Name ends with the word "Maker".
select * from dbo.Products
where Name like '%Maker';

---10-Retrieve all employees whose Name contains the substring "Smith".
select * from dbo.Employees
where Name like '%Smith%';

---11-Retrieve all customers whose Email contains the domain "example".
select * from dbo.Customers
where Email like '%example%';

---12-Retrieve all orders where the OrderStatus starts with "D" and is exactly 9 characters long (e.g., "Delivered").
select * from dbo.Orders
where OrderStatus like 'D________';
