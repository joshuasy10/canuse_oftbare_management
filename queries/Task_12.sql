SELECT clients.id, clients.name, AVG(projects.value) AS 'Average Value'
FROM clients
JOIN projects ON clients.id = projects.client_id
GROUP BY clients.id, clients.name;
