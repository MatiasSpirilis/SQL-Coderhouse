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