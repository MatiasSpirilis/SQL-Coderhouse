USE coderhouse_hr;

-- Creo tabla de employee_audit que servira para implementar un trigger -- 

CREATE TABLE employee_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    job_id INT,
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE,
    operation_date DATETIME,
    operation_type VARCHAR(50)
);


-- Creacion del trigger que registrara datos en la tabla de auditoria cuando haga INSERT de employees --

DELIMITER //

CREATE TRIGGER trg_insert_employee_audit
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date, operation_date, operation_type)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name, NEW.email, NEW.job_id, NEW.salary, NEW.department_id, NEW.hire_date, NOW(), 'INSERT');
END;
//

DELIMITER ;

-- Probar crear el trigger sin usar delimiter ni begin/end ya que es uno solo

-- Agrego un employee nuevo --

INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id, hire_date) VALUES ('Juan', 'Pérez', 'juan.perez@example.com', 1, 50000.00, 1, '2024-04-26');

-- Chequeo la tabla de auditoria --

SELECT * FROM employee_audit;  -- Aparece Juan Perez, nueva persona agregada a la DB --

SELECT * FROM employees