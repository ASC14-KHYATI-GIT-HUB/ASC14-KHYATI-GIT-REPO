SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.Product;

SELECT FirstName, LastName, EmailAddress 
FROM SalesLT.Customer;

SELECT Name, ListPrice 
FROM SalesLT.Product;

SELECT COUNT(*) AS TotalCustomers 
FROM SalesLT.Customer;

-- 6. Count the total number of products in the catalog.
-- Problem: Determine how many products are available for sale by counting all entries in the Product table.
-- Hint: Use COUNT(*) on the Product table.
SELECT COUNT(*) AS TotalProducts
FROM SalesLT.Product

-- 7. List all unique product colors that are not null.
-- Problem: Identify all distinct colors that products come in, ignoring any products where the color is not specified (NULL).
-- Hint: Use DISTINCT and filter out NULLs with WHERE.
SELECT DISTINCT Color
FROM SalesLT.Product
WHERE Color IS NOT NULL;

-- 8. Show the 10 most expensive products.
-- Problem: Find the top 10 products with the highest ListPrice. 
-- Display their names and prices, sorted from most to least expensive.
-- Hint: Use TOP 10 and ORDER BY ListPrice DESC.
SELECT TOP 10 Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;


-- 9. Retrieve all sales orders placed so far.
-- Problem: Display every sales order in the system, including all details for each order.
-- Hint: SELECT * from SalesOrderHeader.
SELECT *
FROM SalesLT.SalesOrderHeader;


-- 10. List products that are currently in stock (not discontinued).
-- Problem: Show all products that are still available for sale, i.e., those that do not have a SellEndDate (SellEndDate IS NULL).
-- Include their name, product number, and standard cost.
-- Hint: Filter with WHERE SellEndDate IS NULL.
SELECT Name, ProductNumber, StandardCost
FROM SalesLT.Product
WHERE SellEndDate IS NULL;

SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice > 1000;

SELECT FirstName, LastName, CompanyName 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City = 'Seattle';

SELECT Name, Color, ListPrice 
FROM SalesLT.Product 
WHERE Color = 'Red';

SELECT SalesOrderID, OrderDate, TotalDue 
FROM SalesLT.SalesOrderHeader 
WHERE YEAR(OrderDate) = 2008;

SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice BETWEEN 100 AND 500;

--16. List customer with an adventure-works.com email address.
-- Problem: Find all customers whose email address ends with 'adventure-works.com'.
--This is useful for identifying company employee or partners.
--Hint: Use LIKE '%adventure-works.com' in WHERE.

SELECT FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE EmailAddress LIKE '%adventure-works.com';
 
--17. Show products whose names start with "Mountain".
--Problem: List all products Where the name begin with the word "Mountain".
--Useful for finding a specific product line.
--Hint: Use WHERE Name LIKE 'Mountain%'.

SELECT Name, ProductNumber, ListPrice
FROM SalesLT.Product
WHERE Name LIKE 'Mountain%';
 
 
--18. List products without a specified color.
--problem :Find all products where the color field is Null, indicating no color has been set.
--Hint: Use WHERE Color IS Null.

SELECT Name, ProductNumber, ListPrice
FROM SalesLT.Product
WHERE Color IS NULL;
 
--19. Find Customer who have provied their phone numbers.
--Problem : List all customers who have a non-null value in the phone coumn.
--Hint: Use WHERE Phone IS Not NULL.

SELECT FirstName, LastName, Phone
FROM SalesLT.Customer
WHERE Phone IS NOT NULL;
 
--20. List Products in the 'Helmets' or 'Gloves ' categories.
--Problem: Show all products that belong to eigther the 'Helmets' or 'Gloves 'categories.
--Join Product and ProductCategory tables to get the category name.
--Hint : Use JOIN and WHERE pc.Name IN ('Helmets','Gloves').

SELECT p.Name, p.ProductNumber, p.ListPrice, pc.Name AS CategoryName
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name IN ('Helmets', 'Gloves');
     
SELECT AVG(ListPrice) AS AveragePrice 
FROM SalesLT.Product;

SELECT SUM(TotalDue) AS TotalSales 
FROM SalesLT.SalesOrderHeader;

SELECT MAX(ListPrice) AS MaxPrice 
FROM SalesLT.Product;

SELECT MIN(ListPrice) AS MinPrice 
FROM SalesLT.Product 
WHERE ListPrice > 0;

SELECT Color, COUNT(*) AS ProductCount 
FROM SalesLT.Product 
WHERE Color IS NOT NULL 
GROUP BY Color;

select APPROX_COUNT_DISTINCT(color) from SalesLT."Product" where color is not null;

select color from SalesLT."Product" order by color;

select COUNT_BIG(*) as TotalProducts from SalesLT.Product;


-- 26. Calculate the average order total for each year.
-- Problem: For every year, compute the average TotalDue for orders placed in that year.
-- Hint: GROUP BY YEAR(OrderDate), use AVG(TotalDue).
SELECT YEAR(OrderDate) AS OrderYear,
AVG(TotalDue) AS AverageOrderTotal
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

-- 27. Count how many units have been sold for each product.
-- Problem: For each product, sum the OrderQty from all sales order details to get total units sold.
-- Hint: JOIN Product and SalesOrderDetail, GROUP BY product name.
SELECT P.Name AS ProductName,
SUM(SOD.OrderQty) AS TotalUnitsSold
FROM SalesLT.SalesOrderDetail SOD
JOIN SalesLT.Product P ON SOD.ProductID = P.ProductID
GROUP BY P.Name
ORDER BY TotalUnitsSold DESC;

-- 28. Count how many orders each customer has placed.
-- Problem: For each customer, count the number of sales orders they've made.
-- Hint: GROUP BY CustomerID .
SELECT CustomerID,
    COUNT(SalesOrderID) AS OrdersPlaced
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
ORDER BY OrdersPlaced DESC;

-- 29. Calculate the average product price in each category.
-- Problem: For every product category, compute the average ListPrice of products in that category.
-- Hint: JOIN Product and ProductCategory, GROUP BY category name.
SELECT PC.Name AS CategoryName,
AVG(P.ListPrice) AS AveragePrice
FROM SalesLT.Product P
JOIN SalesLT.ProductCategory PC ON P.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name
ORDER BY AveragePrice DESC;

-- 30. Show total sales for each month.
-- Problem: For every year and month, sum the TotalDue for all orders placed in that period.
-- Hint: GROUP BY YEAR(OrderDate), MONTH(OrderDate).
SELECT YEAR(OrderDate) AS OrderYear,
MONTH(OrderDate) AS OrderMonth,
SUM(TotalDue) AS MonthlySales
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

SELECT p.Name AS ProductName, pc.Name AS CategoryName 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID;

SELECT soh.SalesOrderID, c.FirstName, c.LastName, soh.OrderDate, soh.TotalDue 
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID;

SELECT sod.SalesOrderID, p.Name, sod.OrderQty, sod.UnitPrice, sod.LineTotal 
FROM SalesLT.SalesOrderDetail sod
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;

SELECT c.FirstName, c.LastName, a.AddressLine1, a.City, a.StateProvince, a.PostalCode 
FROM SalesLT.Customer c
INNER JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a ON ca.AddressID = a.AddressID;

SELECT p.Name AS ProductName, pc.Name AS Category, pcp.Name AS ParentCategory 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN SalesLT.ProductCategory pcp ON pc.ParentProductCategoryID = pcp.ProductCategoryID;

-- 36. Show complete order details including customer and product info.
-- Problem: For each order, display the order ID, customer name, product name, quantity, unit price, and line total.
-- Hint: Multiple INNER JOINs between SalesOrderHeader, Customer, SalesOrderDetail, and Product.
SELECT SOH.SalesOrderID,C.FirstName + ' ' + C.LastName AS CustomerName,P.Name AS ProductName,SOD.OrderQty,SOD.UnitPrice,SOD.LineTotal
FROM SalesLT.SalesOrderHeader SOH
INNER JOIN SalesLT.Customer C ON SOH.CustomerID = C.CustomerID
INNER JOIN SalesLT.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN SalesLT.Product P ON SOD.ProductID = P.ProductID
ORDER BY SOH.SalesOrderID;

-- 37. List products that have never been ordered.
-- Problem: Find all products that do not appear in any sales order detail.
-- Hint: LEFT JOIN Product and SalesOrderDetail, filter for NULLs.
SELECT P.ProductID,P.Name AS ProductName
FROM SalesLT.Product P
LEFT JOIN SalesLT.SalesOrderDetail SOD ON P.ProductID = SOD.ProductID
WHERE SOD.ProductID IS NULL
ORDER BY P.Name;

-- 38. Show total spending for each customer.
-- Problem: For every customer, sum up the TotalDue for all their orders.
-- Hint: INNER JOIN Customer and SalesOrderHeader, GROUP BY customer.
SELECT C.CustomerID,C.FirstName + ' ' + C.LastName AS CustomerName,SUM(SOH.TotalDue) AS TotalSpending
FROM SalesLT.Customer C
INNER JOIN SalesLT.SalesOrderHeader SOH ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpending DESC;

-- 39. Show descriptions for each product model.
-- Problem: For every product model, display its name and the English description.
-- Hint: INNER JOIN ProductModel, ProductModelProductDescription, and ProductDescription, filter for Culture = 'en'.
SELECT PM.Name AS ProductModelName,PD.Description AS EnglishDescription
FROM SalesLT.ProductModel PM
INNER JOIN SalesLT.ProductModelProductDescription PMP ON PM.ProductModelID = PMP.ProductModelID
INNER JOIN SalesLT.ProductDescription PD ON PMP.ProductDescriptionID = PD.ProductDescriptionID
WHERE PMP.Culture = 'en'
ORDER BY PM.Name;

-- 40. Show shipping addresses for each sales order.
-- Problem: For every sales order, display the shipping address details.
-- Hint: INNER JOIN SalesOrderHeader and Address using ShipToAddressID.
SELECT SOH.SalesOrderID,A.AddressLine1,A.AddressLine2,A.City,A.StateProvince,A.CountryRegion,A.PostalCode
FROM SalesLT.SalesOrderHeader SOH
INNER JOIN SalesLT.Address A ON SOH.ShipToAddressID = A.AddressID
ORDER BY SOH.SalesOrderID;

SELECT pc.Name AS Category, COUNT(*) AS ProductCount 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
GROUP BY pc.Name 
HAVING COUNT(*) > 10;

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > 10000;

SELECT p.ProductID, p.Name, SUM(sod.OrderQty) AS TotalSold 
FROM SalesLT.Product p
INNER JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID 
GROUP BY p.ProductID, p.Name 
HAVING SUM(sod.OrderQty) > 100;

SELECT Color, AVG(ListPrice) AS AvgPrice, COUNT(*) AS ProductCount 
FROM SalesLT.Product 
WHERE Color IS NOT NULL 
GROUP BY Color 
HAVING AVG(ListPrice) > 500;

SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS TotalSales 
FROM SalesLT.SalesOrderHeader 
GROUP BY YEAR(OrderDate) 
HAVING SUM(TotalDue) > 1000000;

SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product);

SELECT CustomerID, FirstName, LastName 
FROM SalesLT.Customer 
WHERE CustomerID IN ( SELECT CustomerID FROM SalesLT.SalesOrderHeader WHERE YEAR(OrderDate) = 2008
);

SELECT p.Name, p.ListPrice, pc.Name AS Category 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
WHERE p.ListPrice = ( SELECT MAX(p2.ListPrice) FROM SalesLT.Product p2 WHERE p2.ProductCategoryID = p.ProductCategoryID
);

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > (
SELECT AVG(CustomerTotal) 
FROM (
SELECT SUM(TotalDue) AS CustomerTotal 
FROM SalesLT.SalesOrderHeader 
GROUP BY CustomerID) AS Totals
);

SELECT ProductID, Name 
FROM SalesLT.Product 
WHERE ProductID NOT IN (
SELECT DISTINCT ProductID 
FROM SalesLT.SalesOrderDetail
);




-- ============================================
-- 1. DATA DEFINITION LANGUAGE (DDL)
-- ============================================

CREATE DATABASE SQLWORKS1;
USE SQLWORKS1;
-- Creating Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    "Location" VARCHAR(100)
);

-- Altering Table Structure
-- Add a new column
ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);

-- Modify column data type
ALTER TABLE Employees ALTER COLUMN Email VARCHAR(150);

-- Drop a column
ALTER TABLE Employees DROP COLUMN PhoneNumber;

-- Removing a Table
DROP TABLE IF EXISTS EMPLOYEES, DEPARTMENTS;

-- ============================================
-- 2. DATA MANIPULATION LANGUAGE (DML)
-- ============================================

-- Insert sample departments
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (1, 'IT', 'New York'),
       (2, 'HR', 'Chicago'),
       (3, 'Sales', 'Los Angeles');

-- Inserting Rows (Multiple Methods)
-- Single row insert
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES (1, 'John', 'Doe', 'john.doe@company.com', '2020-01-15', 75000.00, 1);

-- Multiple rows insert
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES 
    (2, 'Jane', 'Smith', 'jane.smith@company.com', '2019-03-20', 82000.00, 2),
    (3, 'Mike', 'Johnson', 'mike.j@company.com', '2021-06-10', 68000.00, 3),
    (4, 'Sarah', 'Williams', 'sarah.w@company.com', '2018-11-05', 95000.00, 1),
    (5, 'Tom', 'Brown', 'tom.brown@company.com', '2022-02-14', 71000.00, 2);
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
-- Updating Rows
-- Update single row
UPDATE Employees 
SET Salary = 78000.00 
WHERE EmployeeID = 1;

-- Update multiple rows
UPDATE Employees 
SET Salary = Salary * 1.10 
WHERE DepartmentID = 1;

-- Deleting Rows
-- Delete specific row
DELETE FROM Employees WHERE EmployeeID = 5;

-- Delete with condition
DELETE FROM Employees WHERE Salary < 70000;
GO;

SET IMPLICIT_TRANSACTIONS ON;
-- Transaction Processing
BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10000000000000000000 WHERE DepartmentID = 2;
ROLLBACK;


BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10 WHERE DepartmentID = 2;
COMMIT;
GO; -- Save changes

SELECT * FROM EMPLOYEES;
-- Rollback example
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE DepartmentID = 3;
    DELETE FROM Employees WHERE DepartmentID = 1;
ROLLBACK; -- Undo changes

-- ============================================
-- 3. DATA RETRIEVAL
-- ============================================

-- Basic SELECT statement
SELECT * FROM Employees;

-- Select specific columns
SELECT FirstName, LastName, Salary FROM Employees;

-- SELECT with DISTINCT
SELECT DISTINCT DepartmentID FROM Employees;

-- Queries Based on Conditions (WHERE clause)
SELECT * FROM Employees WHERE Salary > 75000;

SELECT FirstName, LastName FROM Employees WHERE DepartmentID = 1;

SELECT * FROM Employees WHERE HireDate >= '2020-01-01';

-- Queries Using Operators
-- Comparison operators
SELECT * FROM Employees WHERE Salary BETWEEN 70000 AND 85000;

-- IN operator
SELECT * FROM Employees WHERE DepartmentID IN (1, 2);

-- LIKE operator (pattern matching)
SELECT * FROM Employees WHERE FirstName LIKE 'J%';

SELECT * FROM Employees WHERE Email LIKE '%@company.com';

-- AND, OR, NOT operators
SELECT * FROM Employees 
WHERE Salary > 70000 AND DepartmentID = 1;

SELECT * FROM Employees 
WHERE DepartmentID = 1 OR DepartmentID = 3;

SELECT * FROM Employees 
WHERE NOT DepartmentID = 2;

-- IS NULL / IS NOT NULL
SELECT * FROM Employees WHERE Email IS NOT NULL;

-- Setting Query Results
-- ORDER BY
SELECT * FROM Employees ORDER BY Salary DESC;

SELECT FirstName, LastName, HireDate 
FROM Employees 
ORDER BY HireDate ASC;

-- TOP / LIMIT (SQL Server uses TOP)
SELECT TOP 3 * FROM Employees ORDER BY Salary DESC;

-- OFFSET FETCH (pagination)
SELECT * FROM Employees 
ORDER BY EmployeeID 
OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;
-- The offset is used to skip rows. Here it skips the first 2 rows and fetches the next 3 rows.

-- ============================================
-- 4. SQL FUNCTIONS
-- ============================================

SELECT FirstName, UPPER(FirstName) AS UpperName, LOWER(LastName) AS LowerName 
FROM Employees;

-- SUBSTRING
SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS ShortName 
FROM Employees;

-- LEN / LENGTH
SELECT FirstName, LEN(FirstName) AS NameLength 
FROM Employees;

-- CONCAT
SELECT CONCAT(FirstName, '', LastName) AS FullName 
FROM Employees;

-- LTRIM, RTRIM, TRIM
SELECT RTRIM('Hello World') AS TrimmedText;

-- REPLACE
SELECT Email, REPLACE(Email, 'company.com', 'newdomain.com') AS NewEmail 
FROM Employees;

-- Number Functions
-- ROUND
SELECT Salary, ROUND(Salary, 0) AS RoundedSalary 
FROM Employees;

SELECT ROUND(1234.567, 0);
SELECT ROUND(1234.467, 0);
SELECT ROUND(1234.567, -1);
SELECT ROUND(1234.567, 1);
SELECT ROUND(1256.567, -2) AS 'ROUNDED VALUE';  

SELECT ROUND(-1234.567, 0);
SELECT ROUND(-1234.467, 0);
SELECT ROUND(-1234.567, -1);
SELECT ROUND(-1254.567, -2);
SELECT ROUND(-1256.567, -3) AS 'ROUNDED VALUE';  
SELECT ROUND(-1256.567, -2) AS 'ROUNDED VALUE';


-- 5 EXAMPLES FOR CEILING AND FLOOR
SELECT FLOOR(1.2);  
SELECT CEILING (1.6);  
SELECT FLOOR(-1.2);  
SELECT CEILING (-1.6);  



SELECT CEILING (1.2);  
SELECT FLOOR(-1.8);                    

-- CEILING, FLOOR
SELECT Salary, CEILING(Salary/1000) * 1000 AS CeilingSalary,
       FLOOR(Salary/1000) * 1000 AS FloorSalary
FROM Employees;

-- ABS (absolute value)
SELECT ABS(-150) AS AbsoluteValue;

-- POWER, SQRT
SELECT POWER(2, 3) AS PowerResult, SQRT(16) AS SquareRoot;

-- Date Functions
-- GETDATE (current date/time)
SELECT GETDATE() AS CurrentDateTime;

-- DATEADD
SELECT HireDate, DATEADD(YEAR, 1, HireDate) AS OneYearLater 
FROM Employees;

-- DATEDIFF
SELECT FirstName, HireDate, 
       DATEDIFF(DAY, HireDate, GETDATE()) AS DaysEmployed 
FROM Employees;

-- YEAR, MONTH, DAY
SELECT HireDate, YEAR(HireDate) AS HireYear, 
       MONTH(HireDate) AS HireMonth, 
       DAY(HireDate) AS HireDay 
FROM Employees;

-- FORMAT (date formatting)
SELECT HireDate, FORMAT(HireDate, 'MM/dd/yyyy') AS FormattedDate 
FROM Employees;

-- Conversion Functions
-- CAST
SELECT Salary, CAST(Salary AS INT) AS IntSalary 
FROM Employees;


select Salary ,Cast(Salary as int) as IntSalary ,cast(Salary as varchar(20))
as VarCharSalary
from Employees;


-- CONVERT
SELECT HireDate, CONVERT(VARCHAR, HireDate, 101) AS USDate 
FROM Employees;

-- TRY_CAST (returns NULL if conversion fails)
SELECT TRY_CAST('123' AS INT) AS ValidNumber,
       TRY_CAST('ABC' AS INT) AS InvalidNumber;

-- GROUP FUNCTIONS (Aggregate Functions)
-- COUNT
SELECT COUNT(*) AS TotalEmployees FROM Employees;

SELECT DepartmentID, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY DepartmentID;

-- SUM
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- AVG
SELECT AVG(Salary) AS AverageSalary FROM Employees;

SELECT DepartmentID, AVG(Salary) AS AvgSalary 
FROM Employees 
GROUP BY DepartmentID;

-- MAX, MIN
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary 
FROM Employees;

-- 51. Which products are priced above the average?
-- Problem: List all products whose ListPrice is greater than the average ListPrice of all products.
-- Hint: Use a subquery to get the average price and compare.
SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product);

-- 52. Which customers placed orders in 2008?
-- Problem: Find all customers who have placed at least one order in the year 2008.
-- Hint: Use a subquery with SalesOrderHeader and filter by YEAR(OrderDate) = 2008.
SELECT CustomerID, FirstName, LastName 
FROM SalesLT.Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM SalesLT.SalesOrderHeader 
    WHERE YEAR(OrderDate) = 2008
);

-- 53. What is the most expensive product in each category?
-- Problem: For each product category, show the product(s) with the highest ListPrice.
-- Hint: Use a correlated subquery to get the MAX(ListPrice) per category.
SELECT p.Name, p.ListPrice, pc.Name AS Category 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
WHERE p.ListPrice = (
    SELECT MAX(p2.ListPrice) 
    FROM SalesLT.Product p2 
    WHERE p2.ProductCategoryID = p.ProductCategoryID
);

-- 54. Which customers have spent more than the average customer?
-- Problem: List customers whose total purchases exceed the average total purchases of all customers.
-- Hint: Use HAVING with a subquery that calculates the average total per customer.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > (
    SELECT AVG(CustomerTotal) 
    FROM (
        SELECT SUM(TotalDue) AS CustomerTotal 
        FROM SalesLT.SalesOrderHeader 
        GROUP BY CustomerID
    ) AS Totals
);

-- 55. Which products have never been ordered?
-- Problem: Find all products that do not appear in any sales order detail.
-- Hint: Use NOT IN with a subquery on SalesOrderDetail.
SELECT ProductID, Name 
FROM SalesLT.Product 
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID 
    FROM SalesLT.SalesOrderDetail
);

-- 56. Which orders are larger than the average order value?
-- Problem: List all sales orders where TotalDue is greater than the average TotalDue of all orders.
-- Hint: Use a subquery to get the average TotalDue.
SELECT *
FROM SalesLT.SalesOrderHeader
WHERE TotalDue > (
    SELECT AVG(TotalDue)
    FROM SalesLT.SalesOrderHeader
);
-- 57. Who are our top 5 customers by total purchases?
-- Problem: Show the top 5 customers who have spent the most in total purchases.
-- Hint: Use TOP 5 and ORDER BY total purchases (use a subquery for SUM).

SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalPurchases DESC;


-- 58. Which products are in the most expensive category?
-- Problem: List all products that belong to the category with the highest average ListPrice.
-- Hint: Use a subquery to find the ProductCategoryID with the highest average ListPrice.

SELECT *
FROM SalesLT.Product
WHERE ProductCategoryID = (
    SELECT TOP 1 ProductCategoryID
    FROM SalesLT.Product
    GROUP BY ProductCategoryID
    ORDER BY AVG(ListPrice) DESC
);

-- 59. Which customers live in the top 3 cities by customer count?
-- Problem: Find customers who live in the three cities with the most customers.
-- Hint: Use a subquery to get the top 3 cities by customer count, then filter customers by those cities.

SELECT c.*
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City IN (
    SELECT TOP 3 a.City
    FROM SalesLT.CustomerAddress ca
    JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
    GROUP BY a.City
    ORDER BY COUNT(DISTINCT ca.CustomerID) DESC
);


-- 60. Which products are priced higher than their category's average?
-- Problem: List products whose ListPrice is greater than the average ListPrice for their category.
-- Hint: Use a correlated subquery to get the average price per category.
SELECT p.*
FROM SalesLT.Product p
WHERE ListPrice > (
    SELECT AVG(ListPrice)
    FROM SalesLT.Product
    WHERE ProductCategoryID = p.ProductCategoryID
);


-- DATE & TIME FUNCTIONS (61-70)


-- 61. On which days of the week do we get the most orders?
-- Problem: For each day of the week, count the number of orders placed.
-- Hint: Use DATENAME(WEEKDAY, OrderDate) and GROUP BY.
SELECT DATENAME(WEEKDAY, OrderDate) AS DayOfWeek, COUNT(*) AS OrderCount 
FROM SalesLT.SalesOrderHeader 
GROUP BY DATENAME(WEEKDAY, OrderDate) 
ORDER BY OrderCount DESC;

-- 62. What orders were placed in the last 30 days?
-- Problem: List all sales orders placed in the last 30 days from the most recent order date.
-- Hint: Use DATEADD and MAX(OrderDate) in WHERE.
SELECT SalesOrderID, OrderDate, TotalDue 
FROM SalesLT.SalesOrderHeader 
WHERE OrderDate >= DATEADD(DAY, -30, (SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader));

-- 63. How old are our products (in days since they were first sold)?
-- Problem: For each product, show how many days have passed since SellStartDate.
-- Hint: Use DATEDIFF(DAY, SellStartDate, GETDATE()).
SELECT Name, SellStartDate, DATEDIFF(DAY, SellStartDate, GETDATE()) AS DaysOld 
FROM SalesLT.Product 
ORDER BY DaysOld DESC;

-- 64. How many orders were placed in each quarter?
-- Problem: For each year and quarter, count the number of orders.
-- Hint: Use YEAR(OrderDate), DATEPART(QUARTER, OrderDate), GROUP BY.
SELECT YEAR(OrderDate) AS Year, DATEPART(QUARTER, OrderDate) AS Quarter, COUNT(*) AS OrderCount 
FROM SalesLT.SalesOrderHeader 
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate) 
ORDER BY Year, Quarter;

-- 65. Which products were introduced in 2005?
-- Problem: List all products whose SellStartDate is in 2005.
-- Hint: Use YEAR(SellStartDate) = 2005.
SELECT Name, SellStartDate 
FROM SalesLT.Product 
WHERE YEAR(SellStartDate) = 2005;

-- 66. How long does it take to ship an order?
-- Problem: For each shipped order, show the number of days between OrderDate and ShipDate.
-- Hint: Use DATEDIFF(DAY, OrderDate, ShipDate) and filter ShipDate IS NOT NULL.

SELECT SalesOrderID, OrderDate, ShipDate,
       DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip
FROM SalesLT.SalesOrderHeader
WHERE ShipDate IS NOT NULL;

-- 67. What are the monthly sales and order counts?
-- Problem: For each month, show the number of orders and total sales.
-- Hint: Use FORMAT(OrderDate, 'yyyy-MM'), GROUP BY, and aggregate functions.
SELECT FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth,
       COUNT(*) AS OrderCount,
       SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY OrderMonth;


-- 68. Which products are currently active (available for sale)?
-- Problem: List products where SellStartDate is in the past and SellEndDate is null or in the future.
-- Hint: Use SellStartDate <= GETDATE() and (SellEndDate IS NULL OR SellEndDate >= GETDATE()).

SELECT *
FROM SalesLT.Product
WHERE SellStartDate <= GETDATE()
  AND (SellEndDate IS NULL OR SellEndDate >= GETDATE());

-- 69. When did each customer place their first and last order?
-- Problem: For each customer, show the earliest and latest order dates.
-- Hint: Use MIN(OrderDate) and MAX(OrderDate), GROUP BY CustomerID.
SELECT CustomerID,
       MIN(OrderDate) AS FirstOrderDate,
       MAX(OrderDate) AS LastOrderDate
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;


-- 70. Which products were discontinued in 2006?
-- Problem: List all products whose SellEndDate is in 2006.
-- Hint: Use YEAR(SellEndDate) = 2006.

SELECT *
FROM SalesLT.Product
WHERE YEAR(SellEndDate) = 2006;



