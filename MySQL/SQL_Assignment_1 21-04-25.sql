use assignment1;

-- Basic SELECT
Select * from customers;
Select * from orders;
Select * from product;

-- List all customers and their cities.
Select  first_name ,last_name,city
from customers;

-- JOIN
-- Display each order with customer full name, product name, and total price (quantity × price).
SELECT 
    CONCAT(c.First_Name, ' ', c.Last_Name) AS CustName, 
    p.Product_Name,o.Quantity * p.Price AS TotalPrice
FROM Orders as o
JOIN 
    Customers as c ON o.Customer_ID = c.Customer_ID
JOIN 
    Products as p ON o.Product_ID = p.Product_ID;
    
    
-- Filter & Date
-- Show all orders placed in March 2024.    
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2024-03-01' AND '2024-03-31';

-- GROUP BY
-- Count how many times each product has been ordered
SELECT p.Product_Name, 
    COUNT(o.Product_ID) AS OrderCount
FROM Orders as o
JOIN 
    Products p ON o.Product_ID = p.Product_ID
GROUP BY 
    p.Product_ID, p.Product_Name;
 
-- Revenue Analysis
-- Calculate total revenue generated from each product.
SELECT 
    p.Product_Name, 
    SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN 
    Products p ON o.Product_ID = p.Product_ID
GROUP BY 
    p.Product_ID, p.Product_Name;

-- Top Customer
-- Identify the customer who spent the most.

SELECT 
    CONCAT(c.First_Name, ' ', c.Last_Name) AS CustomerName, 
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM Orders as o
JOIN 
    Customers c ON o.Customer_ID = c.Customer_ID
JOIN 
    products as p ON p.product_id = o.product_id
GROUP BY 
    c.Customer_ID, c.First_Name, c.Last_Name
ORDER BY 
    TotalSpent DESC
LIMIT 1;

-- Bonus:
-- Which city has the highest average spending per customer?

SELECT c.City, 
    AVG(t.TotalSpent) AS AvgSpending
FROM 
    (SELECT 
         o.Customer_ID, 
         avg(o.Quantity * p.Price) AS TotalSpent
     FROM Orders as o
     JOIN products p ON o.product_ID = p.product_ID
     GROUP BY o.Customer_ID
    ) t
JOIN Customers c ON t.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY AvgSpending DESC;

SELECT  c.city,
    avg(o.Quantity * p.Price) AS TotalSpent
FROM Orders as o
JOIN 
    Customers c ON o.Customer_ID = c.Customer_ID
JOIN 
    products as p ON p.product_id = o.product_id
GROUP BY 
    c.city
ORDER BY 
    TotalSpent DESC
LIMIT 1;