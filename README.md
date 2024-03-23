**Markdown:**

# Documentación del Modelo de Base de Datos

## Descripción del Modelo

El modelo de base de datos proporcionado está diseñado para gestionar información relacionada con una empresa o una organización. Contiene tablas para almacenar datos sobre países, ubicaciones, departamentos, puestos de trabajo y empleados. A continuación se presenta una descripción detallada de cada tabla y sus campos, así como las relaciones entre ellas.

Tabla **countries**
Esta tabla almacena información sobre los países.

- **country_id**: Identificador único del país (clave primaria).
- **country_name**: Nombre del país.

Tabla **location**
La tabla location contiene información detallada sobre las ubicaciones de la empresa, como direcciones y ciudades.

- **location_id**: Identificador único de la ubicación (clave primaria).
- **street_address**: Dirección de la ubicación.
- **city**: Ciudad donde se encuentra la ubicación (no puede ser nulo).
- **state_province**: Estado o provincia de la ubicación.
- **country_id**: Clave externa que hace referencia al country_id en la tabla countries.

Tabla **departments**
Esta tabla almacena datos sobre los departamentos de la empresa.

- **department_id**: Identificador único del departamento (clave primaria).
- **department_name**: Nombre del departamento.
- **location_id**: Clave externa que hace referencia al location_id en la tabla location.

Tabla **jobs**
La tabla jobs contiene información sobre los puestos de trabajo disponibles en la empresa.

- **job_id**: Identificador único del puesto de trabajo (clave primaria).
- **job_title**: Título del puesto de trabajo.
- **min_salary**: Salario mínimo del puesto de trabajo.
- **max_salary**: Salario máximo del puesto de trabajo.

Tabla **employees**
Esta tabla almacena detalles sobre los empleados de la empresa.

- **employee_id**: Identificador único del empleado (clave primaria).
- **first_name**: Primer nombre del empleado.
- **last_name**: Apellido del empleado.
- **email**: Dirección de correo electrónico única del empleado (no puede ser nulo).
- **job_id**: Clave externa que hace referencia al job_id en la tabla jobs.
- **salary**: Salario del empleado.
- **department_id**: Clave externa que hace referencia al department_id en la tabla departments.

Relaciones entre Tablas
El modelo de base de datos establece varias relaciones entre las tablas para mantener la integridad referencial de los datos.

La tabla **location** tiene una relación con la tabla **countries** a través de la columna **country_id**.
La tabla **departments** está relacionada con la tabla **location** mediante la columna **location_id**.
La tabla **employees** tiene relaciones con las tablas **jobs** y **departments** a través de las columnas **job_id** y **department_id**, respectivamente.
Estas relaciones garantizan que los datos estén correctamente estructurados y relacionados entre sí, lo que facilita la gestión y consulta de la información dentro del sistema.