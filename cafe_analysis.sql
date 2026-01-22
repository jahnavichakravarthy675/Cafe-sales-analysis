create database cafe;
use cafe;

-- CUSTOMERS 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50)
);

-- PRODUCTS 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price INT
);

-- ORDERS 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
select * from Orders;

-- ORDER DETAILS 
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
select * from OrderDetails;

INSERT INTO Customers VALUES
(1,'Amit Sharma','Male',25,'Hyderabad'),
(2,'Neha Verma','Female',23,'Bangalore'),
(3,'Rahul Mehta','Male',30,'Mumbai'),
(4,'Priya Singh','Female',28,'Delhi'),
(5,'Arjun Reddy','Male',35,'Hyderabad'),
(6,'Sneha Patel','Female',26,'Ahmedabad'),
(7,'Karthik Rao','Male',29,'Bangalore'),
(8,'Ananya Gupta','Female',22,'Delhi'),
(9,'Vikram Joshi','Male',40,'Pune'),
(10,'Pooja Nair','Female',27,'Kochi'),
(11,'Rohit Kumar','Male',31,'Chennai'),
(12,'Divya Iyer','Female',24,'Chennai'),
(13,'Suresh Naik','Male',45,'Goa'),
(14,'Meena Shah','Female',34,'Surat'),
(15,'Nikhil Jain','Male',28,'Indore'),
(16,'Riya Malhotra','Female',26,'Delhi'),
(17,'Abhishek Das','Male',32,'Kolkata'),
(18,'Tanvi Kulkarni','Female',29,'Pune'),
(19,'Harsha Vardhan','Male',37,'Hyderabad'),
(20,'Kavya Rao','Female',21,'Bangalore');

select * from Customers;

INSERT INTO Products VALUES
(1,'Espresso','Beverage',120),
(2,'Cappuccino','Beverage',150),
(3,'Latte','Beverage',170),
(4,'Cold Coffee','Beverage',180),
(5,'Veg Sandwich','Food',140),
(6,'Chicken Sandwich','Food',180),
(7,'Chocolate Muffin','Bakery',90),
(8,'Croissant','Bakery',110),
(9,'Brownie','Bakery',130),
(10,'French Fries','Snacks',100),
(11,'Garlic Bread','Snacks',120),
(12,'Tea','Beverage',60),
(13,'Blueberry Muffin','Bakery',100),
(14,'Paneer Wrap','Food',160),
(15,'Mocha','Beverage',190);
select * from Products;

INSERT INTO Orders VALUES
(101,1,'2024-01-05',390),
(102,2,'2024-01-06',300),
(103,3,'2024-01-07',450),
(104,4,'2024-01-08',260),
(105,5,'2024-01-10',520),
(106,6,'2024-01-12',280),
(107,7,'2024-01-15',610),
(108,8,'2024-01-18',340),
(109,9,'2024-01-20',490),
(110,10,'2024-01-22',360),
(111,11,'2024-02-01',420),
(112,12,'2024-02-03',310),
(113,13,'2024-02-05',540),
(114,14,'2024-02-07',290),
(115,15,'2024-02-10',460),
(116,16,'2024-02-12',330),
(117,17,'2024-02-14',610),
(118,18,'2024-02-16',380),
(119,19,'2024-02-18',500),
(120,20,'2024-02-20',270),
(121,1,'2024-02-22',420),
(122,2,'2024-02-24',360),
(123,3,'2024-02-25',480),
(124,4,'2024-02-26',310),
(125,5,'2024-02-27',560),
(126,6,'2024-02-28',290),
(127,7,'2024-03-01',620),
(128,8,'2024-03-02',350),
(129,9,'2024-03-03',510),
(130,10,'2024-03-04',380),
(131,11,'2024-03-05',440),
(132,12,'2024-03-06',320),
(133,13,'2024-03-07',560),
(134,14,'2024-03-08',300),
(135,15,'2024-03-09',470),
(136,16,'2024-03-10',340),
(137,17,'2024-03-11',630),
(138,18,'2024-03-12',390),
(139,19,'2024-03-13',520),
(140,20,'2024-03-14',280);
select * from Orders;

INSERT INTO OrderDetails VALUES
(1,101,1,2),(2,101,7,1),
(3,102,2,1),(4,102,5,1),
(5,103,3,2),(6,103,9,1),
(7,104,4,1),(8,104,8,1),
(9,105,6,2),(10,105,10,1),
(11,106,12,2),(12,106,7,1),
(13,107,3,2),(14,107,6,1),
(15,108,2,1),(16,108,8,2),
(17,109,4,2),(18,109,10,1),
(19,110,5,1),(20,110,7,2),
(21,111,15,1),(22,111,9,1),
(23,112,12,2),(24,112,8,1),
(25,113,6,2),(26,113,11,1),
(27,114,1,1),(28,114,7,2),
(29,115,14,2),(30,115,9,1),
(31,116,2,1),(32,116,10,1),
(33,117,3,2),(34,117,6,1),
(35,118,12,2),(36,118,8,1),
(37,119,4,2),(38,119,11,1),
(39,120,5,1),(40,120,7,1),
(41,121,15,2),(42,121,9,1),
(43,122,2,2),(44,123,3,2),
(45,124,4,1),(46,125,6,2),
(47,126,12,1),(48,127,3,2),
(49,128,8,2),(50,129,4,2);
select * from OrderDetails;

-- 🔹 SALES ANALYSIS
-- 1 ️Total Revenue Generated
SELECT SUM(TotalAmount) AS Total_Revenue
FROM Orders;

-- 2 Monthly Sales Trend
SELECT 
    MONTH(OrderDate) AS Month,
    SUM(TotalAmount) AS Monthly_Sales
FROM Orders
GROUP BY MONTH(OrderDate)
ORDER BY Month;

-- 3 Day with Highest Sales
SELECT 
    OrderDate,
    SUM(TotalAmount) AS Daily_Sales
FROM Orders
GROUP BY OrderDate
ORDER BY Daily_Sales DESC
LIMIT 1;

-- 4 Average Daily Sales
SELECT 
    AVG(Daily_Sales) AS Avg_Daily_Sales
FROM (
    SELECT OrderDate, SUM(TotalAmount) AS Daily_Sales
    FROM Orders
    GROUP BY OrderDate
) t;

-- 5 Sales Contribution by Each Month (%)
SELECT 
    MONTH(OrderDate) AS Month,
    ROUND(SUM(TotalAmount) * 100 / 
    (SELECT SUM(TotalAmount) FROM Orders), 2) AS Sales_Percentage
FROM Orders
GROUP BY MONTH(OrderDate);

-- PRODUCT ANALYSIS 
-- 6 Top 5 Best-Selling Products (by Quantity)
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

-- 7 Product Category with Highest Revenue
SELECT 
    p.Category,
    SUM(p.Price * od.Quantity) AS Category_Revenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Category_Revenue DESC
LIMIT 1;

-- 8 Least Sold Products
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Quantity_Sold ASC
LIMIT 5;

-- 9 Revenue Generated by Each Product
SELECT 
    p.ProductName,
    SUM(p.Price * od.Quantity) AS Product_Revenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Product_Revenue DESC;

-- 10 Products Never Ordered
SELECT ProductName
FROM Products
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID FROM OrderDetails
);

-- CUSTOMER ANALYSIS
-- 11 Total Unique Customers
SELECT COUNT(DISTINCT CustomerID) AS Unique_Customers
FROM Orders; 

-- 12 Top 5 Customers by Spending
SELECT 
    c.CustomerName,
    SUM(o.TotalAmount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY Total_Spent DESC
LIMIT 5;

-- 13 Average Order Value per Customer
SELECT 
    c.CustomerName,
    AVG(o.TotalAmount) AS Avg_Order_Value
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName;

-- 14 Customers with More Than 2 Orders
SELECT 
    CustomerID,
    COUNT(OrderID) AS Total_Orders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 2; 

-- 15 City-wise Customer Count
SELECT 
    City,
    COUNT(CustomerID) AS Customer_Count
FROM Customers
GROUP BY City
ORDER BY Customer_Count DESC;

-- ORDER ANALYSIS
-- 16 Average Order Value
SELECT AVG(TotalAmount) AS Avg_Order_Value
FROM Orders;

-- 17 Number of Orders Per Day
SELECT 
    OrderDate,
    COUNT(OrderID) AS Orders_Per_Day
FROM Orders
GROUP BY OrderDate
ORDER BY OrderDate;

-- 18 Number of Orders Per Month
SELECT 
    MONTH(OrderDate) AS Month,
    COUNT(OrderID) AS Total_Orders
FROM Orders
GROUP BY MONTH(OrderDate)
ORDER BY Month;

-- 19 High-Value Orders (> ₹500)
SELECT *
FROM Orders
WHERE TotalAmount > 500;

-- 20 Percentage of High-Value Orders
SELECT 
    ROUND(
        COUNT(CASE WHEN TotalAmount > 500 THEN 1 END) * 100.0 /
        COUNT(*), 2
    ) AS High_Value_Order_Percentage
FROM Orders;

-- 21 Orders with More Than 2 Items
SELECT 
    OrderID,
    SUM(Quantity) AS Total_Items
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity) > 2;


























