DELIMITER $$
DROP PROCEDURE IF EXISTS seeder_script $$
CREATE PROCEDURE seeder_script()
BEGIN
	START TRANSACTION;
    
    -- Inserting data into the employees table
INSERT INTO employees (name, salary, national_insurance_number)
VALUES
  ('John Doe', 50000, 'AB34567891C'),
  ('Jane Smith', 60000, 'CD7654321V'),
  ('Alice Johnson', 55000, 'DJ678912P'),
  ('Gordon Davidson', 55000, 'DF386623P'),
  ('Adam Brown', 55000, 'DF679252D');

-- Inserting data into the access table
INSERT INTO access (employee_id, role)
VALUES
  (1, 'hr'),
  (2, 'management'),
  (3, 'delivery');

-- Inserting data into the clients table
INSERT INTO clients (name, address, phone, sales_employee_id)
VALUES
  ('ABC Company', '123 Main St, Anytown', '555-1234', 1),
  ('XYZ Corporation', '456 Elm St, Othertown', '555-5678', 1),
  ('Acme Inc.', '789 Oak St, Anothertown', '555-9012', 1),
  ('Global Enterprises', '321 Pine St, Somewhere', '555-3456', 1),
  ('Tech Solutions', '987 Maple St, Overthere', '555-7890', 1),
  ('Innovative Industries', '654 Cedar St, Outoftown', '555-2345', 1);

-- Inserting data into the projects table
INSERT INTO projects (client_id, name, value, technologies, completed_at, lead_employee_id)
VALUES
  (1, 'Project A', 1000000, 'Java, SQL', '2023-06-15 10:00:00', 4),
  (2, 'Project B', 2000000, 'Python, HTML', NULL, 4),
  (3, 'Project C', 1500000, 'C#, MySQL', '2023-06-30 15:30:00', 5),
  (4, 'Project D', 3000000, 'JavaScript, CSS', NULL, 5),
  (5, 'Project E', 3500000, 'JavaScript, CSS', NULL, 5);

-- Inserting data into the project_employees table
INSERT INTO project_employees (project_id, employee_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 4),
  (4, 5);

-- Inserting data into the project_employee_logs table
INSERT INTO project_employee_logs (project_id, employee_id, left_at)
VALUES
  (1, 1, '2023-06-20 12:00:00'),
  (1, 2, '2023-06-21 14:30:00'),
  (2, 1, '2023-06-19 11:45:00'),
  (3, 4, '2023-06-25 09:15:00');

-- check the number of affected rows
	GET DIAGNOSTICS @rows = ROW_COUNT;
	IF @rows = 0 THEN
		-- Rollback if error
		ROLLBACK;
		SELECT 'Transaction rolled back due to an error.';
	ELSE
		-- If error free
		COMMIT;
		SELECT 'Transaction committed successfully.';
	END IF; 
	
END $$
DELIMITER ;
CALL seeder_script();		