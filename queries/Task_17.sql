SELECT projects.name, employees.name as lead_employee_id  FROM projects 
JOIN employees ON projects.lead_employee_id = employees.id
;

SELECT projects.name, GROUP_CONCAT(employees.`name`) as 'delivery employees' FROM projects
JOIN project_employees ON projects.id = project_employees.project_id
JOIN employees ON project_employees.employee_id = employees.id
JOIN access ON employees.id = access.employee_id
WHERE access.role = 'delivery'
GROUP BY projects.name
;
