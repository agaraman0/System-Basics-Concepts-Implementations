-- Create an unnormalized table
CREATE TABLE CourseRegistration (
RegistrationID INT PRIMARY KEY,
StudentID INT,
StudentName VARCHAR(50),
CourseID INT,
CourseName VARCHAR(50),
InstructorID INT,
InstructorName VARCHAR(50),
Grade CHAR(2)
);

-- Insert some sample data
INSERT INTO CourseRegistration VALUES
(1, 101, 'Alice', 1, 'Math 101', 1001, 'Prof. Smith', 'A'),
(2, 101, 'Alice', 2, 'English 101', 1002, 'Prof. Johnson', 
'B'),
(3, 102, 'Bob', 1, 'Math 101', 1001, 'Prof. Smith', 'B'),
(4, 102, 'Bob', 3, 'History 101', 1003, 'Prof. Brown', 'A'),
(5, 103, 'Charlie', 2, 'English 101', 1002, 'Prof. Johnson', 
'C');

-- 1NF: Eliminate repeating groups (put data in separate 
tables)
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50)
);

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50)
);

CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
InstructorName VARCHAR(50)
);

-- Insert data into the new tables
INSERT INTO Students VALUES (101, 'Alice'), (102, 'Bob'), 
(103, 'Charlie');
INSERT INTO Courses VALUES (1, 'Math 101'), (2, 'English 
101'), (3, 'History 101');
INSERT INTO Instructors VALUES (1001, 'Prof. Smith'), (1002, 
'Prof. Johnson'), (1003, 'Prof. Brown');

-- 2NF: Eliminate partial dependencies (make sure all 
non-primary key attributes are fully dependent on the primary 
key)
CREATE TABLE CourseInstructors (
CourseID INT,
InstructorID INT,
PRIMARY KEY (CourseID, InstructorID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
FOREIGN KEY (InstructorID) REFERENCES 
Instructors(InstructorID)
);

-- Insert data into the new table
INSERT INTO CourseInstructors VALUES (1, 1001), (2, 1002), 
(3, 1003);

-- Update the CourseRegistration table to remove redundant 
columns
ALTER TABLE CourseRegistration
DROP COLUMN StudentName, DROP COLUMN CourseName, DROP COLUMN 
InstructorName;

-- 3NF: Eliminate transitive dependencies (attributes 
dependent on other non-primary key attributes)
-- Our schema is already in 3NF, as there are no transitive 
dependencies.

-- 4NF: Eliminate multi-valued dependencies (no table should 
contain two or more independent multi-valued facts)
-- Our schema is already in 4NF, as there are no multi-valued 
dependencies.


