-- 3.	Show monthly sales totals for 2024.

SELECT 
    MONTHNAME(OrderDate) AS month,
    SUM(TotalAmount) AS monthly_sales
FROM Orders
WHERE YEAR(OrderDate) = 2024
GROUP BY MONTH(OrderDate), MONTHNAME(OrderDate)
ORDER BY MONTH(OrderDate);
