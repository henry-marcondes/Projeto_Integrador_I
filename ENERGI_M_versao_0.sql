-- MySQL dump 10.13  Distrib 8.0.41, for Linux (aarch64)
--
-- Host: localhost    Database: ENERGI_M
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
-- Table structure for table `BATERIA`
--

DROP TABLE IF EXISTS `BATERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATERIA` (
  `id_bat` int NOT NULL AUTO_INCREMENT,
  `fabricante` varchar(30) DEFAULT NULL,
  `amperagem` int DEFAULT NULL,
  `dimençoes` int DEFAULT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_bat`),
  KEY `dimençoes` (`dimençoes`),
  CONSTRAINT `BATERIA_ibfk_1` FOREIGN KEY (`dimençoes`) REFERENCES `DIMENSAO` (`id_dim`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BATERIA`
--

LOCK TABLES `BATERIA` WRITE;
/*!40000 ALTER TABLE `BATERIA` DISABLE KEYS */;
INSERT INTO `BATERIA` VALUES (1,'Feedon',165,2,'DF2500ECO');
/*!40000 ALTER TABLE `BATERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classe_PROD`
--

DROP TABLE IF EXISTS `Classe_PROD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Classe_PROD` (
  `clss_prd` varchar(50) NOT NULL,
  `arcond` tinyint(1) DEFAULT NULL,
  `climatizador` tinyint(1) DEFAULT NULL,
  `bomba_agua` tinyint(1) DEFAULT NULL,
  `usb` tinyint(1) DEFAULT NULL,
  `iluminacao` tinyint(1) DEFAULT NULL,
  `ventilador` tinyint(1) DEFAULT NULL,
  `tv` tinyint(1) DEFAULT NULL,
  `E_12` tinyint(1) DEFAULT NULL,
  `E_AC` tinyint(1) DEFAULT NULL,
  `id_clss` int NOT NULL AUTO_INCREMENT,
  `geladeira` int DEFAULT NULL,
  PRIMARY KEY (`id_clss`),
  KEY `ch_GELO` (`geladeira`),
  CONSTRAINT `ch_GELO` FOREIGN KEY (`geladeira`) REFERENCES `GELADEIRA` (`id_gelo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classe_PROD`
--

LOCK TABLES `Classe_PROD` WRITE;
/*!40000 ALTER TABLE `Classe_PROD` DISABLE KEYS */;
INSERT INTO `Classe_PROD` VALUES ('TESTE',1,1,1,NULL,1,NULL,1,1,1,1,NULL);
/*!40000 ALTER TABLE `Classe_PROD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIMENSAO`
--

DROP TABLE IF EXISTS `DIMENSAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIMENSAO` (
  `id_dim` int NOT NULL AUTO_INCREMENT,
  `altura` float DEFAULT NULL,
  `largura` float DEFAULT NULL,
  `profundidade` float DEFAULT NULL,
  PRIMARY KEY (`id_dim`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIMENSAO`
--

LOCK TABLES `DIMENSAO` WRITE;
/*!40000 ALTER TABLE `DIMENSAO` DISABLE KEYS */;
INSERT INTO `DIMENSAO` VALUES (1,42,32,54),(2,23,21,51);
/*!40000 ALTER TABLE `DIMENSAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DONO`
--

DROP TABLE IF EXISTS `DONO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DONO` (
  `id_dono` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `fone` varchar(15) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_dono`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONO`
--

LOCK TABLES `DONO` WRITE;
/*!40000 ALTER TABLE `DONO` DISABLE KEYS */;
INSERT INTO `DONO` VALUES (1,'Marcos','(13) 99888-1098','maucos@gmail.com');
/*!40000 ALTER TABLE `DONO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOTO`
--

DROP TABLE IF EXISTS `FOTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOTO` (
  `id_foto` int NOT NULL AUTO_INCREMENT,
  `foto1` varchar(255) DEFAULT NULL,
  `foto2` varchar(255) DEFAULT NULL,
  `foto3` varchar(255) DEFAULT NULL,
  `foto4` varchar(255) DEFAULT NULL,
  `foto5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_foto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOTO`
--

LOCK TABLES `FOTO` WRITE;
/*!40000 ALTER TABLE `FOTO` DISABLE KEYS */;
INSERT INTO `FOTO` VALUES (1,'100','31','25','24','127');
/*!40000 ALTER TABLE `FOTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GELADEIRA`
--

DROP TABLE IF EXISTS `GELADEIRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GELADEIRA` (
  `id_gelo` int NOT NULL AUTO_INCREMENT,
  `fabricante` varchar(30) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `litros` int DEFAULT NULL,
  `id_dim` int DEFAULT NULL,
  `id_foto` int DEFAULT NULL,
  `voltagem` int DEFAULT NULL,
  PRIMARY KEY (`id_gelo`),
  KEY `ch_ext` (`id_foto`),
  KEY `ch_ext_D` (`id_dim`),
  KEY `ch_ext_V` (`voltagem`),
  CONSTRAINT `ch_ext` FOREIGN KEY (`id_foto`) REFERENCES `FOTO` (`id_foto`),
  CONSTRAINT `ch_ext_D` FOREIGN KEY (`id_dim`) REFERENCES `DIMENSAO` (`id_dim`),
  CONSTRAINT `ch_ext_V` FOREIGN KEY (`voltagem`) REFERENCES `VOLTAGEM` (`id_volt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GELADEIRA`
--

LOCK TABLES `GELADEIRA` WRITE;
/*!40000 ALTER TABLE `GELADEIRA` DISABLE KEYS */;
INSERT INTO `GELADEIRA` VALUES (2,'Resfriar','GL38l',30,1,1,1);
/*!40000 ALTER TABLE `GELADEIRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOTORHOME`
--

DROP TABLE IF EXISTS `MOTORHOME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOTORHOME` (
  `id_mtrhm` int NOT NULL AUTO_INCREMENT,
  `id_dono` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `veiculo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_mtrhm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOTORHOME`
--

LOCK TABLES `MOTORHOME` WRITE;
/*!40000 ALTER TABLE `MOTORHOME` DISABLE KEYS */;
INSERT INTO `MOTORHOME` VALUES (1,1,1,'Van Sprinter');
/*!40000 ALTER TABLE `MOTORHOME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUTOS`
--

DROP TABLE IF EXISTS `PRODUTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUTOS` (
  `id_prodt` int NOT NULL AUTO_INCREMENT,
  `id_clss` int NOT NULL,
  PRIMARY KEY (`id_prodt`),
  KEY `ch_classe_prod` (`id_clss`),
  CONSTRAINT `ch_classe_prod` FOREIGN KEY (`id_clss`) REFERENCES `Classe_PROD` (`id_clss`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUTOS`
--

LOCK TABLES `PRODUTOS` WRITE;
/*!40000 ALTER TABLE `PRODUTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VOLTAGEM`
--

DROP TABLE IF EXISTS `VOLTAGEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VOLTAGEM` (
  `v_12` tinyint(1) DEFAULT NULL,
  `v_110` tinyint(1) DEFAULT NULL,
  `v_220` tinyint(1) DEFAULT NULL,
  `watts` float DEFAULT NULL,
  `amper` float DEFAULT NULL,
  `id_volt` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_volt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VOLTAGEM`
--

LOCK TABLES `VOLTAGEM` WRITE;
/*!40000 ALTER TABLE `VOLTAGEM` DISABLE KEYS */;
INSERT INTO `VOLTAGEM` VALUES (12,0,0,56,4.2,1);
/*!40000 ALTER TABLE `VOLTAGEM` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 21:29:31
