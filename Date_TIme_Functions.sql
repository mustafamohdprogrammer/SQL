-- Date and Time Functions

-- Part extraction		-- Format and Casting		-- Validation		-- Calculations
	-- Day				 -- Format						--Isdate	    	--Dateadd
	-- Month			 -- Convert											-- Datediff
	-- Year
	-- Datepart
	-- Datename
	-- datetrunc
	-- Eomonth


select
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime
from Sales.Orders;

select
	OrderID,
	CreationTime,
	year(CreationTime) as Year,
	month(CreationTime) as Month,
	day(CreationTime) as Day
from Sales.Orders;

select
	OrderID,
	CreationTime,
	datepart(year,CreationTime) as Year_dp,
	datepart(month,CreationTime) as Month_dp,
	datepart(day,CreationTime) as Day_dp
from Sales.Orders;

select
	OrderID,
	CreationTime,
	datepart(hour,CreationTime) as Hour_dp,
	datepart(quarter,CreationTime) as Quarter_dp,
	datepart(week,CreationTime) as Week_dp
from Sales.Orders


select
	OrderID,
	CreationTime,
	datename(month,CreationTime) as Month_dn,
	datename(day,CreationTime) as Day_dn,
	datename(weekday,CreationTime) as Weekday_dn
from Sales.Orders;



select
	OrderID,
	CreationTime,
	datetrunc(minute,CreationTime) as Minut_dt,
	datetrunc(day,CreationTime) as Day_dn,
	datetrunc(year,CreationTime) as Year_dt
from Sales.Orders;



select
	OrderID,
	CreationTime,
	eomonth(CreationTime) as End_oF_The_Month
from Sales.Orders;




select
	OrderID,
	CreationTime,
	format(CreationTime,'dd') as dd,
	format(CreationTime,'ddd') as ddd,
	format(CreationTime,'dddd') as dddd,
	format(CreationTime,'MM') as mm,
	format(CreationTime,'MMM') as mmm,
	format(CreationTime,'MMMM') as mmmm
from Sales.Orders;

select
	OrderID,
	CreationTime,
	format(CreationTime,'MM-dd-yyyy') as american_date_format,
	format(CreationTime,'dd-MM-yyyy') as euro_date_format
from Sales.Orders;


select
	OrderID,
	CreationTime,
	'Day ' + format(CreationTime,'ddd MM') + ' Q' + datename(quarter,CreationTime) + ' '+ format(CreationTime,'yyyy hh:mm:ss tt') as CustomFormat
from Sales.Orders;


select 
	OrderID,
	CreationTime,
	convert(date,CreationTime) as [Datetime to Date convert]
from Sales.Orders;

select 
	OrderID,
	OrderDate,
	dateadd(year,2,Orderdate) as [Two Years Later]
from Sales.Orders;

select 
	OrderID,
	OrderDate,
	dateadd(month,2,Orderdate) as [Two month Later]
from Sales.Orders;


select
	EmployeeID,
	BirthDate,
	datediff(year,BirthDate,getdate())
from Sales.Employees;


select
	OrderID,
	OrderDate,
	ShipDate,
	datediff(day,OrderDate,ShipDate) day2ship
from Sales.Orders;

select
	month(OrderDate) as OrderDate,
	avg(datediff(day,OrderDate,ShipDate)) day2ship
from Sales.Orders
Group by month(OrderDate);