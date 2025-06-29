-- HAVING clause-- 

select gender,avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40
;

select occupation,avg(salary)
from parks_and_recreation.employee_salary
group by occupation
having avg(salary) > 25000
;