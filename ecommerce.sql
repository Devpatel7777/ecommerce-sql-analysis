CREATE DATABASE ecommerce_management;
USE ecommerce_management;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Home Appliances'),
(4,'Books'),
(5,'Sports');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    added_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Products VALUES
(1,'Laptop',1,60000,30,'2024-01-01'),
(2,'Mobile',1,25000,80,'2024-01-05'),
(3,'Headphones',1,3000,150,'2024-02-01'),
(4,'Smart Watch',1,12000,60,'2024-02-10'),
(5,'TV',3,45000,20,'2024-01-15'),

(6,'T-Shirt',2,800,200,'2024-03-01'),
(7,'Jeans',2,1500,120,'2024-03-02'),
(8,'Jacket',2,3000,40,'2024-03-05'),

(9,'Microwave',3,9000,25,'2024-02-20'),
(10,'Washing Machine',3,28000,15,'2024-02-25'),

(11,'Novel Book',4,500,300,'2024-01-10'),
(12,'Exam Guide',4,700,200,'2024-01-12'),

(13,'Cricket Bat',5,3500,50,'2024-03-10'),
(14,'Football',5,1200,100,'2024-03-12'),
(15,'Gym Gloves',5,900,150,'2024-03-15'),

(16,'Tablet',1,18000,40,'2024-04-01'),
(17,'Bluetooth Speaker',1,4000,90,'2024-04-05'),
(18,'Air Fryer',3,11000,35,'2024-04-07'),
(19,'Shoes',2,2500,70,'2024-04-10'),
(20,'Yoga Mat',5,700,120,'2024-04-12');

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(200),
    registration_date DATE
);

INSERT INTO Customers VALUES
(1,'Amit Patel','amit@gmail.com','9999999999','Ahmedabad','2022-05-10'),
(2,'Riya Shah',NULL,'8888888888','Surat','2023-01-15'),
(3,'Karan Mehta','karan@gmail.com','7777777777','Vadodara','2021-11-20'),
(4,'Neha Joshi','neha@gmail.com','6666666666','Rajkot','2024-02-01'),
(5,'Rahul Verma','rahul@gmail.com','5555555555','Delhi','2022-08-25'),
(6,'Sneha Iyer','sneha@gmail.com','4444444444','Mumbai','2023-03-30'),
(7,'Pooja Desai',NULL,'3333333333','Ahmedabad','2024-01-10'),
(8,'Arjun Singh','arjun@gmail.com','2222222222','Jaipur','2023-06-18'),
(9,'Nikhil Jain','nikhil@gmail.com','1111111111','Indore','2022-09-05'),
(10,'Manish Kumar','manish@gmail.com','1010101010','Patna','2021-12-12'),
(11,'Priya Malhotra','priya@gmail.com','2020202020','Chandigarh','2024-03-03'),
(12,'Vivek Pandey',NULL,'3030303030','Bhopal','2023-10-10');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1,1,'2024-01-10',60000,'Delivered'),
(2,2,'2024-01-15',25000,'Delivered'),
(3,3,'2024-01-20',12000,'Delivered'),
(4,4,'2024-02-05',800,'Pending'),
(5,5,'2024-02-10',45000,'Shipped'),
(6,6,'2024-02-15',9000,'Delivered'),
(7,1,'2024-03-01',18000,'Delivered'),
(8,2,'2024-03-05',3500,'Delivered'),
(9,3,'2024-03-10',700,'Delivered'),
(10,4,'2024-03-12',28000,'Cancelled'),

(11,5,'2024-03-15',3000,'Delivered'),
(12,6,'2024-03-18',1200,'Delivered'),
(13,7,'2024-03-20',11000,'Shipped'),
(14,8,'2024-03-22',2500,'Pending'),
(15,9,'2024-03-25',4000,'Delivered'),

(16,10,'2024-04-01',60000,'Delivered'),
(17,11,'2024-04-05',18000,'Delivered'),
(18,12,'2024-04-08',700,'Delivered'),
(19,1,'2024-04-10',12000,'Delivered'),
(20,2,'2024-04-12',900,'Delivered'),

(21,3,'2024-04-15',3500,'Delivered'),
(22,4,'2024-04-18',25000,'Shipped'),
(23,5,'2024-04-20',800,'Pending'),
(24,6,'2024-04-22',45000,'Delivered'),
(25,7,'2024-04-25',11000,'Delivered');

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1,1,1,1,60000),
(2,2,2,1,25000),
(3,3,4,1,12000),
(4,4,6,1,800),
(5,5,5,1,45000),
(6,6,9,1,9000),
(7,7,16,1,18000),
(8,8,13,1,3500),
(9,9,12,1,700),
(10,10,10,1,28000),

(11,11,8,1,3000),
(12,12,14,1,1200),
(13,13,18,1,11000),
(14,14,19,1,2500),
(15,15,17,1,4000),

(16,16,1,1,60000),
(17,17,16,1,18000),
(18,18,11,1,700),
(19,19,4,1,12000),
(20,20,15,1,900),

(21,21,13,1,3500),
(22,22,2,1,25000),
(23,23,6,1,800),
(24,24,5,1,45000),
(25,25,18,1,11000);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payments VALUES
(1,1,'2024-01-10','Credit Card','Paid'),
(2,2,'2024-01-15','UPI','Paid'),
(3,3,'2024-01-20','PayPal','Paid'),
(4,4,'2024-02-05','UPI','Pending'),
(5,5,'2024-02-10','Credit Card','Paid'),
(6,6,'2024-02-15','UPI','Paid'),
(7,7,'2024-03-01','PayPal','Paid'),
(8,8,'2024-03-05','Credit Card','Paid'),
(9,9,'2024-03-10','UPI','Paid'),
(10,10,'2024-03-12','Credit Card','Failed');

CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Shipping VALUES
(1,1,'2024-01-11','2024-01-15','Delivered'),
(2,2,'2024-01-16','2024-01-20','Delivered'),
(3,3,'2024-01-21','2024-01-25','Delivered'),
(4,5,'2024-02-11',NULL,'In Transit'),
(5,6,'2024-02-16','2024-02-20','Delivered'),
(6,7,'2024-03-02','2024-03-06','Delivered'),
(7,8,'2024-03-06','2024-03-10','Delivered'),
(8,13,'2024-03-21',NULL,'Dispatched'),
(9,16,'2024-04-02','2024-04-06','Delivered'),
(10,24,'2024-04-23','2024-04-28','Delivered');


-- 1. CRUD Operations

-- Insert

INSERT INTO Products VALUES (21,'Headphones',1,2000,80,CURDATE());

-- Update Stock

UPDATE Products SET stock_quantity = stock_quantity - 1 WHERE product_id = 1;

-- Delete cancelled orders older than 30 days

DELETE FROM Orders WHERE status='Cancelled' AND order_date < CURDATE() - INTERVAL 30 DAY;

-- 2. WHERE / HAVING / LIMIT
SELECT * FROM Orders WHERE order_date >= CURDATE() - INTERVAL 6 MONTH;

SELECT * FROM Products ORDER BY price DESC LIMIT 5;

SELECT customer_id, COUNT(*) AS total_orders FROM Orders GROUP BY customer_id HAVING COUNT(*) > 3;

-- 3. AND / OR / NOT

SELECT * FROM Orders o JOIN Payments p ON o.order_id = p.order_id WHERE p.payment_status = 'Paid' AND o.status != 'Delivered';

SELECT * FROM Products WHERE NOT stock_quantity=0;

SELECT * FROM Customers WHERE registration_date > '2022-01-01' OR customer_id IN (SELECT customer_id FROM Orders GROUP BY customer_id HAVING SUM(total_amount)>100000);

-- 4. ORDER BY / GROUP BY

SELECT * FROM Products ORDER BY price DESC;

SELECT customer_id, COUNT(*) FROM Orders GROUP BY customer_id;

SELECT c.category_name, SUM(oi.subtotal) AS revenue FROM Order_Items oi JOIN Products p ON oi.product_id=p.product_id JOIN Categories c ON p.category_id=c.category_id GROUP BY c.category_name;

-- 5. Aggregate Functions
SELECT SUM(total_amount) FROM Orders;

SELECT product_id, SUM(quantity) AS qty FROM Order_Items GROUP BY product_id ORDER BY qty DESC LIMIT 1;

SELECT AVG(total_amount) FROM Orders; 

-- 6. joins

SELECT p.name, c.category_name FROM Products p INNER JOIN Categories c ON p.category_id=c.category_id;

-- 7. Joins

SELECT Orders.*, Customers.name FROM Orders LEFT JOIN Customers ON Orders.customer_id = Customers.customer_id;

SELECT Orders.* FROM Orders LEFT JOIN Shipping ON Orders.order_id = Shipping.order_id WHERE Shipping.shipping_id IS NULL;


-- 8. Subqueries
SELECT * FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customers WHERE registration_date>'2022-01-01');

SELECT customer_id FROM Orders GROUP BY customer_id ORDER BY SUM(total_amount) DESC LIMIT 1;

SELECT * FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items); 

-- 9. Date & Time Functions
SELECT MONTH(order_date), COUNT(*) FROM Orders GROUP BY MONTH(order_date);

SELECT DATEDIFF(delivery_date, shipping_date) FROM Shipping;

SELECT DATE_FORMAT(order_date,'%d-%m-%Y') FROM Orders; 

-- 10. String Functions
SELECT UPPER(name) FROM Products;

SELECT TRIM(name) FROM Customers;

SELECT IFNULL(email,'Not Provided') FROM Customers; 

-- 11. Window Functions
SELECT customer_id, SUM(total_amount), RANK() OVER(ORDER BY SUM(total_amount) DESC) FROM Orders GROUP BY customer_id;

SELECT MONTH(order_date), SUM(total_amount), SUM(SUM(total_amount)) OVER(ORDER BY MONTH(order_date)) FROM Orders GROUP BY MONTH(order_date);

SELECT order_id, SUM(total_amount) OVER(ORDER BY order_date) FROM Orders; 

-- 12. CASE Expressions
-- Loyalty Status

SELECT customer_id,
CASE
WHEN SUM(total_amount)>250000 THEN 'Gold'
WHEN SUM(total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
ELSE 'Bronze'
END AS Loyalty_Status
FROM Orders
GROUP BY customer_id;

-- Product Category

SELECT product_id,
CASE
WHEN SUM(quantity)>500 THEN 'Best Seller'
WHEN SUM(quantity) BETWEEN 200 AND 500 THEN 'Popular'
ELSE 'Regular'
END AS Product_Status
FROM Order_Items
GROUP BY product_id;


