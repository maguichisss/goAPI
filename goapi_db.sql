-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: goapi_db
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Current Database: `goapi_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `goapi_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `goapi_db`;

--
-- Table structure for table `CalendarioPagos`
--

DROP TABLE IF EXISTS `CalendarioPagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarioPagos` (
  `id` int(11) NOT NULL,
  `cuenta_id` varchar(5) NOT NULL,
  `num_pago` int(11) NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `estatus` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CalendarioPagos_1_idx` (`cuenta_id`),
  CONSTRAINT `fk_CalendarioPagos_1` FOREIGN KEY (`cuenta_id`) REFERENCES `Cuentas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarioPagos`
--

LOCK TABLES `CalendarioPagos` WRITE;
/*!40000 ALTER TABLE `CalendarioPagos` DISABLE KEYS */;
INSERT INTO `CalendarioPagos` VALUES (2,'23001',2,15000.00,'2018-12-07','PAGADO'),(3,'23001',3,15000.00,'2018-12-14','PAGADO'),(4,'23001',4,15000.00,'2018-12-21','PAGADO'),(5,'12345',1,18750.00,'2018-12-20','PARCIAL'),(6,'12345',2,18750.00,'2018-12-27','PENDIENTE'),(7,'12345',3,18750.00,'2019-01-03','PENDIENTE'),(8,'12345',4,18750.00,'2019-01-10','PENDIENTE'),(9,'10001',1,37500.00,'2018-12-07','PAGADO'),(10,'10001',2,37500.00,'2018-12-14','PAGADO'),(11,'10001',3,37500.00,'2018-12-21','PARCIAL'),(12,'10001',4,37500.00,'2018-12-28','PENDIENTE'),(13,'89752',1,20000.00,'2019-01-07','ATRASADO'),(14,'89752',2,20000.00,'2019-01-14','PENDIENTE'),(15,'89752',3,20000.00,'2019-01-21','PENDIENTE'),(16,'89752',4,20000.00,'2019-01-28','PENDIENTE');
/*!40000 ALTER TABLE `CalendarioPagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clientes` (
  `id` varchar(7) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES ('ABCDE03','JUANA'),('ASD123','\'JUANA la Cubana\''),('ASDFG08','SANDRA SANCHEZ GONZALEZ'),('HJKLL09','ANGELA GOMEZ MONROY'),('MNOPQ01','GERTRUDIS LOPEZ MARTINEZ'),('NMZXC11','DANIELA HERNANDEZ GUERRERO'),('OPQRS04','ALEIDA SANCHEZ AMOR'),('QRSTU02','FERNANDA JUAREZ LOPEZ'),('QWERT06','ALBA PEREZ TORRES'),('TYUIQ05','LORENA GARCIA ROCHA'),('YUIOP07','ELISEO CHAVEZ OLVERA'),('ZXCVB10','KARLA ENRIQUEZ NAVARRETE');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuentas`
--

DROP TABLE IF EXISTS `Cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuentas` (
  `id` varchar(5) NOT NULL,
  `grupo_id` varchar(5) NOT NULL,
  `estatus` varchar(15) NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `saldo` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_idx` (`grupo_id`),
  CONSTRAINT `fk_Cuentas_1` FOREIGN KEY (`grupo_id`) REFERENCES `Grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuentas`
--

LOCK TABLES `Cuentas` WRITE;
/*!40000 ALTER TABLE `Cuentas` DISABLE KEYS */;
INSERT INTO `Cuentas` VALUES ('10001','XYZW1','DESEMBOLSADA',150000.00,74500.00),('12345','ABCD2','DESEMBOLSADA',75000.00,64500.00),('23001','XYZW1','CERRADA',60000.00,0.00),('89752','GHIJK','DESEMBOLSADA',80000.00,80000.00);
/*!40000 ALTER TABLE `Cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grupos`
--

DROP TABLE IF EXISTS `Grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grupos` (
  `id` varchar(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grupos`
--

LOCK TABLES `Grupos` WRITE;
/*!40000 ALTER TABLE `Grupos` DISABLE KEYS */;
INSERT INTO `Grupos` VALUES ('ABCD2','CHARLIE\'S ANGELS'),('GHIJK','KITTIE'),('XYZW1','POWERPUFF GIRLS');
/*!40000 ALTER TABLE `Grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Miembros`
--

DROP TABLE IF EXISTS `Miembros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Miembros` (
  `grupo_id` varchar(5) NOT NULL,
  `cliente_id` varchar(7) NOT NULL,
  PRIMARY KEY (`grupo_id`,`cliente_id`),
  KEY `fk_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `Grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Miembros`
--

LOCK TABLES `Miembros` WRITE;
/*!40000 ALTER TABLE `Miembros` DISABLE KEYS */;
INSERT INTO `Miembros` VALUES ('XYZW1','ABCDE03'),('ABCD2','ASDFG08'),('GHIJK','HJKLL09'),('XYZW1','MNOPQ01'),('GHIJK','NMZXC11'),('XYZW1','OPQRS04'),('XYZW1','QRSTU02'),('ABCD2','QWERT06'),('ABCD2','TYUIQ05'),('ABCD2','YUIOP07'),('GHIJK','ZXCVB10');
/*!40000 ALTER TABLE `Miembros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transacciones`
--

DROP TABLE IF EXISTS `Transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transacciones` (
  `id` int(11) NOT NULL,
  `cuenta_id` varchar(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Transacciones_1_idx` (`cuenta_id`),
  CONSTRAINT `fk_Transacciones_1` FOREIGN KEY (`cuenta_id`) REFERENCES `Cuentas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transacciones`
--

LOCK TABLES `Transacciones` WRITE;
/*!40000 ALTER TABLE `Transacciones` DISABLE KEYS */;
INSERT INTO `Transacciones` VALUES (1,'23001','2030-11-18 10:36:00',15000.00),(2,'23001','2007-12-18 12:50:00',15000.00),(3,'23001','2014-12-18 13:45:00',15000.00),(4,'23001','2021-12-18 11:35:00',15000.00),(5,'12345','2020-12-18 14:50:00',5000.00),(6,'12345','2021-12-18 15:25:00',5500.00),(7,'10001','2007-12-18 11:34:00',37500.00),(8,'10001','2007-12-18 10:04:00',37500.00),(9,'10001','2007-12-18 18:50:00',-30000.00),(10,'10001','2007-12-18 18:51:00',-7500.00),(11,'10001','2014-12-18 09:59:00',37500.00),(12,'10001','2021-12-18 11:05:00',500.00);
/*!40000 ALTER TABLE `Transacciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-23 12:59:32
