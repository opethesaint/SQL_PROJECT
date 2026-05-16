-- ============================================================
--  E-COMMERCE PRACTICE DATABASE
--  Compatible with MySQL 5.7+ / MySQL 8.x
--  Created for SQL practice and learning
-- ============================================================

DROP DATABASE IF EXISTS ecommerce_practice;
CREATE DATABASE ecommerce_practice CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_practice;

-- ============================================================
-- TABLE DEFINITIONS
-- ============================================================

CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    parent_id     INT DEFAULT NULL,
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(120) NOT NULL UNIQUE,
    phone         VARCHAR(20),
    city          VARCHAR(80),
    country       VARCHAR(60)  DEFAULT 'Nigeria',
    gender        ENUM('Male','Female','Other'),
    birthdate     DATE,
    created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    category_id   INT          NOT NULL,
    price         DECIMAL(10,2) NOT NULL,
    cost          DECIMAL(10,2) NOT NULL,
    stock_qty     INT          DEFAULT 0,
    brand         VARCHAR(80),
    created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT          NOT NULL,
    order_date    DATETIME     NOT NULL,
    status        ENUM('pending','processing','shipped','delivered','cancelled','returned') DEFAULT 'pending',
    shipping_city VARCHAR(80),
    shipping_fee  DECIMAL(8,2) DEFAULT 0.00,
    discount      DECIMAL(8,2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id       INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT          NOT NULL,
    product_id    INT          NOT NULL,
    quantity      INT          NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE reviews (
    review_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_id    INT NOT NULL,
    customer_id   INT NOT NULL,
    rating        TINYINT CHECK (rating BETWEEN 1 AND 5),
    review_text   TEXT,
    review_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id)  REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id    INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT          NOT NULL UNIQUE,
    method        ENUM('card','transfer','cash_on_delivery','wallet') NOT NULL,
    status        ENUM('pending','successful','failed','refunded') DEFAULT 'pending',
    amount        DECIMAL(10,2) NOT NULL,
    paid_at       DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ============================================================
-- SEED DATA — CATEGORIES
-- ============================================================

INSERT INTO categories (name, parent_id) VALUES
('Electronics', NULL),
('Fashion', NULL),
('Home & Kitchen', NULL),
('Sports & Fitness', NULL),
('Beauty & Health', NULL),
('Phones & Tablets', 1),
('Laptops & Computers', 1),
('TVs & Audio', 1),
('Men Clothing', 2),
('Women Clothing', 2),
('Shoes', 2),
('Cookware', 3),
('Furniture', 3),
('Gym Equipment', 4),
('Outdoor & Adventure', 4),
('Skincare', 5),
('Supplements', 5);

-- ============================================================
-- SEED DATA — CUSTOMERS (50 customers)
-- ============================================================

INSERT INTO customers (first_name, last_name, email, phone, city, country, gender, birthdate, created_at) VALUES
('Chidi','Okafor','chidi.okafor@email.com','08012345601','Lagos','Nigeria','Male','1990-03-15','2022-01-10 08:30:00'),
('Amina','Suleiman','amina.suleiman@email.com','08012345602','Abuja','Nigeria','Female','1993-07-22','2022-01-15 09:00:00'),
('Emeka','Nwosu','emeka.nwosu@email.com','08012345603','Port Harcourt','Nigeria','Male','1988-11-05','2022-02-01 10:15:00'),
('Fatima','Ibrahim','fatima.ibrahim@email.com','08012345604','Kano','Nigeria','Female','1995-04-18','2022-02-10 11:20:00'),
('Tunde','Adeyemi','tunde.adeyemi@email.com','08012345605','Lagos','Nigeria','Male','1985-09-30','2022-02-20 14:00:00'),
('Ngozi','Eze','ngozi.eze@email.com','08012345606','Enugu','Nigeria','Female','1992-12-01','2022-03-05 09:45:00'),
('Segun','Balogun','segun.balogun@email.com','08012345607','Ibadan','Nigeria','Male','1987-06-14','2022-03-12 16:30:00'),
('Halima','Musa','halima.musa@email.com','08012345608','Kaduna','Nigeria','Female','1998-02-28','2022-03-20 08:00:00'),
('Kelechi','Obi','kelechi.obi@email.com','08012345609','Owerri','Nigeria','Male','1991-08-19','2022-04-01 10:00:00'),
('Blessing','Nwofor','blessing.nwofor@email.com','08012345610','Lagos','Nigeria','Female','1996-05-25','2022-04-10 13:00:00'),
('Damilola','Akinwale','damilola.akinwale@email.com','08012345611','Abeokuta','Nigeria','Female','1994-01-08','2022-04-15 09:30:00'),
('Yusuf','Aliyu','yusuf.aliyu@email.com','08012345612','Maiduguri','Nigeria','Male','1989-10-12','2022-05-01 11:00:00'),
('Chioma','Okonkwo','chioma.okonkwo@email.com','08012345613','Anambra','Nigeria','Female','1997-03-03','2022-05-10 14:30:00'),
('Ade','Fashola','ade.fashola@email.com','08012345614','Lagos','Nigeria','Male','1986-07-07','2022-05-20 08:45:00'),
('Rukayat','Adebisi','rukayat.adebisi@email.com','08012345615','Lagos','Nigeria','Female','1999-09-09','2022-06-01 10:20:00'),
('Obiora','Chukwu','obiora.chukwu@email.com','08012345616','Onitsha','Nigeria','Male','1983-04-25','2022-06-10 12:00:00'),
('Zainab','Garba','zainab.garba@email.com','08012345617','Katsina','Nigeria','Female','1993-11-14','2022-06-20 15:00:00'),
('Gbenga','Olawale','gbenga.olawale@email.com','08012345618','Lagos','Nigeria','Male','1990-06-06','2022-07-01 09:00:00'),
('Adaeze','Nnamdi','adaeze.nnamdi@email.com','08012345619','Umuahia','Nigeria','Female','1995-02-17','2022-07-10 11:30:00'),
('Musa','Danjuma','musa.danjuma@email.com','08012345620','Jos','Nigeria','Male','1988-08-23','2022-07-20 14:00:00'),
('Sola','Ogundipe','sola.ogundipe@email.com','08012345621','Ibadan','Nigeria','Female','1992-05-30','2022-08-01 08:30:00'),
('Ifeanyi','Ogbonna','ifeanyi.ogbonna@email.com','08012345622','Lagos','Nigeria','Male','1987-03-19','2022-08-10 10:00:00'),
('Hadiza','Umar','hadiza.umar@email.com','08012345623','Sokoto','Nigeria','Female','1996-12-12','2022-08-20 12:30:00'),
('Rotimi','Oduya','rotimi.oduya@email.com','08012345624','Benin City','Nigeria','Male','1984-09-01','2022-09-01 09:15:00'),
('Chinwe','Okeke','chinwe.okeke@email.com','08012345625','Aba','Nigeria','Female','1993-04-04','2022-09-10 11:00:00'),
('Usman','Bello','usman.bello@email.com','08012345626','Abuja','Nigeria','Male','1991-07-16','2022-09-20 14:45:00'),
('Adunola','Coker','adunola.coker@email.com','08012345627','Lagos','Nigeria','Female','1998-01-20','2022-10-01 08:00:00'),
('Nnamdi','Egwu','nnamdi.egwu@email.com','08012345628','Enugu','Nigeria','Male','1986-10-28','2022-10-10 10:30:00'),
('Ramat','Yahaya','ramat.yahaya@email.com','08012345629','Zaria','Nigeria','Female','1994-06-11','2022-10-20 13:00:00'),
('Femi','Adeleke','femi.adeleke@email.com','08012345630','Osogbo','Nigeria','Male','1989-02-14','2022-11-01 09:30:00'),
('Uchenna','Anene','uchenna.anene@email.com','08012345631','Awka','Nigeria','Male','1992-08-08','2022-11-10 11:45:00'),
('Mariam','Lawal','mariam.lawal@email.com','08012345632','Lagos','Nigeria','Female','1997-11-25','2022-11-20 14:00:00'),
('Olumide','Oguike','olumide.oguike@email.com','08012345633','Abeokuta','Nigeria','Male','1985-05-05','2022-12-01 08:30:00'),
('Precious','Ugwu','precious.ugwu@email.com','08012345634','Nsukka','Nigeria','Female','1999-03-21','2022-12-10 10:00:00'),
('Babatunde','Oladapo','babatunde.oladapo@email.com','08012345635','Lagos','Nigeria','Male','1988-12-30','2022-12-20 12:30:00'),
('Ifeoma','Chima','ifeoma.chima@email.com','08012345636','Port Harcourt','Nigeria','Female','1993-07-07','2023-01-05 09:00:00'),
('Lawal','Abdullahi','lawal.abdullahi@email.com','08012345637','Ilorin','Nigeria','Male','1990-04-14','2023-01-15 11:30:00'),
('Titi','Oyelaran','titi.oyelaran@email.com','08012345638','Akure','Nigeria','Female','1996-10-10','2023-02-01 14:00:00'),
('Emmanuel','Osei','emmanuel.osei@email.com','08012345639','Lagos','Nigeria','Male','1991-01-27','2023-02-15 08:45:00'),
('Bola','Tinubu','bola.tinubu2@email.com','08012345640','Lagos','Nigeria','Male','1984-03-29','2023-03-01 10:15:00'),
('Lara','Oguntimehin','lara.oguntimehin@email.com','08012345641','Ilesha','Nigeria','Female','1995-09-16','2023-03-10 12:00:00'),
('Odunayo','Fasanya','odunayo.fasanya@email.com','08012345642','Lagos','Nigeria','Male','1987-06-23','2023-04-01 09:30:00'),
('Comfort','Okafor','comfort.okafor@email.com','08012345643','Calabar','Nigeria','Female','1998-02-02','2023-04-15 11:00:00'),
('Solomon','Nwachukwu','solomon.nwachukwu@email.com','08012345644','Warri','Nigeria','Male','1986-11-18','2023-05-01 14:30:00'),
('Grace','Iyanda','grace.iyanda@email.com','08012345645','Lagos','Nigeria','Female','1994-08-05','2023-05-15 08:00:00'),
('Abdul','Razaq','abdul.razaq@email.com','08012345646','Kano','Nigeria','Male','1992-05-12','2023-06-01 10:45:00'),
('Omotola','Jalade','omotola.jalade2@email.com','08012345647','Lagos','Nigeria','Female','1997-02-07','2023-06-10 13:15:00'),
('Chukwuemeka','Obi','chukwuemeka.obi@email.com','08012345648','Onitsha','Nigeria','Male','1989-09-09','2023-07-01 09:00:00'),
('Yetunde','Adegoke','yetunde.adegoke@email.com','08012345649','Ibadan','Nigeria','Female','1993-12-15','2023-07-15 11:30:00'),
('Victor','Okonjo','victor.okonjo@email.com','08012345650','Abuja','Nigeria','Male','1990-07-20','2023-08-01 14:00:00');

-- ============================================================
-- SEED DATA — PRODUCTS (40 products)
-- ============================================================

INSERT INTO products (name, category_id, price, cost, stock_qty, brand) VALUES
-- Phones & Tablets (6)
('iPhone 15 Pro Max 256GB',6,950000.00,720000.00,45,'Apple'),
('Samsung Galaxy S24 Ultra',6,820000.00,610000.00,60,'Samsung'),
('Tecno Camon 20 Pro',6,185000.00,130000.00,120,'Tecno'),
('Infinix Note 40 Pro',6,145000.00,100000.00,150,'Infinix'),
('iPad Air 5th Gen',6,680000.00,500000.00,30,'Apple'),
('Samsung Galaxy Tab S9',6,550000.00,400000.00,25,'Samsung'),
-- Laptops (5)
('MacBook Pro 14" M3',7,1450000.00,1100000.00,20,'Apple'),
('Dell XPS 15 Laptop',7,980000.00,740000.00,35,'Dell'),
('HP Pavilion 15 Laptop',7,420000.00,310000.00,80,'HP'),
('Lenovo ThinkPad X1 Carbon',7,870000.00,650000.00,28,'Lenovo'),
('Asus ROG Strix G16',7,760000.00,570000.00,40,'Asus'),
-- TVs & Audio (4)
('LG 55" 4K OLED Smart TV',8,620000.00,450000.00,18,'LG'),
('Samsung 65" QLED TV',8,780000.00,580000.00,12,'Samsung'),
('Sony WH-1000XM5 Headphones',8,185000.00,130000.00,95,'Sony'),
('JBL Charge 5 Speaker',8,68000.00,45000.00,200,'JBL'),
-- Men Clothing (4)
('Classic Oxford Shirt',9,12500.00,7000.00,300,'Zara'),
('Slim Fit Chinos',9,18000.00,10000.00,250,'H&M'),
('Wool Blend Blazer',9,45000.00,28000.00,80,'Marks & Spencer'),
('Polo T-Shirt Pack x3',9,9500.00,5500.00,400,'Polo'),
-- Women Clothing (4)
('Floral Maxi Dress',10,22000.00,12000.00,200,'Zara'),
('Ankara Jumpsuit',10,18500.00,10500.00,180,'Local Brand'),
('Lace Blouse',10,15000.00,8000.00,220,'H&M'),
('High-waist Jeans',10,28000.00,16000.00,175,'Levi\'s'),
-- Shoes (3)
('Nike Air Max 270',11,75000.00,52000.00,120,'Nike'),
('Adidas Ultraboost 23',11,88000.00,62000.00,90,'Adidas'),
('Office Leather Oxford',11,35000.00,20000.00,140,'Clarks'),
-- Cookware (3)
('Non-stick Frying Pan Set',12,22000.00,13000.00,160,'Tefal'),
('Pressure Cooker 7L',12,35000.00,21000.00,110,'Tower'),
('Stainless Steel Pot Set',12,28000.00,16000.00,130,'Chef Craft'),
-- Furniture (2)
('Office Chair Ergonomic',13,85000.00,55000.00,50,'Ikea'),
('Bookshelf 5-Tier',13,42000.00,26000.00,65,'Ikea'),
-- Gym Equipment (3)
('Adjustable Dumbbell Set 20kg',14,68000.00,44000.00,75,'PowerBlock'),
('Yoga Mat Premium',14,12000.00,6500.00,300,'Gaiam'),
('Resistance Bands Set',14,8500.00,4500.00,400,'TheraBand'),
-- Outdoor (2)
('Camping Tent 4-Person',15,55000.00,35000.00,40,'Coleman'),
('Hiking Backpack 50L',15,38000.00,23000.00,60,'Osprey'),
-- Skincare (3)
('Vitamin C Serum 30ml',16,15000.00,7500.00,250,'The Ordinary'),
('SPF 50 Sunscreen',16,9500.00,5000.00,300,'Neutrogena'),
('Hydrating Face Moisturiser',16,18000.00,10000.00,220,'Cetaphil'),
-- Supplements (2)
('Whey Protein 2kg Chocolate',17,42000.00,28000.00,100,'Optimum Nutrition'),
('Multivitamin 365 Tablets',17,18500.00,11000.00,180,'Nature Made');

-- ============================================================
-- SEED DATA — ORDERS (120 orders across 2022-2024)
-- ============================================================

INSERT INTO orders (customer_id, order_date, status, shipping_city, shipping_fee, discount) VALUES
(1,'2022-01-15 10:30:00','delivered','Lagos',1500.00,0.00),
(2,'2022-01-20 14:00:00','delivered','Abuja',2000.00,500.00),
(3,'2022-02-05 09:15:00','delivered','Port Harcourt',2500.00,0.00),
(4,'2022-02-14 11:00:00','delivered','Kano',3000.00,0.00),
(5,'2022-03-01 16:30:00','delivered','Lagos',1500.00,1000.00),
(6,'2022-03-10 13:45:00','delivered','Enugu',2000.00,0.00),
(7,'2022-03-22 08:30:00','delivered','Ibadan',1800.00,0.00),
(8,'2022-04-05 10:00:00','delivered','Kaduna',2500.00,500.00),
(9,'2022-04-18 15:30:00','delivered','Owerri',2000.00,0.00),
(10,'2022-05-02 09:00:00','delivered','Lagos',1500.00,0.00),
(11,'2022-05-15 14:30:00','delivered','Abeokuta',2000.00,0.00),
(12,'2022-05-28 11:00:00','delivered','Maiduguri',3500.00,1000.00),
(13,'2022-06-10 10:15:00','delivered','Anambra',2000.00,0.00),
(14,'2022-06-20 16:00:00','delivered','Lagos',1500.00,500.00),
(15,'2022-07-04 09:30:00','delivered','Lagos',1500.00,0.00),
(16,'2022-07-15 13:00:00','delivered','Onitsha',2000.00,0.00),
(17,'2022-08-01 10:45:00','delivered','Katsina',3000.00,0.00),
(18,'2022-08-12 14:15:00','delivered','Lagos',1500.00,1500.00),
(19,'2022-08-25 09:00:00','delivered','Umuahia',2000.00,0.00),
(20,'2022-09-05 11:30:00','delivered','Jos',2500.00,0.00),
(21,'2022-09-18 15:00:00','delivered','Ibadan',1800.00,500.00),
(22,'2022-10-01 08:45:00','delivered','Lagos',1500.00,0.00),
(23,'2022-10-14 12:00:00','delivered','Sokoto',3000.00,0.00),
(24,'2022-10-25 16:30:00','delivered','Benin City',2000.00,0.00),
(25,'2022-11-07 10:00:00','delivered','Aba',2000.00,1000.00),
(26,'2022-11-20 13:30:00','delivered','Abuja',2000.00,0.00),
(27,'2022-12-05 09:15:00','delivered','Lagos',1500.00,0.00),
(28,'2022-12-18 15:00:00','delivered','Enugu',2000.00,500.00),
(29,'2023-01-08 10:30:00','delivered','Zaria',2500.00,0.00),
(30,'2023-01-20 14:00:00','delivered','Osogbo',2000.00,0.00),
(1,'2023-02-03 09:00:00','delivered','Lagos',1500.00,0.00),
(5,'2023-02-15 11:30:00','delivered','Lagos',1500.00,2000.00),
(10,'2023-02-28 14:00:00','delivered','Lagos',1500.00,0.00),
(2,'2023-03-10 10:15:00','delivered','Abuja',2000.00,0.00),
(15,'2023-03-22 16:45:00','delivered','Lagos',1500.00,500.00),
(18,'2023-04-04 09:30:00','delivered','Lagos',1500.00,0.00),
(22,'2023-04-15 13:00:00','delivered','Lagos',1500.00,0.00),
(3,'2023-04-28 10:45:00','returned','Port Harcourt',2500.00,0.00),
(7,'2023-05-10 14:00:00','delivered','Ibadan',1800.00,1000.00),
(12,'2023-05-22 09:15:00','delivered','Maiduguri',3500.00,0.00),
(31,'2023-06-04 11:30:00','delivered','Awka',2000.00,0.00),
(32,'2023-06-15 15:00:00','delivered','Lagos',1500.00,500.00),
(33,'2023-06-28 10:00:00','delivered','Abeokuta',2000.00,0.00),
(34,'2023-07-10 13:30:00','delivered','Nsukka',2000.00,0.00),
(35,'2023-07-22 09:00:00','delivered','Lagos',1500.00,1000.00),
(36,'2023-08-03 14:15:00','delivered','Port Harcourt',2500.00,0.00),
(37,'2023-08-15 10:30:00','delivered','Ilorin',2000.00,0.00),
(38,'2023-08-28 15:45:00','delivered','Akure',2000.00,500.00),
(39,'2023-09-09 09:30:00','delivered','Lagos',1500.00,0.00),
(40,'2023-09-20 13:00:00','delivered','Lagos',1500.00,0.00),
(41,'2023-10-02 10:15:00','delivered','Ilesha',2000.00,0.00),
(42,'2023-10-14 14:30:00','delivered','Lagos',1500.00,1500.00),
(43,'2023-10-25 09:00:00','delivered','Calabar',2500.00,0.00),
(44,'2023-11-06 11:30:00','delivered','Warri',2000.00,0.00),
(45,'2023-11-18 15:00:00','delivered','Lagos',1500.00,0.00),
(46,'2023-11-30 10:45:00','delivered','Kano',3000.00,500.00),
(47,'2023-12-10 13:15:00','delivered','Lagos',1500.00,0.00),
(48,'2023-12-20 09:30:00','delivered','Onitsha',2000.00,1000.00),
(49,'2023-12-28 14:00:00','delivered','Ibadan',1800.00,0.00),
(50,'2024-01-08 10:00:00','delivered','Abuja',2000.00,0.00),
(1,'2024-01-20 13:30:00','delivered','Lagos',1500.00,0.00),
(5,'2024-02-01 09:15:00','delivered','Lagos',1500.00,2000.00),
(10,'2024-02-12 14:45:00','delivered','Lagos',1500.00,0.00),
(15,'2024-02-25 10:30:00','delivered','Lagos',1500.00,500.00),
(20,'2024-03-08 13:00:00','delivered','Jos',2500.00,0.00),
(25,'2024-03-19 09:00:00','delivered','Aba',2000.00,0.00),
(30,'2024-03-31 15:30:00','delivered','Osogbo',2000.00,1000.00),
(35,'2024-04-11 10:15:00','delivered','Lagos',1500.00,0.00),
(40,'2024-04-22 13:45:00','delivered','Lagos',1500.00,0.00),
(45,'2024-05-04 09:30:00','delivered','Lagos',1500.00,500.00),
(2,'2024-05-16 14:00:00','delivered','Abuja',2000.00,0.00),
(7,'2024-05-28 10:45:00','delivered','Ibadan',1800.00,0.00),
(12,'2024-06-09 13:15:00','delivered','Maiduguri',3500.00,1500.00),
(17,'2024-06-20 09:00:00','delivered','Katsina',3000.00,0.00),
(22,'2024-07-02 14:30:00','delivered','Lagos',1500.00,0.00),
(27,'2024-07-14 10:00:00','delivered','Lagos',1500.00,0.00),
(32,'2024-07-25 13:30:00','delivered','Lagos',1500.00,500.00),
(37,'2024-08-06 09:15:00','shipped','Ilorin',2000.00,0.00),
(42,'2024-08-18 14:45:00','processing','Lagos',1500.00,1000.00),
(47,'2024-08-30 10:30:00','pending','Lagos',1500.00,0.00),
(3,'2024-09-10 13:00:00','delivered','Port Harcourt',2500.00,0.00),
(8,'2024-09-21 09:30:00','delivered','Kaduna',2500.00,0.00),
(13,'2024-10-03 15:00:00','delivered','Anambra',2000.00,500.00),
(18,'2024-10-14 10:15:00','delivered','Lagos',1500.00,0.00),
(23,'2024-10-25 13:45:00','cancelled','Sokoto',3000.00,0.00),
(28,'2024-11-06 09:00:00','delivered','Enugu',2000.00,0.00),
(33,'2024-11-18 14:30:00','delivered','Abeokuta',2000.00,1000.00),
(38,'2024-11-30 10:45:00','delivered','Akure',2000.00,0.00),
(43,'2024-12-10 13:15:00','delivered','Calabar',2500.00,0.00),
(48,'2024-12-22 09:30:00','shipped','Onitsha',2000.00,500.00),
(4,'2024-12-28 15:00:00','pending','Kano',3000.00,0.00),
(9,'2023-01-15 10:00:00','delivered','Owerri',2000.00,0.00),
(14,'2023-02-01 13:30:00','delivered','Lagos',1500.00,500.00),
(19,'2023-03-05 09:15:00','delivered','Umuahia',2000.00,0.00),
(24,'2023-04-08 14:45:00','delivered','Benin City',2000.00,0.00),
(29,'2023-05-12 10:30:00','delivered','Zaria',2500.00,1000.00),
(6,'2023-07-01 13:00:00','delivered','Enugu',2000.00,0.00),
(11,'2023-08-05 09:00:00','delivered','Abeokuta',2000.00,0.00),
(16,'2023-09-10 14:30:00','delivered','Onitsha',2000.00,500.00),
(21,'2023-10-15 10:15:00','delivered','Ibadan',1800.00,0.00),
(26,'2023-11-20 13:45:00','delivered','Abuja',2000.00,0.00),
(31,'2024-01-15 09:30:00','delivered','Awka',2000.00,1000.00),
(36,'2024-02-20 14:00:00','delivered','Port Harcourt',2500.00,0.00),
(41,'2024-03-25 10:45:00','delivered','Ilesha',2000.00,0.00),
(46,'2024-04-30 13:15:00','delivered','Kano',3000.00,500.00),
(50,'2024-06-05 09:00:00','delivered','Abuja',2000.00,0.00),
(44,'2024-07-10 14:30:00','cancelled','Warri',2000.00,0.00),
(49,'2024-08-15 10:00:00','delivered','Ibadan',1800.00,0.00),
(1,'2024-09-20 13:30:00','delivered','Lagos',1500.00,0.00),
(5,'2024-10-25 09:15:00','delivered','Lagos',1500.00,2500.00),
(10,'2024-11-30 14:45:00','delivered','Lagos',1500.00,0.00),
(15,'2024-12-15 10:30:00','delivered','Lagos',1500.00,1000.00),
(2,'2022-03-15 13:00:00','delivered','Abuja',2000.00,0.00),
(4,'2022-07-10 09:00:00','delivered','Kano',3000.00,0.00),
(6,'2022-09-25 14:30:00','delivered','Enugu',2000.00,500.00),
(8,'2022-11-30 10:15:00','delivered','Kaduna',2500.00,0.00),
(3,'2023-12-01 13:45:00','delivered','Port Harcourt',2500.00,1000.00),
(20,'2024-05-20 09:30:00','delivered','Jos',2500.00,0.00);

-- ============================================================
-- SEED DATA — ORDER ITEMS
-- ============================================================

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,1,1,950000.00),(1,15,1,68000.00),
(2,7,1,1450000.00),
(3,2,1,820000.00),(3,14,1,185000.00),
(4,3,2,185000.00),
(5,8,1,980000.00),(5,33,1,12000.00),
(6,20,2,22000.00),(6,22,1,15000.00),
(7,24,1,75000.00),(7,19,1,22000.00),
(8,12,1,620000.00),
(9,16,3,12500.00),(9,17,1,18000.00),
(10,4,1,145000.00),(10,37,2,15000.00),
(11,26,1,22000.00),(11,28,1,28000.00),
(12,1,1,950000.00),(12,14,1,185000.00),
(13,9,1,420000.00),
(14,5,1,680000.00),(14,15,2,68000.00),
(15,25,1,88000.00),(15,32,1,12000.00),
(16,2,1,820000.00),
(17,13,1,780000.00),
(18,7,1,1450000.00),(18,39,1,42000.00),
(19,21,2,18500.00),(19,23,1,35000.00),
(20,3,1,185000.00),(20,10,1,87000.00),
(21,29,1,85000.00),(21,30,1,42000.00),
(22,1,1,950000.00),
(23,8,1,980000.00),
(24,6,1,550000.00),(24,14,1,185000.00),
(25,11,1,760000.00),
(26,2,1,820000.00),(26,37,1,15000.00),
(27,16,2,12500.00),(27,17,2,18000.00),(27,18,1,45000.00),
(28,12,1,620000.00),(28,15,1,68000.00),
(29,4,2,145000.00),
(30,20,1,22000.00),(30,22,2,15000.00),(30,23,1,35000.00),
(31,1,1,950000.00),(31,33,1,12000.00),
(32,7,1,1450000.00),(32,39,2,42000.00),
(33,5,1,680000.00),
(34,9,1,420000.00),(34,25,1,88000.00),
(35,2,1,820000.00),
(36,14,2,185000.00),(36,15,1,68000.00),
(37,3,1,185000.00),(37,4,1,145000.00),
(38,8,1,980000.00),
(39,19,1,22000.00),(39,20,2,22000.00),
(40,10,1,870000.00),(40,11,1,760000.00),
(41,26,2,22000.00),(41,27,1,35000.00),
(42,1,1,950000.00),(42,37,1,15000.00),(42,38,1,9500.00),
(43,13,1,780000.00),
(44,7,1,1450000.00),
(45,25,1,88000.00),(45,24,1,75000.00),
(46,2,1,820000.00),(46,15,1,68000.00),
(47,12,1,620000.00),
(48,1,1,950000.00),(48,14,1,185000.00),(48,33,1,12000.00),
(49,9,1,420000.00),(49,16,2,12500.00),
(50,8,1,980000.00),(50,39,1,42000.00),
(51,5,1,680000.00),(51,32,2,12000.00),
(52,7,1,1450000.00),
(53,3,2,185000.00),(53,37,1,15000.00),
(54,2,1,820000.00),(54,14,1,185000.00),
(55,1,1,950000.00),
(56,11,1,760000.00),(56,29,1,85000.00),
(57,4,1,145000.00),(57,25,1,88000.00),
(58,6,1,550000.00),
(59,8,1,980000.00),(59,15,2,68000.00),
(60,2,1,820000.00),(60,33,1,12000.00),
(61,7,1,1450000.00),(61,39,1,42000.00),
(62,1,1,950000.00),
(63,12,1,620000.00),(63,14,1,185000.00),
(64,9,1,420000.00),(64,25,1,88000.00),
(65,3,1,185000.00),(65,37,1,15000.00),
(66,8,1,980000.00),(66,40,2,18500.00),
(67,5,1,680000.00),(67,15,1,68000.00),
(68,2,1,820000.00),
(69,13,1,780000.00),(69,14,1,185000.00),
(70,1,1,950000.00),(70,32,1,12000.00),
(71,7,1,1450000.00),
(72,4,2,145000.00),(72,10,1,870000.00),
(73,25,1,88000.00),(73,24,1,75000.00),
(74,8,1,980000.00),(74,39,1,42000.00),
(75,2,1,820000.00),(75,37,1,15000.00),
(76,3,1,185000.00),(76,26,1,22000.00),
(77,1,1,950000.00),(77,14,2,185000.00),
(78,9,1,420000.00),
(79,5,1,680000.00),(79,15,1,68000.00),
(80,12,1,620000.00),(80,33,1,12000.00),
(81,7,1,1450000.00),(81,39,2,42000.00),
(82,2,1,820000.00),(82,25,1,88000.00),
(83,6,1,550000.00),(83,14,1,185000.00),
(84,8,1,980000.00),
(85,1,1,950000.00),(85,37,1,15000.00),
(86,3,1,185000.00),(86,4,1,145000.00),
(87,13,1,780000.00),
(88,9,1,420000.00),(88,25,1,88000.00),
(89,2,1,820000.00),(89,14,1,185000.00),
(90,5,1,680000.00),(90,15,1,68000.00),
(91,7,1,1450000.00),(91,39,1,42000.00),
(92,1,1,950000.00),(92,32,1,12000.00),
(93,8,1,980000.00),(93,33,1,12000.00),
(94,2,1,820000.00),(94,25,1,88000.00),
(95,12,1,620000.00),
(96,4,2,145000.00),(96,37,1,15000.00),
(97,6,1,550000.00),(97,14,1,185000.00),
(98,3,1,185000.00),(98,15,2,68000.00),
(99,9,1,420000.00),(99,25,1,88000.00),
(100,1,1,950000.00),(100,39,1,42000.00),
(101,8,1,980000.00),(101,14,1,185000.00),
(102,5,1,680000.00),
(103,2,1,820000.00),(103,33,1,12000.00),
(104,7,1,1450000.00),(104,32,1,12000.00),
(105,1,1,950000.00),(105,25,1,88000.00),
(106,3,1,185000.00),(106,4,1,145000.00),
(107,12,1,620000.00),(107,15,1,68000.00),
(108,8,1,980000.00),(108,37,1,15000.00),
(109,2,1,820000.00),(109,39,1,42000.00),
(110,6,1,550000.00),(110,14,2,185000.00),
(111,1,1,950000.00),(111,25,1,88000.00),
(112,9,1,420000.00),(112,33,1,12000.00),
(113,5,1,680000.00),(113,15,1,68000.00),
(114,7,1,1450000.00),
(115,3,2,185000.00),(115,37,1,15000.00),
(116,8,1,980000.00),(116,14,1,185000.00),
(117,2,1,820000.00),(117,25,1,88000.00),
(118,1,1,950000.00),(118,39,1,42000.00),
(119,12,1,620000.00),(119,32,1,12000.00),
(120,4,1,145000.00),(120,33,1,12000.00);

-- ============================================================
-- SEED DATA — PAYMENTS
-- ============================================================

INSERT INTO payments (order_id, method, status, amount, paid_at)
SELECT
    o.order_id,
    ELT(1 + (o.order_id % 4), 'card','transfer','cash_on_delivery','wallet'),
    CASE o.status
        WHEN 'delivered' THEN 'successful'
        WHEN 'shipped'   THEN 'successful'
        WHEN 'processing' THEN 'successful'
        WHEN 'pending'   THEN 'pending'
        WHEN 'cancelled' THEN 'refunded'
        WHEN 'returned'  THEN 'refunded'
    END,
    (SELECT SUM(oi.quantity * oi.unit_price) FROM order_items oi WHERE oi.order_id = o.order_id) + o.shipping_fee - o.discount,
    CASE o.status WHEN 'pending' THEN NULL ELSE DATE_ADD(o.order_date, INTERVAL 1 HOUR) END
FROM orders o;

-- ============================================================
-- SEED DATA — REVIEWS
-- ============================================================

INSERT INTO reviews (product_id, customer_id, rating, review_text, review_date) VALUES
(1,1,5,'Absolutely love this phone. The camera is incredible!','2022-02-01 09:00:00'),
(1,5,4,'Great phone but very expensive.','2022-04-10 10:30:00'),
(2,3,5,'Samsung at its finest. Fast, beautiful screen.','2022-03-10 14:00:00'),
(3,4,4,'Good budget phone. Solid performance for the price.','2022-03-20 11:00:00'),
(7,2,5,'The MacBook M3 is a beast! Battery lasts all day.','2022-02-25 09:30:00'),
(7,18,4,'Expensive but worth every kobo.','2022-10-01 14:00:00'),
(8,5,4,'Great laptop for heavy tasks. Runs hot sometimes.','2022-04-05 10:00:00'),
(9,13,3,'Average laptop. Okay for daily tasks.','2022-07-15 11:00:00'),
(12,8,5,'Picture quality is stunning! Best TV I have owned.','2022-06-20 15:30:00'),
(14,10,5,'These headphones block out everything. 10/10.','2022-07-10 09:00:00'),
(15,7,4,'Great sound. Perfect for parties and outdoor use.','2022-05-15 14:00:00'),
(20,6,5,'Beautiful dress. Fits perfectly and fabric is lovely.','2022-05-01 10:30:00'),
(21,11,4,'Nice jumpsuit. The ankara print is gorgeous.','2022-07-20 12:00:00'),
(24,15,5,'Best shoes I have bought. Very comfortable.','2022-09-05 09:30:00'),
(25,22,4,'Quality shoes, runs slightly large.','2022-12-01 14:00:00'),
(26,9,5,'Non-stick works great. Easy to clean.','2022-06-10 11:00:00'),
(29,21,4,'Very comfortable office chair. Back pain gone!','2022-12-20 10:00:00'),
(32,14,5,'Excellent yoga mat. Good grip and cushion.','2022-09-15 13:00:00'),
(37,16,5,'Transformed my skin in 2 weeks. Highly recommend!','2022-10-25 09:00:00'),
(39,24,4,'Good whey protein. Chocolate flavor is great.','2022-11-10 14:30:00'),
(1,31,5,'Amazing phone. Worth the investment.','2023-07-20 10:00:00'),
(2,32,5,'Samsung Galaxy is just perfect. Love it!','2023-09-01 11:30:00'),
(7,35,4,'MacBook is premium. Slightly overpriced in Nigeria.','2023-10-05 09:00:00'),
(3,36,4,'Tecno is underrated. Very reliable phone.','2023-09-15 14:00:00'),
(8,39,5,'Dell XPS is a workhorse. Love it for coding.','2024-01-20 10:30:00'),
(4,40,3,'Decent phone but heats up after long use.','2024-02-10 12:00:00'),
(25,42,5,'Adidas shoes are next level comfort.','2024-03-15 09:30:00'),
(37,45,5,'Vitamin C serum is a game changer for my skin.','2024-04-20 11:00:00'),
(39,46,4,'Protein powder mixes well. Good results.','2024-05-25 14:00:00'),
(14,47,5,'Sony headphones are the best. Crystal clear sound.','2024-06-10 09:00:00');

-- ============================================================
-- USEFUL VIEWS
-- ============================================================

CREATE OR REPLACE VIEW vw_order_summary AS
SELECT
    o.order_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    c.city AS customer_city,
    o.order_date,
    o.status,
    o.shipping_city,
    o.shipping_fee,
    o.discount,
    SUM(oi.quantity * oi.unit_price)                   AS subtotal,
    SUM(oi.quantity * oi.unit_price) + o.shipping_fee - o.discount AS total_amount
FROM orders o
JOIN customers c  ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id  = o.order_id
GROUP BY o.order_id, customer_name, customer_city,
         o.order_date, o.status, o.shipping_city, o.shipping_fee, o.discount;

CREATE OR REPLACE VIEW vw_product_sales AS
SELECT
    p.product_id,
    p.name        AS product_name,
    cat.name      AS category,
    p.brand,
    p.price,
    p.cost,
    SUM(oi.quantity)                          AS total_units_sold,
    SUM(oi.quantity * oi.unit_price)          AS total_revenue,
    SUM(oi.quantity * (oi.unit_price - p.cost)) AS total_profit
FROM products p
JOIN categories cat  ON cat.category_id = p.category_id
JOIN order_items oi  ON oi.product_id   = p.product_id
JOIN orders o        ON o.order_id      = oi.order_id
WHERE o.status NOT IN ('cancelled','returned')
GROUP BY p.product_id, product_name, category, p.brand, p.price, p.cost;

-- ============================================================
-- END OF SCHEMA & DATA
-- ============================================================
