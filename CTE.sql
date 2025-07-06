-- CTE

with cte_example as
(
select gender,
avg(salary) as avg_sal,
min(salary) as min_sal,
max(salary) as max_Sal,
count(salary) as count_sal
from employee_demographics dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select min(min_sal)
from cte_example
;
