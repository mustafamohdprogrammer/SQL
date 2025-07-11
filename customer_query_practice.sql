-- Switch to the 'salesdb' database
USE salesdb;

-- Get average score per country where score is not 0, and filter those with average score greater than 430
SELECT 
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;

-- Get a list of all unique countries in the customers table
SELECT DISTINCT country
FROM customers;

-- Fetch the first 3 records from the customers table (useful for preview)
SELECT *
FROM customers
LIMIT 3;

-- Get all customers whose score is greater than 500
SELECT *
FROM customers
WHERE score > 500;

-- Get all customers whose score is not equal to 750
SELECT *
FROM customers
WHERE score != 750;

-- Get all customers with score between 100 and 500 (inclusive)
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

-- Get all customers from Germany
SELECT *
FROM customers
WHERE country IN ('Germany');

-- Get all customers NOT from Germany
SELECT *
FROM customers
WHERE country NOT IN ('Germany');

-- Get all customers whose first name starts with 'M'
SELECT *
FROM customers
WHERE firstname LIKE 'M%';

-- Get all customers whose first name ends with 'n'
SELECT *
FROM customers
WHERE firstname LIKE '%n';

-- Get all customers whose first name contains the letter 'r'
SELECT *
FROM customers
WHERE firstname LIKE '%r%';

-- Get all customers whose first name has 'r' as the third character
SELECT *
FROM customers
WHERE firstname LIKE '__r%';

