DELIMITER $$
DROP PROCEDURE IF EXISTS init_script $$
CREATE PROCEDURE init_script()
BEGIN
	START TRANSACTION;

	-- part one (employee table)
	CREATE TABLE IF NOT EXISTS employees (
		id SMALLINT AUTO_INCREMENT PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		salary INT UNSIGNED NOT NULL,
		national_insurance_number VARCHAR(9) NOT NULL
	);

	-- part two (access table)

	CREATE TABLE IF NOT EXISTS access (
		id SMALLINT AUTO_INCREMENT PRIMARY KEY,
		employee_id SMALLINT NOT NULL,
		role VARCHAR(50) NOT NULL,
		FOREIGN KEY (employee_id) REFERENCES employees(id)
	);

	-- part three (client table)

	CREATE TABLE IF NOT EXISTS clients (
		id SMALLINT AUTO_INCREMENT PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		address VARCHAR(255) NOT NULL,
		phone VARCHAR(11) NOT NULL,
		FOREIGN KEY (lead_employee_id) REFERENCES employees(id)
	);

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
CALL init_script();			