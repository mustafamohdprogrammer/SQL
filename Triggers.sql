create table Sales.EmployeeLogs(
	LogIn int identity(1,1) primary key,
	EmployeeId int,
	LogMessage varchar(255),
	LogDate date
)




CREATE TRIGGER trg_AfterInsertEmployee on Sales.Employees
after insert
as
begin
	insert into Sales.EmployeeLogs (EmployeeId,LogMessage,LogDate)
	select
		EmployeeID,
		'New Employee Added =' + cast(EmployeeID as varchar),
		getdate()
	from inserted
end





INSERT INTO Sales.Employees
Values
(6 , 'Maria','Doe','HR','1988-01-12','F',80000,3)



select * from Sales.EmployeeLogs

