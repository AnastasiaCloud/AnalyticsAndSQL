-- MySQL dump 10.13  Distrib 5.5.43, for Win32 (x86)
--
-- Host: localhost    Database: mixsture
-- ------------------------------------------------------
-- Server version	5.5.43

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
-- Table structure for table `заказы`
--

DROP TABLE IF EXISTS `заказы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `заказы` (
  `НомерЗаказа` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ОптовыеКлиенты_НомерКлиента` int(10) unsigned NOT NULL,
  `Препараты_КодПрепарата` int(10) unsigned NOT NULL,
  `ДатаЗаказа` date DEFAULT NULL,
  `Количество` int(10) unsigned DEFAULT NULL,
  `Скидка` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`НомерЗаказа`),
  KEY `Заказы_FKIndex1` (`Препараты_КодПрепарата`),
  KEY `Заказы_FKIndex2` (`ОптовыеКлиенты_НомерКлиента`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказы`
--

LOCK TABLES `заказы` WRITE;
/*!40000 ALTER TABLE `заказы` DISABLE KEYS */;
INSERT INTO `заказы` VALUES (1,10006,117,'2025-05-24',1000,20),(2,10019,121,'2025-05-07',820,35),(3,10002,106,'2025-05-08',830,47),(4,10006,109,'2025-05-23',1020,15),(5,10010,118,'2025-05-10',230,67),(6,10006,108,'2025-05-22',450,50),(7,10029,101,'2025-05-12',630,68),(8,10026,120,'2025-04-19',950,12),(9,10015,105,'2025-05-02',720,22),(10,10019,110,'2025-04-17',650,56),(11,10008,112,'2025-04-18',540,57),(12,10007,124,'2025-04-19',460,48),(13,10022,128,'2025-04-20',330,36),(14,10017,113,'2025-05-13',680,13),(15,10009,107,'2025-05-14',920,30);
/*!40000 ALTER TABLE `заказы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `оптовыеклиенты`
--

DROP TABLE IF EXISTS `оптовыеклиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `оптовыеклиенты` (
  `НомерКлиента` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(20) DEFAULT NULL,
  `Имя` varchar(20) DEFAULT NULL,
  `Отчество` varchar(20) DEFAULT NULL,
  `Город` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`НомерКлиента`)
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `оптовыеклиенты`
--

LOCK TABLES `оптовыеклиенты` WRITE;
/*!40000 ALTER TABLE `оптовыеклиенты` DISABLE KEYS */;
INSERT INTO `оптовыеклиенты` VALUES (10002,'Сидоров','Иван','Александрович','Уфа'),(10004,'Кириенко','Ольга','Ивановна','Челябинск'),(10006,'Гончаров','Кирилл','Петрович','Сочи'),(10007,'Косых','Игорь','Максимович','Красноярск'),(10008,'Аргамакова','Елизавета','Семеновна','Воронеж'),(10009,'Шипеев','Антон','Кириллович','Москва'),(10010,'Бармыкин','Олег','Даниилович','Санкт-Петербург'),(10012,'Васильев','Геннадий','Юрьевич','Казань'),(10015,'Филатова','Виолетта','Олеговна','Уфа'),(10017,'Тимофеев','Николай','Петрович','Красноярск'),(10018,'Савельев','Артур','Яковлевич','Калуга'),(10019,'Титов','Егор','Григорьевич','Тула'),(10022,'Григорьев','Олег','Валерьевич','Челябинск'),(10026,'Муратова','Светлана','Игоревна','Тула'),(10029,'Соколов','Петр','Николаевич','Тверь'),(10030,'Уварова','Мария','Петровна','Брянск');
/*!40000 ALTER TABLE `оптовыеклиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `препараты`
--

DROP TABLE IF EXISTS `препараты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `препараты` (
  `КодПрепарата` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(20) DEFAULT NULL,
  `СтранаПроизводитель` varchar(20) DEFAULT NULL,
  `Упаковка` varchar(20) DEFAULT NULL,
  `Цена` decimal(10,0) DEFAULT NULL,
  `Сертификат` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`КодПрепарата`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `препараты`
--

LOCK TABLES `препараты` WRITE;
/*!40000 ALTER TABLE `препараты` DISABLE KEYS */;
INSERT INTO `препараты` VALUES (101,'Hepabolan','Германия','Блистер',672,0),(105,'Formigran','Германия','Тюбик',678,0),(106,'Polase','Италия','Блистер',995,1),(107,'Xenical','Швейцария','Флакон',423,0),(108,'Dafflon','Франция','Ампула',867,0),(109,'Celmigon','Россия','Блистер',348,0),(110,'Selen','Норвегия','Баночка',524,0),(112,'Levain','Россия','Ампула',770,1),(113,'Ferretab','Италия','Флакон',440,0),(117,'Papillock','Россия','Флакон',340,0),(118,'Spartofer','Италия','Спрей',260,0),(120,'Aspecton','Германия','Ампула',540,0),(121,'Depakine','Россия','Тюбик',320,0),(124,'Jalucomplex','Италия','Флакон',580,0),(128,'Leukosilk','Германия','Флакон',1000,1),(129,'Ibuprofen','Россия','Блистер',410,0);
/*!40000 ALTER TABLE `препараты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `nv1`
--

DROP TABLE IF EXISTS `nv1`;
/*!50001 DROP VIEW IF EXISTS `nv1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `nv1` (
  `Фамилия` tinyint NOT NULL,
  `Город` tinyint NOT NULL,
  `Скидка` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `nv2`
--

DROP TABLE IF EXISTS `nv2`;
/*!50001 DROP VIEW IF EXISTS `nv2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `nv2` (
  `Дата` tinyint NOT NULL,
  `Кол-во заказов` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'mixsture'
--

--
-- Final view structure for view `nv1`
--

/*!50001 DROP TABLE IF EXISTS `nv1`*/;
/*!50001 DROP VIEW IF EXISTS `nv1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nv1` AS select `��������������`.`�������` AS `�������`,`��������������`.`�����` AS `�����`,`������`.`������` AS `������` from (`��������������` join `������` on((`��������������`.`������������` = `������`.`��������������_������������`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nv2`
--

/*!50001 DROP TABLE IF EXISTS `nv2`*/;
/*!50001 DROP VIEW IF EXISTS `nv2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nv2` AS select cast(`������`.`����������` as date) AS `����`,count(0) AS `���-�� �������` from `������` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02 15:07:31
