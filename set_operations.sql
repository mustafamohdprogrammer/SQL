select 
	FirstName as Customer_First_Name,
	LastName as Customer_last_Name
from Sales.Customers

intersetion

select 
	FirstName as Employee_First_Name,
	LastName as Employee_last_Name
from Sales.Employees;

select 
	FirstName as Customer_First_Name,
	LastName as Customer_last_Name
from Sales.Customers

except

select 
	FirstName as Employee_First_Name,
	LastName as Employee_last_Name
from Sales.Employees;

select 
	FirstName as Customer_First_Name,
	LastName as Customer_last_Name
from Sales.Customers

union

select 
	FirstName as Employee_First_Name,
	LastName as Employee_last_Name
from Sales.Employees;

select 
	FirstName as Customer_First_Name,
	LastName as Customer_last_Name
from Sales.Customers

union all

select 
	FirstName as Employee_First_Name,
	LastName as Employee_last_Name
from Sales.Employees;