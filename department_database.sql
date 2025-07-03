use college;

create table department(
	id int primary key,
    name varchar(50)
);


insert into department
(id,name)
values
(101,'science'),
(102,'math'),
(103,'bio');

set sql_safe_updates = 0;

update department
set id = 104
where id = 103;

create table teacher(
	id int primary key,
    name varchar(50),
    dept_id int,
    foreign key (dept_id) references department(id)
    on update cascade
    on delete cascade
);

insert into teacher
(id,name,dept_id)
values
(110,'adam',101),
(111,'eve',102),
(112,'joseph',103);

select *
from teacher

