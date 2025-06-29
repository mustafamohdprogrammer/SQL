
-- GROUP BY 
-- The GROUP BY clause groups rows with the same values in specified columns.
--  And allows aggregate functions like SUM or COUNT to be applied to each group. 

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age),MIN(age) , MAX(age) , COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY
-- The ORDER BY clause sorts the rows in the result set based on one or more columns in ascending or descending order.

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name ASC
;


SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC  -- this will sort the elements in decending order 
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age
;
