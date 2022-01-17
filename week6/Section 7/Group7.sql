-- 7Practice ORDERBY --
SELECT DISTINCT country ,city 
FROM suppliers
ORDER BY country ASC , city ASC;
-- DoYourself --
SELECT productname , unitprice
FROM products
ORDER BY unitprice DESC , productname ASC;

-- MINMAX --
SELECT MIN(orderdate)
FROM orders
WHERE shipcountry='Italy';
SELECT MAX(shippeddate)
FROM orders
Where shipcountry='Canada';
--DOYourself --
SELECT MAX(shippeddate - orderdate)
FROM orders
WHERE shipcountry = 'Canada';

-- AVG&SUM--
SELECT AVG(freight)
from orders
WHERE shipcountry='Brazil';
--SUM--
Select SUM(quantity)
from order_details
Where productid=14;
--DOyourself--
SELECT AVG(quantity)
FROM order_details
Where productid=35;

--LIKEtoMatch --
SELECT companyname,contactname
FROM customers
WHERE contactname LIKE 'D%';

SELECT companyname
FROM suppliers
WHERE city LIKE '_on%';

-- ALias --
Select unitprice*quantity AS TotalSpent
FROM order_details;

SELECT unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory DESC;

-- LimitRecords --
SELECT productname , unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory ASC
Limit 3;

-- NULL& NOTNULL --
select count(*)
From customers
WHERE region IS NULL;

select count(*)
From suppliers
WHERE region IS NOT NULL;

select count(*)
From orders
WHERE shipregion IS NULL;
