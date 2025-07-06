-- Window Functions

-- first a example without using window functions

select gender, avg(salary)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
;

-- first window function

select dem.age,dem.first_name,dem.last_name,gender,avg(salary) 
over(partition by gender) as avg_salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;


-- row_number()
-- rank()
-- dense_rank()


SELECT 
    dem.age,
    dem.first_name,
    dem.last_name,
    gender,
    salary, 
    ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS row_num,
    RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS rank_num,
    dense_rank() OVER (PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;





