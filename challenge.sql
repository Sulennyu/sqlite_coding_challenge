--Tools used: VSCode + SQLTools (SQLite Viewer)
--Results validated by executing each query independently on the bais_sqlite_lab file.
--With this information I was able to confirm if the outputs matched requirements. 
--Also made sure the SQL ran without errors or crashes.

-- Task 1 
SELECT c.first_name || ' ' || c.last_name AS customer_name,
SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c 
JOIN orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id 
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5; 

-- Task 2 
SELECT p.category,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.id
GROUP BY p.category 
ORDER BY revenue DESC;

-- Task 3 
SELECT e.first_name, e.last_name, d.name AS department,
e.salary,
dep.avg 
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN (
    SELECT department_id,ROUND(AVG(salary)) AS avg
    FROM employees 
    GROUP BY department_id
) AS dep ON e.department_id = dep.department_id
WHERE e.salary > dep.avg
ORDER BY d.name, e.salary DESC;

-- Task 4 
SELECT city,
COUNT(*) AS gold_c_count
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_c_count DESC, city;

--TASK 4 (Extension)
SELECT city,
SUM(loyalty_level='Gold') AS gold_count,
SUM(loyalty_level='Silver') AS silver_count,
SUM(loyalty_level='Bronze') AS bronze_count,
COUNT(*) AS total_customers
FROM customers 
GROUP BY city
ORDER BY gold_count DESC, city;









