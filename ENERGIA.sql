-- MySQL dump 10.13  Distrib 8.0.41, for Linux (aarch64)
--
-- Host: localhost    Database: ENERGIA
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `AR_CONDICIONADO`
--

DROP TABLE IF EXISTS `AR_CONDICIONADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AR_CONDICIONADO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AR_CONDICIONADO`
--

LOCK TABLES `AR_CONDICIONADO` WRITE;
/*!40000 ALTER TABLE `AR_CONDICIONADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `AR_CONDICIONADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BATERIA`
--

DROP TABLE IF EXISTS `BATERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATERIA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BATERIA`
--

LOCK TABLES `BATERIA` WRITE;
/*!40000 ALTER TABLE `BATERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOMBA_AGUA`
--

DROP TABLE IF EXISTS `BOMBA_AGUA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOMBA_AGUA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOMBA_AGUA`
--

LOCK TABLES `BOMBA_AGUA` WRITE;
/*!40000 ALTER TABLE `BOMBA_AGUA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOMBA_AGUA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIMATIZADOR`
--

DROP TABLE IF EXISTS `CLIMATIZADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIMATIZADOR` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIMATIZADOR`
--

LOCK TABLES `CLIMATIZADOR` WRITE;
/*!40000 ALTER TABLE `CLIMATIZADOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIMATIZADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTROLADORA`
--

DROP TABLE IF EXISTS `CONTROLADORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONTROLADORA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTROLADORA`
--

LOCK TABLES `CONTROLADORA` WRITE;
/*!40000 ALTER TABLE `CONTROLADORA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTROLADORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIVERSOS`
--

DROP TABLE IF EXISTS `DIVERSOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIVERSOS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIVERSOS`
--

LOCK TABLES `DIVERSOS` WRITE;
/*!40000 ALTER TABLE `DIVERSOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DIVERSOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GELADEIRA`
--

DROP TABLE IF EXISTS `GELADEIRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GELADEIRA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GELADEIRA`
--

LOCK TABLES `GELADEIRA` WRITE;
/*!40000 ALTER TABLE `GELADEIRA` DISABLE KEYS */;
/*!40000 ALTER TABLE `GELADEIRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVERSOR`
--

DROP TABLE IF EXISTS `INVERSOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVERSOR` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVERSOR`
--

LOCK TABLES `INVERSOR` WRITE;
/*!40000 ALTER TABLE `INVERSOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVERSOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PL_SOLAR`
--

DROP TABLE IF EXISTS `PL_SOLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PL_SOLAR` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PL_SOLAR`
--

LOCK TABLES `PL_SOLAR` WRITE;
/*!40000 ALTER TABLE `PL_SOLAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `PL_SOLAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TV`
--

DROP TABLE IF EXISTS `TV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TV` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TV`
--

LOCK TABLES `TV` WRITE;
/*!40000 ALTER TABLE `TV` DISABLE KEYS */;
/*!40000 ALTER TABLE `TV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USINA`
--

DROP TABLE IF EXISTS `USINA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USINA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Litros` int DEFAULT NULL,
  `Volts` int DEFAULT NULL,
  `Amper` float DEFAULT NULL,
  `Potencia` float DEFAULT NULL,
  `C` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `A` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USINA`
--

LOCK TABLES `USINA` WRITE;
/*!40000 ALTER TABLE `USINA` DISABLE KEYS */;
/*!40000 ALTER TABLE `USINA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07  8:54:29
