-- null Function

select 
CustomerID,
Score,
coalesce(Score,0) as score2,
avg(Score) over() avg_score,
avg(coalesce(Score,0)) over() avg_score_2
from Sales.Customers;


select 
FirstName,
LastName,
FirstName + ' ' + coalesce(LastName , '') as Full_name,
Score,
coalesce(Score,0)+10 as ['Scores with bonus']
from Sales.Customers;


SELECT
CustomerID,
Score
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END,Score;


select
OrderID,
Sales,
Quantity,
Sales / nullif(Quantity,0) as price
from Sales.Orders;


select 
*
from Sales.Customers
where score is null;



select 
*
from Sales.Customers
where score is not null;

-- List all the customers who have not placed any orders

select 
c.*,
o.OrderID
from Sales.Customers c
left join Sales.Orders o
on c.CustomerID = o.CustomerID
where o.CustomerId is null;