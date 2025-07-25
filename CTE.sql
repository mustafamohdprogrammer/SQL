
-- standalone cte
-- CTE to calculate total sales per customer
with cte_total_sales as
(
	select
		CustomerID,
		sum(Sales) as totalSales
	from Sales.Orders
	group by CustomerID
),
-- CTE to find the most recent order date per customer
cte_last_order as(
	select
		CustomerID,
		max(OrderDate) as lastOrder
	from Sales.Orders
	group by CustomerID
)
-- Main query to join customer information with sales and last order details
select 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	cts.totalSales,
	clo.lastOrder
from Sales.Customers c
left join cte_total_sales cts on cts.CustomerID = c.CustomerID
left join cte_last_order clo on clo.CustomerID = c.CustomerID



-- nested cte

with cte_total_sales as
(
	select
		CustomerID,
		sum(Sales) as totalSales
	from Sales.Orders
	group by CustomerID
),
-- CTE to assign rank to customers based on total sales in descending order
cte_customer_rank as(
	select
		CustomerID,
		TotalSales,
		rank() over(order by totalSales desc) as CustomerRank
	from cte_total_sales
),
-- CTE to assign customer segments based on total sales thresholds
cte_customer_segment as(
	select
		CustomerID,
		case when totalSales > 100 then 'hign'
			 when totalSales > 80 then 'medium'
			 else 'low'
		end CustomerSegments
	from cte_total_sales
)
-- Final query joining all CTEs with the Customers table
select 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	cts.totalSales,
	ccr.CustomerRank,
	ccs.CustomerSegments
from Sales.Customers c
left join cte_total_sales cts on cts.CustomerID = c.CustomerID
left join cte_customer_rank ccr on ccr.CustomerID = c.CustomerID
left join cte_customer_segment ccs on ccs.CustomerID = c.CustomerID

-- Recursive CTE


with Series as(
-- Anchor Query
	select
	1 as myNumber
	union all
	-- recursive query
	select
	myNumber + 1
	from Series
	where myNumber < 20
)
select *
from Series;


with Series as(
-- Anchor Query
	select
	1 as myNumber
	union all
	-- recursive query
	select
	myNumber + 1
	from Series
	where myNumber < 1000
)
select *
from Series
option (maxrecursion 5000)