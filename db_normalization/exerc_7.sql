-- Create database
CREATE DATABASE OnlineStore;
USE OnlineStore;

-- Create OrderDetails table (initial unnormalized form)
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerID INT,
    CustomerName VARCHAR(50),
    ProductID INT,
    ProductName VARCHAR(50),
    CategoryID INT,
    CategoryName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails VALUES
(1, 101, 'John Doe', 201, 'Laptop', 1, 'Electronics', 1, 
1000),
(2, 102, 'Jane Smith', 202, 'Headphones', 1, 'Electronics', 
2, 50),
(3, 103, 'Sara Brown', 203, 'Smartphone', 1, 'Electronics', 
1, 800),
(4, 101, 'John Doe', 204, 'Tablet', 1, 'Electronics', 1, 
300),
(5, 104, 'Mark Davis', 301, 'T-Shirt', 2, 'Clothing', 3, 20),
(6, 105, 'Tom Johnson', 302, 'Jeans', 2, 'Clothing', 2, 50);


-- Create Orders, Customers, and Products tables
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    CategoryName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert data into Orders, Customers, and Products tables
INSERT INTO Orders VALUES
(1, 101, 201, 1),
(2, 102, 202, 2),
(3, 103, 203, 1),
(4, 101, 204, 1),
(5, 104, 301, 3),
(6, 105, 302, 2);

INSERT INTO Customers VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Sara Brown'),
(104, 'Mark Davis'),
(105, 'Tom Johnson');

INSERT INTO Products VALUES
(201, 'Laptop', 1, 'Electronics', 1000),
(202, 'Headphones', 1, 'Electronics', 50),
(203, 'Smartphone', 1,)

