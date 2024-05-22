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
