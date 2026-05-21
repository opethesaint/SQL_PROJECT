use salesdb;

select *  from customers;
select *  from orderdetails;
select *  from orders;
select *  from products;

select c.CustomerID, c.Name,
round(sum(o.TotalAmount),0) as totalspending
from customers as c
JOIN  orders as o
on c.CustomerID=o.CustomerID
group by CustomerID
ORDER BY TOTALSPENDING  DESC
limit 10;


SELECT 
    c.CustomerID, 
    c.Name,
    SUM(o.TotalAmount) AS totalspending
FROM Customers AS c
JOIN Orders AS o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY totalspending DESC
LIMIT 10;
