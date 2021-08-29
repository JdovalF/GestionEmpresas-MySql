-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: GestionEmpresa
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
INSERT INTO `Departamento` VALUES (1,'Compras','se encargan de las compras'),(2,'Ventas','se encargan de las ventas'),(3,'Mantenimiento','se encargan del mantenimiento');
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codEmpresa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Empleado_FK_Empresa` (`codEmpresa`),
  CONSTRAINT `Empleado_FK_Empresa` FOREIGN KEY (`codEmpresa`) REFERENCES `Empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'Juan Perez',NULL,1),(2,'Enrique Ruiz',NULL,2),(3,'Marta Mosquera',NULL,1);
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmpleadoDepartamento`
--

DROP TABLE IF EXISTS `EmpleadoDepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmpleadoDepartamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `codEmpleado` int NOT NULL,
  `codDepartamento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EmpleadoDepartamento_FK_Empleado` (`codEmpleado`),
  KEY `EmpleadoDepartamento_FK_Departamento` (`codDepartamento`),
  CONSTRAINT `EmpleadoDepartamento_FK_Departamento` FOREIGN KEY (`codDepartamento`) REFERENCES `Departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EmpleadoDepartamento_FK_Empleado` FOREIGN KEY (`codEmpleado`) REFERENCES `Empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpleadoDepartamento`
--

LOCK TABLES `EmpleadoDepartamento` WRITE;
/*!40000 ALTER TABLE `EmpleadoDepartamento` DISABLE KEYS */;
INSERT INTO `EmpleadoDepartamento` VALUES (1,'Jefe',1,3),(2,'Ayudante',1,2),(3,'Jefe',2,2),(4,'Jefe',3,1);
/*!40000 ALTER TABLE `EmpleadoDepartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `potenciaContratada` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES (1,'Carreour','Supermercado',100.65),(2,'Alcampo','Supermercado',95.06);
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmpresaDepartamento`
--

DROP TABLE IF EXISTS `EmpresaDepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmpresaDepartamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codEmpresa` int NOT NULL,
  `codDepartamento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EmpresaDepartamento_FK_Departamento` (`codDepartamento`),
  KEY `EmpresaDepartamento_FK_Empresa` (`codEmpresa`),
  CONSTRAINT `EmpresaDepartamento_FK_Departamento` FOREIGN KEY (`codDepartamento`) REFERENCES `Departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EmpresaDepartamento_FK_Empresa` FOREIGN KEY (`codEmpresa`) REFERENCES `Empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpresaDepartamento`
--

LOCK TABLES `EmpresaDepartamento` WRITE;
/*!40000 ALTER TABLE `EmpresaDepartamento` DISABLE KEYS */;
INSERT INTO `EmpresaDepartamento` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3);
/*!40000 ALTER TABLE `EmpresaDepartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'GestionEmpresa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 12:25:17
