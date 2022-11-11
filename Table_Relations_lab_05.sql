-- 1. Mountains and Peaks
CREATE TABLE `mountains` (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE `peaks` (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
mountain_id INT,
CONSTRAINT fk_peaks_mountains
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
);

-- 2. Trip Organization
SELECT driver_id, vehicle_type, CONCAT( first_name, ' ', last_name) AS driver_name
FROM vehicles AS v
JOIN campers AS c
ON v.driver_id = c.id;

-- 3. SoftUni Hiking
SELECT starting_point AS 'route_starting_point',
 end_point AS 'route_ending_point',
 leader_id, CONCAT( first_name, ' ', last_name) AS 'leader_name'
 FROM routes AS r
 JOIN campers AS c
 ON r.leader_id = c.id;
 
 -- 4. Delete Mountains
 	CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL
	);
	 
	CREATE TABLE `peaks`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`mountain_id` INT,
	CONSTRAINT `fk_peaks_mountains`
	FOREIGN KEY (`mountain_id`)
	REFERENCES `mountains`(`id`)
	ON DELETE CASCADE
	);

 
 -- 5 Project Management DB*
CREATE TABLE clients ( 
id INT(11) PRIMARY KEY AUTO_INCREMENT, 
client_name VARCHAR(100) 
); 
 
CREATE TABLE projects ( 
id INT(11) PRIMARY KEY AUTO_INCREMENT, 
client_id INT(11), 
project_leader_id INT(11) 
); 
 
CREATE TABLE employees ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(30), 
last_name VARCHAR(30), 
project_id INT 
); 
	 
ALTER TABLE projects 
ADD CONSTRAINT fk_projects_clients 
FOREIGN KEY (client_id) 
REFERENCES clients(id), 
ADD CONSTRAINT fk_projects_employees 
FOREIGN KEY (project_leader_id) 
REFERENCES employees(id); 
 
ALTER TABLE employees 
ADD CONSTRAINT fk_employees_projects 
FOREIGN KEY (project_id) 
REFERENCES projects(id);

 
 
 
 
 
 
 
 
 
 











