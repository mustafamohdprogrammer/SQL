-- CASE Statement in SQL:
-- The CASE statement allows conditional logic within SQL queries by evaluating conditions and returning specific values when the conditions are met.
-- It works like an if-else construct and can be used in SELECT, WHERE, ORDER BY, and other clauses. 

select first_name,
last_name,
age,
case
	when age <=30 then 'young'
    when age between 31 and 50 then 'old'
    when age >=50 then 'grandpa'
end as age_catagory
from parks_and_recreation.employee_demographics
;

-- another example

select * 
from parks_and_recreation.employee_salary
;

select first_name,
last_name,
salary,
-- occupation, 
case
	when salary < 50000 then salary + (salary * 0.05)
    when salary >= 50000 then salary * 1.07
    when salary > 50000 then salary + (salary * 0.07)
end as bonus_salaries,
occupation
from parks_and_recreation.employee_salary
; 