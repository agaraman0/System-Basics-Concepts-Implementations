-- Create the initial database schema (in 1NF)
CREATE DATABASE NormalizationExercise;

USE NormalizationExercise;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(255),
    product_id INT,
    product_name VARCHAR(255),
    category_name VARCHAR(255),
    quantity INT,
    order_date DATE
);

-- Insert sample data
INSERT INTO Orders VALUES
(1, 1, 'John Doe', 101, 'Laptop', 'Electronics', 1, 
'2023-04-01'),
(2, 1, 'John Doe', 102, 'Smartphone', 'Electronics', 1, 
'2023-04-01'),
(3, 2, 'Jane Smith', 103, 'Tablet', 'Electronics', 2, 
'2023-04-02'),
(4, 3, 'Mary Johnson', 201, 'T-Shirt', 'Clothing', 3, 
'2023-04-03'),
(5, 3, 'Mary Johnson', 202, 'Jeans', 'Clothing', 1, 
'2023-04-03');

-- Normalize to 2NF
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category_name VARCHAR(255)
);

INSERT INTO Customers (customer_id, customer_name)
SELECT DISTINCT customer_id, customer_name FROM Orders;

INSERT INTO Products (product_id, product_name, 
category_name)
SELECT DISTINCT product_id, product_name, category_name FROM 
Orders;

ALTER TABLE Orders
DROP COLUMN customer_name,
DROP COLUMN product_name,
DROP COLUMN category_name;

-- Normalize to 3NF
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255)
);

INSERT INTO Categories (category_name)
SELECT DISTINCT category_name FROM Products;

ALTER TABLE Products
ADD COLUMN category_id INT;

UPDATE Products p
JOIN Categories c ON p.category_name = c.category_name
SET p.category_id = c.category_id;

ALTER TABLE Products
DROP COLUMN category_name;

-- Normalize to 4NF
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO OrderItems (order_id, product_id, quantity)
SELECT order_id, product_id, quantity FROM Orders;

ALTER TABLE Orders
DROP COLUMN product_id,
DROP COLUMN quantity;

