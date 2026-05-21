-- 9. Find orders placed in the last 30 days
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= CURDATE() - INTERVAL 30 DAY
ORDER BY o.OrderDate DESC;




