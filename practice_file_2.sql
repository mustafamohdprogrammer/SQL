use college;

alter table candidate
change name full_name varchar(50);

delete from candidate
where marks < 80;

alter table candidate
drop grade;

select * 
from candidate;