-- aggregate functions --
-- count()
-- max()
-- min()
-- avg()
-- sum()

use college;

-- count()

select count(rollno)
from student; 

-- max()

select max(marks)
from student; 

-- min()

select min(marks)
from student;

-- avg()

select avg(marks)
from student;

-- sum()

select sum(marks)
from student;

select city, count(name)
from student
group by city;

select city,avg(marks)
from student
group by city
order by avg(marks) asc;
