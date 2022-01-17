-- InnerJoin (Matching Values in both tables)--
SELECT companyname,orderdate,shipcountry
FROM orders
JOIN customers ON customers.customerid=orders.customerid;
-- DoYouself --
SELECT firstname,lastname,orderdate
FROM orders
JOIN employees ON employees.employeeid=orders.employeeid
--DoYourself --
Select companyname,unitprice,unitsinstock
from products
JOIN suppliers ON products.supplierid=suppliers.supplierid;

-- Multiple table --
SELECT companyname, productname , orderdate , order_details.unitprice, quantity
FROM orders
JOIN customers ON customers.customerid=orders.customerid
JOIN order_details ON order_details.orderid=orders.orderid
JOIN products ON products.productid=order_details.productid;
-- DoYourself --
SELECT companyname,categoryname productname , orderdate , order_details.unitprice, quantity
FROM orders
JOIN customers ON customers.customerid=orders.customerid
JOIN order_details ON order_details.orderid=orders.orderid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid = products.categoryid;
-- DoYoursel--
SELECT companyname,categoryname productname , orderdate , order_details.unitprice, quantity
FROM orders
JOIN customers ON customers.customerid=orders.customerid
JOIN order_details ON order_details.orderid=orders.orderid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid = products.categoryid
Where categoryname = 'SeaFood' AND order_details.unitprice*quantity >= 500;


-- -- Left Join (pulls back all data from first table and matching values of second)--
SELECT companyname,orderid
FROM customers
LEFT JOIN orders ON customers.customerid = orders.customerid
WHERE orderid IS Null;
-- DOYourself --
SELECT productname , orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid;

-- -- Right Join (pulls back matching values from first table n return all from second)--
SELECT companyname,orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid
Where orderid is NULL; 

SELECT customercustomerdemo.customerid,companyname
FROM customercustomerdemo
RIGHT JOIN customers on customercustomerdemo.customerid = customers.customerid;

-- FullJOin pulls all record from both tables --
SELECT companyname , orderid
FROM customers
FULL JOIN orders on customers.customerid=orders.customerid;
-- Doyourself --
SELECT productname , categoryname
FROM products
FULL JOIN categories ON categories.categoryid=products.categoryid
Where categoryname = 'Beverages';


-- -- Using KEYWORD -----
Select *
From orders
JOIN order_details USING (orderid)
-- DoYourself -- 
Select *
From orders
JOIN order_details USING (orderid)
JOIN products USING (productid);