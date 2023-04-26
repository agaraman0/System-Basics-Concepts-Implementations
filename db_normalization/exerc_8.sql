-- Create tables
CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  product_name VARCHAR(50),
  product_category VARCHAR(50),
  sale_date DATE,
  sale_amount DECIMAL(10, 2)
);

-- Insert data
INSERT INTO Sales (sale_id, customer_name, product_name, 
product_category, sale_date, sale_amount)
VALUES (1, 'John', 'Product A', 'Category 1', '2022-01-01', 
100.00),
       (2, 'John', 'Product B', 'Category 1', '2022-01-02', 
200.00),
       (3, 'Sara', 'Product A', 'Category 1', '2022-01-03', 
150.00),
       (4, 'Sara', 'Product B', 'Category 1', '2022-01-04', 
250.00),
       (5, 'Mike', 'Product C', 'Category 2', '2022-01-05', 
300.00),
       (6, 'Mike', 'Product D', 'Category 2', '2022-01-06', 
400.00),
       (7, 'Mike', 'Product E', 'Category 2', '2022-01-07', 
500.00),
       (8, 'Mike', 'Product F', 'Category 2', '2022-01-08', 
600.00);

-- First normal form (1NF)
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50)
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  product_category VARCHAR(50)
);

CREATE TABLE Sales_1NF (
  sale_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  sale_date DATE,
  sale_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES 
Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, customer_name)
SELECT DISTINCT NULL, customer_name
FROM Sales;

INSERT INTO Products (product_id, product_name, 
product_category)
SELECT DISTINCT NULL, product_name, product_category
FROM Sales;

INSERT INTO Sales_1NF (sale_id, customer_id, product_id, 
sale_date, sale_amount)
SELECT sale_id, c.customer_id, p.product_id, sale_date, 
sale_amount
FROM Sales s
JOIN Customers c ON s.customer_name = c.customer

