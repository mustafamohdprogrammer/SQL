# In this file i am going to try and execute logical operators

-- NOT -- 

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male' 
;

-- or --
  
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male' 
;

-- LIKE statement
-- % --  

 -- If we use % at the last after our needed condition that means we will get the output where the 
 -- defined word or statement will start at the beginning
 
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%'
; 


 -- If we use % at the last after our needed condition that means we will get the output where the 
 -- defined word or statement will have that word somewhere in the statment it is not mandatory to start will

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE last_name LIKE '%a%'
; 

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%'
; 