SELECT id, name, COUNT(project_employees.employee_id) as 'Num employees'
FROM projects
JOIN project_employees ON id = project_employees.project_id
GROUP BY id, name
ORDER BY 'Num of employees'
LIMIT 1;