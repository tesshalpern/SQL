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

