-- Task 9: Get a list of clients, name of the sales employee who with that client and the list of projects that the client has.

-- Task 10: Get the client who has the highest value of projects.
SELECT id, name, SUM(projects.value) AS 'Total Value'
FROM clients
JOIN projects ON id = projects.client_id
GROUP BY id, name
ORDER BY 'Total Value'
LIMIT 1;

-- Task 11: Get the client who has the lowest value of projects.

-- Task 12: Get a list of clients with the average value of their projects.
SELECT id, name, AVG(projects.value) AS 'Average Value'
FROM clients
JOIN projects ON id = projects.client_id
GROUP BY id, name;

-- Task 13: Get a list of sales employees and how much each has made in commission this year.

-- Task 14: Get a list of sales employees who haven't won any clients this year.
SELECT id, name

-- Task 15: Get a list of delivery employees who aren't assigned to a project, 
-- who have previously worked with a technology that is currently being used on 
-- a project and the name of those projects.

-- Task 16: Set a project as completed (completed projects shouldn't show in any lists)

-- Task 17: See a list of projects, the name of the Tech Lead and a list of all 
-- delivery employees assigned to the project.

-- Task 18: See the project with the most delivery employees working on it.
