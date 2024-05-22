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


-- Modifico con UPDATE para que todos tengan salary unicos -- 

UPDATE employees
SET salary = FLOOR(50000 + RAND() * 50000)
WHERE employee_id > 0;

SELECT first_name, last_name, salary
FROM employees;