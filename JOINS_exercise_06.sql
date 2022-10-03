-- 01. Employee Address
SELECT e.employee_id,	e.job_title,	e.address_id,	a.address_text
FROM `employees` AS e
JOIN `addresses` AS a
ON e.address_id = a.address_id
ORDER BY address_id
LIMIT 5;

-- 02. Addresses with Towns
SELECT e.first_name, e.last_name, t.name AS 'town', a.address_text
FROM `employees` AS e
JOIN `towns` AS t
JOIN `addresses` AS a
ON e.address_id = a.address_id AND a.town_id = t.town_id
ORDER BY first_name, last_name
LIMIT 5;

-- 03. Sales Employee
SELECT e.employee_id,	e.first_name,	e.last_name,	d.name  AS 'department_name'
FROM `employees` AS e
JOIN `departments` AS d
ON e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY e.employee_id DESC;

-- 04. Employee Departments
SELECT e.employee_id, e.first_name,	e.salary,	d.name AS 'department_name'
FROM `employees` AS e
JOIN `departments` AS d
ON e.department_id = d.department_id
WHERE salary> 15000
ORDER BY d.department_id DESC
LIMIT 5;

-- 05. Employees Without Project
SELECT e.employee_id,	e.first_name
FROM `employees` AS e
LEFT JOIN 	`employees_projects` AS ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

-- 06. Employees Hired After
SELECT e.first_name,	e.last_name,	e.hire_date,	d.name AS 'dept_name'
FROM `employees` AS e
JOIN `departments` AS d
ON e.department_id = d.department_id
WHERE (e.hire_date > '1999-01-01') AND (d.name = 'Sales' OR d.name = 'Finance')
ORDER BY e.hire_date;

-- 07. Employees with Project !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 83/100
USE soft_uni;
SELECT e.employee_id,	e.first_name,	p.name AS 'project_name'
FROM `employees` AS e
JOIN `employees_projects` AS ep
JOIN `projects` AS p  
ON e.employee_id = ep.employee_id  AND ep.project_id = p.project_id
WHERE DATE(p.start_date) > '2002-08-13' AND p.end_date IS NULL
ORDER BY e.first_name ASC, p.name ASC
LIMIT 5;

-- 08. Employee 24
SELECT e.employee_id,	e.first_name, 
IF(p.start_date >= '2005-01-01', NULL, p.name)AS 'project_name'
FROM `employees` AS e
JOIN `projects` AS p
JOIN `employees_projects` AS e_p
ON e.employee_id = e_p.employee_id AND e_p.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY p.name;

-- 09. Employee Manager
SELECT e.employee_id,	e.first_name,	e.manager_id,	m.first_name AS manager_name
FROM `employees` AS e
JOIN `employees` AS m
ON m.employee_id = e.manager_id
WHERE e.manager_id IN (3,7)
ORDER BY e.first_name;

-- 10. Employee Summary
SELECT e.employee_id,	
CONCAT(e.first_name," ", e.last_name) AS 'employee_name',	
CONCAT(m.first_name, " ", m.last_name) AS 'manager_name',	d.name AS 'department_name'
FROM `employees` AS e
JOIN `employees` AS m
JOIN `departments` AS d
ON m.employee_id = e.manager_id AND d.department_id = e.department_id
ORDER BY e.employee_id
LIMIT 5;

-- 11. Min Average Salary
SELECT AVG(salary) AS 'min_average_salary'
FROM `employees`
GROUP BY department_id
ORDER BY `min_average_salary`
LIMIT 1;

-- 12. Highest Peaks in Bulgaria
SELECT mc.country_code,	m.mountain_range,	p.peak_name,	p.elevation
FROM `peaks` AS p
JOIN `mountains` AS m
JOIN `mountains_countries` AS mc
ON p.mountain_id = m.id AND m.id = mc.mountain_id
WHERE mc.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;

-- 13. Count Mountain Ranges
SELECT mc.country_code,	COUNT(m.mountain_range) AS 'mountain_range'
FROM `mountains` AS m
JOIN  `mountains_countries` AS mc
ON mc.mountain_id = m.id
GROUP BY mc.country_code
HAVING mc.country_code IN ('US','RU','BG')
ORDER BY `mountain_range` DESC;

-- 14. Countries with Rivers
SELECT c.country_name,	r.river_name
FROM `countries` AS c
LEFT JOIN `countries_rivers` AS cr
ON c.country_code = cr.country_code
LEFT JOIN `rivers` AS r
ON  r.id = cr.river_id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;

-- 15. *Continents and Currencies
SELECT t1.continent_code, t1.currency_code, t1.currency_usage FROM 
	(SELECT c.`continent_code`, c.`currency_code`,
    COUNT(c.`currency_code`) AS `currency_usage` FROM `countries` AS c
	GROUP BY c.currency_code, c.continent_code HAVING currency_usage > 1) as t1
LEFT JOIN 
	(SELECT c.`continent_code`,c.`currency_code`,
    COUNT(c.`currency_code`) AS `currency_usage` FROM `countries` AS c
	 GROUP BY c.currency_code, c.continent_code HAVING currency_usage > 1) as t2
ON t1.continent_code = t2.continent_code AND t2.currency_usage > t1.currency_usage
WHERE t2.currency_usage IS NULL
ORDER BY t1.continent_code, t1.currency_code;



-- 16. Countries without any Mountains
SELECT COUNT(c.country_code) AS 'country_count'
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc
ON c.country_code = mc.country_code
WHERE mc.mountain_id IS NULL;

-- 17. Highest Peak and Longest River by Country
SELECT c.country_name,
	MAX(p.elevation) AS 'highest_peak_elevation',
	MAX(r.length) AS 'longest_river_length'
    FROM `countries` AS c
     LEFT JOIN `countries_rivers` AS cr ON c.country_code = cr.country_code
     LEFT JOIN `mountains_countries` AS mc ON c.country_code = mc.country_code
    LEFT JOIN `peaks` AS p ON p.mountain_id = mc.mountain_id
    LEFT JOIN `rivers` AS r ON cr.river_id = r.id
    GROUP BY c.country_name
    ORDER BY `highest_peak_elevation` DESC, `longest_river_length` DESC, c.country_name
    LIMIT 5;










































































