if object_id ('Sales.view_monthly_summary', 'V') is not null
	drop view Sales.view_monthly_summary;
go
create view Sales.view_monthly_summary as(
	select
	DATETRUNC(month,OrderDate) OrderMonth,
	sum(Sales) TotalSales,
	count(OrderID) TotalOrders,
	sum(Quantity) Totalquantity
	from Sales.Orders
	group by DATETRUNC(month,OrderDate)
);



select 
	OrderMonth,
	TotalSales,
	Totalquantity,
	sum(TotalSales) over (order by OrderMonth) as RunningTotal
from Sales.view_monthly_summary;







