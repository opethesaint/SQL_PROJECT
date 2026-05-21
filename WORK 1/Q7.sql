-- 7.	Show average order value per customer.
SELECT 
    c.CustomerID,
    c.Name,
    ROUND(AVG(o.TotalAmount), 1) AS avg_order_value
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY avg_order_value DESC;

