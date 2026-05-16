-- 2.	Find the most popular product category.

SELECT Products
    Category,
    COUNT(*) AS total_products
FROM Products
GROUP BY Category
ORDER BY total_products DESC
LIMIT 1;
