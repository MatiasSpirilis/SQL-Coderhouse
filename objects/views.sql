-- Primer vista; muestra los empleados que cobran mas de 50k --

USE coderhouse_hr;
CREATE OR REPLACE VIEW vista_empleados AS
SELECT first_name, last_name
FROM employees
WHERE salary > 50000;

--SELECT * FROM vista_empleados;

-- Segunda vista; muestra los empleados que cobran menos de 75k en Argentina, Brasil, Uruguay y Paraguay --

CREATE OR REPLACE VIEW vista_empleados_dos AS
SELECT e.first_name, e.last_name, e.salary, c.country_name AS pais
FROM employees e
JOIN location l ON e.department_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE e.salary < 75000 AND (c.country_name = 'Argentina' OR c.country_name = 'Brasil' OR c.country_name = 'Uruguay' OR c.country_name = 'Paraguay');

-- SELECT * FROM vista_empleados_dos;


-- Tercera vista; podemos visualizar la lista de empleados agrupados por departamento y pais. --

CREATE OR REPLACE VIEW vista_empleados_departamento_pais AS
SELECT e.first_name, e.last_name, d.department_name, c.country_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN location l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

-- SELECT * FROM vista_empleados_departamento_pais

-- Cuarta vista; donde vemos en orden los empleados que tienen mas de 10 años en la empresa. --

CREATE OR REPLACE VIEW vista_empleados_antiguedad AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) > 3650
ORDER BY hire_date DESC;

-- SELECT * FROM vista_empleados_antiguedad;

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