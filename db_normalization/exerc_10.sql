CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20)
);

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  ShipAddress VARCHAR(255),
  ShipCity VARCHAR(255),
  ShipRegion VARCHAR(255),
  ShipPostalCode VARCHAR(10),
  ShipCountry VARCHAR(255)
);

CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  UnitPrice DECIMAL(10,2),
  Quantity INT
);

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(255),
  SupplierID INT,
  CategoryID INT,
  QuantityPerUnit VARCHAR(255),
  UnitPrice DECIMAL(10,2),
  UnitsInStock INT,
  UnitsOnOrder INT,
  ReorderLevel INT
);


INSERT INTO Customers (CustomerID, CustomerName, Address, 
Phone)
VALUES (1, 'John Smith', '123 Main St', '555-1234'),
       (2, 'Jane Doe', '456 Elm St', '555-5678'),
       (3, 'Bob Johnson', '789 Oak St', '555-9012');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, 
ShipAddress, ShipCity, ShipRegion, ShipPostalCode, 
ShipCountry)
VALUES (1, 1, '2022-01-01', '123 Main St', 'Anytown', 'TX', 
'12345', 'USA'),
       (2, 1, '2022-02-01', '123 Main St', 'Anytown', 'TX', 
'12345', 'USA'),
       (3, 2, '2022-03-01', '456 Elm St', 'Othertown', 'TX', 
'67890', 'USA');

INSERT INTO Products (ProductID, ProductName, SupplierID, 
CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, 
UnitsOnOrder, ReorderLevel)
VALUES (1, 'Product A', 1, 1, '10 boxes', 20.00, 50, 0, 10),
       (2, 'Product B', 1, 1, '5 boxes', 10.00, 20, 0, 5),
       (3, 'Product C', 2, 2, '1 case', 30.00, 10, 5, 2);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, 
UnitPrice, Quantity)
VALUES (1, 1, 1, 20.00, 2),
       (2, 1, 2, 10.00, 1),
       (3, 2, 1, 20.00, 3),
       (4, 2, 3, 30.00, 1),
       (5, 3, 2, 10.00, 2);

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  AddressLine1 VARCHAR(255),
  AddressLine2 VARCHAR(255),
  City VARCHAR(255),
  State VARCHAR(255),
  ZipCode VARCHAR(10),
  Country VARCHAR(255),
  Phone VARCHAR(20)
);

