use college;

-- ALTER command
 
alter table student
add column age int not null default 19;

-- MODIFY command

alter table student
modify age varchar(3);

-- change command (rename)

alter table student
change age stu_age int; 

-- Drop command

alter table student
drop city;

-- rename table

alter table student
rename to candidate;

select * from student;