-- 1. Managers
USE soft_uni;
SELECT e.employee_id, CONCAT(e.first_name, " ", e.last_name) AS 'full_name',
d.department_id, d.`name` AS 'department_name'
 FROM employees AS e
 JOIN departments AS d
 ON d.manager_id = e.employee_id
 ORDER BY e.employee_id
 LIMIT 5;
 
 -- 2. Towns and Addresses
SELECT t.town_id, t.`name` AS 'town_name', a.address_text
FROM towns AS t
JOIN addresses AS a
ON t.town_id = a.town_id
WHERE name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY town_id, address_id;

-- 3. Employees Without Managers
SELECT employee_id, first_name, last_name, d.department_id, salary
FROM `employees` AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.manager_id IS NULL;

SELECT employee_id, first_name, last_name, department_id, salary
FROM `employees` AS e
WHERE e.manager_id IS NULL;

-- 4. High Salary
SELECT COUNT(employee_id) AS 'count'
FROM `employees`
WHERE salary >
(SELECT AVG(salary) FROM `employees`);










 