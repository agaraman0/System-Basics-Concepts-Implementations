In this exercise, we will work with a fictional school 
database, which consists of information about students, 
courses, and the grades they received in different courses. 
We'll start with a simple, unnormalized table and normalize 
it step by step up to the 4th Normal Form (4NF).

Unnormalized table: StudentCourseGrade
ID	StudentName	CourseCode	CourseName	
Teacher	Grade
1	Alice	CS101	Programming	John Smith	A
2	Alice	CS102	Data Science	Jane Brown	B
3	Bob	CS101	Programming	John Smith	C
4	Bob	CS102	Data Science	Jane Brown	A
Now let's normalize this table.

First Normal Form (1NF):
Remove duplicate columns and ensure that each column has 
atomic values.
Table: Student

StudentID	StudentName
1	Alice
2	Bob
Table: Course

CourseCode	CourseName	Teacher
CS101	Programming	John Smith
CS102	Data Science	Jane Brown
Table: StudentCourseGrade

ID	StudentID	CourseCode	Grade
1	1	CS101	A
2	1	CS102	B
3	2	CS101	C
4	2	CS102	A
Second Normal Form (2NF):
Ensure that all non-key attributes are fully dependent on the 
primary key.
Table: Teacher

TeacherID	TeacherName
1	John Smith
2	Jane Brown
Table: Course

CourseCode	CourseName	TeacherID
CS101	Programming	1
CS102	Data Science	2
Third Normal Form (3NF):
Remove transitive dependencies.
The schema is already in 3NF because there are no transitive 
dependencies.

Fourth Normal Form (4NF):
Remove multi-valued dependencies.
The schema is already in 4NF because there are no 
multi-valued dependencies.

Now we have a normalized schema for our fictional school 
database:

Student (StudentID, StudentName)
Course (CourseCode, CourseName, TeacherID)
Teacher (TeacherID, TeacherName)
StudentCourseGrade (ID, StudentID, CourseCode, Grade)




