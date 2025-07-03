use college;

-- we need to right sql_safe_updates line to update in the data base

set sql_safe_updates = 0;

update student
set grade = "O"
where grade = "A";

update student
set marks = 85
where rollno = 105;

update student
set marks = 12
where rollno = 105;

-- delete command 

delete from student
where marks<33;

select *
from student;