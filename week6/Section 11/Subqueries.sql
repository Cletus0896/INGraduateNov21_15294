--EXISTS---
SELECT companyname,contactname
FROM customers
WHERE EXISTS (SELECT customerid FROM orders
              WHERE customerid=customers.customerid AND
               orderdate BETWEEN '1997-04-01' AND '1997-04-30');

 SELECT companyname,contactname
 FROM customers
 WHERE NOT EXISTS (SELECT customerid FROM orders
               WHERE customerid=customers.customerid AND
                orderdate BETWEEN '1997-04-01' AND '1997-04-30');

-- ANY --
SELECT companyname
FROM customers
WHERE  customerid = ANY (SELECT customerid FROM orders
                         JOIN order_details ON orders.orderid=order_details.orderid
                         WHERE quantity > 50);

SELECT companyname
FROM suppliers
WHERE  supplierid = ANY (SELECT products.supplierid FROM order_details
                        JOIN products ON products.productid=order_details.productid
                        WHERE quantity = 1);
-- ALL --
SELECT DISTINCT productname
FROM products
JOIN order_details ON products.productid=order_details.productid
WHERE  order_details.unitprice*quantity > ALL
	(SELECT AVG(order_details.unitprice*quantity)
             FROM order_details
             GROUP BY productid);
			 
---IN-------

SELECT companyname
FROM customers
WHERE country IN (SELECT DISTINCT country
                                    FROM suppliers);

SELECT companyname
FROM suppliers
WHERE city IN (SELECT DISTINCT city
                  FROM customers);

