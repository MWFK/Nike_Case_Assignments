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


