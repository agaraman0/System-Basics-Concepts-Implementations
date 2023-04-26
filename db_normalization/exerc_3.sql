-- Create the schema
CREATE DATABASE NormalizationExercise;
USE NormalizationExercise;

-- Create table
CREATE TABLE StudentsCourses (
    StudentID INT,
    StudentName VARCHAR(255),
    CourseID INT,
    CourseName VARCHAR(255),
    InstructorID INT,
    InstructorName VARCHAR(255),
    Grade CHAR(2)
);

-- Insert data
INSERT INTO StudentsCourses (StudentID, StudentName, 
CourseID, CourseName, InstructorID, InstructorName, Grade)
VALUES (1, 'Alice', 101, 'Math', 1001, 'John', 'A'),
       (1, 'Alice', 102, 'Physics', 1002, 'Jane', 'B'),
       (2, 'Bob', 101, 'Math', 1001, 'John', 'B'),
       (2, 'Bob', 103, 'Chemistry', 1003, 'Jack', 'A'),
       (3, 'Charlie', 102, 'Physics', 1002, 'Jane', 'C'),
       (3, 'Charlie', 103, 'Chemistry', 1003, 'Jack', 'B');


-- Create tables
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(255)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(255)
);

CREATE TABLE StudentCourseGrades (
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    Grade CHAR(2),
    PRIMARY KEY (StudentID, CourseID, InstructorID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES 
Instructors(InstructorID)
);


-- No changes needed, as our tables from 1NF are already in 
2NF.

-- Create table
CREATE TABLE CourseInstructors (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES 
Instructors(InstructorID)
);

-- Update StudentCourseGrades table
ALTER TABLE StudentCourseGrades
DROP FOREIGN KEY FK_StudentCourseGrades_Instructors;  -- 
Replace FK_StudentCourseGrades_Instructors with actual 
constraint name
ALTER TABLE StudentCourseGrades
DROP COLUMN InstructorID;


-- Our tables are already in 4NF, as there are no 
multi-valued dependencies present.

