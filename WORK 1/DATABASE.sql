CREATE DATABASE SalesDB;
USE SalesDB;

-- Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

-- Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Insert 50 customers
INSERT INTO Customers (Name, Email, Phone, Address)
SELECT CONCAT('Customer ', n), CONCAT('customer', n, '@example.com'),
       CONCAT('080', LPAD(n, 8, '0')), CONCAT('Address ', n)
FROM (SELECT @row := @row + 1 AS n FROM
      (SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
      (SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
      (SELECT @row:=0) t0 LIMIT 50) numbers;

-- Insert 20 products
INSERT INTO Products (ProductName, Category, Price, Stock)
VALUES
('Laptop', 'Electronics', 1200, 50),
('Phone', 'Electronics', 800, 100),
('Tablet', 'Electronics', 600, 70),
('Headphones', 'Accessories', 150, 200),
('Shoes', 'Fashion', 90, 300),
('Watch', 'Fashion', 250, 150),
('TV', 'Electronics', 1500, 40),
('Camera', 'Electronics', 1000, 60),
('Bag', 'Fashion', 70, 400),
('Perfume', 'Fashion', 120, 250),
('Book', 'Stationery', 20, 500),
('Pen', 'Stationery', 5, 1000),
('Notebook', 'Stationery', 10, 800),
('Chair', 'Furniture', 200, 100),
('Table', 'Furniture', 400, 80),
('Lamp', 'Furniture', 60, 150),
('Sofa', 'Furniture', 900, 30),
('Bed', 'Furniture', 1200, 20),
('Fan', 'Electronics', 100, 200),
('Microwave', 'Electronics', 300, 50);

-- Generate 500 orders with random details
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
SELECT FLOOR(1 + RAND()*50), 
       DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*365) DAY),
       FLOOR(50 + RAND()*2000)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
      UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
      UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3
LIMIT 500;

-- Generate order details (each order gets 1–3 products)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal)
SELECT o.OrderID,
       FLOOR(1 + RAND()*20),
       FLOOR(1 + RAND()*5),
       FLOOR(20 + RAND()*500)
FROM Orders o
JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3) x ON RAND() < 0.5;
