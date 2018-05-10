-- MySQL dump 10.13  Distrib 5.7.18, for Linux (i686)
--
-- Host: localhost    Database: RedSocial
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.10.1

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
-- Table structure for table `Amigos`
--

DROP TABLE IF EXISTS `Amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amigos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seguido` int(11) DEFAULT NULL,
  `seguidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amigos`
--

LOCK TABLES `Amigos` WRITE;
/*!40000 ALTER TABLE `Amigos` DISABLE KEYS */;
INSERT INTO `Amigos` VALUES (1,2,NULL),(3,2,6),(4,3,6),(5,5,6);
/*!40000 ALTER TABLE `Amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publicaciones`
--

DROP TABLE IF EXISTS `Publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publicaciones` (
  `IDPubli` bigint(20) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Contenido` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FHCreado` datetime DEFAULT NULL,
  `IDUser` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IDPubli`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publicaciones`
--

LOCK TABLES `Publicaciones` WRITE;
/*!40000 ALTER TABLE `Publicaciones` DISABLE KEYS */;
INSERT INTO `Publicaciones` VALUES (1,'titulo','Hola, soy HOMERO','','2017-05-17 11:53:00','3'),(2,'a','a','C:fakepathSin título3.png','2017-05-17 15:38:26','3'),(3,'qwew','1234','C:fakepathSin título3.png','2017-05-17 15:44:06','3'),(4,'fuygfvbnm,','WHAT IS YOUR MIND¿?','C:fakepathSin título3.png','2017-05-17 15:46:27','3'),(5,'wq','wq','C:fakepathdrupal.pdf','2017-05-17 15:51:07','3'),(6,'aA','a','C:fakepathdrupal.pdf','2017-05-17 15:57:40','3'),(7,'qw','wq','C:fakepathSin título3.png','2017-05-17 16:29:01','3'),(8,'seagrams-tonica','1234567891011','','2017-05-17 17:30:29','4'),(9,'No bajo que tengo que estudiar',':(','','2017-05-20 21:40:32','5'),(10,'Comprando anillo :)',':)','','2017-05-20 23:56:48','6');
/*!40000 ALTER TABLE `Publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de usuario',
  `Apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'Apellidos de usuario',
  `Pais` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Pais de procedencia del usuario',
  `Email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FHNacimiento` date DEFAULT NULL,
  `Descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (2,'hugo perico','Perexz','España','huugoo95@gmail.com','',NULL,'Chico listo'),(3,'Juan lopez','López','España','juanin@mail.com','juanin','1995-09-17','Influencer.'),(4,'Diego Gallu',NULL,'España','diego@gallu.es','barcelo',NULL,'Nobody said it was easy'),(5,'Adrian Tudoli',NULL,'España','tudoli@worker.es','abcd1234.','1995-03-17','Trabajador nato'),(6,'Patricio Gabriel Sanchez',NULL,'España','Patrick@rude.es','sanchez','1995-06-02','Informático. Socialmente estéril');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitas`
--

DROP TABLE IF EXISTS `Visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userA` int(11) DEFAULT NULL,
  `userB` int(11) DEFAULT NULL,
  `FHVisita` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitas`
--

LOCK TABLES `Visitas` WRITE;
/*!40000 ALTER TABLE `Visitas` DISABLE KEYS */;
INSERT INTO `Visitas` VALUES (1,5,4,NULL),(2,5,4,NULL),(3,5,4,NULL),(4,5,4,NULL),(5,5,4,NULL),(6,5,3,NULL),(7,5,3,NULL),(8,5,4,NULL),(9,5,4,NULL),(10,6,2,NULL),(11,6,2,NULL),(12,6,2,NULL),(13,6,2,NULL),(14,6,2,NULL),(15,6,2,NULL),(16,6,2,NULL),(17,6,2,NULL),(18,6,2,NULL),(19,6,2,NULL),(20,6,2,NULL),(21,6,2,NULL),(22,6,2,NULL),(23,6,2,NULL),(24,6,2,NULL),(25,6,2,NULL),(26,6,2,NULL),(27,6,2,NULL),(28,6,2,NULL),(29,6,2,NULL),(30,6,2,NULL),(31,6,2,NULL),(32,6,2,NULL),(33,6,3,NULL),(34,6,3,NULL),(35,6,3,NULL),(36,6,3,NULL),(37,6,3,NULL),(38,6,2,NULL),(39,6,2,NULL),(40,6,2,NULL),(41,6,2,NULL),(42,6,2,NULL),(43,6,2,NULL),(44,6,2,NULL),(45,6,2,NULL),(46,6,2,NULL),(47,6,2,NULL),(48,6,2,NULL),(49,6,2,NULL),(50,6,2,NULL),(51,6,2,NULL),(52,6,2,NULL),(53,6,2,NULL),(54,6,2,NULL),(55,6,2,NULL),(56,6,2,NULL),(57,6,2,NULL),(58,6,3,NULL),(59,6,3,NULL),(60,6,3,NULL),(61,6,3,NULL),(62,6,3,NULL),(63,6,3,NULL),(64,6,3,'2017-05-31 16:11:54');
/*!40000 ALTER TABLE `Visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'RedSocial'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-31 16:53:09
