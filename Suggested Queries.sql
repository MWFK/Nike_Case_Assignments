-- 1. Write an SQL query to fetch unique values of “city” from “customers” table using the alias name as “CUSTOMER_CITY”.

SELECT DISTINCT city CUSTOMER_CITY 
FROM customers; 

-- 2. Write an SQL query to print all details of employees, excluding those with first names “Gerard” and “Mary”.

SELECT * 
FROM employees 
WHERE firstName NOT IN ('Gerard', 'Mary');

-- 3. Write an SQL query to print full name as concatenation of first and last name of employees whose last name ends with ‘n’.

SELECT CONCAT(firstName, ' ', lastName)
FROM employees
WHERE lastName LIKE '%N' OR lastName LIKE '%n';

-- 4. Write an SQL query to print all details of all employees located in offices within territory “EMEA”.

SELECT *
FROM employees e, offices o
WHERE e.officeCode = o.officeCode 
AND o.territory = 'EMEA';

-- 5. Write an SQL query to fetch the no. of employees for each territory. Sort by no. of employees in the descending order.

SELECT o.territory, COUNT(*) AS nbr_emp_territory
FROM employees e, offices o
WHERE e.officeCode = o.officeCode 
GROUP BY o.territory
ORDER BY nbr_emp_territory DESC;

-- 6. Write an SQL query to print “productName” from “products” table next to the corresponding “textDescription” with alias “productLine” from the “productlines” table order by “productLine” Ascending and “productName” Descending.

SELECT p.productName, l.textDescription AS productLine 
FROM products p 
LEFT JOIN productlines l 
ON p.productLine = l.productLine 
ORDER BY productLine ASC, p.productName DESC;

-- 7. Write an SQL query to print top 5 products with highest total quantity sold in April, 2005. Quantities should also be displayed.

SELECT p.productName, p.productCode, d.quantityOrdered 
FROM products p, orderdetails d, orders o 
WHERE p.productCode = d.productCode AND d.orderNumber = o.orderNumber 
                                    AND o.orderDate BETWEEN '2005-04-01' AND '2005-04-30' 
ORDER BY d.quantityOrdered 
DESC LIMIT 3; 
