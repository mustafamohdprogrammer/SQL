# executing Some Statements using WHERE clause


# greater than euqal to operator

SELECT *
FROM parks_and_recreation.employee_salary
WHERE Salary >= 50000 
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Ron'
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE Salary <= 50000 
;

# Equal to operator

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = "Female"
;

# != not equal to operator

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != "Female"
;