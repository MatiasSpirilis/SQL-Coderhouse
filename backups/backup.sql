CREATE DATABASE  IF NOT EXISTS `coderhouse_hr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coderhouse_hr`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: coderhouse_hr
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Argentina'),(2,'Brazil'),(3,'Chile'),(4,'Uruguay'),(5,'Paraguay'),(6,'Peru'),(7,'Ecuador'),(8,'Colombia'),(9,'Bolivia'),(10,'Venezuela');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Human Resources',1),(2,'Finance',2),(3,'Sales',3),(4,'Marketing',4),(5,'IT',5),(6,'Administration',6),(7,'Customer Service',7),(8,'Research and Development',8),(9,'Quality Assurance',9),(10,'Operations',10);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_audit`
--

DROP TABLE IF EXISTS `employee_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `operation_date` datetime DEFAULT NULL,
  `operation_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_audit_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_audit`
--

LOCK TABLES `employee_audit` WRITE;
/*!40000 ALTER TABLE `employee_audit` DISABLE KEYS */;
INSERT INTO `employee_audit` VALUES (1,29,'Juan','Pérez','juan.perez@example.com',1,50000.00,1,'2024-04-26','2024-04-26 19:25:30','INSERT'),(2,1,'Pablo','Baldor','chp@example.com',1,87675.00,1,'2014-12-13','2024-05-24 19:50:40','UPDATE');
/*!40000 ALTER TABLE `employee_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `job_id` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `job_id` (`job_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Pablo','Baldor','chp@example.com',1,87675.00,1,'2014-12-13'),(2,'Maria','Silva','mariasilva@example.com',2,65138.00,2,'2013-06-30'),(3,'Pedro','García','pedrogarcia@example.com',3,62667.00,3,'2012-08-19'),(4,'Ana','Rodriguez','anarodriguez@example.com',4,67921.00,4,'2012-09-05'),(5,'Lucas','Fernández','lucasfernandez@example.com',5,51604.00,5,'2015-06-29'),(6,'Camila','Gonzalez','gcz@example.com',NULL,54259.00,5,'2014-06-03'),(8,'Juan Pablo','López','juanpablolopez@example.com',7,66481.00,7,'2015-08-18'),(9,'Diego','Sánchez','diegosanchez@example.com',6,69629.00,6,'2024-11-19'),(10,'Valeria','Martinez','valeriamartinez@example.com',7,98703.00,7,'2022-07-15'),(11,'Andrés','López','andreslopez@example.com',8,84629.00,8,'2013-01-13'),(12,'Carolina','Gomez','carolinagomez@example.com',9,77035.00,9,'2017-07-25'),(13,'Juan','Hernández','jhernandez@example.com',10,81288.00,10,'2023-09-17'),(14,'Luis','Perez','lpz@example.com',NULL,75335.00,10,'2010-11-11'),(15,'Federico','López','federicolopez@example.com',2,82811.00,2,'2018-03-05'),(16,'Luisa','Martínez','luisamartinez@example.com',3,88052.00,3,'2018-04-17'),(17,'Gabriel','Fernández','gabrielfernandez@example.com',5,91827.00,5,'2011-12-08'),(18,'Sofía','González','sofiagonzalez@example.com',9,94980.00,9,'2024-10-19'),(19,'Martín','Díaz','martindiaz@example.com',7,99420.00,7,'2018-03-14'),(20,'Valentina','Herrera','valentinaherrera@example.com',10,62160.00,10,'2021-08-05'),(21,'Joaquín','Rojas','joaquinrojas@example.com',6,62540.00,6,'2013-05-15'),(22,'Marina','Alvarez','marinaalvarez@example.com',4,76223.00,4,'2022-01-26'),(23,'Matías','Torres','matiastorres@example.com',8,93493.00,8,'2015-04-01'),(24,'Paula','Sosa','paulasosa@example.com',1,88796.00,1,'2015-01-09'),(25,'Nicolás','Ramírez','nicolasramirez@example.com',3,63502.00,3,'2019-05-18'),(26,'Elena','Luna','elenaluna@example.com',5,51123.00,5,'2011-10-26'),(27,'Alejandro','Castro','alejandrocastro@example.com',10,65110.00,10,'2020-12-14'),(28,'Clara','Morales','claramorales@example.com',2,72183.00,2,'2014-04-26'),(29,'Juan','Pérez','juan.perez@example.com',1,50000.00,1,'2024-04-26');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_insert_employee_audit` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
    INSERT INTO employee_audit (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date, operation_date, operation_type)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name, NEW.email, NEW.job_id, NEW.salary, NEW.department_id, NEW.hire_date, NOW(), 'INSERT');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_employee_audit` AFTER UPDATE ON `employees` FOR EACH ROW BEGIN
    INSERT INTO employee_audit (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date, operation_date, operation_type)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name, NEW.email, NEW.job_id, NEW.salary, NEW.department_id, NEW.hire_date, NOW(), 'UPDATE');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_delete_employee_audit` AFTER DELETE ON `employees` FOR EACH ROW BEGIN
    INSERT INTO employee_audit (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date, operation_date, operation_type)
    VALUES (OLD.employee_id, OLD.first_name, OLD.last_name, OLD.email, OLD.job_id, OLD.salary, OLD.department_id, OLD.hire_date, NOW(), 'DELETE');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `job_title` varchar(255) NOT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Software Engineer',50000.00,100000.00),(2,'Database Administrator',45000.00,90000.00),(3,'Sales Manager',55000.00,110000.00),(4,'Marketing Specialist',48000.00,95000.00),(5,'Software Tester',40000.00,80000.00),(6,'System Analyst',48000.00,95000.00),(7,'Network Administrator',45000.00,90000.00),(8,'Customer Support Manager',55000.00,110000.00),(9,'Research Analyst',50000.00,100000.00),(10,'Operations Supervisor',48000.00,95000.00);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Av. Libertad 900','Mar del Plata','Buenos Aires',1),(2,'Setor Sol Nascente 800','São Paulo','São Paulo',2),(3,'Formosa 5800','Santiago','Metropolitana',3),(4,'La Rioja 6500','Montevideo','Montevideo',4),(5,'Catamarca 6300','Asunción','Central',5),(6,'Av. Los Incas 1200','Lima','Lima',6),(7,'Av. Amazonas 600','Quito','Pichincha',7),(8,'Calle 10 de Agosto 2200','Bogotá','Cundinamarca',8),(9,'Av. América 1500','La Paz','La Paz',9),(10,'Av. Bolívar 900','Caracas','Distrito Capital',10);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_empleados`
--

DROP TABLE IF EXISTS `vista_empleados`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_empleados_antiguedad`
--

DROP TABLE IF EXISTS `vista_empleados_antiguedad`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_antiguedad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_antiguedad` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `hire_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_empleados_departamento_pais`
--

DROP TABLE IF EXISTS `vista_empleados_departamento_pais`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_departamento_pais`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_departamento_pais` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `department_name`,
 1 AS `country_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_empleados_dos`
--

DROP TABLE IF EXISTS `vista_empleados_dos`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_dos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_dos` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `salary`,
 1 AS `pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_empleados_rangos_salarios`
--

DROP TABLE IF EXISTS `vista_empleados_rangos_salarios`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_rangos_salarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_rangos_salarios` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `salary`,
 1 AS `rango_salarial`,
 1 AS `orden_rango`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'coderhouse_hr'
--

--
-- Dumping routines for database 'coderhouse_hr'
--
/*!50003 DROP FUNCTION IF EXISTS `get_avg_salary_by_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_avg_salary_by_country`(pais VARCHAR(255)) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_max_salary_per_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_salary_per_department`(department_id_param INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE max_salary DECIMAL(10, 2);

    SELECT MAX(salary)
    INTO max_salary
    FROM employees
    WHERE department_id = department_id_param;

    RETURN max_salary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_by_job` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_by_job`(IN job_name VARCHAR(255))
BEGIN
    SELECT e.first_name, e.last_name, j.job_title
    FROM employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
    WHERE j.job_title = job_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_by_loc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_by_loc`(IN location VARCHAR(255))
BEGIN
    SELECT e.first_name, e.last_name, d.department_name, l.city, c.country_name AS Pais
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    INNER JOIN location l ON d.location_id = l.location_id
    INNER JOIN countries c ON l.country_id = c.country_id
    WHERE d.department_name = location OR l.city = location OR c.country_name = location;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_empleados`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados` AS select `employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name` from `employees` where (`employees`.`salary` > 50000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_empleados_antiguedad`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_antiguedad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_antiguedad` AS select `employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name`,`employees`.`hire_date` AS `hire_date` from `employees` where ((to_days(curdate()) - to_days(`employees`.`hire_date`)) > 3650) order by `employees`.`hire_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_empleados_departamento_pais`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_departamento_pais`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_departamento_pais` AS select `e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`d`.`department_name` AS `department_name`,`c`.`country_name` AS `country_name` from (((`employees` `e` join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) join `location` `l` on((`d`.`location_id` = `l`.`location_id`))) join `countries` `c` on((`l`.`country_id` = `c`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_empleados_dos`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_dos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_dos` AS select `e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`salary` AS `salary`,`c`.`country_name` AS `pais` from ((`employees` `e` join `location` `l` on((`e`.`department_id` = `l`.`location_id`))) join `countries` `c` on((`l`.`country_id` = `c`.`country_id`))) where ((`e`.`salary` < 75000) and ((`c`.`country_name` = 'Argentina') or (`c`.`country_name` = 'Brasil') or (`c`.`country_name` = 'Uruguay') or (`c`.`country_name` = 'Paraguay'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_empleados_rangos_salarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_rangos_salarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_rangos_salarios` AS select `employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name`,`employees`.`salary` AS `salary`,(case when (`employees`.`salary` < 30000) then 'Menos de 30k' when (`employees`.`salary` between 30000 and 49999) then '30k - 50k' when (`employees`.`salary` between 50000 and 74999) then '50k - 75k' when (`employees`.`salary` between 75000 and 99999) then '75k - 100k' else 'Más de 100k' end) AS `rango_salarial`,(case when (`employees`.`salary` < 30000) then 1 when (`employees`.`salary` between 30000 and 49999) then 2 when (`employees`.`salary` between 50000 and 74999) then 3 when (`employees`.`salary` between 75000 and 99999) then 4 else 5 end) AS `orden_rango` from `employees` order by (case when (`employees`.`salary` < 30000) then 1 when (`employees`.`salary` between 30000 and 49999) then 2 when (`employees`.`salary` between 50000 and 74999) then 3 when (`employees`.`salary` between 75000 and 99999) then 4 else 5 end) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 19:51:44
