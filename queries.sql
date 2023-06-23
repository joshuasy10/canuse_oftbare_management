-- Task 9: Get a list of clients, name of the sales employee who with that client and the list of projects that the client has.

SELECT clients.id, clients.`name` as 'client name', employees.`name` as 'sales employee name', GROUP_CONCAT(projects.`name`) FROM clients
JOIN employees ON clients.sales_employee_id = employees.id
JOIN projects ON projects.client_id = clients.id
GROUP BY client_id;

-- Task 10: Get the client who has the highest value of projects. WORKS
SELECT clients.id, clients.name, SUM(projects.value) AS 'Total Value'
FROM clients
JOIN projects ON clients.id = projects.client_id
GROUP BY clients.id, clients.name
ORDER BY `Total Value` DESC
LIMIT 1;

-- Task 11: Get the client who has the lowest value of projects. WORKS
SELECT clients.id, clients.name, SUM(projects.value) AS 'Total Value'
FROM clients
JOIN projects ON clients.id = projects.client_id
GROUP BY clients.id, clients.name
ORDER BY `Total Value` ASC
LIMIT 1;

-- Task 12: Get a list of clients with the average value of their projects. WORKS
SELECT clients.id, clients.name, AVG(projects.value) AS 'Average Value'
FROM clients
JOIN projects ON clients.id = projects.client_id
GROUP BY clients.id, clients.name;

-- Task 13: Get a list of sales employees and how much each has made in commission this year.

-- Task 14: Get a list of sales employees who haven't won any clients this year 

-- Task 15: Get a list of delivery employees who aren't assigned to a project, 
-- who have previously worked with a technology that is currently being used on 
-- a project and the name of those projects.

-- Task 16: Set a project as completed.
UPDATE projects
SET completed_at = NOW()
WHERE id = 2;

-- Task 17: See a list of projects, the name of the Tech Lead and a list of all 
-- delivery employees assigned to the project.

SELECT projects.name, employees.name as lead_employee_id  FROM projects 
JOIN employees ON projects.lead_employee_id = employees.id;

SELECT projects.name, GROUP_CONCAT(employees.`name`) as 'delivery employees' FROM projects
JOIN project_employees ON projects.id = project_employees.project_id
JOIN employees ON project_employees.employee_id = employees.id
JOIN access ON employees.id = access.employee_id
WHERE access.role = 'delivery'
GROUP BY projects.name;

-- Task 18: See the project with the most delivery employees working on it. WORKS

SELECT id, name, COUNT(project_employees.employee_id) as 'Num employees'
FROM projects
JOIN project_employees ON id = project_employees.project_id
GROUP BY id, name
ORDER BY 'Num of employees'
LIMIT 1;
