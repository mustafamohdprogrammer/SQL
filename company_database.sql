CREATE DATABASE company;
USE company;

CREATE TABLE employees(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

SELECT *
FROM employees;

INSERT INTO employees
(id,name,salary)
VALUES
(101,'karan',25000),
(102,'arjun',50000);