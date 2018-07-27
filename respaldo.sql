-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: examen
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES ('1900463908','Luis','Quito Acosta',1244567588,'Sucre'),('1900553908','Leoanrdo','Paredes Rivas',1234567898,'Alamor'),('1900563908','Carlos','Paredes Acosta',1234567588,'Eduardo Kigman');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatura` (
  `codigo_a` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `duracion` varchar(3) NOT NULL,
  PRIMARY KEY (`codigo_a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (11,'Quimica','30H'),(12,'Fisica','04H'),(32,'Ingles','04H');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codigo_c` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (114,'Fisica','Calculo de vectores'),(120,'Calculo','Variables matematicas'),(122,'Quimica','Refuerzo en matematicas');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen` (
  `codigo_ex` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`codigo_ex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
INSERT INTO `examen` VALUES ('100k','2018-02-12'),('103k','2018-04-12'),('1LSk','2017-04-12');
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculan`
--

DROP TABLE IF EXISTS `matriculan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriculan` (
  `codigo_c` tinyint(3) unsigned NOT NULL,
  `dni` varchar(10) NOT NULL,
  KEY `cod_d_idx5` (`codigo_c`),
  KEY `dn_d_idx12` (`dni`),
  CONSTRAINT `cod_d` FOREIGN KEY (`codigo_c`) REFERENCES `curso` (`codigo_c`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dn_d` FOREIGN KEY (`dni`) REFERENCES `alumno` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculan`
--

LOCK TABLES `matriculan` WRITE;
/*!40000 ALTER TABLE `matriculan` DISABLE KEYS */;
INSERT INTO `matriculan` VALUES (114,'1900463908'),(120,'1900553908'),(122,'1900563908');
/*!40000 ALTER TABLE `matriculan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseen`
--

DROP TABLE IF EXISTS `poseen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseen` (
  `codigo_c` tinyint(3) unsigned NOT NULL,
  `codigo_a` tinyint(3) unsigned NOT NULL,
  KEY `cod_c_idx1` (`codigo_c`),
  KEY `cod_a_idx9` (`codigo_a`),
  CONSTRAINT `cod_a` FOREIGN KEY (`codigo_a`) REFERENCES `asignatura` (`codigo_a`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_c` FOREIGN KEY (`codigo_c`) REFERENCES `curso` (`codigo_c`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseen`
--

LOCK TABLES `poseen` WRITE;
/*!40000 ALTER TABLE `poseen` DISABLE KEYS */;
INSERT INTO `poseen` VALUES (114,11),(120,12),(122,32);
/*!40000 ALTER TABLE `poseen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `codigo_p` varchar(5) NOT NULL,
  `enunciado` varchar(150) NOT NULL,
  `respuesta` varchar(150) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `codigo_ex` varchar(4) NOT NULL,
  PRIMARY KEY (`codigo_p`),
  KEY `cod_x_idx30` (`codigo_ex`),
  CONSTRAINT `cod_x` FOREIGN KEY (`codigo_ex`) REFERENCES `examen` (`codigo_ex`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES ('1L023','4-2',' 2','Calculo','1LSK'),('Lk023','4+4',' 8','Calculo','103K'),('Lk123','Calcule el area del siguiente trinagulo',' el area es 4','Calculo','100K');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `dni_P` varchar(10) NOT NULL,
  `titulacion` varchar(15) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`dni_P`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('190045437','ingeniero','Luis','Paredes Rivas','alamor',123456789,'luis.com');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'examen'
--

--
-- Dumping routines for database 'examen'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-27 13:32:34
