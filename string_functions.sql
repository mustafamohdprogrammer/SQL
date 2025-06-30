--  string functions


-- length() function
 
select first_name, length(first_name)
from parks_and_recreation.employee_demographics
order by 2
; 

-- upper()

select first_name, upper(first_name)
from parks_and_recreation.employee_demographics
order by 2
; 

-- substring()  function

select birth_date, substring(birth_date,6,2) as birth_month
from parks_and_recreation.employee_demographics
order by 2
; 

-- replace()

select first_name, replace(first_name, 'a','b'),
first_name, replace(first_name, 'A','B')
from parks_and_recreation.employee_demographics
; 
 
 
 -- locate() 
 
select first_name, locate('e',first_name)
from parks_and_recreation.employee_demographics
; 

-- concatinate()

select first_name, last_name,
concat(first_name," ",last_name) as full_name
from parks_and_recreation.employee_demographics
;  