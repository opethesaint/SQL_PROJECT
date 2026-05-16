-- 6.	Find customers who never ordered anything.
SELECT 
    c.CustomerID,
    c.Name
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
