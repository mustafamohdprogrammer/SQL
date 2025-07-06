-- temporary table
-- Temporary tables are special tables that exist temporarily during a session.
-- They are used to store intermediate results and are automatically deleted when the session ends


create temporary table temp_table(
	name varchar(50),
    age int
);

insert into temp_table
values
(
	'mustafa',20
);

select * from temp_table;