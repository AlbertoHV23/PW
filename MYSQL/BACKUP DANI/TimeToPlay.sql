CREATE DATABASE  IF NOT EXISTS `timetoplay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `timetoplay`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: timetoplay
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `tbl_anonimos`
--

DROP TABLE IF EXISTS `tbl_anonimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_anonimos` (
  `id_anonimo` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_anonimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anonimos`
--

LOCK TABLES `tbl_anonimos` WRITE;
/*!40000 ALTER TABLE `tbl_anonimos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anonimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
INSERT INTO `tbl_categoria` VALUES (3,'Accion','Basado en ejercicios de repeticion'),(4,'Ejercicios','Basados en ejercicios'),(5,'Arcade','El usuario debe superar pantallas para seguir jugando'),(6,'Deportes','Recrean diversos deportes'),(7,'Estrategia','Consiste en trazar una estrategia para superar al contrincante'),(8,'Simulacion','Permite experimentar e investigar el funcionamiento de maquinas, fenomenos, situaciones y asumir el mando'),(9,'Mesa','Recrea los juegos físicos en entornos virtuales'),(10,'Musicales','juegos que inducen a la interacción del jugador con la música y cuyo objetivo es seguir los patrones de una canción.'),(11,'Shooter','Descripcion'),(12,'Shooter','Descripcion');
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comentario_a_comentario`
--

DROP TABLE IF EXISTS `tbl_comentario_a_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comentario_a_comentario` (
  `id_sub_comentario` int NOT NULL AUTO_INCREMENT,
  `fk_comentario` int NOT NULL,
  `comentario` varchar(1000) NOT NULL,
  `aprovado` tinyint(1) DEFAULT '0',
  `fk_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_sub_comentario`),
  KEY `fk_comentario` (`fk_comentario`),
  CONSTRAINT `tbl_comentario_a_comentario_ibfk_1` FOREIGN KEY (`fk_comentario`) REFERENCES `tbl_comentarios` (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comentario_a_comentario`
--

LOCK TABLES `tbl_comentario_a_comentario` WRITE;
/*!40000 ALTER TABLE `tbl_comentario_a_comentario` DISABLE KEYS */;
INSERT INTO `tbl_comentario_a_comentario` VALUES (3,1,'hola?',0,24),(4,1,'a ver',0,25),(5,2,'yo no',0,25),(6,7,'comentario de comentario',0,28),(7,7,'otro comentario',0,24),(8,7,'otro',0,24),(9,7,'otro',0,24),(10,7,'nuevo',0,24),(11,7,'nuevo 2',0,24),(12,8,'Prueba??',0,24),(13,8,'funcionara??',0,24),(14,8,'creo que no ',0,24),(15,8,'nooooooooooo',0,24),(16,8,'funcionaaa?',0,24),(17,9,'a ver si es cierto haha',0,24),(18,9,'siuuuuuuuuuuuuuuuuuuuuu',0,24),(19,12,'Como estas anonimo??',0,30),(20,13,'Hello word',0,29);
/*!40000 ALTER TABLE `tbl_comentario_a_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comentario_editor`
--

DROP TABLE IF EXISTS `tbl_comentario_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comentario_editor` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `fk_usuario` int DEFAULT NULL,
  `fk_noticia` int NOT NULL,
  `comentario` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_usuario` (`fk_usuario`),
  KEY `fk_noticia` (`fk_noticia`),
  CONSTRAINT `tbl_comentario_editor_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  CONSTRAINT `tbl_comentario_editor_ibfk_2` FOREIGN KEY (`fk_noticia`) REFERENCES `tbl_noticia` (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comentario_editor`
--

LOCK TABLES `tbl_comentario_editor` WRITE;
/*!40000 ALTER TABLE `tbl_comentario_editor` DISABLE KEYS */;
INSERT INTO `tbl_comentario_editor` VALUES (1,NULL,135,'No me gusto');
/*!40000 ALTER TABLE `tbl_comentario_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comentarios`
--

DROP TABLE IF EXISTS `tbl_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(1000) NOT NULL,
  `fk_usuario` int NOT NULL,
  `fk_noticia` int NOT NULL,
  `valoracion_like` int DEFAULT '0',
  `valoracion_Nolike` int DEFAULT '0',
  `aprovado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_comentario`),
  KEY `fk_usuario` (`fk_usuario`),
  KEY `fk_noticia` (`fk_noticia`),
  CONSTRAINT `tbl_comentarios_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  CONSTRAINT `tbl_comentarios_ibfk_2` FOREIGN KEY (`fk_noticia`) REFERENCES `tbl_noticia` (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comentarios`
--

LOCK TABLES `tbl_comentarios` WRITE;
/*!40000 ALTER TABLE `tbl_comentarios` DISABLE KEYS */;
INSERT INTO `tbl_comentarios` VALUES (1,'Que buena noticia',24,127,0,0,1),(2,'I liked',24,127,0,0,1),(3,'JUEGAZO',24,127,0,0,1),(4,'Siempre sacan lo mismo',24,126,0,0,1),(5,'Porque??',25,127,0,0,1),(6,'Porque??',25,127,0,0,1),(7,'Esto es un comentario',24,125,0,0,1),(8,'Spiderman',24,125,0,0,1),(9,'Creo que ya',24,125,0,0,1),(10,'Funcionara?????',30,129,0,0,1),(11,'Otro',30,129,0,0,1),(12,'Hola',30,128,0,0,1),(13,'Hola mundo',29,129,0,0,1);
/*!40000 ALTER TABLE `tbl_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_imagenes`
--

DROP TABLE IF EXISTS `tbl_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_imagenes` (
  `id_imagen` int NOT NULL AUTO_INCREMENT,
  `extencion` varchar(200) NOT NULL,
  `fk_noticia` int NOT NULL,
  PRIMARY KEY (`id_imagen`),
  KEY `fk_noticia` (`fk_noticia`),
  CONSTRAINT `tbl_imagenes_ibfk_1` FOREIGN KEY (`fk_noticia`) REFERENCES `tbl_noticia` (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_imagenes`
--

LOCK TABLES `tbl_imagenes` WRITE;
/*!40000 ALTER TABLE `tbl_imagenes` DISABLE KEYS */;
INSERT INTO `tbl_imagenes` VALUES (1,'assets/IMG/Estaticas/SpiderMan1.jpg',125),(2,'assets/IMG/Estaticas/SpiderMan2.jpg',125),(3,'assets/IMG/Estaticas/SpiderMan3.jpg',125),(4,'assets/IMG/Estaticas/Fifa1.jpg',126),(5,'assets/IMG/Estaticas/Fifa2.jpg',126),(6,'assets/IMG/Estaticas/Fifa2.jpg',126),(7,'assets/IMG/Estaticas/Fortnite1.jpg',127),(8,'assets/IMG/Estaticas/Fortnite2.jpg',127),(9,'assets/IMG/Estaticas/Fortnite3.jpg',127),(19,'assets/IMG/Estaticas/Warzone1.jpg',128),(20,'assets/IMG/Estaticas/Warzone2.jpg',128),(21,'assets/IMG/Estaticas/Warzone3.jpg',128),(22,'assets/IMG/Estaticas/GTA1.jpg',129),(23,'assets/IMG/Estaticas/GTA2.jpg',129),(24,'assets/IMG/Estaticas/GTA3.jpg',129),(40,'assets/IMG/Estaticas/Mine1.jpg',135),(41,'assets/IMG/Estaticas/Mine2.jpg',135),(42,'assets/IMG/Estaticas/Mine3.jpg',135),(43,'assets/IMG/Estaticas/ColdWar1.jpg',136),(44,'assets/IMG/Estaticas/ColdWar1.jpg',136),(45,'assets/IMG/Estaticas/ColdWar1.jpg',136);
/*!40000 ALTER TABLE `tbl_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marcadas`
--

DROP TABLE IF EXISTS `tbl_marcadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_marcadas` (
  `id_marcadas` int NOT NULL AUTO_INCREMENT,
  `fk_usuario` int NOT NULL,
  `fk_noticia` int NOT NULL,
  PRIMARY KEY (`id_marcadas`),
  KEY `fk_usuario` (`fk_usuario`),
  KEY `fk_noticia` (`fk_noticia`),
  CONSTRAINT `tbl_marcadas_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  CONSTRAINT `tbl_marcadas_ibfk_2` FOREIGN KEY (`fk_noticia`) REFERENCES `tbl_noticia` (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marcadas`
--

LOCK TABLES `tbl_marcadas` WRITE;
/*!40000 ALTER TABLE `tbl_marcadas` DISABLE KEYS */;
INSERT INTO `tbl_marcadas` VALUES (1,24,126),(2,24,127),(3,25,129),(4,25,125),(5,25,125),(6,31,129),(7,30,126),(8,31,128),(9,30,126);
/*!40000 ALTER TABLE `tbl_marcadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_noticia`
--

DROP TABLE IF EXISTS `tbl_noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_noticia` (
  `id_noticia` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion_corta` varchar(250) NOT NULL,
  `descripcion_larga` varchar(2500) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `aprovado` tinyint(1) DEFAULT '1',
  `valoracion_like` int DEFAULT '0',
  `valoracion_Nolike` int DEFAULT '0',
  `fk_usuarios` int NOT NULL,
  `fk_categoria` int NOT NULL,
  PRIMARY KEY (`id_noticia`),
  KEY `fk_categoria` (`fk_categoria`),
  KEY `fk_usuarios` (`fk_usuarios`),
  CONSTRAINT `tbl_noticia_ibfk_1` FOREIGN KEY (`fk_categoria`) REFERENCES `tbl_categoria` (`id_categoria`),
  CONSTRAINT `tbl_noticia_ibfk_2` FOREIGN KEY (`fk_usuarios`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_noticia`
--

LOCK TABLES `tbl_noticia` WRITE;
/*!40000 ALTER TABLE `tbl_noticia` DISABLE KEYS */;
INSERT INTO `tbl_noticia` VALUES (125,'Marvel\'s Spider-Man: Miles Morales','El nuevo videojuego de la franquicia Spider-Man de Insomniac Games llega a PS5 ','Miles Gonzalo Morales es un adolescente de ascendencia afroamericana y latina residente en Brooklyn; quien despuÃ©s de haber sido mordido por una araÃ±a genÃ©ticamente modificada diseÃ±ada por el nÃ©mesis de Spider-Man, Norman Osborn, asumiÃ³ la identidad de Spider-Man en el Universo Ultimate tras la muerte de Peter Parker.','13/11/2020','19:34:25',1,0,0,24,8),(126,'FIFA 21','YA DISPONIBLE','AHORA TIENES EL PODER. USA SUPERPODERES COMO GUANTELETES ARCANOS DEL DOCTOR DOOM, ESCUDO DE ESPINAS DE GROOT, LA TABLA DE SILVER SURFER Y MÃÂS QUE LLEGARÃÂN DURANTE LA TEMPORADA.','13/11/2020','19:35:35',1,0,0,24,6),(127,'FORTNITE','CONVIERTETE EN SUPERHEROE','AHORA TIENES EL PODER. USA SUPERPODERES COMO GUANTELETES ARCANOS DEL DOCTOR DOOM, ESCUDO DE ESPINAS DE GROOT, LA TABLA DE SILVER SURFER Y MÃÂS QUE LLEGARÃÂN DURANTE LA TEMPORADA.','13/11/2020','19:36:27',1,0,0,24,11),(128,'Call of Duty: Warzone','UN NUEVO ESTILO DE BATTLE ROYALE','Une fuerzas con tus amigos y salta al campo de batalla con hasta 150 jugadores.','14/11/2020','19:09:59',1,0,0,24,11),(129,'Grand Theft Auto V ','Ya estÃ¡ disponible.','EdiciÃ³n Premium te permite disfrutar por completo de la trama de GTAV, Grand Theft Auto Online y todas las mejoras y contenidos','14/11/2020','23:35:33',1,0,0,24,3),(135,'MINECRAFT 2.0','Preparate para una aventura de posibilidades ilimitadas mientras construyes, extraes, combates criaturas y exploras el cambiante paisaje de Minecraft. ','Preparate para una aventura de posibilidades ilimitadas mientras construyes, extraes, combates criaturas y exploras el cambiante paisaje de Minecraft. ','17/11/2020','21:46:57',0,0,0,28,8),(136,'Call of Duty: Black Ops Cold War','Analisis - La Guerra Fria se recrudece','Analizamos Call of Duty: Black Ops Cold War, secuela directa de Call of Duty: Black Ops, y disponible en PC, PS4, PS5, Xbox One y Xbox Series X y S.','17/11/2020','21:48:31',0,0,0,28,11);
/*!40000 ALTER TABLE `tbl_noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `_password` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT 'assets/IMG/Avatars/default.png',
  `descripcion` varchar(50) DEFAULT NULL,
  `face` varchar(50) DEFAULT NULL,
  `twit` varchar(50) DEFAULT NULL,
  `insta` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (24,'Moderador','AlberThor','albertho0.hdzv@gmail.com','1234','assets/IMG/Avatars/Yo.jpg','','Alberto Hernandez','Alberto Hernandez','_Albertohv',1),(25,'Normal','Becerra','albertho0.hdzv@gmail.com','1234','assets/IMG/Avatars/image1605659312581.jpg','Hola','Facebook','Twiter','Instagram',1),(28,'Creador','creador','Creador@gmail.com','1234','assets/IMG/Avatars/default.png','null','null','null','null',1),(29,'Editor','editor','editor@gmail.com','1234','assets/IMG/Avatars/default.png','null','null','null','null',1),(30,'Anonimo','Anonimo','Anonimo','Anonimo','assets/IMG/Avatars/anonimo.jpg',NULL,NULL,NULL,NULL,1),(31,'Normal','Donato','donato@gmail.com','1234','assets/IMG/Avatars/image1605671568985.jpg','hOLA','Facebook','Twiter','Instagram',1),(32,'Administrador','root','root@gmail.com','root','assets/IMG/Avatars/default.png','null','null','null','null',1);
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_videos`
--

DROP TABLE IF EXISTS `tbl_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_videos` (
  `id_video` int NOT NULL AUTO_INCREMENT,
  `extencion` varchar(100) NOT NULL,
  `fk_noticia` int NOT NULL,
  PRIMARY KEY (`id_video`),
  KEY `fk_noticia` (`fk_noticia`),
  CONSTRAINT `tbl_videos_ibfk_1` FOREIGN KEY (`fk_noticia`) REFERENCES `tbl_noticia` (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_videos`
--

LOCK TABLES `tbl_videos` WRITE;
/*!40000 ALTER TABLE `tbl_videos` DISABLE KEYS */;
INSERT INTO `tbl_videos` VALUES (1,'https://www.youtube.com/embed/gHzuHo80U2M',125),(2,'https://www.youtube.com/embed/tuLAn9adQpI',126),(3,'https://www.youtube.com/embed/2PGmwK8cuo4',127),(4,'https://www.youtube.com/embed/0E44DClsX5Q',128),(7,'https://www.youtube.com/embed/1DhWXAiNgfQ ',135),(8,'https://www.youtube.com/embed/aTS9n_m7TW0',136);
/*!40000 ALTER TABLE `tbl_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `urlImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'123','assets/IMG/image1605212622644.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'timetoplay'
--

--
-- Dumping routines for database 'timetoplay'
--
/*!50003 DROP PROCEDURE IF EXISTS `anonimo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anonimo`()
BEGIN
select id_usuario,rol,username,imagen from tbl_usuarios where username = 'Anonimo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar`(in buscar varchar(100) )
BEGIN
SELECT id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,tbl_categoria.nombre
FROM tbl_noticia
INNER JOIN tbl_categoria ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria where titulo  like concat('%', buscar, '%') or descripcion_corta  like concat('%', buscar, '%') or tbl_categoria.nombre  like concat('%', buscar, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_comentario_noticia_rechazada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_comentario_noticia_rechazada`(in id_noticia int,in comen varchar(2000))
BEGIN
INSERT INTO `tbl_comentario_editor`
(
`fk_noticia`,
`comentario`)
VALUES
(
id_noticia,
comen);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `So_noticias_marcadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `So_noticias_marcadas`(in id int)
BEGIN
select id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike 
from tbl_marcadas 
inner join tbl_noticia on fk_noticia = id_noticia 
where fk_usuario = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Aprovadas_rexhazadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Aprovadas_rexhazadas`(in id int,in activo boolean  )
BEGIN
select id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,nombre,username
from tbl_noticia 
inner join tbl_categoria on fk_categoria = id_categoria
inner join tbl_usuarios on fk_usuarios = id_usuario and fk_usuarios = id and aprovado = activo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_buscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_buscar`(in buscar varchar(100) )
BEGIN
SELECT id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,tbl_categoria.nombre
FROM tbl_noticia
INNER JOIN tbl_categoria ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria where titulo  like concat('%', buscar, '%') or descripcion_corta  like concat('%', buscar, '%') or tbl_categoria.nombre  like concat('%', buscar, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_categoria_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_categoria_delete`(
in id_cat int
)
BEGIN
DELETE FROM tbl_categoria
WHERE id_categoria = id_cat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_categoria_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_categoria_insert`(
    in nombre			varchar(50),
    in descripcion		varchar(200)
)
BEGIN
INSERT INTO `tbl_categoria`
(`nombre`,
`descripcion`)
VALUES
(nombre,
descripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_categoria_selectid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_categoria_selectid`(in tipo varchar(100))
BEGIN
select id_categoria from tbl_categoria where nombre = tipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_categoria_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_categoria_update`(
 in id				int,
 in nombre			varchar(50),
 in descripcion		varchar(200)
)
BEGIN
UPDATE `timetoplay`.`tbl_categoria`
SET
`id_categoria` =id_categoria,
`nombre` = nombre,
`descripcion` = descripcion
WHERE `id_categoria` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_comentarioacomentario_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_comentarioacomentario_delete`(
in id int)
BEGIN
DELETE FROM `tbl_comentario_a_comentario`
WHERE id_sub_comentario = id ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_comentarioacomentario_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_comentarioacomentario_insert`(
	in id_sub_comentario   int ,
    in fk_comentario       int ,
    in comentario          varchar(1000) ,
    in aprovado            bool,
    in fk_usuario 			int
    )
BEGIN
INSERT INTO `tbl_comentario_a_comentario`
(fk_comentario,
comentario,
aprovado, fk_usuario)
VALUES
(fk_comentario,
comentario,
aprovado,fk_usuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_comentarioacomentario_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_comentarioacomentario_update`(
	in id_sub_comentario   int ,
    in fk_comentario       int ,
    in comentario          varchar(1000) ,
    in aprovado            bool
    )
BEGIN
UPDATE `tbl_comentario_a_comentario`
SET
`id_sub_comentario` = id_sub_comentario,
`fk_comentario` =fk_comentario,
`comentario` = comentario,
`aprovado` = aprovado
WHERE `id_sub_comentario` = id_sub_comentario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_comentarios_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_comentarios_delete`(
in id int)
BEGIN
DELETE FROM tbl_comentarios
WHERE id_comentario = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_comentarios_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_comentarios_insert`(
	in id_comentario      	 int,
    in comentario		   	 varchar(1000),
	in fk_usuario		     int,
    in fk_noticia		     int,
    in valoracion_like 		 int,
    in valoracion_Nolike 	 int,
    in aprovado			bool
    )
BEGIN
INSERT INTO `tbl_comentarios`
(
`comentario`,
`fk_usuario`,
`fk_noticia`,
`valoracion_like`,
`valoracion_Nolike`,
`aprovado`)
VALUES
(
comentario,
fk_usuario,
fk_noticia,
valoracion_like,
valoracion_Nolike,
aprovado);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_comentarios_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_comentarios_update`(
	in id      	 int,
    in comentario		   	 varchar(1000),
	in fk_usuario		     int,
    in fk_noticia		     int,
    in valoracion_like 		 int,
    in valoracion_Nolike 	 int,
    in aprovado			bool
    )
BEGIN
UPDATE `timetoplay`.`tbl_comentarios`
SET
`id_comentario` =id_comentario,
`comentario` =comentario,
`fk_usuario` = fk_usuario,
`fk_noticia` = fk_noticia,
`valoracion_like` = valoracion_like,
`valoracion_Nolike` = valoracion_Nolike,
`aprovado` =aprovado
WHERE `id_comentario` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Delete_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Delete_users`(
in  id  int,
out estado int)
BEGIN
if (select count(id_usuario) from tbl_usuarios where id_usuarios = id) = 0 then
select 0 into estado;
	else
	DELETE FROM `tbl_usuarios`
	WHERE id_usuario = id;
    select 1 into estado;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_imagen_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_imagen_insert`(
	in id_imagen	int,
    in extencion	varchar(200) ,
    in fk_noticia	int )
BEGIN
INSERT INTO `tbl_imagenes`
(`extencion`,
`fk_noticia`)
VALUES
(extencion,
fk_noticia);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_imagen_selectxFk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_imagen_selectxFk`(in id int)
BEGIN

select *from tbl_imagenes where fk_noticia = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_imagen_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_imagen_update`(
	in id_imagen	int,
    in extencion	varchar(100) ,
    in fk_noticia	int )
BEGIN
UPDATE `tbl_imagenes`
SET
`id_imagen` = id_imagen,
`extencion` = extencion,
`fk_noticia` = fk_noticia
WHERE `id_imagen` = id_imagen;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_insert_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_insert_users`(
  in rol 			varchar(50),
  in username 		varchar(50),
  in email 			varchar(50),
  in _password 		varchar(50),
  in imagen 		varchar(100),
  in descripcion 	varchar(50),
  in face 		    varchar(50),
  in twit           varchar(50),
  in insta          varchar(50),
  in activo         bool
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_usuarios`
(`rol`,
`username`,
`email`,
`_password`,
`imagen`,
`descripcion`,
`face`,
`twit`,
`insta`,
`activo`)
VALUES
(
rol,
username,
email,
_password,
imagen,
descripcion,
face,
twit,
insta,
activo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_login`(
in usuario varchar(40),
in contra varchar(40),
in tipo varchar(40)
)
BEGIN
select * from tbl_usuarios where username = usuario and _password = contra and rol = tipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_marcadas_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_marcadas_delete`(
in id int)
BEGIN
DELETE FROM `timetoplay`.`tbl_marcadas`
WHERE `id_marcadas` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_marcadas_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_marcadas_insert`(
		in id_marcadas	int,
		in fk_usuario	int ,
		in fk_noticia	int)
BEGIN
	INSERT INTO `timetoplay`.`tbl_marcadas`
	(`fk_usuario`,
	`fk_noticia`)
	VALUES
	(fk_usuario,
	fk_noticia);

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_marcadas_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_marcadas_update`(
	in id_marcadas	int,
    in fk_usuario	int ,
	in fk_noticia	int)
BEGIN
UPDATE `tbl_marcadas`
SET
`id_marcadas` = id_marcadas,
`fk_usuario` = fk_usuario,
`fk_noticia` = fk_noticia
WHERE `id_marcadas` = id_marcadas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticias_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticias_delete`(
in id int
)
BEGIN
DELETE FROM tbl_noticia
WHERE id_noticia = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticias_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticias_insert`(
	in id_noticia         	int,
	in titulo				varchar(50) ,
    in descripcion_corta	varchar(250),
    in descripcion_larga	varchar(2500),
    in fecha				varchar(30),
    in hora					varchar(20),
    in aprovado				bool,
    in valoracion_like 		int,
    in valoracion_Nolike 	int,
    in fk_usuarios			int,
    in fk_categoria        	int
)
BEGIN
INSERT INTO `timetoplay`.`tbl_noticia`
(`titulo`,
`descripcion_corta`,
`descripcion_larga`,
`fecha`,
`hora`,
`aprovado`,
`valoracion_like`,
`valoracion_Nolike`,
`fk_usuarios`,
`fk_categoria`)
VALUES
(
titulo,
descripcion_corta,
descripcion_larga,
fecha,
hora,
aprovado,
valoracion_like,
valoracion_Nolike,
fk_usuarios,
fk_categoria);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticias_marcadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticias_marcadas`(in id int)
BEGIN
select id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike 
from tbl_marcadas 
inner join tbl_noticia on fk_noticia = id_noticia 
where fk_usuario = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticias_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticias_select`(in id int)
BEGIN
SELECT id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,tbl_categoria.nombre,tbl_usuarios.username
FROM tbl_noticia
INNER JOIN tbl_categoria ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria
INNER JOIN tbl_usuarios ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria
where fk_categoria = id_categoria and fk_usuarios = id_usuario and id_noticia = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticias_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticias_update`(
	in id         	int,
	in titulo				varchar(50) ,
    in descripcion_corta	varchar(250),
    in descripcion_larga	varchar(2500),
    in fk_categoria        	int
)
BEGIN
UPDATE `tbl_noticia`
SET
`titulo` = titulo,
`descripcion_corta` =descripcion_corta,
`descripcion_larga` =descripcion_larga,
`fk_categoria` = fk_categoria
WHERE `id_noticia` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticia_Activas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticia_Activas`()
BEGIN
SELECT id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,tbl_categoria.nombre,tbl_usuarios.username
FROM tbl_noticia
INNER JOIN tbl_categoria ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria
INNER JOIN tbl_usuarios ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria
where fk_categoria = id_categoria and fk_usuarios = id_usuario and aprovado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticia_Aprovar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticia_Aprovar`(in id int)
BEGIN
UPDATE tbl_noticia
SET
aprovado = 1
WHERE id_noticia = id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticia_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticia_id`(
in title varchar(40)
)
BEGIN
select	id_noticia from tbl_noticia where titulo = title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticia_news` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticia_news`()
BEGIN
SELECT id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,tbl_categoria.nombre
FROM tbl_noticia
INNER JOIN tbl_categoria ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria where aprovado = 1 order by id_noticia desc limit 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_noticia_NoActiva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_noticia_NoActiva`()
BEGIN
SELECT id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,tbl_categoria.nombre,tbl_usuarios.username
FROM tbl_noticia
INNER JOIN tbl_categoria ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria
INNER JOIN tbl_usuarios ON tbl_noticia.fk_categoria = tbl_categoria.id_categoria
where fk_categoria = id_categoria and fk_usuarios = id_usuario and aprovado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_rechazadas_comentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_rechazadas_comentario`(in id int)
BEGIN
select id_noticia,titulo,descripcion_corta,descripcion_larga,fecha,hora,aprovado,valoracion_like,valoracion_Nolike,nombre,username,comentario
from tbl_noticia 
inner join tbl_categoria on fk_categoria = id_categoria
inner join tbl_comentario_editor on fk_noticia = id_noticia
inner join tbl_usuarios on fk_usuarios = id_usuario and fk_usuarios = id and aprovado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_update_datos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_update_datos`(
  in id				int,
  in username 		varchar(50),
  in email 			varchar(50),
  in imagen 		varchar(100),
  in descripcion 	varchar(50),
  in face 		    varchar(50),
  in twit           varchar(50),
  in insta          varchar(50)
)
BEGIN
UPDATE `timetoplay`.`tbl_usuarios`
SET
`username` =username ,
`email` = email,

`imagen` = imagen,
`descripcion` = descripcion,
`face` =face,
`twit` = twit,
`insta` =insta

WHERE `id_usuario` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_update_datos_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_update_datos_usuario`(
  in id				int,
  in username 		varchar(50),
  in email 			varchar(50),
  in imagen 		varchar(100),
  in descripcion 	varchar(50),
  in face 		    varchar(50),
  in twit           varchar(50),
  in insta          varchar(50)
)
BEGIN
UPDATE `tbl_usuarios`
SET
`username` =username ,
`email` = email,

`imagen` = imagen,
`descripcion` = descripcion,
`face` =face,
`twit` = twit,
`insta` =insta

WHERE `id_usuario` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_update_pass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_update_pass`(in id int,
in pass varchar(50))
BEGIN
update tbl_usuarios set _password = pass where id_usuario = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_update_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_update_users`(
  in id				int,
  in rol 			varchar(50),
  in username 		varchar(50),
  in email 			varchar(50),
  in _password 		varchar(50),
  in imagen 		varchar(100),
  in descripcion 	varchar(50),
  in face 		    varchar(50),
  in twit           varchar(50),
  in insta          varchar(50),
  in activo         bool)
BEGIN
UPDATE `tbl_usuarios`
SET
`id_usuario` =id_usuario,
`rol` = rol,
`username` = username,
`email` = email,
`_password` =_password,
`imagen` = imagen,
`descripcion` =descripcion,
`face` =face,
`twit` = twit,
`insta` = insta,
`activo` = activo
WHERE `id_usuario` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_videos_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_videos_insert`(
	in id_video	int,
    in extencion	varchar(100) ,
    in fk_noticia	int )
BEGIN
INSERT INTO `tbl_videos`
(
`extencion`,
`fk_noticia`)
VALUES
(
extencion,
fk_noticia);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_videos_selectId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_videos_selectId`(in video int)
BEGIN
select extencion from tbl_videos where fk_noticia = video;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_videos_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_videos_update`(
	in id_video	int,
    in extencion	varchar(100) ,
    in fk_noticia	int )
BEGIN
UPDATE `tbl_videos`
SET
`id_video` = id_video,
`extencion` =extencion,
`fk_noticia` =fk_noticia
WHERE `id_video` = id_video;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traer_comentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_comentarios`(in id int)
BEGIN
select id_comentario,comentario,username,imagen from tbl_comentarios
inner join tbl_usuarios on fk_usuario = id_usuario
 where fk_noticia = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Traer_comentario_comentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Traer_comentario_comentario`(in id int)
BEGIN
select id_sub_comentario,comentario,username,imagen from tbl_comentario_a_comentario 
inner join tbl_usuarios on fk_usuario = id_usuario where fk_comentario = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 18:30:56
