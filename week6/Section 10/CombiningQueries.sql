-- Union (Combine the result of 2 or more queries) removes duplicate--
SELECT companyname
FROM customers
UNION 
SELECT companyname
FROM suppliers;

-- UNION all doesnt remove duplicate
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

-- Do yourself --
SELECT country
FROM customers
UNION 
SELECT country
FROM suppliers
ORDER BY country ASC;

--Intersect (results to common things in both sets) same number of columns and remove duplicates--
SELECT country
FROM customers
Intersect
SELECT country
FROM suppliers;

--Intersect all Doesnt remove duplicate--
SELECT country
FROM customers
Intersect ALL
SELECT country
FROM suppliers;

--DOYourself--
SELECT city
FROM customers
Intersect 
SELECT city
FROM suppliers;

--Except --
SELECT country
FROM customers
Except
SELECT country
FROM suppliers;

--ExceptAll--
SELECT country
FROM customers
Except ALL
SELECT country
FROM suppliers;

--DOYourself--
SELECT city
FROM suppliers
Except 
SELECT city
FROM customers;