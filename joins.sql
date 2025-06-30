select *
from parks_and_recreation.employee_demographics
;

select * 
from parks_and_recreation.employee_salary
;

-- inner join -- 

select *
from parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
;


--  left join -- 
-- LEFT JOIN (LEFT OUTER JOIN):
-- Returns all rows from the left table, and the matching rows from the right table.
-- Rows with no match in the right table will have NULL values for the right table's columns.


select *
from parks_and_recreation.employee_demographics as dem
left join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
;


-- RIGHT JOIN (RIGHT OUTER JOIN): -- 
-- Returns all rows from the right table, and the matching rows from the left table.
-- Rows with no match in the left table will have NULL values for the left table's columns.


select *
from parks_and_recreation.employee_demographics as dem
right join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
;


