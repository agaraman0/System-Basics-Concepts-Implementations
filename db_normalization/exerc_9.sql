-- Create tables
CREATE TABLE Employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(50),
  salary INT,
  projects VARCHAR(255)
);

-- Insert data
INSERT INTO Employees (emp_id, name, address, salary, 
projects)
VALUES (1, 'John Smith', '123 Main St', 50000, 'Project A, 
Project B'),
       (2, 'Jane Doe', '456 Second St', 60000, 'Project A, 
Project C'),
       (3, 'Bob Johnson', '789 Third St', 75000, 'Project B, 
Project C');

-- First normal form (1NF)
CREATE TABLE Employees_1NF (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(50),
  salary INT
);

CREATE TABLE Employee_Projects (
  emp_id INT,
  project VARCHAR(50),
  PRIMARY KEY (emp_id, project),
  FOREIGN KEY (emp_id) REFERENCES Employees_1NF(emp_id)
);

INSERT INTO Employees_1NF (emp_id, name, address, salary)
VALUES (1, 'John Smith', '123 Main St', 50000),
       (2, 'Jane Doe', '456 Second St', 60000),
       (3, 'Bob Johnson', '789 Third St', 75000);

INSERT INTO Employee_Projects (emp_id, project)
VALUES (1, 'Project A'),
       (1, 'Project B'),
       (2, 'Project A'),
       (2, 'Project C'),
       (3, 'Project B'),
       (3, 'Project C');

-- Second normal form (2NF)
CREATE TABLE Departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50),
  dept_head INT
);

CREATE TABLE Employees_2NF (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(50),
  salary INT,
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name, dept_head)
VALUES (1, 'Engineering', 1),
       (2, 'Sales', 2),
       (3, 'Marketing', 3);

UPDATE Employees_2NF SET dept_id = 1 WHERE emp_id = 1;
UPDATE Employees_2NF SET dept_id = 1 WHERE emp_id = 2;
UPDATE Employees_2NF SET dept_id = 3 WHERE emp_id = 3;

-- Third normal form (3NF)
CREATE TABLE Positions (
  position_id INT PRIMARY KEY,
  position_name VARCHAR(50),
  position_salary INT
);

CREATE TABLE Employees_3NF (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(50),
  position_id INT,
  FOREIGN KEY (position_id) REFERENCES Positions(position_id)
);

INSERT INTO Positions (position_id, position_name, 
position_salary)
VALUES (1, 'Engineer', 60000),
       (2, 'Salesperson', 50000),
       (3, 'Marketing Manager', 80000);

UPDATE Employees_3NF SET position_id = 1 WHERE emp_id = 1;
UPDATE Employees_3NF SET position_id = 2 WHERE emp_id = 2;
UPDATE Employees_3NF SET position_id = 3 WHERE emp_id = 3;

-- Fourth normal form (4NF)
CREATE TABLE Employee_Projects_4NF (
  emp_id INT,
  project_id INT,
  PRIMARY KEY (emp_id, project_id)
);

