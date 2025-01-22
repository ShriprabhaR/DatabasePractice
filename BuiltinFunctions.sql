---ASCII()
SELECT ASCII('A') AS [In ASCII Format]
SELECT ASCII('a') AS [In ASCII Format]

---CHAR()
SELECT CHAR(65) AS [In CAHR Format]
SELECT CHAR(85) AS [In CHAR Format]

---CHARINDEX()
SELECT CHARINDEX('CHAR', 'SQL Server CHARINDEX() function examples') AS MatchPosition;
select CHARINDEX('t', 'Customer') as ex;

---SOUNDEX()& DIFFERENCE()
SELECT SOUNDEX('Juice') soundex1,SOUNDEX('55') soundex2,DIFFERENCE('Juice', '55');
SELECT SOUNDEX('India') soundex1,SOUNDEX('Indian') soundex2,DIFFERENCE('India', 'Indian');

---FORMAT()
SELECT FORMAT(9658254870, '###-###-####');

DECLARE @Salary INT = 56.68;
SELECT @Salary, FORMAT(@Salary, N'F'), FORMAT(@Salary, N'C', N'en-IN');

SELECT FORMAT(GETDATE(), 'yyyy-MMM-dd'), FORMAT(GETDATE(), 'dd-MM-yyyy');

---LEFT()
SELECT LEFT('Amit Mohanty', 4) AS [Name];
SELECT LEFT('Sql Server Function Examples', 13) AS [Example];

---LEN()
SELECT LEN('Amit Mohanty') AS [Count1];
SELECT LEN('Built-In Functions LEN() in SQL Server – Part One') AS [Count2];

---LOWER() & UPPER()
SELECT LOWER('Amit Mohanty') AS [Name];
SELECT UPPER('Built-In Functions in SQL Server – Part One') AS [Example];

---LTRIM() & RTRIM()
SELECT LTRIM('       Amit Mohanty') AS [Name];
SELECT RTRIM('       Amit Mohanty         ') AS [Name];
SELECT LTRIM(RTRIM('       Amit Mohanty         ')) AS [Name];

---PATINDEX()
SELECT PATINDEX('%Part%', 'Built-In Functions in SQL Server – Part One') AS [Example];
SELECT PATINDEX('%S_rver%', 'Built-In Functions in SQL Server – Part One') AS [Example];
SELECT PATINDEX('%[^0-9A-z]%', 'Built-In Functions in SQL Server – Part One') AS [Example];

---REPLACE()
SELECT REPLACE('Built-In Functions in SQL Server – Part One', 'SQL Server', 'MS SQL Server') AS [Example];
SELECT REPLACE('Amit Kumar Mohanty', 'Kumar', '') AS [Name];

---REPLICATE()
SELECT REPLICATE(' Built-In Functions in SQL Server', 4) AS [Example];

---REVERSE()
SELECT REVERSE('Amit Mohanty') AS [Name];

---SPACE()
SELECT 'Amit' + SPACE(10) + 'Mohanty' AS [Name];

---STR()
SELECT STR(10.513) result;
SELECT STR(10.513, 5, 2) result;

---STUFF()
SELECT STUFF('My name is ', 11, 1, ' Amit Mohanty!');
SELECT STUFF('My name is ', 1, 1, ' Amit Mohanty!');

---SUBSTRING()
SELECT SUBSTRING('Built-In Functions in SQL Server – Part One', 4, 16) AS ResultString;


-----------Date and Time Functions--------
 
---CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP;

---DATEADD()
SELECT DATEADD(YEAR, 2, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(MONTH, 2, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(DAY, 2, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(WEEK, 2, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(HOUR, 2, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(MINUTE, 2, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(SECOND, 30, '2021-12-25 13:50:47.234') AS [DateAdd];
SELECT DATEADD(MILLISECOND, 200, '2021-12-25 13:50:47.234') AS [DateAdd];

---DATEDIFF()
SELECT DATEDIFF(YEAR, '2020/10/13', '2021/10/13') AS [DiffYear];

SELECT DATEDIFF(MONTH, '2020/10/13', '2021/09/13') AS [DiffMonth];

SELECT DATEDIFF(HOUR, '2020/10/13 07:00', '2021/10/13 12:45') AS [DiffHour];

---DATEFROMPARTS()
SELECT DATENAME(MONTH, '2021/12/25') AS [DateNameMonth],
       DATENAME(WEEKDAY, '2021/12/25') AS [DateNameDay];
	   ---returns string
SELECT DATEPART(MONTH, '2021/12/25') AS [DatePartMonth],
       DATEPART(WEEKDAY, '2021/12/25') AS [DatePartDay];
	   ---returns integer

---DAY(), MONTH() & YEAR()
SELECT DAY('2021-12-25') AS [Day] ,
MONTH('2021-12-25') AS [Month], 
 YEAR('2021-12-25') AS [Year];

---GETDATE(),GETUTCDATE() & SYSDATETIME()
SELECT GETDATE() AS [GetDate],
GETUTCDATE() AS [UTCDate], 
SYSDATETIME() AS [SysDateTime];

---ISDATE()
SELECT ISDATE('2021-12-25') AS [STATUS];
SELECT ISDATE('2021-15-25') AS [STATUS];

---------Aggregate functions--------
---AVG()
SELECT AVG(Price) avg_product_price
FROM ProductDetails;

---COUNT()
select COUNT(*) as prod_count
from ProductDetails;

---MAX()
select MAX(Price) as max_price
from ProductDetails;

---MIN()
select MIN(Price) as min_price
from ProductDetails;

---SUM()
select Name, SUM(Stock) as stock_count
from wine
group by Name
order by stock_count desc;

















