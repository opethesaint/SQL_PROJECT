-- 4.	Which customer placed the highest number of orders?
select c.CustomerID, Name, 
count(o.OrderID) as orders
from customers c 
join orders o 
on c.CustomerID=o.CustomerID
group by CustomerID
order by orders desc
limit 1;


SELECT 
    c.CustomerID, 
    c.Name, 
    COUNT(o.OrderID) AS order_count
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY order_count DESC
LIMIT 1;
