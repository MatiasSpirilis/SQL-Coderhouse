# Documentación del Modelo de Base de Datos

## Descripción del Modelo

El modelo de base de datos proporcionado está diseñado para gestionar información relacionada con una empresa u organización. Contiene tablas para almacenar datos sobre países, ubicaciones, departamentos, puestos de trabajo y empleados. A continuación se presenta una descripción detallada de cada tabla y sus campos, así como las relaciones entre ellas.

### Tabla **countries**
Esta tabla almacena información sobre los países.

- **country_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Tipo de clave: PRIMARY KEY, AUTO_INCREMENT
  - Descripción: Identificador único del país.
- **country_name**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Nombre del país.

### Tabla **location**
La tabla location contiene información detallada sobre las ubicaciones de la empresa, como direcciones y ciudades.

- **location_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Tipo de clave: PRIMARY KEY, AUTO_INCREMENT
  - Descripción: Identificador único de la ubicación.
- **street_address**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Dirección de la ubicación.
- **city**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Ciudad de la ubicación.
- **state_province**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Provincia o estado de la ubicación.
- **country_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Clave foránea que referencia el ID del país en la tabla "countries".

### Tabla **departments**
Esta tabla almacena datos sobre los departamentos de la empresa.

- **department_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Tipo de clave: PRIMARY KEY, AUTO_INCREMENT
  - Descripción: Identificador único del departamento.
- **department_name**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Nombre del departamento.
- **location_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Clave foránea que referencia el ID de la ubicación en la tabla "location".

### Tabla **jobs**
La tabla jobs contiene información sobre los puestos de trabajo disponibles en la empresa.

- **job_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Tipo de clave: PRIMARY KEY, AUTO_INCREMENT
  - Descripción: Identificador único del puesto de trabajo.
- **job_title**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Título del puesto de trabajo.
- **min_salary**: 
  - Tipo de dato: DECIMAL(10, 2)
  - Longitud: -
  - Descripción: Salario mínimo para el trabajo.
- **max_salary**: 
  - Tipo de dato: DECIMAL(10, 2)
  - Longitud: -
  - Descripción: Salario máximo para el trabajo.

### Tabla **employees**
Esta tabla almacena detalles sobre los empleados de la empresa.

- **employee_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Tipo de clave: PRIMARY KEY, AUTO_INCREMENT
  - Descripción: Identificador único del empleado.
- **first_name**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Nombre del empleado.
- **last_name**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Apellido del empleado.
- **email**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Tipo de clave: UNIQUE
  - Descripción: Correo electrónico del empleado.
- **job_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Clave foránea que referencia el ID del trabajo en la tabla "jobs".
- **salary**: 
  - Tipo de dato: DECIMAL(10, 2)
  - Longitud: -
  - Descripción: Salario del empleado.
- **department_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Clave foránea que referencia el ID del departamento en la tabla "departments".

### Tabla **employee_audit**
Esta tabla registra auditorías de empleados, registrando cambios realizados en la tabla `employees`.

- **audit_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Tipo de clave: PRIMARY KEY, AUTO_INCREMENT
  - Descripción: Identificador único de la auditoría de empleado.
- **employee_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Identificador del empleado.
- **first_name**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Nombre del empleado.
- **last_name**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Apellido del empleado.
- **email**: 
  - Tipo de dato: VARCHAR(255)
  - Longitud: 255 caracteres
  - Descripción: Dirección de correo electrónico del empleado.
- **job_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Identificador del puesto de trabajo del empleado.
- **salary**: 
  - Tipo de dato: DECIMAL(10, 2)
  - Longitud: -
  - Descripción: Salario del empleado.
- **department_id**: 
  - Tipo de dato: INT
  - Longitud: -
  - Descripción: Identificador del departamento del empleado.
- **hire_date**: 
  - Tipo de dato: DATE
  - Longitud: -
  - Descripción: Fecha de contratación del empleado.
- **operation_date**: 
  - Tipo de dato: DATETIME
  - Longitud: -
  - Descripción: Fecha y hora de la operación de auditoría.
- **operation_type**: 
  - Tipo de dato: VARCHAR(50)
  - Longitud: 50 caracteres
  - Descripción: Tipo de operación realizada (INSERT, UPDATE, DELETE).


### Relaciones entre Tablas
El modelo de base de datos establece varias relaciones entre las tablas para mantener la integridad referencial de los datos.

- La tabla **location** tiene una relación con la tabla **countries** a través de la columna **country_id**.
- La tabla **departments** está relacionada con la tabla **location** mediante la columna **location_id**.
- La tabla **employees** tiene relaciones con las tablas **jobs** y **departments** a través de las columnas **job_id** y **department_id**, respectivamente.
- La tabla **employee_audit** tiene una relación con la tabla **employees** a través de la columna **employee_id**.

Estas relaciones garantizan que los datos estén correctamente estructurados y relacionados entre sí, lo que facilita la gestión y consulta de la información dentro del sistema.


## Vistas

### vista_empleados
- Muestra los empleados que cobran más de $50,000.

### vista_empleados_dos
- Muestra los empleados que cobran menos de $75,000 en Argentina, Brasil, Uruguay y Paraguay.

### vista_empleados_departamento_pais
- Visualiza la lista de empleados agrupados por departamento y país.

### vista_empleados_antiguedad
- Muestra en orden los empleados que tienen más de 10 años en la empresa.

### vista_empleados_rangos_salarios
- Muestra los empleados agrupados por rangos de salarios, ordenados por rango salarial descendente.

## Procedimientos almacenados (Stored Procedures)

### employee_by_job
- Muestra los empleados por título de trabajo.

### employee_by_loc
- Muestra los empleados por ubicación (departamento, ciudad o país).

## Funciones

### get_avg_salary_by_country
- Calcula el salario promedio por país.

### get_max_salary_per_department
- Obtiene el salario máximo por departamento.

## Triggers

### trg_insert_employee_audit
- Registra datos en la tabla de auditoría cuando se inserta un nuevo empleado en la tabla `employees`.

## Roles

- 'web_admin'
- 'web_reader'
- 'web_writer'

## Permisos

- `web_admin`: Todos los permisos en la base de datos `web_db`.
- `web_reader`: Permisos de SELECT en la base de datos `web_db`.
- `web_writer`: Permisos de INSERT, UPDATE y DELETE en la base de datos `web_db`.

## Usuarios y Asignación de Roles

- `admin_user`@`localhost` con contraseña `admin_pass`: Asignado el rol `web_admin`.
- `reader_user1`@`localhost` con contraseña `reader1_pass`: Asignado el rol `web_reader`.
- `reader_user2`@`localhost` con contraseña `reader2_pass`: Asignado el rol `web_reader`.
- `writer_user1`@`localhost` con contraseña `writer1_pass`: Asignado el rol `web_writer`.

