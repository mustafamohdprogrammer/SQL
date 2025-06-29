SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name,
last_name,
birth_date,
age,
age + 10,
(age + 10) * 10
FROM parks_and_recreation.employee_demographics;

# DISTINCT
# The SQL DISTINCT function is used to return unique (distinct) values from a specified column in a table.
# It eliminates duplicate rows in the result set.

SELECT  DISTINCT gender
FROM parks_and_recreation.employee_demographics;