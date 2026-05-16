-- 5.	List all orders that include “Laptop”.
select o.OrderID,
count(p.ProductName) as oba
from orders as o
join products as p
on o.OrderID = p.OrderID
where products = 'laptop'
group by OrderID
order by oba;



SELECT 
    o.OrderID,
    p.ProductName,
    od.Quantity,
    od.Subtotal
FROM Orders o
JOIN OrderDetails od 
    ON o.OrderID = od.OrderID
JOIN Products p 
    ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Laptop';
