create database college;
use college;

create table student(
	rollno int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(50),
    city varchar(50)
);

insert into student
(rollno,name,marks,grade,city)
values
(101,'anil',78,'C','pune'),
(102,'bhumika',93,'A','mumbai'),
(103,'dhruv',85,'B','mumbai'),
(104,'farah',96,'A','delhi'),
(105,'emanuel',82,'B','delhi');

select name,marks from student;

select *
from student
where marks > 80;

select *
from student
where marks > 80 and city = 'mumbai';

select *
from student
order by city;

select *
from student
order by marks asc;

select *
from student
order by marks desc
limit 3;