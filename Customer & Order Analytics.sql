--#In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customer and order data. 

--How many orders were placed in January? 
SELECT COUNT(orderid)
FROM BIT_DB.JanSales
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

--How many of those orders were for an iPhone? 
SELECT COUNT(orderid)
FROM BIT_DB.JanSales
WHERE Product='iPhone'
AND length(orderid) = 6 
AND orderid <> 'Order ID';

--Select the customer account numbers for all the orders that were placed in February. 
SELECT distinct acctnum
FROM BIT_DB.customers cust

INNER JOIN BIT_DB.FebSales Feb
ON cust.order_id=FEB.orderid
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

--Which product was the cheapest one sold in January, and what was the price? 
SELECT distinct product, price FROM BIT_DB.JanSales 
ORDER BY price ASC LIMIT 1;

--What is the total revenue for each product sold in January?
SELECT sum(quantity)*price as revenue, product
FROM BIT_DB.JanSales
GROUP BY product;

--Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
SELECT SUM(Quantity), product, 
SUM(quantity)*price as revenue
FROM BIT_DB.FebSales 
WHERE location = '548 Lincoln St, Seattle, WA 98101'
GROUP BY product;

--How many customers ordered more than 2 products at a time, and what was the average amount spent for those customers? 
SELECT COUNT(distinct customers.acctnum), 
AVG(quantity*price)
FROM BIT_DB.FebSales 
LEFT JOIN BIT_DB.customers 
ON FebSales.orderid=customers.order_id
WHERE FebSales.Quantity>2
AND length(orderid) = 6 
AND orderid <> 'Order ID';

--Select how many of each product sold in February in Los Angeles
SELECT Product, SUM(Quantity)
FROM BIT_DB.FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY Product;

-- Show orders between February 13th and February 19th 2019
SELECT orderdate
FROM BIT_DB.FebSales
where orderdate BETWEEN '02/13/19 00:00' AND 
'02/18/19 00:00';

-- Show location of sales on February 18th 2019 at 1:35
SELECT location
FROM BIT_DB.FebSales
WHERE orderdate = '02/18/19 01:35';

-- Show number of sales on February 18th 2019
SELECT sum(quantity)
FROM BIT_DB.FebSales
WHERE orderdate LIKE '02/18/19%';

-- Show me what kind of battery products were sold in February
SELECT DISTINCT Product
FROM BIT_DB.FebSales
WHERE Product LIKE '%Batteries%';

-- Show me products whose price ends in .99
SELECT DISTINCT Product, Price
FROM BIT_DB.FebSales
WHERE Price LIKE '%.99';

-- Show me the total of each product sold in Los Angeles

SELECT Product, SUM(Quantity)
FROM BIT_DB.FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY Product;

-- Which locations in New York received at least 3 orders in January, and how many orders did they each receive?

SELECT distinct location, COUNT(orderID)
FROM Bit_DB.JanSales 
WHERE location LIKE '%NY%' 
AND orderid <> 'Order ID'
GROUP BY location
HAVING COUNT(orderID)>2;

-- How many of each type of headphone was sold in February?

SELECT DISTINCT Product, COUNT(orderID)
FROM Bit_DB.FebSales
WHERE Product LIKE '%headphone%'
GROUP BY Product;

-- What was the average amount spent per account in February?

SELECT SUM(quantity*price)/COUNT(cust.acctnum)
FROM Bit_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON Feb.orderid=cust.order_id
WHERE LENGTH(orderid) = 6
AND orderid <> 'Order ID';

-- OR

SELECT AVG(quantity*price)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON Feb.orderid=cust.order_id
WHERE length (orderid) = 6
AND orderid <> 'Order ID';

-- What was the average quantity of products purchased per account in February?

SELECT AVG(quantity), acctnum
FROM Bit_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON Feb.orderid=cust.order_id
WHERE LENGTH(orderid) = 6
AND orderid <> 'Order ID'
GROUP BY acctnum;

-- Which product brought in the most revenue in January and how much revenue did it bring in total?

SELECT product, SUM(quantity*price)
FROM BIT_DB.JanSales
GROUP BY product
ORDER BY SUM(quantity*price) 
desc LIMIT 1;