USE coderhouse_hr;

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