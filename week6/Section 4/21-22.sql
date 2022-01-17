-- 20 DoYourself --
--SELECT COUNT(*)
--FROM orders
--WHERE shipcountry='Germany' AND (Freight<50 OR freight>170)

--SELECT COUNT(*)
--FROM orders 
--WHERE (shipcountry='Canada' OR shipcountry='Spain') AND shippeddate> '1997-05-01'

--21 Practice --
--SELECT COUNT(*)
--from order_details
--where unitprice BETWEEN 10 AND 20;

--SELECT COUNT(*)
--FROM orders
--WHERE shippeddate BETWEEN '1996-06-01' AND '1996-09-30'

--22 DoYourself --
SELECT COUNT(*)
FROM products
WHERE categoryid IN (1,4,6,7);