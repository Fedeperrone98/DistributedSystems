-- MySQL dump 10.13  Distrib 8.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: dsmtdb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `host` varchar(16) NOT NULL,
  `guest` varchar(16) NOT NULL,
  `content` varchar(60) NOT NULL,
  `timeslot` date NOT NULL,
  `creationTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`host`,`guest`,`timeslot`),
  KEY `guest` (`guest`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`host`) REFERENCES `user` (`username`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`guest`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user1` varchar(16) NOT NULL,
  `user2` varchar(16) NOT NULL,
  `creationTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user1_2` (`user1`,`user2`),
  KEY `user1` (`user1`),
  KEY `user2` (`user2`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `user` (`username`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'m.capelli','primonome','2023-10-17 10:34:23'),(2,'f.pellegrini','g.ferretti','2023-10-17 10:34:23'),(3,'m.capelli','s.martini','2023-10-17 10:34:23'),(4,'a.bianchi','l.rossi','2023-10-17 10:34:23'),(5,'f.pellegrini','primonome','2023-10-17 10:34:23'),(6,'m.capelli','v.moretti','2023-10-17 10:34:23'),(7,'l.rossi','l.russo','2023-10-17 10:34:23'),(8,'f.pellegrini','s.martini','2023-10-17 10:34:23'),(9,'a.bianchi','s.martini','2023-10-17 10:34:23'),(10,'a.bianchi','v.moretti','2023-10-17 10:34:23');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageID` int NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL,
  `sender` varchar(32) NOT NULL,
  `chatID` int NOT NULL,
  `creationTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageID`),
  KEY `sender` (`sender`),
  KEY `chatID` (`chatID`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`username`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`chatID`) REFERENCES `chat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Hello, this is the start of our chat!','m.capelli',1,'2023-10-17 10:34:23'),(2,'Hi there! Let\'s have a great conversation.','primonome',1,'2023-10-17 10:34:23'),(3,'Hello, this is the start of our chat!','f.pellegrini',2,'2023-10-17 10:34:23'),(4,'Hi there! Let\'s have a great conversation.','g.ferretti',2,'2023-10-17 10:34:23'),(5,'Hello, this is the start of our chat!','m.capelli',3,'2023-10-17 10:34:23'),(6,'Hi there! Let\'s have a great conversation.','s.martini',3,'2023-10-17 10:34:23'),(7,'Hello, this is the start of our chat!','a.bianchi',4,'2023-10-17 10:34:23'),(8,'Hi there! Let\'s have a great conversation.','l.rossi',4,'2023-10-17 10:34:23'),(9,'Hello, this is the start of our chat!','f.pellegrini',5,'2023-10-17 10:34:23'),(10,'Hi there! Let\'s have a great conversation.','primonome',5,'2023-10-17 10:34:23'),(11,'Hello, this is the start of our chat!','m.capelli',6,'2023-10-17 10:34:23'),(12,'Hi there! Let\'s have a great conversation.','v.moretti',6,'2023-10-17 10:34:23'),(13,'Hello, this is the start of our chat!','l.rossi',7,'2023-10-17 10:34:23'),(14,'Hi there! Let\'s have a great conversation.','l.russo',7,'2023-10-17 10:34:23'),(15,'Hello, this is the start of our chat!','f.pellegrini',8,'2023-10-17 10:34:23'),(16,'Hi there! Let\'s have a great conversation.','s.martini',8,'2023-10-17 10:34:23'),(17,'Hello, this is the start of our chat!','a.bianchi',9,'2023-10-17 10:34:23'),(18,'Hi there! Let\'s have a great conversation.','s.martini',9,'2023-10-17 10:34:23'),(19,'Hello, this is the start of our chat!','a.bianchi',10,'2023-10-17 10:34:23'),(20,'Hi there! Let\'s have a great conversation.','v.moretti',10,'2023-10-17 10:34:23'),(34,'ciao !!','a.bianchi',4,'2023-10-19 11:08:06'),(35,'ciaone!','l.rossi',4,'2023-10-19 11:08:34'),(36,'hb','l.rossi',4,'2023-10-19 11:41:09'),(37,'hbhbhbbb','l.rossi',4,'2023-10-19 11:41:25'),(38,'kk','a.bianchi',4,'2023-10-19 11:44:22');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `password` text NOT NULL,
  `name` varchar(16) NOT NULL,
  `surname` varchar(16) NOT NULL,
  `department` enum('IT','HR','Administration','Buying','Selling') NOT NULL,
  `onlineFlag` tinyint(1) NOT NULL,
  `creationTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a.bianchi','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Alessia','Bianchi','HR',1,'2023-10-15 00:00:00'),('a.neri','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Andrea','Neri','Buying',0,'2023-10-15 00:00:00'),('f.pellegrini','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Federica','Pellegrini','Selling',0,'2023-10-15 00:00:00'),('g.ferretti','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Giulia','Ferretti','Selling',0,'2023-10-15 00:00:00'),('l.rossi','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Luca','Rossi','Buying',1,'2023-10-15 00:00:00'),('l.russo','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Laura','Russo','Selling',0,'2023-10-15 00:00:00'),('m.capelli','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Marco','Capelli','IT',0,'2023-10-15 00:00:00'),('mario.rossi','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Mario','Rossi','IT',0,'2023-10-15 00:00:00'),('p.santoro','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Paolo','Santoro','Buying',0,'2023-10-15 00:00:00'),('primonome','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','primo','nome','Administration',1,'2023-10-14 00:00:00'),('s.martini','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Stefano','Martini','IT',0,'2023-10-15 00:00:00'),('v.moretti','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Valentina','Moretti','Administration',0,'2023-10-15 00:00:00');
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

-- Dump completed on 2023-10-21 15:02:51
