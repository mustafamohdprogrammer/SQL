select
OrderID,
Sales,
case
	when Sales > 50 then 'High'
	when Sales > 20 then 'Medium'
	else 'Low'
end Category
from Sales.Orders;



select
Category,
sum(Sales) as Total_sales
From(
	select
	OrderID,
	Sales,
	case
		when Sales > 50 then 'High'
		when Sales > 20 then 'Medium'
		else 'Low'
	end Category
	from Sales.Orders
)t
group by Category
order by Total_sales desc;


select
EmployeeID,
FirstName,
LastName,
Gender,
case
	when Gender = 'F' then 'Female'
	when Gender = 'M' then 'male'
end GenderFullText
from Sales.Employees;


select
CustomerID,
FirstName,
LastName,
Country,
case
	when Country = 'Germany' then 'GE'
	when Country = 'USA' then 'US'
	else 'n/a'
end ['countr abbr']
from Sales.Customers;

select
	CustomerID,
	FirstName,
	LastName,
	Country,
	case Country
		when 'Germany' then 'GE'
		when 'USA' then 'US'
		else 'n/a'
	end ['countr abbr2']
from Sales.Customers;

select distinct Country
from Sales.Customers;

select
	CustomerID,
	FirstName,
	LastName,
	Score,
	case
		when Score is null then 0
		else Score
	end ScoreClean,

	avg(case
			when Score is null then 0
			else Score
		end) over() AvgCustomerScore,
	avg(Score) over() AvgCustomer

from Sales.Customers;


select 
CustomerID,
OrderID,
Sales,
	case
		when Sales > 30	then 1
		else 0
	end flag
from Sales.Orders
order by CustomerID;


select
*
from Sales.Orders;

select 
CustomerID,
	sum(case
			when Sales > 30	then 1
			else 0
	    end) TotalOrderHighSales,
	count(*) TotalOrders
from Sales.Orders
group by CustomerID;


