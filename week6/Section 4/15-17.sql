-- SELECT companyname
-- FROM suppliers
-- WHERE city='Berlin';

--14 DoYourself--
-- SELECT companyname,contactname
-- FROM customers
-- WHERE country='Mexico';

--15 DoYourself--
SELECT COUNT(*)
FROM orders
WHERE freight>=250;

-- 16 Practice --
SELECT Count(*)
FROM orders
WHERE orderdate >= '1998-01-01';
-- Doyourself
SELECT COUNT(*)
from orders
WHERE shippeddate < '1997-07-05';

-- 17 Practice --
SELECT COUNT(*)
FROM orders
WHERE shipcountry='Germany' AND freight > 100;

-- Do Youself
SELECT DISTINCT(customerid)
FROM orders
WHERE shipcountry='Brazil' AND shipvia=2

