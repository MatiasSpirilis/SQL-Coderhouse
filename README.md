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

### Relaciones entre Tablas
El modelo de base de datos establece varias relaciones entre las tablas para mantener la integridad referencial de los datos.

- La tabla **location** tiene una relación con la tabla **countries** a través de la columna **country_id**.
- La tabla **departments** está relacionada con la tabla **location** mediante la columna **location_id**.
- La tabla **employees** tiene relaciones con las tablas **jobs** y **departments** a través de las columnas **job_id** y **department_id**, respectivamente.

Estas relaciones garantizan que los datos estén correctamente estructurados y relacionados entre sí, lo que facilita la gestión y consulta de la información dentro del sistema.
