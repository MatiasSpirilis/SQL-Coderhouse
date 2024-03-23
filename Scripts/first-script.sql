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

-- Agrego las relaciones -- 

ALTER TABLE location
ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);

ALTER TABLE departments
ADD FOREIGN KEY (location_id) REFERENCES location(location_id);

ALTER TABLE employees
ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id),
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);



-- Inserto info en las tablas --

INSERT INTO countries (country_name) VALUES ('Argentina');
INSERT INTO countries (country_name) VALUES ('Brazil');
INSERT INTO countries (country_name) VALUES ('Chile');
INSERT INTO countries (country_name) VALUES ('Uruguay');
INSERT INTO countries (country_name) VALUES ('Paraguay');

INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Av. Libertad 900', 'Mar del Plata', 'Buenos Aires', 1);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Setor Sol Nascente 800', 'São Paulo', 'São Paulo', 2);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Formosa 5800', 'Santiago', 'Metropolitana', 3);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('La Rioja 6500', 'Montevideo', 'Montevideo', 4);
INSERT INTO location (street_address, city, state_province, country_id) VALUES ('Catamarca 6300', 'Asunción', 'Central', 5);

INSERT INTO departments (department_name, location_id) VALUES ('Human Resources', 1);
INSERT INTO departments (department_name, location_id) VALUES ('Finance', 2);
INSERT INTO departments (department_name, location_id) VALUES ('Sales', 3);
INSERT INTO departments (department_name, location_id) VALUES ('Marketing', 4);
INSERT INTO departments (department_name, location_id) VALUES ('IT', 5);

INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Software Engineer', 50000, 100000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Database Administrator', 45000, 90000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Sales Manager', 55000, 110000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Marketing Specialist', 48000, 95000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Software Tester', 40000, 80000);

INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Pablo', 'Chp', 'chp@example.com', 1, 75000, 1);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Maria', 'Silva', 'mariasilva@example.com', 2, 60000, 2);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Pedro', 'García', 'pedrogarcia@example.com', 3, 70000, 3);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Ana', 'Rodriguez', 'anarodriguez@example.com', 4, 55000, 4);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Lucas', 'Fernández', 'lucasfernandez@example.com', 5, 48000, 5);
INSERT INTO employees (first_name, last_name, email, job_id, salary, department_id) VALUES ('Camila', 'Gonzalez', 'gcz@example.com', NULL, 0, 5);

/*
SELECT * FROM employees e
INNER JOIN jobs j	
ON e.job_id = j.job_id
ORDER BY e.salary DESC

SELECT * FROM employees e
LEFT JOIN jobs j	
ON e.job_id = j.job_id

SELECT e.first_name, e.last_name, e.email, c.country_name FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN location l
ON d.location_id = l.location_id
INNER JOIN countries c
ON l.country_id = c.country_id 
WHERE c.country_name = 'Argentina' OR c.country_name = 'Chile'
*/
