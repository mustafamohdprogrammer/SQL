-- 1. Total sales by each product across all orders
select 
	OrderID,
	OrderStatus,
	OrderDate,
	ProductID,
	sum(Sales) over(partition by ProductID) as total_sales_by_Product
from Sales.Orders;

-- 2. Total sales by product and order status
select 
	OrderID,
	OrderStatus,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(partition by ProductID, OrderStatus) as total_sales_by_Product
from Sales.Orders;

-- 3. Combining both product and product+status level totals
select 
	OrderID,
	OrderStatus,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(partition by ProductID) as total_sales_by_Product,
	sum(Sales) over(partition by ProductID, OrderStatus) as total_sales_by_Product_status
from Sales.Orders;

-- 4. Including total sales over the entire table with and without partitions
select 
	OrderID,
	OrderStatus,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over() as without_sum,
	sum(Sales) over(partition by ProductID) as total_sales_by_Product,
	sum(Sales) over(partition by ProductID, OrderStatus) as total_sales_by_Product_status
from Sales.Orders;

-- 5. Ranking sales in descending order
select
	OrderID,
	OrderDate,
	Sales,
	rank() over(order by Sales desc) as RankSales
from Sales.Orders;

-- 6. Running total with ROWS BETWEEN CURRENT AND 2 FOLLOWING within each status
select
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	sum(Sales) over(partition by OrderStatus order by OrderDate rows between current row and 2 following) as TotalSales
from Sales.Orders;

-- 7. Incorrect syntax (missing BETWEEN): fixed version uses ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
select
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	sum(Sales) over(partition by OrderStatus order by OrderDate rows between 2 preceding and current row) as TotalSales
from Sales.Orders;

-- 8. Count of rows across the whole table
select
	*,
	count(*) over() as TotalCustomers,
	count(Score) over() as TotalScores,
	count(Country) over() as Country,
	count(LastName) over() as LastName
from Sales.Customers;

-- 9. Sales percentage contribution to total sales
select
	OrderID,
	ProductID,
	Sales,
	sum(Sales) Over() as TotalSales,
	round(cast(Sales as float) / sum(Sales) Over() * 100, 2) as PercentageOfTotal
from Sales.Orders;

-- 10. Handle NULL scores and compute average with and without them
select
	CustomerID,
	LastName,
	Score,
	coalesce(Score, 0) as CustomerScore,
	avg(Score) over() as AvgScore,
	avg(coalesce(score, 0)) over() as AvgScoreWithoutNull
from Sales.Customers;

-- 11. Employees with highest and lowest salaries
select *
from (
	select *,
		max(Salary) over() as high_salary,
		min(Salary) over() as low_salary
	from Sales.Employees
) t
where Salary = high_salary or Salary = low_salary;

-- 12. Moving averages and rolling sales analysis
select
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	avg(Sales) over(partition by ProductID) as AvgByProduct,
	avg(Sales) over(partition by ProductID order by OrderDate) as MovingAvg,
	avg(Sales) over(partition by ProductID order by OrderDate rows between current row and 1 following) as rollingAvg
from Sales.Orders;

-- 13. Row numbering and ranking functions
select 
	OrderID,
	ProductID,
	Sales,
	row_number() over(order by Sales desc) as RowNum
from Sales.Orders;

select 
	OrderID,
	ProductID,
	Sales,
	rank() over(order by Sales desc) as SalesRank
from Sales.Orders;

select 
	OrderID,
	ProductID,
	Sales,
	dense_rank() over(order by Sales desc) as DenseSalesRank
from Sales.Orders;

-- 14. Top-selling order per product
select *
from (
	select 
		OrderID,
		ProductID,
		Sales,
		row_number() over(partition by ProductID order by Sales desc) as rank_by_product
	from Sales.Orders
) t
where rank_by_product = 1;

-- 15. Top 2 customers by total sales
select *
from (
	select
		CustomerID,
		sum(Sales) as TotalSales,
		row_number() over(order by sum(Sales)) as RankCustomers
	from Sales.Orders
	group by CustomerID
) t
where RankCustomers <= 2;

-- 16. Unique row ID generation
select 
	row_number() over(order by OrderID, OrderDate) as uniqueID,
	*
from Sales.OrdersArchive;

-- 17. Get most recent record for each order
select *
from (
	select
		row_number() over(partition by OrderID order by CreationTime desc) as rn,
		*
	from Sales.OrdersArchive
) t
where rn = 1;

-- 18. Bucket customers into 2/3/4 equal groups based on Sales
select
	OrderID,
	Sales,
	ntile(2) over(order by Sales desc) as twoBucket
from Sales.Orders;

select
	OrderID,
	Sales,
	ntile(3) over(order by Sales desc) as threeBucket
from Sales.Orders;

select
	OrderID,
	Sales,
	ntile(4) over(order by Sales desc) as fourBucket
from Sales.Orders;

-- 19. Assign sales segments using buckets
select
	*,
	case 
		when buckets = 1 then 'High'
		when buckets = 2 then 'Medium'
		when buckets = 3 then 'Low'
	end as SalesSegment
from (
	select 
		OrderID,
		Sales,
		ntile(3) over(order by Sales desc) as buckets
	from Sales.Orders
) t;

-- 20. Cumulative distribution of product prices
select
	Product,
	Price,
	cume_dist() over(order by Price desc) as DistRank
from Sales.Products;

-- 21. Filter products by top 40% price distribution
select *,
	concat(DistRank * 100, '%') as DistRankPerc
from (
	select
		Product,
		Price,
		cume_dist() over(order by Price desc) as DistRank
	from Sales.Products
) t
where DistRank <= 0.4;

-- 22. Products from bottom 60% based on price
select *,
	concat(DistRank * 100, '%') as DistRankPerc
from (
	select
		Product,
		Price,
		cume_dist() over(order by Price desc) as DistRank
	from Sales.Products
) t
where DistRank >= 0.4;

-- 23. Percent rank instead of cumulative distribution
select *,
	concat(DistRank * 100, '%') as DistRankPerc
from (
	select
		Product,
		Price,
		percent_rank() over(order by Price desc) as DistRank
	from Sales.Products
) t
where DistRank >= 0.4;

-- 24. Lag previous month’s total sales
select 
	month(OrderDate) as OrderMonth,
	sum(Sales) as Current_month_sales,
	lag(sum(Sales)) over(order by month(OrderDate)) as PrevMonthSales
from Sales.Orders
group by month(OrderDate);

-- 25. Lead next month’s total sales
select 
	month(OrderDate) as OrderMonth,
	sum(Sales) as Current_month_sales,
	lead(sum(Sales)) over(order by month(OrderDate)) as NextMonthSales
from Sales.Orders
group by month(OrderDate);

-- 26. First and last value of sales for each product
select
	OrderID,
	ProductID,
	Sales,
	first_value(Sales) over(partition by ProductID order by Sales) as lowestSales,
	last_value(Sales) over(partition by ProductID order by Sales rows between current row and unbounded following) as highSales,
	Sales - first_value(Sales) over(partition by ProductID order by Sales) as SalesDiff
from Sales.Orders;
