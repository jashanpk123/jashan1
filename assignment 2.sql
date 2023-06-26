

--jashanpreet kaur
--445811

SELECT ProductName, ListPrice, DateAdded
FROM Products
WHERE ListPrice > 500 AND ListPrice < 2000
ORDER BY DateAdded DESC;

SELECT ItemID, ItemPrice, DiscountAmount, Quantity, 
    ItemPrice * Quantity AS PriceTotal,
    DiscountAmount * Quantity AS DiscountTotal,
    (ItemPrice - DiscountAmount) * Quantity AS ItemTotal
FROM OrderItems
WHERE (ItemPrice - DiscountAmount) * Quantity > 500
ORDER BY ItemTotal DESC;

SELECT OrderID, OrderDate, ShipDate
FROM Orders
WHERE ShipDate IS NULL;

SELECT c.FirstName, c.LastName, a.Line1, a.City, a.State, a.ZipCode
FROM Customers c
JOIN Addresses a ON c.CustomerID = a.CustomerID
WHERE c.EmailAddress = 'allan.sherwood@yahoo.com';

SELECT c.FirstName, c.LastName, a.Line1, a.City, a.State, a.ZipCode
FROM Customers c
JOIN Addresses a ON c.ShippingAddressID = a.AddressID;

SELECT c.LastName, c.FirstName, o.OrderDate, p.ProductName, oi.ItemPrice, oi.DiscountAmount, oi.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
ORDER BY c.LastName, o.OrderDate, p.ProductName;

SELECT 'SHIPPED' AS ShipStatus, OrderID, OrderDate
FROM Orders
WHERE ShipDate IS NOT NULL
UNION
SELECT 'NOT SHIPPED' AS ShipStatus, OrderID, OrderDate
FROM Orders
WHERE ShipDate IS NULL
ORDER BY OrderDate;

SELECT c.CategoryName, p.ProductID
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
WHERE p.CategoryID IS NULL;

SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount, MAX(p.ListPrice) AS MaxListPrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY ProductCount DESC;

SELECT COUNT(*) AS OrderCount, SUM(TaxAmount) AS TotalTaxAmount
FROM Orders;

SELECT DISTINCT CategoryName
FROM Categories
WHERE CategoryID IN (
    SELECT DISTINCT CategoryID
    FROM Products
)
ORDER BY CategoryName;

INSERT INTO Customers (EmailAddress, Password, FirstName, LastName)
VALUES ('rick@raven.com', '', 'Rick', 'Raven');

UPDATE Customers
SET Password = 'secret'
WHERE EmailAddress = 'rick@raven.com';

INSERT INTO Categories (CategoryName)
VALUES ('Brass');

DELETE FROM Categories
WHERE CategoryID = 5;