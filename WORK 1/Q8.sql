-- 8. Identify the top 5 products by revenue
SELECT 
    p.ProductID, 
    p.ProductName,
    concat('#',round(SUM(p.Price * od.Quantity),0)) AS revenue
FROM Products p
JOIN OrderDetails od 
    ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY revenue DESC
LIMIT 5;
