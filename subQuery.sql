select
*
from
	(
	select
		ProductID,
		Price,
		avg(price) over() avg_price
		from Sales.Products
	)t
where price >= avg_price;

select 
*,
rank() over(order by Total_sales desc) as rankSales
from
	(SELECT
		CustomerID,
		SUM(Sales) total_sales
	FROM Sales.Orders
	group by CustomerID)t



select
	ProductID,
	Product,
	Price,
	(select count(*) from Sales.Orders) as TotalOrders
from Sales.Products;


select
c.*,
o.TotalOrders
from Sales.Customers c
left join(
	select 
	CustomerID,
	count(*) TotalOrders
	from sales.Orders
	group by CustomerID) o
on c.CustomerID = o.CustomerID



select
*
from Sales.Orders
where CustomerID in
					(select 
						CustomerID
						from Sales.Customers
						where Country = 'Germany')



select
*
from Sales.Orders
where CustomerID not in
					(select 
						CustomerID
						from Sales.Customers
						where Country = 'Germany')





select
	EmployeeID,
	FirstName,
	Salary
from Sales.Employees
where Gender = 'F'
and Salary > any (select Salary from Sales.Employees where Gender = 'M' )


select
	EmployeeID,
	FirstName,
	Salary
from Sales.Employees
where Gender = 'F'
and Salary > all (select Salary from Sales.Employees where Gender = 'M' )


select
*
from Sales.Orders o
where not exists (select 1
					from Sales.Customers c
					where Country = 'Germany'
					and o.CustomerID = c.CustomerID					
)


select
*
from Sales.Orders o
where exists (select 1
					from Sales.Customers c
					where Country = 'Germany'
					and o.CustomerID = c.CustomerID					
)