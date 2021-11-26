-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: sampledb
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'2021-11-11',1,3,'Costata',16),(2,'2021-11-11',1,3,'Costata',16),(3,'2021-11-11',1,3,'Costata',16),(4,'2021-11-11',1,3,'Costata',16),(5,'2021-11-11',1,3,'Carbonara',16),(6,'2021-11-11',1,3,'Carbonara',16),(7,'2021-11-11',1,3,'Carbonara',16),(8,'2021-11-11',1,3,'Carbonara',16),(9,'2021-11-11',1,3,'Carbonara',16),(10,'2021-11-11',1,3,'Carbonara',16),(11,'2021-11-11',1,3,'Filetto di manzo',34),(12,'2021-11-11',1,3,'Filetto di manzo',34);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `piatto`
--

LOCK TABLES `piatto` WRITE;
/*!40000 ALTER TABLE `piatto` DISABLE KEYS */;
INSERT INTO `piatto` VALUES (7,NULL,'cannolo',25,1,'dolce'),(8,NULL,'LucaPaolo',1,1,'Primo'),(9,1,'Costata',16,0,'Secondo'),(11,1,'Carbonara',16,1,'Primo'),(12,1,'Filetto di manzo',34,1,'Secondo'),(13,2,'Polenta',6,1,'Primo'),(14,2,'Casoncelli',7,1,'Primo'),(15,2,'Patatine fritte',3,1,'Aperitivo'),(16,3,'Pizza margherita',5,1,'Primo'),(17,3,'Pizza capricciosa',6,1,'Primo'),(18,3,'Pizza americana',6,1,'Primo');
/*!40000 ALTER TABLE `piatto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ristorante`
--

LOCK TABLES `ristorante` WRITE;
/*!40000 ALTER TABLE `ristorante` DISABLE KEYS */;
INSERT INTO `ristorante` VALUES (1,1,'Totò e la malafemmina'),(2,7,'Taverna Bergamasca'),(3,8,'Pizzeria \"La Bestia\"');
/*!40000 ALTER TABLE `ristorante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','ADMIN'),(3,'Catania','Gianlo','USER'),(7,'Rosi','Edoardo','ADMIN'),(8,'Giuseppe','Giuseppe','ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 12:22:06
