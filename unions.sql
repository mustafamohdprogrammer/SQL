-- union --
-- the union operator combines the result sets of two or more select queries, removig the duplicate rows.
-- each select query must have the same number of columns with matching data types and order 

select first_name,last_name
from parks_and_recreation.employee_demographics
union
select first_name,last_name
from parks_and_recreation.employee_salary
;

-- union all
-- this will print all the values including the duplicates  

select first_name,last_name
from parks_and_recreation.employee_demographics
union all
select first_name,last_name
from parks_and_recreation.employee_salary
;


select first_name,last_name, 'old man' as label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'male'
union
select first_name,last_name, 'old lady' as label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'female'
union
select first_name,last_name, 'highest paid employee' as label
from parks_and_recreation.employee_salary
where salary > 70000
order by first_name,last_name
;