-- Creo una vista que muestra los empleados que cobran mas de 50k --
USE coderhouse_hr;
CREATE OR REPLACE VIEW vista_empleados AS
SELECT first_name, last_name
FROM employees
WHERE salary > 50000;

-- SELECT * FROM vista_empleados;

-- Creo una vista que muestra los empleados que cobran menos de 75k en Argentina, Brasil, Uruguay y Paraguay --

CREATE OR REPLACE VIEW vista_empleados_dos AS
SELECT e.first_name, e.last_name, e.salary, c.country_name AS pais
FROM employees e
JOIN location l ON e.department_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE e.salary < 75000 AND (c.country_name = 'Argentina' OR c.country_name = 'Brasil' OR c.country_name = 'Uruguay' OR c.country_name = 'Paraguay');
