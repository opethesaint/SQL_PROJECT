
-- 10. Show total sales grouped by category
SELECT 
    p.Category,
    SUM(od.Quantity * p.Price) AS total_sales
FROM Products p
JOIN OrderDetails od 
    ON p.ProductID = od.ProductID
GROUP BY p.Category
ORDER BY total_sales DESC;
