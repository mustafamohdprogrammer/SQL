CREATE DATABASE college;
USE college;

CREATE TABLE students(
	rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT *
FROM students;

INSERT INTO students
(rollno,name)
VALUES
(101,'karan'),
(102,'arjun');