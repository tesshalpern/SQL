-- Show type of customer
SELECT c.FirstName, c.LastName, COUNT(InvoiceId),
CASE 
    WHEN COUNT(InvoiceId) >= 6 THEN "Frequent Customer"
    WHEN COUNT(InvoiceId) >= 4 THEN "Occasional Customer"
    WHEN COUNT(InvoiceId) >= 1 THEN "Infrequent Customer"
    ELSE "No Purchase History"
END AS "Customer Type"

FROM Customers c
LEFT JOIN Invoices i 
ON I.CustomerId = c.CustomerId
GROUP BY c.CustomerId;

-- How many tracks does each artist have
SELECT Ar.Name, COUNT(ar.ArtistId) AS Tracks
FROM albums al
JOIN artists ar
ON al.ArtistId = ar.ArtistId
GROUP BY al.ArtistId
ORDER BY Tracks DESC;

—How many orders in each city ordered by employeeid
SELECT employees.FirstName , billingcity, COUNT(*)
FROM chinook.employees
JOIN chinook.customers
ON employees.Employeeid = customers.SupportRepid
JOIN chinook.invoices
ON invoices.Customerid = customers.Customerid
GROUP BY employees.FirstName, billingcity;


How many Invoices were there in 2010?
SELECT COUNT(*)
FROM chinook.invoices
WHERE InvoiceDate BETWEEN "2010-01-01" AND "2010-12-31";

—Show the average amount each customer spent in the year 2010
SELECT CustomerId, AVG(Total)
FROM chinook.invoices
WHERE InvoiceDate BETWEEN "2010-01-01" AND "2010-12-31"
GROUP BY CustomerId
ORDER BY CustomerId ASC;

—Show what countries have ordered from us in 2010 
SELECT DISTINCT BillingCountry
FROM chinook.invoices
WHERE InvoiceDate BETWEEN "2010-01-01" AND "2010-12-31";

—All invoices in the year 2009
SELECT *
FROM chinook.invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2009-12-31";

—Show only the Customers from Brazil.
SELECT Customerid, FirstName, LastName, Country
FROM chinook.customers
WHERE Country = 'Brazil';

—Get the names of customers who ordered in Brazil, and how many orders they placed
SELECT invoices.CustomerId, customers.FirstName, customers.LastName, invoices.BillingCountry, COUNT(*)
FROM chinook.invoices
JOIN chinook.customers
ON invoices.CustomerId = customers.CustomerId
WHERE BillingCountry ='Brazil'
GROUP BY invoices.customerid;


