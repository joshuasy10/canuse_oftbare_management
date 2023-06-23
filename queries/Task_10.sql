SELECT clients.id, clients.name, SUM(projects.value) AS 'Total Value'
FROM clients
JOIN projects ON clients.id = projects.client_id
GROUP BY clients.id, clients.name
ORDER BY `Total Value` DESC
LIMIT 1;