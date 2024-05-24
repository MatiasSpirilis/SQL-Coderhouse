DROP DATABASE IF EXISTS coderhouse_hr;
CREATE DATABASE coderhouse_hr ;

USE coderhouse_hr ;

-- CREACION DE TABLAS --

CREATE TABLE countries (
    country_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(255) NOT NULL
);

CREATE TABLE location (
    location_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    street_address VARCHAR(255),
    city VARCHAR(255) NOT NULL,
    state_province VARCHAR(255),
    country_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(255) NOT NULL,
    location_id INT
);

CREATE TABLE jobs (
   job_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   job_title VARCHAR(255) NOT NULL,
   min_salary DECIMAL(10, 2),
   max_salary DECIMAL(10, 2)
);

CREATE TABLE employees (
   employee_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(255),
   last_name VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL UNIQUE,
   job_id INT, 
   salary DECIMAL (10,2), 
   department_id INT
);

-- Agrego campo hire_date para saber cuando fueron contratados --

ALTER TABLE employees
ADD hire_date DATE;

-- Agrego fechas hire_date randomizadas entre 2010 y 2024 --

UPDATE employees
SET hire_date = DATE(FROM_UNIXTIME(
    UNIX_TIMESTAMP('2010-01-01') + 
    FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31') - UNIX_TIMESTAMP('2010-01-01')))
));

SET SQL_SAFE_UPDATES = 0;


-- Agrego las relaciones -- 

ALTER TABLE location
ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);

ALTER TABLE departments
ADD FOREIGN KEY (location_id) REFERENCES location(location_id);

ALTER TABLE employees
ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id),
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);



-- Inserto info en las tablas --
USE coderhouse_hr;
INSERT INTO countries (country_name) VALUES ('Argentina');
INSERT INTO countries (country_name) VALUES ('Brazil');
INSERT INTO countries (country_name) VALUES ('Chile');
INSERT INTO countries (country_name) VALUES ('Uruguay');
INSERT INTO countries (country_name) VALUES ('Paraguay');
INSERT INTO countries (country_name) VALUES ('Peru');
INSERT INTO countries (country_name) VALUES ('Ecuador');
INSERT INTO countries (country_name) VALUES ('Colombia');
INSERT INTO countries (country_name) VALUES ('Bolivia');
INSERT INTO countries (country_name) VALUES ('Venezuela');

INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Av. Libertad 900', 'Mar del Plata', 'Buenos Aires', 1);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Setor Sol Nascente 800', 'São Paulo', 'São Paulo', 2);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Formosa 5800', 'Santiago', 'Metropolitana', 3);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('La Rioja 6500', 'Montevideo', 'Montevideo', 4);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Catamarca 6300', 'Asunción', 'Central', 5);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Av. Los Incas 1200', 'Lima', 'Lima', 6);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Av. Amazonas 600', 'Quito', 'Pichincha', 7);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Calle 10 de Agosto 2200', 'Bogotá', 'Cundinamarca', 8);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Av. América 1500', 'La Paz', 'La Paz', 9);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Av. Bolívar 900', 'Caracas', 'Distrito Capital', 10);

INSERT INTO departments (department_name, location_id) VALUES ('Human Resources', 1);
INSERT INTO departments (department_name, location_id) VALUES ('Finance', 2);
INSERT INTO departments (department_name, location_id) VALUES ('Sales', 3);
INSERT INTO departments (department_name, location_id) VALUES ('Marketing', 4);
INSERT INTO departments (department_name, location_id) VALUES ('IT', 5);
INSERT INTO departments (department_name, location_id) VALUES ('Administration', 6);
INSERT INTO departments (department_name, location_id) VALUES ('Customer Service', 7);
INSERT INTO departments (department_name, location_id) VALUES ('Research and Development', 8);
INSERT INTO departments (department_name, location_id) VALUES ('Quality Assurance', 9);
INSERT INTO departments (department_name, location_id) VALUES ('Operations', 10);

INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Software Engineer', 50000, 100000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Database Administrator', 45000, 90000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Sales Manager', 55000, 110000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Marketing Specialist', 48000, 95000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Software Tester', 40000, 80000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('System Analyst', 48000, 95000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Network Administrator', 45000, 90000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Customer Support Manager', 55000, 110000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Research Analyst', 50000, 100000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Operations Supervisor', 48000, 95000);

INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Pablo', 'Chp', 'chp@example.com', 1, 75000, 1);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Maria', 'Silva', 'mariasilva@example.com', 2, 60000, 2);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Pedro', 'García', 'pedrogarcia@example.com', 3, 70000, 3);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Ana', 'Rodriguez', 'anarodriguez@example.com', 4, 55000, 4);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Lucas', 'Fernández', 'lucasfernandez@example.com', 5, 48000, 5);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Camila', 'Gonzalez', 'gcz@example.com', NULL, 0, 5);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Diego', 'Sánchez', 'diegosanchez@example.com', 6, 70000, 6);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Valeria', 'Martinez', 'valeriamartinez@example.com', 7, 60000, 7);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Andrés', 'López', 'andreslopez@example.com', 8, 75000, 8);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Carolina', 'Gomez', 'carolinagomez@example.com', 9, 55000, 9);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Juan', 'Hernández', 'jhernandez@example.com', 10, 48000, 10);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Luis', 'Perez', 'lpz@example.com', NULL, 0, 10);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Federico', 'López', 'federicolopez@example.com', 2, 60000, 2);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Luisa', 'Martínez', 'luisamartinez@example.com', 3, 70000, 3);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Gabriel', 'Fernández', 'gabrielfernandez@example.com', 5, 48000, 5);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Sofía', 'González', 'sofiagonzalez@example.com', 9, 55000, 9);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Martín', 'Díaz', 'martindiaz@example.com', 7, 60000, 7);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Valentina', 'Herrera', 'valentinaherrera@example.com', 10, 48000, 10);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Joaquín', 'Rojas', 'joaquinrojas@example.com', 6, 70000, 6);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Marina', 'Alvarez', 'marinaalvarez@example.com', 4, 55000, 4);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Matías', 'Torres', 'matiastorres@example.com', 8, 75000, 8);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Paula', 'Sosa', 'paulasosa@example.com', 1, 75000, 1);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Nicolás', 'Ramírez', 'nicolasramirez@example.com', 3, 70000, 3);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Elena', 'Luna', 'elenaluna@example.com', 5, 48000, 5);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Alejandro', 'Castro', 'alejandrocastro@example.com', 10, 48000, 10);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Clara', 'Morales', 'claramorales@example.com', 2, 60000, 2);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Juan Pablo', 'López', 'juanpablolopez@example.com', 7, 60000, 7);

SELECT *
FROM employees
ORDER BY employee_id;


-- Modifico con UPDATE para que todos tengan salary unicos -- 

UPDATE employees
SET salary = FLOOR(50000 + RAND() * 50000)
WHERE employee_id > 0;

SELECT first_name, last_name, salary
FROM employees;

-- Primer vista; muestra los empleados que cobran mas de 50k --

USE coderhouse_hr;
CREATE OR REPLACE VIEW vista_empleados AS
SELECT first_name, last_name
FROM employees
WHERE salary > 50000;

SELECT *
FROM vista_empleados;

-- Segunda vista; muestra los empleados que cobran menos de 75k en Argentina, Brasil, Uruguay y Paraguay --

CREATE OR REPLACE VIEW vista_empleados_dos AS
SELECT e.first_name, e.last_name, e.salary, c.country_name AS pais
FROM employees e
JOIN location l ON e.department_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE e.salary < 75000 AND (c.country_name = 'Argentina' OR c.country_name = 'Brasil' OR c.country_name = 'Uruguay' OR c.country_name = 'Paraguay');

SELECT *
FROM vista_empleados_dos;


-- Tercera vista; podemos visualizar la lista de empleados agrupados por departamento y pais. --

CREATE OR REPLACE VIEW vista_empleados_departamento_pais AS
SELECT e.first_name, e.last_name, d.department_name, c.country_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN location l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

SELECT * FROM vista_empleados_departamento_pais

-- Cuarta vista; donde vemos en orden los empleados que tienen mas de 10 años en la empresa. --

CREATE OR REPLACE VIEW vista_empleados_antiguedad AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) > 3650
ORDER BY hire_date DESC;

SELECT * FROM vista_empleados_antiguedad;

-- Quinta vista; muestra los empleados agrupados por rangos de salarios, ordenados por rango salarial descendente. --

CREATE OR REPLACE VIEW vista_empleados_rangos_salarios AS
SELECT first_name, last_name, salary,
       CASE
           WHEN salary < 30000 THEN 'Menos de 30k'
           WHEN salary BETWEEN 30000 AND 49999 THEN '30k - 50k'
           WHEN salary BETWEEN 50000 AND 74999 THEN '50k - 75k'
           WHEN salary BETWEEN 75000 AND 99999 THEN '75k - 100k'
           ELSE 'Más de 100k'
       END AS rango_salarial,
       CASE
           WHEN salary < 30000 THEN 1
           WHEN salary BETWEEN 30000 AND 49999 THEN 2
           WHEN salary BETWEEN 50000 AND 74999 THEN 3
           WHEN salary BETWEEN 75000 AND 99999 THEN 4
           ELSE 5
       END AS orden_rango
FROM employees
ORDER BY orden_rango DESC;

SELECT * FROM vista_empleados_rangos_salarios;

-- SP para ver la cantidad de empleados por trabajo --

DELIMITER //
CREATE PROCEDURE employee_by_job (IN job_name VARCHAR(255))
BEGIN
    SELECT e.first_name, e.last_name, j.job_title
    FROM employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
    WHERE j.job_title = job_name;
END //
DELIMITER ;

CALL employee_by_job('Software Engineer');

-- SP para ver la cantidad de empleados por ubicacion --

DELIMITER //
CREATE PROCEDURE employee_by_loc(IN location VARCHAR(255))
BEGIN
    SELECT e.first_name, e.last_name, d.department_name, l.city, c.country_name AS Pais
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    INNER JOIN location l ON d.location_id = l.location_id
    INNER JOIN countries c ON l.country_id = c.country_id
    WHERE d.department_name = location OR l.city = location OR c.country_name = location;
END //
DELIMITER ;

CALL employee_by_loc('Brazil');


-- Function para calcular salario promedio por pais --

DELIMITER //

CREATE FUNCTION get_avg_salary_by_country(pais VARCHAR(255))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE promedio_salario DECIMAL(10, 2);
    
    SELECT AVG(e.salary)
    INTO promedio_salario
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    INNER JOIN location l ON d.location_id = l.location_id
    INNER JOIN countries c ON l.country_id = c.country_id
    WHERE c.country_name = pais;

    RETURN promedio_salario;
END //

DELIMITER ;

SELECT get_avg_salary_by_country('Argentina');


-- Function para obtener el salario maximo por department --

DELIMITER //

CREATE FUNCTION get_max_salary_per_department(department_id_param INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE max_salary DECIMAL(10, 2);

    SELECT MAX(salary)
    INTO max_salary
    FROM employees
    WHERE department_id = department_id_param;

    RETURN max_salary;
END //

DELIMITER ;


SELECT department_id, department_name, get_max_salary_per_department(department_id) AS max_salary
FROM departments;

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

-- Creación del trigger que registrará datos en la tabla de auditoría cuando se haga un DELETE en la tabla employees --

DELIMITER //

CREATE TRIGGER trg_delete_employee_audit
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date, operation_date, operation_type)
    VALUES (OLD.employee_id, OLD.first_name, OLD.last_name, OLD.email, OLD.job_id, OLD.salary, OLD.department_id, OLD.hire_date, NOW(), 'DELETE');
END;
//

DELIMITER ;


-- Creación del trigger que registrará datos en la tabla de auditoría cuando se haga un UPDATE en la tabla employees --

DELIMITER //

CREATE TRIGGER trg_update_employee_audit
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date, operation_date, operation_type)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name, NEW.email, NEW.job_id, NEW.salary, NEW.department_id, NEW.hire_date, NOW(), 'UPDATE');
END;
//

DELIMITER ;

-- Agrego un employee nuevo --

INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id, hire_date) VALUES ('Juan', 'Pérez', 'juan.perez@example.com', 1, 50000.00, 1, '2024-04-26');

-- Chequeo la tabla de auditoria --

SELECT * FROM employee_audit;  -- Aparece Juan Perez, nueva persona agregada a la DB --

-- Creo roles

CREATE ROLE 'web_admin';
CREATE ROLE 'web_reader';
CREATE ROLE 'web_writer';

-- Asigno permisos a los roles

GRANT ALL ON coderhouse_hr.* TO 'web_admin';
GRANT SELECT ON coderhouse_hr.* TO 'web_reader';
GRANT INSERT, UPDATE, DELETE ON coderhouse_hr.* TO 'web_writer';

-- Creo usuarios y asigno roles

CREATE USER 'admin_user'@'%' IDENTIFIED BY 'admin_pass';
CREATE USER 'reader_user1'@'%' IDENTIFIED BY 'reader1_pass';
CREATE USER 'reader_user2'@'%' IDENTIFIED BY 'reader2_pass';
CREATE USER 'writer_user1'@'%' IDENTIFIED BY 'writer1_pass';

GRANT 'web_admin' TO 'admin_user'@'%';
GRANT 'web_reader' TO 'reader_user1'@'%';
GRANT 'web_reader' TO 'reader_user2'@'%';
GRANT 'web_writer' TO 'writer_user1'@'%';

GRANT ALL ON coderhouse_hr.* TO 'admin_user'@'%';
GRANT SELECT ON coderhouse_hr.* TO 'reader_user1'@'%';
GRANT SELECT ON coderhouse_hr.* TO 'reader_user2'@'%';
GRANT INSERT, UPDATE, DELETE ON coderhouse_hr.* TO 'writer_user1';
FLUSH PRIVILEGES;
