-- INNER JOIN: Matching records in both tables
SELECT 
    o.orderid,
    c.customerid,
    firstname,
    sales
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON o.OrderID = c.CustomerID;


-- LEFT JOIN: All records from customers, matched orders if available
SELECT 
    o.OrderID,
    c.CustomerID,
    firstname,
    sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
    ON o.OrderID = c.CustomerID;


-- RIGHT JOIN: All records from orders, matched customers if available
SELECT 
    o.OrderID,
    c.CustomerID,
    firstname,
    sales
FROM Sales.Customers AS c
RIGHT JOIN Sales.Orders AS o
    ON o.OrderID = c.CustomerID;


-- FULL OUTER JOIN using UNION of LEFT JOIN and RIGHT JOIN
-- Part 1: LEFT JOIN
SELECT 
    o.OrderID,
    c.CustomerID,
    firstname,
    sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
    ON o.OrderID = c.CustomerID

UNION

-- Part 2: RIGHT JOIN (gets unmatched customers)
SELECT 
    o.OrderID,
    c.CustomerID,
    firstname,
    sales
FROM Sales.Customers AS c
RIGHT JOIN Sales.Orders AS o
    ON o.OrderID = c.CustomerID;


-- Records in customers with no matching orders (LEFT ANTI JOIN)
SELECT *
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;


-- Records in orders with no matching customers (RIGHT ANTI JOIN)
SELECT *
FROM Sales.Customers AS c
RIGHT JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;


-- Records in customers with matching orders only
SELECT *
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NOT NULL;


-- CROSS JOIN: Cartesian product of customers and orders
SELECT *
FROM Sales.Customers
CROSS JOIN Sales.Orders;


use salesdb;

select 
	OrderID,
    Sales
from Sales.Orders;

select 
	firstname,
    lastname
from Sales.Customers;

select 
	o.orderid,
    o.sales,
    c.firstname as CustomerFirstName,
    c.lastname as CustomerLastName,	
    p.product as productname,
    p.price,
    e.firstname as salesmanFirstName,
    e.lastname as salesmanLastName
from Sales.Orders as o
left join Sales.Customers as c
on o.customerid = c.customerid
left join Sales.Products as p
on o.productid = p.productid
left join Sales.Employees as e
on o.salespersonid = e.employeeid 

-- Display all customer records
SELECT *
FROM Sales.Customers;
