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
FROM order_items oi
JOIN products p ON p.id = oi.product_id
JOIN orders o ON o.id = oi.order_id
GROUP BY p.category 
ORDER BY revenue DESC;

-- Task 3 
SELECT e.first_name, e.last_name, d.name AS department,
e.salary,
da.avg 
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN (
    SELECT department_id, AVG(salary) AS avg
    FROM employees 
    GROUP BY department_id
) AS da ON e.department_id = da.department_id
WHERE e.salary > da.avg
ORDER BY d.name, e.salary DESC;






