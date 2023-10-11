-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clienteID` int NOT NULL,
  `medicoID` int DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_clientes_clienteIdFk_idx` (`clienteID`),
  KEY `vendas_medicos_MedicosFk_idx` (`medicoID`),
  CONSTRAINT `vendas_clientes_clienteIdFk` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`id`),
  CONSTRAINT `vendas_medicos_MedicosFk` FOREIGN KEY (`medicoID`) REFERENCES `medicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,1,1,14.33,'2023-09-02 00:00:00'),(2,2,2,13.22,'2023-01-18 00:00:00'),(3,3,3,89.17,'2023-06-28 00:00:00'),(4,4,4,52.19,'2023-08-08 00:00:00'),(5,5,5,15.99,'2023-05-27 00:00:00'),(6,6,6,70.24,'2023-03-04 00:00:00'),(7,7,7,49.67,'2022-12-22 00:00:00'),(8,8,8,39.25,'2022-10-21 00:00:00'),(9,9,9,55.97,'2023-09-19 00:00:00'),(10,10,10,11.41,'2023-07-27 00:00:00'),(11,3,4,55.32,'2023-10-12 00:00:00');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10 22:59:09
