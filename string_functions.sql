-- String Functions

--  Manipulation                -- Calculation				-- String Extraction
	-- 1.Concat						-- 1. Len					1.Left
	-- 2. Upper													2.Right
	-- 3.Lower													3.Substring
	-- 4.Replace
	-- 5.Trim



select 
	FirstName,
	Country,
	concat(FirstName,'-',Country) as name_country
from Sales.Customers;

select 
	FirstName,
	Country,
	lower(FirstName) as name_lower
from Sales.Customers;

select 
	FirstName,
	Country,
	upper(FirstName) as name_upper
from Sales.Customers;

select 
	FirstName,
	Country,
	concat(FirstName,'-',Country) as name_country,
	lower(FirstName) as name_lower,
		upper(Country) as country_upper
from Sales.Customers;

select
	FirstName
from Sales.Customers
where FirstName != trim(FirstName);

select
	FirstName,
	len(FirstName) as length
from Sales.Customers;

select
'123-456-7890' as phone,
replace('123-456-7890','-','/');


select
	FirstName,
	left(FirstName,2) as first_2_letters
from Sales.Customers;


select
	FirstName,
	right(FirstName,2) as last_2_letters
from Sales.Customers;


select
	FirstName,
	left(FirstName,2) as first_2_letters,
	right(FirstName,2) as last_2_letters
from Sales.Customers;



select
	FirstName,
	SUBSTRING(FirstName,2,len(FirstName))
from Sales.Customers;