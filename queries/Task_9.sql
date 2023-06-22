SELECT clients.id, clients.`name` as 'client name', employees.`name` as 'sales employee name', GROUP_CONCAT(projects.`name`) FROM clients
JOIN employees ON clients.sales_employee_id = employees.id
JOIN projects ON projects.client_id = clients.id
GROUP BY client_id
;
