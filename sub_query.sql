select * 
from employee_demographics;

select *
from parks_departments;

select * 
from employee_salary;


-- sub query using where clause

select *
from employee_demographics
where employee_id in(
					select employee_id
						from employee_salary
                        where dept_id = 1
);

-- sub query using select 

select first_name , salary,
(select avg(salary)
from employee_salary)
from employee_salary;

-- sub query using from 

select avg(avg_age)
from
(select gender,
avg(age) as avg_age,
max(age) as max_age,
min(age) as min_age,
count(age)
from employee_demographics
group by gender)as agg_table
;