CREATE DATABASE  IF NOT EXISTS `roots_dev` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `roots_dev`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: roots_dev
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `rad_operaciones`
--

DROP TABLE IF EXISTS `rad_operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rad_operaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `importe` decimal(12,4) DEFAULT NULL,
  `operaciontipo_id` int(11) DEFAULT NULL,
  `cuotas` int(11) DEFAULT '1',
  `ctaD_id` int(11) DEFAULT NULL,
  `ctaH_id` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `empresa_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cuotaimporte` decimal(12,4) DEFAULT NULL,
  `asiento_id` int(11) DEFAULT NULL,
  `rdosxmes` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_rad_operaciones_on_operaciontipo_id` (`operaciontipo_id`),
  KEY `index_rad_operaciones_on_ctaD_id` (`ctaD_id`),
  KEY `index_rad_operaciones_on_ctaH_id` (`ctaH_id`),
  KEY `index_rad_operaciones_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operaciones`
--

LOCK TABLES `rad_operaciones` WRITE;
/*!40000 ALTER TABLE `rad_operaciones` DISABLE KEYS */;
INSERT INTO `rad_operaciones` VALUES (1,'2014-10-01',7312.3700,5,1,315,337,'SI',1,'2014-10-28 22:23:59','2014-10-28 22:24:30',7312.3700,77,0),(2,'2014-10-01',2972.1600,5,1,317,337,'SI',1,'2014-10-28 22:26:56','2014-11-24 14:43:27',NULL,98,0),(3,'2014-10-01',4000.0000,5,1,355,337,'SI',1,'2014-10-28 22:29:52','2014-10-28 22:29:52',NULL,79,0),(4,'2014-10-14',3171.2500,4,1,361,355,'',1,'2014-10-28 22:35:58','2014-10-28 22:35:58',3171.2500,80,0),(5,'2014-12-18',50.0000,4,1,328,313,'',1,'2014-12-18 23:23:28','2014-12-18 23:26:39',50.0000,103,0),(6,'2014-12-18',100.0000,2,1,339,313,'',1,'2014-12-19 01:37:40','2014-12-19 01:37:40',100.0000,104,0),(7,'2014-12-20',1500.0000,4,1,328,313,'',1,'2014-12-20 18:59:21','2014-12-20 19:06:49',1500.0000,109,0),(8,'2014-12-20',1000.0000,4,1,328,313,'',1,'2014-12-20 19:11:48','2014-12-20 19:11:48',1000.0000,110,0),(9,'2014-12-20',1500.0000,4,1,328,313,'',1,'2014-12-20 19:17:36','2014-12-20 19:17:36',1500.0000,111,0),(10,'2014-12-20',123.0000,4,1,328,313,'',1,'2014-12-20 19:18:47','2014-12-20 19:18:47',123.0000,112,0),(11,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 19:22:54','2014-12-20 19:22:54',1.0000,113,0),(12,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 19:25:29','2014-12-20 19:25:29',1.0000,114,0),(13,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 19:28:43','2014-12-20 19:28:43',1.0000,115,0),(14,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 19:30:48','2014-12-20 19:30:48',1.0000,116,0),(15,'2014-12-20',1.0000,4,1,328,317,'',1,'2014-12-20 19:37:05','2014-12-20 19:37:05',1.0000,117,0),(16,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 19:37:48','2014-12-20 19:37:48',1.0000,118,0),(17,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 20:04:41','2014-12-20 20:04:41',1.0000,119,0),(18,'2014-12-20',1.0000,4,1,328,313,'',1,'2014-12-20 20:06:35','2014-12-20 20:06:35',1.0000,120,0),(19,'2014-12-20',12.0000,2,1,338,313,'',1,'2014-12-20 20:11:55','2014-12-20 20:11:55',12.0000,122,0),(20,'2014-12-20',21312.0000,2,1,338,313,'',1,'2014-12-20 20:14:02','2014-12-20 20:14:02',21312.0000,123,0),(21,'2014-12-20',5000.0000,4,1,328,313,'',1,'2014-12-20 20:14:20','2014-12-20 20:14:20',5000.0000,124,0);
/*!40000 ALTER TABLE `rad_operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rad_operaciontipos`
--

DROP TABLE IF EXISTS `rad_operaciontipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rad_operaciontipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operaciontipos`
--

LOCK TABLES `rad_operaciontipos` WRITE;
/*!40000 ALTER TABLE `rad_operaciontipos` DISABLE KEYS */;
INSERT INTO `rad_operaciontipos` VALUES (1,1,1,'INGRESO','2014-09-09 13:55:58','2014-09-09 13:55:58'),(2,1,-1,'EGRESOS','2014-09-09 13:56:11','2014-09-09 13:56:11'),(3,1,2,'COBRANZA','2014-09-09 13:57:26','2014-09-09 13:57:51'),(4,1,-2,'PAGOS','2014-09-09 13:57:34','2014-09-09 13:57:34'),(5,1,0,'MOV. DE FONDOS','2014-09-09 13:57:43','2014-09-09 13:57:43');
/*!40000 ALTER TABLE `rad_operaciontipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_actividades`
--

DROP TABLE IF EXISTS `rba_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_actividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `actividadtipo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_actividades_on_actividadtipo_id` (`actividadtipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_actividades`
--

LOCK TABLES `rba_actividades` WRITE;
/*!40000 ALTER TABLE `rba_actividades` DISABLE KEYS */;
INSERT INTO `rba_actividades` VALUES (1,'MP1','MAIZ DE PRIMERA',1,'',1,'2014-07-21 22:17:31','2014-07-21 22:24:19'),(2,'SJ1','SOJA DE PRIMERA',1,'',1,'2014-07-21 22:24:01','2014-07-21 22:24:01');
/*!40000 ALTER TABLE `rba_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_actividadtipos`
--

DROP TABLE IF EXISTS `rba_actividadtipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_actividadtipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_actividadtipos`
--

LOCK TABLES `rba_actividadtipos` WRITE;
/*!40000 ALTER TABLE `rba_actividadtipos` DISABLE KEYS */;
INSERT INTO `rba_actividadtipos` VALUES (1,'AGR','AGRICOLA',1,'2014-07-21 21:47:20','2014-07-21 21:47:20'),(2,'GAN','GANADERAS',1,'2014-07-21 22:22:25','2014-07-21 22:22:41');
/*!40000 ALTER TABLE `rba_actividadtipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_arboles`
--

DROP TABLE IF EXISTS `rba_arboles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_arboles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_arboles_on_modelo` (`modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_arboles`
--

LOCK TABLES `rba_arboles` WRITE;
/*!40000 ALTER TABLE `rba_arboles` DISABLE KEYS */;
INSERT INTO `rba_arboles` VALUES (1,'CUENTAS','rco/cuentas','2014-06-24 23:42:26','2014-06-27 13:32:09'),(13,'USUARIOS','rba/usuarios','2014-07-04 14:55:04','2014-07-22 21:45:21'),(20,'TIPOS DE ACTIVIDADES','rba/actividadtipos','2014-07-21 21:48:59','2014-07-21 21:48:59'),(21,'ESTADOS','rga/estados','2014-07-23 21:54:09','2014-07-23 21:54:09'),(22,'CAMPOS','rba/establecimientos','2014-07-25 21:17:12','2014-07-25 21:17:12'),(23,'GRUPOS','rba/empresagrupos','2014-10-30 03:01:26','2014-10-30 03:01:26');
/*!40000 ALTER TABLE `rba_arboles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_campanas`
--

DROP TABLE IF EXISTS `rba_campanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_campanas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temporada_id` int(11) DEFAULT NULL,
  `campanatipo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_campanas_on_temporada_id` (`temporada_id`),
  KEY `index_rba_campanas_on_campanatipo_id` (`campanatipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_campanas`
--

LOCK TABLES `rba_campanas` WRITE;
/*!40000 ALTER TABLE `rba_campanas` DISABLE KEYS */;
INSERT INTO `rba_campanas` VALUES (1,'1','C1415G','C-1415-GRUESA','',1,2,'2014-07-22 15:08:49','2014-07-22 15:08:49'),(2,'1','C1415F','C-1415-FINA','',1,1,'2014-07-22 15:09:10','2014-07-22 15:09:10'),(3,'1','C1415','C-1415-GENERAL','GENERAL',1,3,'2014-07-22 22:05:28','2014-07-22 22:11:25');
/*!40000 ALTER TABLE `rba_campanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_campanatipos`
--

DROP TABLE IF EXISTS `rba_campanatipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_campanatipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_campanatipos`
--

LOCK TABLES `rba_campanatipos` WRITE;
/*!40000 ALTER TABLE `rba_campanatipos` DISABLE KEYS */;
INSERT INTO `rba_campanatipos` VALUES (1,'1','F','FINA','','2014-07-22 15:05:36','2014-07-22 15:05:36'),(2,'1','G','GRUESA','','2014-07-22 15:05:46','2014-07-22 15:05:46'),(3,'1','GRAL','GENERAL','','2014-07-22 22:06:34','2014-07-22 22:06:34');
/*!40000 ALTER TABLE `rba_campanatipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_catfiscales`
--

DROP TABLE IF EXISTS `rba_catfiscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_catfiscales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_catfiscales`
--

LOCK TABLES `rba_catfiscales` WRITE;
/*!40000 ALTER TABLE `rba_catfiscales` DISABLE KEYS */;
INSERT INTO `rba_catfiscales` VALUES (1,'RI','RESPONSABLE INSCRIPTO','','2014-06-07 23:33:37','2014-06-07 23:33:37'),(2,'MON','MONOTRIBUTO','','2014-06-07 23:33:56','2014-06-07 23:33:56');
/*!40000 ALTER TABLE `rba_catfiscales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_empresagrupos`
--

DROP TABLE IF EXISTS `rba_empresagrupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_empresagrupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_empresagrupos`
--

LOCK TABLES `rba_empresagrupos` WRITE;
/*!40000 ALTER TABLE `rba_empresagrupos` DISABLE KEYS */;
INSERT INTO `rba_empresagrupos` VALUES (1,'RF','RANCHO FLOJO','','2014-06-16 22:56:04','2014-06-27 13:43:10'),(2,'OTRA','OTRA','','2014-07-21 16:07:56','2014-07-21 16:07:56');
/*!40000 ALTER TABLE `rba_empresagrupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_empresas`
--

DROP TABLE IF EXISTS `rba_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catfiscal_id` int(11) DEFAULT NULL,
  `cuit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresagrupo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_empresas_on_catfiscal_id` (`catfiscal_id`),
  KEY `index_rba_empresas_on_empresagrupo_id` (`empresagrupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_empresas`
--

LOCK TABLES `rba_empresas` WRITE;
/*!40000 ALTER TABLE `rba_empresas` DISABLE KEYS */;
INSERT INTO `rba_empresas` VALUES (1,'ERF','RANCHO FLOJO',1,'20-31624095-0',1,'2014-07-04 15:50:10','2014-07-04 15:50:10'),(2,'FER','FER',1,'21-13333212-2',1,'2014-07-23 14:29:46','2014-07-23 14:29:46');
/*!40000 ALTER TABLE `rba_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_establecimientos`
--

DROP TABLE IF EXISTS `rba_establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_establecimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `superficie` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `empresagrupo_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_establecimientos`
--

LOCK TABLES `rba_establecimientos` WRITE;
/*!40000 ALTER TABLE `rba_establecimientos` DISABLE KEYS */;
INSERT INTO `rba_establecimientos` VALUES (1,'SJ','SAN JOSE','',360.00,'2014-07-21 15:05:26','2014-07-22 21:36:14',1,1),(2,'EA','EL ALTILLO','',0.00,'2014-07-21 15:06:03','2014-07-21 15:06:03',1,NULL),(3,'PR','pR','',0.00,'2014-07-21 16:02:57','2014-07-21 16:02:57',2,NULL),(7,'EM','EL MANGURLLO','',150.00,'2014-07-22 00:54:38','2014-07-22 00:54:38',1,1);
/*!40000 ALTER TABLE `rba_establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_items_nodos`
--

DROP TABLE IF EXISTS `rba_items_nodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_items_nodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `nodo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_items_nodos_on_item_id` (`item_id`),
  KEY `index_rba_items_nodos_on_nodo_id` (`nodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_items_nodos`
--

LOCK TABLES `rba_items_nodos` WRITE;
/*!40000 ALTER TABLE `rba_items_nodos` DISABLE KEYS */;
INSERT INTO `rba_items_nodos` VALUES (676,301,1),(677,302,1),(678,303,1),(679,304,1),(683,308,1),(684,309,1),(685,310,1),(686,311,1),(742,337,4),(746,345,12),(747,338,12),(748,341,12),(749,351,12),(750,346,12),(751,348,12),(752,347,12),(753,344,12),(754,349,12),(756,343,12),(757,340,12),(761,334,11),(762,339,12),(763,350,12),(764,342,12),(765,336,11),(766,325,15),(768,324,15),(770,319,13),(772,315,13),(773,316,13),(774,317,13),(775,318,13),(777,320,13),(778,321,13),(779,322,13),(780,323,14),(784,352,13),(785,326,15),(800,353,11),(801,354,43),(802,355,13),(803,356,12),(804,357,12),(805,358,45),(806,359,46),(807,360,43),(808,361,43),(809,362,12),(810,363,12),(811,1,48),(812,2,48),(813,328,15),(814,330,15);
/*!40000 ALTER TABLE `rba_items_nodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_lotes`
--

DROP TABLE IF EXISTS `rba_lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_lotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `establecimiento_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_lotes_on_establecimiento_id` (`establecimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_lotes`
--

LOCK TABLES `rba_lotes` WRITE;
/*!40000 ALTER TABLE `rba_lotes` DISABLE KEYS */;
INSERT INTO `rba_lotes` VALUES (3,1,'em-l1','l1','',7,'2014-07-22 01:00:11','2014-07-22 01:00:11'),(4,1,'em-l12','l12','',7,'2014-07-22 01:00:36','2014-07-22 01:00:36'),(13,1,'','L1','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(14,1,'','L2','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(15,1,'','L3','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(16,1,'','L4','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(17,1,'','L5','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(18,1,'','L6','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(19,1,'','L7','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(20,1,'','L8','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(25,0,'','L9','',1,'2014-07-25 22:31:59','2014-07-25 22:32:19');
/*!40000 ALTER TABLE `rba_lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_loteutilizaciones`
--

DROP TABLE IF EXISTS `rba_loteutilizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_loteutilizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lote_id` int(11) DEFAULT NULL,
  `campana_id` int(11) DEFAULT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `superficie` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_loteutilizaciones_on_lote_id` (`lote_id`),
  KEY `index_rba_loteutilizaciones_on_campana_id` (`campana_id`),
  KEY `index_rba_loteutilizaciones_on_actividad_id` (`actividad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_loteutilizaciones`
--

LOCK TABLES `rba_loteutilizaciones` WRITE;
/*!40000 ALTER TABLE `rba_loteutilizaciones` DISABLE KEYS */;
INSERT INTO `rba_loteutilizaciones` VALUES (1,1,'C-1415-GRUESA-SJE-L1','C-1415-GRUESA-SJE-L1','',1,1,1,80.00,'2014-07-23 15:59:33','2014-07-23 15:59:33');
/*!40000 ALTER TABLE `rba_loteutilizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_nodos`
--

DROP TABLE IF EXISTS `rba_nodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_nodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arbol_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rba_nodos_on_arbol_id` (`arbol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_nodos`
--

LOCK TABLES `rba_nodos` WRITE;
/*!40000 ALTER TABLE `rba_nodos` DISABLE KEYS */;
INSERT INTO `rba_nodos` VALUES (1,'CUENTAS',1,'2014-06-24 23:42:26','2014-06-28 22:34:57',NULL),(2,'ACTIVO',1,'2014-06-24 23:42:44','2014-06-24 23:42:44',1),(3,'PASIVO',1,'2014-06-24 23:42:51','2014-06-27 13:30:36',1),(4,'PATRIMONIO NETO',1,'2014-06-24 23:43:00','2014-06-27 13:30:38',1),(11,'INGRESOS',1,'2014-06-27 14:17:44','2014-06-27 14:17:44',1),(12,'EGRESOS',1,'2014-06-27 14:17:52','2014-06-27 14:17:52',1),(13,'CAJAS & BANCOS',1,'2014-06-27 14:18:20','2014-10-28 16:50:25',47),(14,'CLIENTES',1,'2014-06-27 14:19:12','2014-10-28 16:50:37',47),(15,'DEUDAS CP',1,'2014-06-27 14:19:28','2014-10-04 16:08:14',3),(25,'Usuarios',13,'2014-07-04 14:55:04','2014-07-04 15:13:36',NULL),(26,'Activo',13,'2014-07-04 15:13:54','2014-07-04 15:13:54',25),(33,'TIPOS DE ACTIVIDADES',20,'2014-07-21 21:48:59','2014-07-21 21:48:59',NULL),(34,'AGROPECUARIAS',20,'2014-07-21 21:49:53','2014-07-21 21:49:53',33),(35,'ESTADOS',21,'2014-07-23 21:54:09','2014-07-23 21:54:09',NULL),(36,'HEMBRAS',21,'2014-07-23 21:54:34','2014-07-23 21:54:34',35),(37,'MACHOS',21,'2014-07-23 21:54:47','2014-07-23 21:54:47',35),(38,'TERNEROS',21,'2014-07-23 21:55:06','2014-07-23 21:55:06',35),(39,'GENERAL',21,'2014-07-23 21:56:05','2014-07-23 21:56:05',35),(40,'CAMPOS',22,'2014-07-25 21:17:12','2014-07-25 21:17:12',NULL),(41,'Buenos Aires',22,'2014-07-25 21:17:41','2014-07-25 21:17:41',40),(42,'Sur',22,'2014-07-25 21:17:55','2014-07-25 21:17:55',41),(43,'DEUDAS LP',1,'2014-10-04 16:08:29','2014-10-04 16:08:29',3),(44,'NO-CORRIENTE',1,'2014-10-18 17:33:43','2014-10-18 17:33:43',2),(45,'BIENES DE USO',1,'2014-10-18 17:34:02','2014-10-18 17:34:02',44),(46,'PLAZOS FIJOS',1,'2014-10-28 16:47:23','2014-10-28 16:50:32',47),(47,'CORRIENTE',1,'2014-10-28 16:48:39','2014-12-18 22:24:10',2),(48,'GRUPOS',23,'2014-10-30 03:01:27','2014-10-30 03:01:27',NULL);
/*!40000 ALTER TABLE `rba_nodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_temporadas`
--

DROP TABLE IF EXISTS `rba_temporadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_temporadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_temporadas`
--

LOCK TABLES `rba_temporadas` WRITE;
/*!40000 ALTER TABLE `rba_temporadas` DISABLE KEYS */;
INSERT INTO `rba_temporadas` VALUES (1,'1','1415','14 - 15','','2014-07-01','2015-06-30','2014-07-22 15:03:38','2014-07-22 15:03:38');
/*!40000 ALTER TABLE `rba_temporadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_usuarios`
--

DROP TABLE IF EXISTS `rba_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_usuarios`
--

LOCK TABLES `rba_usuarios` WRITE;
/*!40000 ALTER TABLE `rba_usuarios` DISABLE KEYS */;
INSERT INTO `rba_usuarios` VALUES (8,'pony','Jose','Esteves','ajesteves@gmail.com','$2a$10$AoaLJOT8rapwWSMkR8LbkOvfsvcNBXiphjZEcCPeambgLAZrLsQPS','2014-06-03 01:27:03','2014-07-04 15:14:09'),(9,'Pepe','Pepe','Pepe','ajesteves@gmail.com.ar','$2a$10$VXVDFfeUYrdcufMrTeDrO.ZZp5a2SMc8LU0VCsxPogKNDWNBz3WVC','2014-07-04 15:15:42','2014-07-04 15:15:42');
/*!40000 ALTER TABLE `rba_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_aplicaciones`
--

DROP TABLE IF EXISTS `rco_aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_aplicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_debe_id` int(11) DEFAULT NULL,
  `reg_haber_id` int(11) DEFAULT NULL,
  `importe` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rco_aplicaciones_on_reg_haber_id` (`reg_haber_id`),
  KEY `index_rco_aplicaciones_on_reg_debe_id` (`reg_debe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_aplicaciones`
--

LOCK TABLES `rco_aplicaciones` WRITE;
/*!40000 ALTER TABLE `rco_aplicaciones` DISABLE KEYS */;
INSERT INTO `rco_aplicaciones` VALUES (4,577,578,0.0000,'2014-11-13 22:33:02','2014-11-13 22:33:02'),(10,633,586,1500.0000,'2014-12-20 20:14:20','2014-12-20 20:14:20'),(11,633,600,1234.0000,'2014-12-20 20:14:20','2014-12-20 20:14:20');
/*!40000 ALTER TABLE `rco_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_asientos`
--

DROP TABLE IF EXISTS `rco_asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_asientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  `cotizacion` decimal(12,4) DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `esgenerado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_rco_asientos_on_moneda_id` (`moneda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_asientos`
--

LOCK TABLES `rco_asientos` WRITE;
/*!40000 ALTER TABLE `rco_asientos` DISABLE KEYS */;
INSERT INTO `rco_asientos` VALUES (77,'2014-10-01',1,1.0000,'Operacion:SI','2014-10-28 22:24:30','2014-10-28 22:24:30',1,1),(79,'2014-10-01',1,1.0000,'Operacion:SI','2014-10-28 22:29:52','2014-10-28 22:29:52',1,1),(80,'2014-10-14',1,1.0000,'Operacion:','2014-10-28 22:35:58','2014-10-28 22:35:58',1,1),(88,'2014-09-15',1,1.0000,'PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 22:44:01',1,0),(89,'2014-09-15',1,1.0000,'PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 22:44:16',1,0),(90,'2014-09-15',1,1.0000,'PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 22:44:27',1,0),(92,'2014-09-15',1,1.0000,'PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1,0),(93,'2014-09-15',1,1.0000,'PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',1,0),(94,'2014-09-20',1,1.0000,'TRANSFERENCIA DEL BNA A GALEANTE POR COMPRA DEL FLUENCE','2014-10-29 22:58:14','2014-10-29 22:58:14',1,0),(95,'2014-09-15',1,1.0000,'PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1,0),(96,'2014-11-07',1,1.0000,'','2014-11-07 21:51:13','2014-11-07 21:51:13',1,0),(97,'2014-11-24',1,1.0000,'hola','2014-11-24 14:33:25','2014-11-24 14:52:18',1,0),(98,'2014-10-01',1,1.0000,'Operacion:SI','2014-11-24 14:43:27','2014-11-24 14:43:27',1,1),(99,'2014-12-18',1,1.0000,'','2014-12-18 16:10:39','2014-12-18 16:10:39',1,0),(100,'2014-12-18',1,1.0000,'VISA A PAGAR','2014-12-18 22:20:19','2014-12-18 22:20:44',1,0),(103,'2014-12-18',1,1.0000,'Operacion:','2014-12-18 23:26:39','2014-12-18 23:26:39',1,1),(104,'2014-12-18',1,1.0000,'Operacion:','2014-12-19 01:37:40','2014-12-19 01:37:40',1,1),(107,'2014-12-20',1,1.0000,'dic','2014-12-20 19:04:30','2014-12-20 19:04:30',1,0),(109,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:06:49','2014-12-20 19:06:49',1,1),(110,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:11:48','2014-12-20 19:11:48',1,1),(111,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:17:36','2014-12-20 19:17:36',1,1),(112,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:18:47','2014-12-20 19:18:47',1,1),(113,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:22:54','2014-12-20 19:22:54',1,1),(114,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:25:29','2014-12-20 19:25:29',1,1),(115,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:28:43','2014-12-20 19:28:43',1,1),(116,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:30:48','2014-12-20 19:30:48',1,1),(117,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:37:05','2014-12-20 19:37:05',1,1),(118,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 19:37:48','2014-12-20 19:37:48',1,1),(119,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 20:04:41','2014-12-20 20:04:41',1,1),(120,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 20:06:35','2014-12-20 20:06:35',1,1),(122,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 20:11:55','2014-12-20 20:11:55',1,1),(123,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 20:14:02','2014-12-20 20:14:02',1,1),(124,'2014-12-20',1,1.0000,'Operacion:','2014-12-20 20:14:20','2014-12-20 20:14:20',1,1);
/*!40000 ALTER TABLE `rco_asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_cotizaciones`
--

DROP TABLE IF EXISTS `rco_cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_cotizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `cotizacion` decimal(12,4) DEFAULT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rco_cotizaciones_on_moneda_id` (`moneda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cotizaciones`
--

LOCK TABLES `rco_cotizaciones` WRITE;
/*!40000 ALTER TABLE `rco_cotizaciones` DISABLE KEYS */;
INSERT INTO `rco_cotizaciones` VALUES (1,'2001-01-01',1.0000,1,'2014-07-08 15:51:15','2014-07-08 15:51:15'),(2,'2014-01-01',8.0000,2,'2014-07-08 15:54:34','2014-07-08 15:54:34'),(3,'2014-01-01',12.0000,3,'2014-07-08 16:10:40','2014-07-08 16:10:40'),(4,'2014-01-01',5.0000,4,'2014-07-08 16:10:51','2014-07-08 16:10:51');
/*!40000 ALTER TABLE `rco_cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_cuentas`
--

DROP TABLE IF EXISTS `rco_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `cuentatipo_id` int(11) DEFAULT NULL,
  `empresagrupo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rco_cuentas_on_cuentatipo_id` (`cuentatipo_id`),
  KEY `index_rco_cuentas_on_empresagrupo_id` (`empresagrupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cuentas`
--

LOCK TABLES `rco_cuentas` WRITE;
/*!40000 ALTER TABLE `rco_cuentas` DISABLE KEYS */;
INSERT INTO `rco_cuentas` VALUES (312,'RODADOS','RODADOS',1,'',12,1,'2014-06-27 14:12:20','2014-07-08 17:04:24'),(313,'CAJA GENERAL $','CAJA GENERAL $',1,'',3,1,'2014-06-27 14:12:20','2014-06-28 22:22:32'),(315,'BBVA CA','BBVA CA',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:22'),(316,'BBVA CTA CTE','BBVA CTA CTE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:32'),(317,'PROV CA','PROV CA',1,NULL,3,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(318,'CAJA GRIS $','CAJA GRIS $',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(319,'CAJA GRIS U$S','CAJA GRIS U$S',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:25'),(320,'CAJA GRIS UY','CAJA GRIS UY',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(321,'CAJA GRIS REAIS','CAJA GRIS REAIS',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(322,'CUENTA CANJE','CUENTA CANJE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(323,'POR COBRAR','POR COBRAR',1,'',4,1,'2014-06-27 14:12:21','2014-06-28 22:11:31'),(324,'BBVA VISA','BBVA VISA',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(325,'BBVA MASTER','BBVA MASTER',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(326,'PROV VISA','PROV VISA',1,'',9,1,'2014-06-27 14:12:21','2014-06-28 22:11:41'),(327,'SERVICIOS A PAGAR','SERVICIOS A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(328,'BBVA VISA A PAGAR','BBVA VISA A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(329,'BBVA MASTER A PAGAR','BBVA MASTER A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(330,'PROV VISA A PAGAR','PROV VISA A PAGAR',1,'',9,1,'2014-06-27 14:12:22','2014-06-28 22:11:41'),(331,'FC JOSE','SUELDO JOSE',1,'SERVICIOS FACTURADOS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(332,'SUELDO FLO','SUELDO FLO',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(333,'VET','VET',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(334,'ROOTS','ROOTS',1,'FC SERVICIOS ROOTS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(336,'REGALOS RECIBIDOS','REGALOS RECIBIDOS',1,'',6,1,'2014-06-27 14:12:22','2014-10-16 21:58:08'),(337,'CAPITAL','CAPITAL',1,'',5,1,'2014-06-27 14:12:22','2014-10-11 00:03:09'),(338,'ALQUILER','ALQUILER',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(339,'SUPERMERCADO','SUPERMERCADO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(340,'SERVICIOS','SERVICIOS',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(341,'AUTO','AUTO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(342,'VIAJES','VIAJES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(343,'REGALOS REALIZADOS','REGALOS REALIZADOS',1,'',7,1,'2014-06-27 14:12:23','2014-10-16 21:58:21'),(344,'GENERALES','GENERALES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(345,'ALMUERZOS','ALMUERZOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(346,'EDUCACION','EDUCACION',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(347,'EXTRA ORDINARIOS','EXTRA ORDINARIOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(348,'ENTRETENIMIENTO','ENTRETENIMIENTO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(349,'MANTENIMIENTO CUENTAS','MANTENIMIENTO CUENTAS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(350,'TELEFONO','TELEFONO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(351,'COMBUSTIBLE','COMBUSTIBLE',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(352,'BBVA COM','BBVA COM',1,'CUENTA COMITENTE',3,1,'2014-07-08 15:00:16','2014-07-08 15:07:16'),(353,'TUR','TURISMO',1,'',7,1,'2014-07-23 14:26:03','2014-07-23 14:26:03'),(354,'PROCREAUTO','PROCREAUTO',1,'',11,1,'2014-10-04 16:09:15','2014-10-29 20:09:36'),(355,'BNA CA','BNA CA',1,'',3,1,'2014-10-04 16:10:03','2014-10-29 18:20:42'),(356,'OBRA SOCIAL','OBRA SOCIAL',1,'',7,1,'2014-10-17 02:38:23','2014-10-17 02:38:23'),(357,'PERSONAL CASA','PERSONAL CASA',1,'',7,1,'2014-10-18 01:22:25','2014-10-18 01:22:25'),(358,'FLUENCE','FLUENCE',1,'',12,1,'2014-10-18 17:35:27','2014-10-18 17:35:31'),(359,'BBVA PF','BBVA PF',1,'',3,1,'2014-10-28 16:51:07','2014-10-28 16:51:07'),(360,'INTERESES A DEVENGAR','INTERESES A DEVENGAR',1,'',9,1,'2014-10-28 22:32:34','2014-10-28 22:32:34'),(361,'PROCREAUTO A PAGAR','PROCREAUTO A PAGAR',1,'',9,1,'2014-10-28 22:33:40','2014-10-28 22:33:44'),(362,'INTERESES BANCARIOS','INTERESES BANCARIOS',1,'',7,1,'2014-10-29 18:26:06','2014-10-29 18:26:06'),(363,'GASTOS BANCARIOS','GASTOS BANCARIOS',1,'IMPUESTOS CHEQUES TRANSEFERENCIAS SELLADOS ETC',7,1,'2014-10-29 22:54:03','2014-10-29 22:54:03');
/*!40000 ALTER TABLE `rco_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_cuentatipos`
--

DROP TABLE IF EXISTS `rco_cuentatipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_cuentatipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cuentatipos`
--

LOCK TABLES `rco_cuentatipos` WRITE;
/*!40000 ALTER TABLE `rco_cuentatipos` DISABLE KEYS */;
INSERT INTO `rco_cuentatipos` VALUES (3,'1.1','BANCOS & CAJAS',1,'','2014-06-24 19:05:08','2014-06-27 13:51:58'),(4,'1.2','CTA CTES ACTIVO',1,'','2014-06-24 19:05:21','2014-06-27 13:54:13'),(5,'3.0','PATRIMONIO NETO',1,'','2014-06-24 19:05:59','2014-06-27 13:52:21'),(6,'4.0','INGRESOS',1,'','2014-06-24 19:08:51','2014-06-27 13:52:21'),(7,'5.0','EGRESOS',1,'\r\n','2014-06-24 19:09:15','2014-06-27 13:52:21'),(8,'6.0','DIF DE INVENTARIO',1,'','2014-06-24 19:09:39','2014-06-27 13:52:21'),(9,'2.2','CTA CTE PASIVO',1,'','2014-06-27 13:49:07','2014-06-27 13:52:21'),(10,'1.0','ACTIVO',1,'','2014-06-27 13:52:38','2014-06-27 13:52:38'),(11,'2.0','PASIVO',1,'','2014-06-27 13:54:25','2014-06-27 13:54:25'),(12,'1.3','BIENES DE CAMBIO',1,'','2014-07-08 17:02:02','2014-10-18 17:35:10'),(13,'1.4','BIENES DE USO',1,'','2014-10-18 17:34:58','2014-10-18 17:34:58');
/*!40000 ALTER TABLE `rco_cuentatipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_monedas`
--

DROP TABLE IF EXISTS `rco_monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_monedas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_monedas`
--

LOCK TABLES `rco_monedas` WRITE;
/*!40000 ALTER TABLE `rco_monedas` DISABLE KEYS */;
INSERT INTO `rco_monedas` VALUES (1,'PESOS','PESOS','2014-06-27 21:49:02','2014-06-27 21:49:02'),(2,'DOLARES','DOLARES','2014-06-27 21:49:24','2014-06-27 21:49:24'),(3,'EURO','EURO','2014-06-27 21:52:23','2014-06-27 21:52:23'),(4,'REALES','REALES','2014-06-27 21:52:23','2014-06-27 21:52:23');
/*!40000 ALTER TABLE `rco_monedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rco_registros`
--

DROP TABLE IF EXISTS `rco_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rco_registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `asiento_id` int(11) DEFAULT NULL,
  `cuenta_id` int(11) DEFAULT NULL,
  `debe` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `haber` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `vencimiento` date DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `debe_op` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `haber_op` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `index_rco_registros_on_asiento_id` (`asiento_id`),
  KEY `index_rco_registros_on_cuenta_id` (`cuenta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=635 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_registros`
--

LOCK TABLES `rco_registros` WRITE;
/*!40000 ALTER TABLE `rco_registros` DISABLE KEYS */;
INSERT INTO `rco_registros` VALUES (224,'2014-10-01',77,315,7312.3700,0.0000,NULL,NULL,'2014-10-28 22:24:30','2014-10-28 22:24:30',7312.3700,0.0000),(225,'2014-10-01',77,337,0.0000,7312.3700,NULL,NULL,'2014-10-28 22:24:30','2014-10-28 22:24:30',0.0000,7312.3700),(228,'2014-10-01',79,355,4000.0000,0.0000,NULL,NULL,'2014-10-28 22:29:52','2014-10-28 22:29:52',4000.0000,0.0000),(229,'2014-10-01',79,337,0.0000,4000.0000,NULL,NULL,'2014-10-28 22:29:52','2014-10-28 22:29:52',0.0000,4000.0000),(230,'2014-10-14',80,361,3171.2500,0.0000,NULL,NULL,'2014-10-28 22:35:58','2014-10-28 22:35:58',3171.2500,0.0000),(231,'2014-10-14',80,355,0.0000,3171.2500,NULL,NULL,'2014-10-28 22:35:58','2014-10-28 22:35:58',0.0000,3171.2500),(279,'2014-09-15',88,355,2415.0200,0.0000,NULL,'PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',2415.0200,0.0000),(280,'2014-09-15',88,354,0.0000,789.1200,NULL,'1 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',0.0000,789.1200),(281,'2014-09-15',88,354,0.0000,804.9000,NULL,'2 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',0.0000,804.9000),(282,'2014-09-15',88,354,0.0000,821.0000,NULL,'3 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',0.0000,821.0000),(283,'2014-10-10',88,354,789.1200,0.0000,NULL,'1 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',789.1200,0.0000),(284,'2014-11-10',88,354,804.9000,0.0000,NULL,'2 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',804.9000,0.0000),(285,'2014-12-10',88,354,821.0000,0.0000,NULL,'3 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',821.0000,0.0000),(286,'2014-10-10',88,362,2382.1300,0.0000,NULL,'1 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',2382.1300,0.0000),(287,'2014-11-10',88,362,1893.8000,0.0000,NULL,'2 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',1893.8000,0.0000),(288,'2014-12-10',88,362,1876.7900,0.0000,NULL,'3 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',1876.7900,0.0000),(289,'2014-10-10',88,361,0.0000,3171.2500,NULL,'1 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',0.0000,3171.2500),(290,'2014-11-10',88,361,0.0000,2698.7000,NULL,'2 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',0.0000,2698.7000),(291,'2014-12-10',88,361,0.0000,2697.7900,NULL,'3 – PROCREAUTO 2014','2014-10-29 20:25:29','2014-10-29 20:25:29',0.0000,2697.7900),(292,'2014-09-15',89,355,11231.5300,0.0000,NULL,'PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',11231.5300,0.0000),(293,'2014-09-15',89,354,0.0000,837.4200,NULL,'4 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,837.4200),(294,'2014-09-15',89,354,0.0000,854.1700,NULL,'5 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,854.1700),(295,'2014-09-15',89,354,0.0000,871.2500,NULL,'6 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,871.2500),(296,'2014-09-15',89,354,0.0000,888.6700,NULL,'7 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,888.6700),(297,'2014-09-15',89,354,0.0000,906.4500,NULL,'8 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,906.4500),(298,'2014-09-15',89,354,0.0000,924.5800,NULL,'9 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,924.5800),(299,'2014-09-15',89,354,0.0000,943.0700,NULL,'10 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,943.0700),(300,'2014-09-15',89,354,0.0000,961.9300,NULL,'11 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,961.9300),(301,'2014-09-15',89,354,0.0000,981.1700,NULL,'12 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,981.1700),(302,'2014-09-15',89,354,0.0000,1000.7900,NULL,'13 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,1000.7900),(303,'2014-09-15',89,354,0.0000,1020.8100,NULL,'14 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,1020.8100),(304,'2014-09-15',89,354,0.0000,1041.2200,NULL,'15 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,1041.2200),(305,'2015-01-12',89,354,837.4200,0.0000,NULL,'4 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',837.4200,0.0000),(306,'2015-02-10',89,354,854.1700,0.0000,NULL,'5 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',854.1700,0.0000),(307,'2015-03-10',89,354,871.2500,0.0000,NULL,'6 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',871.2500,0.0000),(308,'2015-04-10',89,354,888.6700,0.0000,NULL,'7 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',888.6700,0.0000),(309,'2015-05-11',89,354,906.4500,0.0000,NULL,'8 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',906.4500,0.0000),(310,'2015-06-10',89,354,924.5800,0.0000,NULL,'9 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',924.5800,0.0000),(311,'2015-07-10',89,354,943.0700,0.0000,NULL,'10 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',943.0700,0.0000),(312,'2015-08-10',89,354,961.9300,0.0000,NULL,'11 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',961.9300,0.0000),(313,'2015-09-10',89,354,981.1700,0.0000,NULL,'12 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',981.1700,0.0000),(314,'2015-10-13',89,354,1000.7900,0.0000,NULL,'13 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1000.7900,0.0000),(315,'2015-11-10',89,354,1020.8100,0.0000,NULL,'14 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1020.8100,0.0000),(316,'2015-12-10',89,354,1041.2200,0.0000,NULL,'15 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1041.2200,0.0000),(317,'2015-01-12',89,362,1859.4300,0.0000,NULL,'4 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1859.4300,0.0000),(318,'2015-02-10',89,362,1841.7400,0.0000,NULL,'5 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1841.7400,0.0000),(319,'2015-03-10',89,362,1823.7000,0.0000,NULL,'6 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1823.7000,0.0000),(320,'2015-04-10',89,362,1805.2800,0.0000,NULL,'7 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1805.2800,0.0000),(321,'2015-05-11',89,362,1786.5100,0.0000,NULL,'8 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1786.5100,0.0000),(322,'2015-06-10',89,362,1767.3900,0.0000,NULL,'9 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1767.3900,0.0000),(323,'2015-07-10',89,362,1747.8200,0.0000,NULL,'10 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1747.8200,0.0000),(324,'2015-08-10',89,362,1727.9100,0.0000,NULL,'11 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1727.9100,0.0000),(325,'2015-09-10',89,362,1707.5800,0.0000,NULL,'12 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1707.5800,0.0000),(326,'2015-10-13',89,362,1686.8500,0.0000,NULL,'13 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1686.8500,0.0000),(327,'2015-11-10',89,362,1665.7100,0.0000,NULL,'14 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1665.7100,0.0000),(328,'2015-12-10',89,362,1644.1300,0.0000,NULL,'15 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',1644.1300,0.0000),(329,'2015-01-12',89,361,0.0000,2696.8500,NULL,'4 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2696.8500),(330,'2015-02-10',89,361,0.0000,2695.9100,NULL,'5 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2695.9100),(331,'2015-03-10',89,361,0.0000,2694.9500,NULL,'6 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2694.9500),(332,'2015-04-10',89,361,0.0000,2693.9500,NULL,'7 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2693.9500),(333,'2015-05-11',89,361,0.0000,2692.9600,NULL,'8 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2692.9600),(334,'2015-06-10',89,361,0.0000,2691.9700,NULL,'9 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2691.9700),(335,'2015-07-10',89,361,0.0000,2690.8900,NULL,'10 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2690.8900),(336,'2015-08-10',89,361,0.0000,2689.8400,NULL,'11 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2689.8400),(337,'2015-09-10',89,361,0.0000,2688.7500,NULL,'12 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2688.7500),(338,'2015-10-13',89,361,0.0000,2687.6400,NULL,'13 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2687.6400),(339,'2015-11-10',89,361,0.0000,2686.5200,NULL,'14 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2686.5200),(340,'2015-12-10',89,361,0.0000,2685.3500,NULL,'15 – PROCREAUTO 2015','2014-10-29 20:25:46','2014-10-29 20:25:46',0.0000,2685.3500),(341,'2014-09-15',90,355,14244.2800,0.0000,NULL,'PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',14244.2800,0.0000),(342,'2014-09-15',90,354,0.0000,1062.0500,NULL,'16 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1062.0500),(343,'2014-09-15',90,354,0.0000,1083.2900,NULL,'17 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1083.2900),(344,'2014-09-15',90,354,0.0000,1104.9500,NULL,'18 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1104.9500),(345,'2014-09-15',90,354,0.0000,1127.0500,NULL,'19 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1127.0500),(346,'2014-09-15',90,354,0.0000,1149.5900,NULL,'20 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1149.5900),(347,'2014-09-15',90,354,0.0000,1172.5900,NULL,'21 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1172.5900),(348,'2014-09-15',90,354,0.0000,1196.0400,NULL,'22 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1196.0400),(349,'2014-09-15',90,354,0.0000,1219.9600,NULL,'23 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1219.9600),(350,'2014-09-15',90,354,0.0000,1244.3600,NULL,'24 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1244.3600),(351,'2014-09-15',90,354,0.0000,1269.2500,NULL,'25 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1269.2500),(352,'2014-09-15',90,354,0.0000,1294.6300,NULL,'26 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1294.6300),(353,'2014-09-15',90,354,0.0000,1320.5200,NULL,'27 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,1320.5200),(354,'2016-01-11',90,354,1062.0500,0.0000,NULL,'16 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1062.0500,0.0000),(355,'2016-02-10',90,354,1083.2900,0.0000,NULL,'17 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1083.2900,0.0000),(356,'2016-03-10',90,354,1104.9500,0.0000,NULL,'18 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1104.9500,0.0000),(357,'2016-04-11',90,354,1127.0500,0.0000,NULL,'19 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1127.0500,0.0000),(358,'2016-05-10',90,354,1149.5900,0.0000,NULL,'20 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1149.5900,0.0000),(359,'2016-06-10',90,354,1172.5900,0.0000,NULL,'21 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1172.5900,0.0000),(360,'2016-07-11',90,354,1196.0400,0.0000,NULL,'22 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1196.0400,0.0000),(361,'2016-08-10',90,354,1219.9600,0.0000,NULL,'23 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1219.9600,0.0000),(362,'2016-09-12',90,354,1244.3600,0.0000,NULL,'24 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1244.3600,0.0000),(363,'2016-10-11',90,354,1269.2500,0.0000,NULL,'25 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1269.2500,0.0000),(364,'2016-11-10',90,354,1294.6300,0.0000,NULL,'26 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1294.6300,0.0000),(365,'2016-12-12',90,354,1320.5200,0.0000,NULL,'27 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1320.5200,0.0000),(366,'2016-01-11',90,362,1622.1400,0.0000,NULL,'16 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1622.1400,0.0000),(367,'2016-02-10',90,362,1599.7000,0.0000,NULL,'17 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1599.7000,0.0000),(368,'2016-03-10',90,362,1576.8200,0.0000,NULL,'18 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1576.8200,0.0000),(369,'2016-04-11',90,362,1553.4500,0.0000,NULL,'19 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1553.4500,0.0000),(370,'2016-05-10',90,362,1529.6500,0.0000,NULL,'20 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1529.6500,0.0000),(371,'2016-06-10',90,362,1505.3700,0.0000,NULL,'21 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1505.3700,0.0000),(372,'2016-07-11',90,362,1480.5900,0.0000,NULL,'22 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1480.5900,0.0000),(373,'2016-08-10',90,362,1455.3300,0.0000,NULL,'23 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1455.3300,0.0000),(374,'2016-09-12',90,362,1429.5500,0.0000,NULL,'24 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1429.5500,0.0000),(375,'2016-10-11',90,362,1403.2400,0.0000,NULL,'25 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1403.2400,0.0000),(376,'2016-11-10',90,362,1376.4400,0.0000,NULL,'26 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1376.4400,0.0000),(377,'2016-12-12',90,362,1349.0700,0.0000,NULL,'27 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',1349.0700,0.0000),(378,'2016-01-11',90,361,0.0000,2684.1900,NULL,'16 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2684.1900),(379,'2016-02-10',90,361,0.0000,2682.9900,NULL,'17 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2682.9900),(380,'2016-03-10',90,361,0.0000,2681.7700,NULL,'18 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2681.7700),(381,'2016-04-11',90,361,0.0000,2680.5000,NULL,'19 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2680.5000),(382,'2016-05-10',90,361,0.0000,2679.2400,NULL,'20 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2679.2400),(383,'2016-06-10',90,361,0.0000,2677.9600,NULL,'21 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2677.9600),(384,'2016-07-11',90,361,0.0000,2676.6300,NULL,'22 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2676.6300),(385,'2016-08-10',90,361,0.0000,2675.2900,NULL,'23 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2675.2900),(386,'2016-09-12',90,361,0.0000,2673.9100,NULL,'24 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2673.9100),(387,'2016-10-11',90,361,0.0000,2672.4900,NULL,'25 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2672.4900),(388,'2016-11-10',90,361,0.0000,2671.0700,NULL,'26 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2671.0700),(389,'2016-12-12',90,361,0.0000,2669.5900,NULL,'27 – PROCREAUTO 2016','2014-10-29 20:35:32','2014-10-29 20:35:32',0.0000,2669.5900),(439,'2014-09-15',92,355,22911.0200,0.0000,NULL,'PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',22911.0200,0.0000),(440,'2014-09-15',92,354,0.0000,1708.2400,NULL,'40 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1708.2400),(441,'2014-09-15',92,354,0.0000,1742.4000,NULL,'41 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1742.4000),(442,'2014-09-15',92,354,0.0000,1777.2500,NULL,'42 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1777.2500),(443,'2014-09-15',92,354,0.0000,1812.7900,NULL,'43 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1812.7900),(444,'2014-09-15',92,354,0.0000,1849.0500,NULL,'44 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1849.0500),(445,'2014-09-15',92,354,0.0000,1886.0300,NULL,'45 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1886.0300),(446,'2014-09-15',92,354,0.0000,1923.7500,NULL,'46 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1923.7500),(447,'2014-09-15',92,354,0.0000,1962.2300,NULL,'47 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,1962.2300),(448,'2014-09-15',92,354,0.0000,2001.4700,NULL,'48 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2001.4700),(449,'2014-09-15',92,354,0.0000,2041.5000,NULL,'49 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2041.5000),(450,'2014-09-15',92,354,0.0000,2082.3300,NULL,'50 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2082.3300),(451,'2014-09-15',92,354,0.0000,2123.9800,NULL,'51 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2123.9800),(452,'2018-01-10',92,354,1708.2400,0.0000,NULL,'40 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1708.2400,0.0000),(453,'2018-02-14',92,354,1742.4000,0.0000,NULL,'41 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1742.4000,0.0000),(454,'2018-03-12',92,354,1777.2500,0.0000,NULL,'42 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1777.2500,0.0000),(455,'2018-04-10',92,354,1812.7900,0.0000,NULL,'43 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1812.7900,0.0000),(456,'2018-05-10',92,354,1849.0500,0.0000,NULL,'44 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1849.0500,0.0000),(457,'2018-06-11',92,354,1886.0300,0.0000,NULL,'45 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1886.0300,0.0000),(458,'2018-07-10',92,354,1923.7500,0.0000,NULL,'46 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1923.7500,0.0000),(459,'2018-08-10',92,354,1962.2300,0.0000,NULL,'47 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',1962.2300,0.0000),(460,'2018-09-10',92,354,2001.4700,0.0000,NULL,'48 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',2001.4700,0.0000),(461,'2018-10-10',92,354,2041.5000,0.0000,NULL,'49 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',2041.5000,0.0000),(462,'2018-11-12',92,354,2082.3300,0.0000,NULL,'50 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',2082.3300,0.0000),(463,'2018-12-10',92,354,2123.9800,0.0000,NULL,'51 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',2123.9800,0.0000),(464,'2018-01-10',92,362,939.5000,0.0000,NULL,'40 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',939.5000,0.0000),(465,'2018-02-14',92,362,903.4300,0.0000,NULL,'41 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',903.4300,0.0000),(466,'2018-03-12',92,362,866.6000,0.0000,NULL,'42 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',866.6000,0.0000),(467,'2018-04-10',92,362,829.0500,0.0000,NULL,'43 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',829.0500,0.0000),(468,'2018-05-10',92,362,790.7600,0.0000,NULL,'44 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',790.7600,0.0000),(469,'2018-06-11',92,362,751.6900,0.0000,NULL,'45 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',751.6900,0.0000),(470,'2018-07-10',92,362,711.8400,0.0000,NULL,'46 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',711.8400,0.0000),(471,'2018-08-10',92,362,701.1900,0.0000,NULL,'47 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',701.1900,0.0000),(472,'2018-09-10',92,362,629.7500,0.0000,NULL,'48 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',629.7500,0.0000),(473,'2018-10-10',92,362,587.4500,0.0000,NULL,'49 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',587.4500,0.0000),(474,'2018-11-12',92,362,544.3100,0.0000,NULL,'50 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',544.3100,0.0000),(475,'2018-12-10',92,362,500.3200,0.0000,NULL,'51 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',500.3200,0.0000),(476,'2018-01-10',92,361,0.0000,2647.7400,NULL,'40 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2647.7400),(477,'2018-02-14',92,361,0.0000,2645.8300,NULL,'41 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2645.8300),(478,'2018-03-12',92,361,0.0000,2643.8500,NULL,'42 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2643.8500),(479,'2018-04-10',92,361,0.0000,2641.8400,NULL,'43 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2641.8400),(480,'2018-05-10',92,361,0.0000,2639.8100,NULL,'44 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2639.8100),(481,'2018-06-11',92,361,0.0000,2637.7200,NULL,'45 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2637.7200),(482,'2018-07-10',92,361,0.0000,2635.5900,NULL,'46 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2635.5900),(483,'2018-08-10',92,361,0.0000,2663.4200,NULL,'47 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2663.4200),(484,'2018-09-10',92,361,0.0000,2631.2200,NULL,'48 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2631.2200),(485,'2018-10-10',92,361,0.0000,2628.9500,NULL,'49 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2628.9500),(486,'2018-11-12',92,361,0.0000,2626.6400,NULL,'50 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2626.6400),(487,'2018-12-10',92,361,0.0000,2624.3000,NULL,'51 – PROCREAUTO 2018','2014-10-29 22:48:18','2014-10-29 22:48:18',0.0000,2624.3000),(488,'2014-09-15',93,355,21132.9700,0.0000,NULL,'PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',21132.9700,0.0000),(489,'2014-09-15',93,354,0.0000,2166.4600,NULL,'52 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2166.4600),(490,'2014-09-15',93,354,0.0000,2209.7900,NULL,'53 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2209.7900),(491,'2014-09-15',93,354,0.0000,2253.9800,NULL,'54 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2253.9800),(492,'2014-09-15',93,354,0.0000,2299.0600,NULL,'55 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2299.0600),(493,'2014-09-15',93,354,0.0000,2345.0400,NULL,'56 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2345.0400),(494,'2014-09-15',93,354,0.0000,2391.9400,NULL,'57 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2391.9400),(495,'2014-09-15',93,354,0.0000,2439.7800,NULL,'58 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2439.7800),(496,'2014-09-15',93,354,0.0000,2488.5800,NULL,'59 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2488.5800),(497,'2014-09-15',93,354,0.0000,2538.3400,NULL,'60 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2538.3400),(498,'2019-01-10',93,354,2166.4600,0.0000,NULL,'52 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2166.4600,0.0000),(499,'2019-02-14',93,354,2209.7900,0.0000,NULL,'53 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2209.7900,0.0000),(500,'2019-03-12',93,354,2253.9800,0.0000,NULL,'54 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2253.9800,0.0000),(501,'2019-04-10',93,354,2299.0600,0.0000,NULL,'55 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2299.0600,0.0000),(502,'2019-05-10',93,354,2345.0400,0.0000,NULL,'56 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2345.0400,0.0000),(503,'2019-06-11',93,354,2391.9400,0.0000,NULL,'57 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2391.9400,0.0000),(504,'2019-07-10',93,354,2439.7800,0.0000,NULL,'58 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2439.7800,0.0000),(505,'2019-08-10',93,354,2488.5800,0.0000,NULL,'59 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2488.5800,0.0000),(506,'2019-09-10',93,354,2538.3400,0.0000,NULL,'60 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',2538.3400,0.0000),(507,'2019-01-10',93,362,455.4400,0.0000,NULL,'52 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',455.4400,0.0000),(508,'2019-02-14',93,362,409.6900,0.0000,NULL,'53 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',409.6900,0.0000),(509,'2019-03-12',93,362,362.9800,0.0000,NULL,'54 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',362.9800,0.0000),(510,'2019-04-10',93,362,315.3600,0.0000,NULL,'55 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',315.3600,0.0000),(511,'2019-05-10',93,362,266.7800,0.0000,NULL,'56 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',266.7800,0.0000),(512,'2019-06-11',93,362,217.2300,0.0000,NULL,'57 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',217.2300,0.0000),(513,'2019-07-10',93,362,166.7000,0.0000,NULL,'58 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',166.7000,0.0000),(514,'2019-08-10',93,362,115.1600,0.0000,NULL,'59 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',115.1600,0.0000),(515,'2019-09-10',93,362,62.5900,0.0000,NULL,'60 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',62.5900,0.0000),(516,'2019-01-10',93,361,0.0000,2621.9000,NULL,'52 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2621.9000),(517,'2019-02-14',93,361,0.0000,2619.4800,NULL,'53 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2619.4800),(518,'2019-03-12',93,361,0.0000,2616.9600,NULL,'54 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2616.9600),(519,'2019-04-10',93,361,0.0000,2614.4200,NULL,'55 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2614.4200),(520,'2019-05-10',93,361,0.0000,2611.8200,NULL,'56 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2611.8200),(521,'2019-06-11',93,361,0.0000,2609.1700,NULL,'57 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2609.1700),(522,'2019-07-10',93,361,0.0000,2606.4800,NULL,'58 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2606.4800),(523,'2019-08-10',93,361,0.0000,2603.7400,NULL,'59 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2603.7400),(524,'2019-09-10',93,361,0.0000,2600.9300,NULL,'60 – PROCREAUTO 2019','2014-10-29 22:50:43','2014-10-29 22:50:43',0.0000,2600.9300),(525,'2014-09-20',94,358,88920.0000,0.0000,NULL,'','2014-10-29 22:58:14','2014-10-29 22:58:14',88920.0000,0.0000),(526,'2014-09-20',94,363,1080.0000,0.0000,NULL,'','2014-10-29 22:58:14','2014-10-29 22:58:14',1080.0000,0.0000),(527,'2014-09-20',94,355,0.0000,90000.0000,NULL,'','2014-10-29 22:58:14','2014-10-29 22:58:14',0.0000,90000.0000),(528,'2014-09-15',95,355,18065.1800,0.0000,NULL,'PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',18065.1800,0.0000),(529,'2014-09-15',95,354,0.0000,1346.9300,NULL,'28 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1346.9300),(530,'2014-09-15',95,354,0.0000,1373.8700,NULL,'29 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1373.8700),(531,'2014-09-15',95,354,0.0000,1401.3500,NULL,'30 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1401.3500),(532,'2014-09-15',95,354,0.0000,1429.3800,NULL,'31 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1429.3800),(533,'2014-09-15',95,354,0.0000,1457.9600,NULL,'32 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1457.9600),(534,'2014-09-15',95,354,0.0000,1487.1200,NULL,'33 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1487.1200),(535,'2014-09-15',95,354,0.0000,1516.8700,NULL,'34 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1516.8700),(536,'2014-09-15',95,354,0.0000,1547.2000,NULL,'35 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1547.2000),(537,'2014-09-15',95,354,0.0000,1578.1500,NULL,'36 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1578.1500),(538,'2014-09-15',95,354,0.0000,1609.7100,NULL,'37 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1609.7100),(539,'2014-09-15',95,354,0.0000,1641.9000,NULL,'38 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1641.9000),(540,'2014-09-15',95,354,0.0000,1674.7400,NULL,'39 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,1674.7400),(541,'2017-01-10',95,354,1346.9300,0.0000,NULL,'28 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1346.9300,0.0000),(542,'2017-02-10',95,354,1373.8700,0.0000,NULL,'29 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1373.8700,0.0000),(543,'2017-03-10',95,354,1401.3500,0.0000,NULL,'30 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1401.3500,0.0000),(544,'2017-04-10',95,354,1429.3800,0.0000,NULL,'31 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1429.3800,0.0000),(545,'2017-05-10',95,354,1457.9600,0.0000,NULL,'32 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1457.9600,0.0000),(546,'2017-06-12',95,354,1487.1200,0.0000,NULL,'33 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1487.1200,0.0000),(547,'2017-07-10',95,354,1516.8700,0.0000,NULL,'34 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1516.8700,0.0000),(548,'2017-08-10',95,354,1547.2000,0.0000,NULL,'35 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1547.2000,0.0000),(549,'2017-09-11',95,354,1578.1500,0.0000,NULL,'36 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1578.1500,0.0000),(550,'2017-10-10',95,354,1609.7100,0.0000,NULL,'37 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1609.7100,0.0000),(551,'2017-11-10',95,354,1641.9000,0.0000,NULL,'38 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1641.9000,0.0000),(552,'2017-12-11',95,354,1674.7400,0.0000,NULL,'39 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1674.7400,0.0000),(553,'2017-01-10',95,362,1321.1800,0.0000,NULL,'28 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1321.1800,0.0000),(554,'2017-02-10',95,362,1292.7400,0.0000,NULL,'29 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1292.7400,0.0000),(555,'2017-03-10',95,362,1263.7000,0.0000,NULL,'30 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1263.7000,0.0000),(556,'2017-04-10',95,362,1234.0900,0.0000,NULL,'31 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1234.0900,0.0000),(557,'2017-05-10',95,362,1203.8900,0.0000,NULL,'32 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1203.8900,0.0000),(558,'2017-06-12',95,362,1173.0900,0.0000,NULL,'33 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1173.0900,0.0000),(559,'2017-07-10',95,362,1141.6600,0.0000,NULL,'34 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1141.6600,0.0000),(560,'2017-08-10',95,362,1109.6200,0.0000,NULL,'35 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1109.6200,0.0000),(561,'2017-09-11',95,362,1076.9300,0.0000,NULL,'36 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1076.9300,0.0000),(562,'2017-10-10',95,362,1043.5900,0.0000,NULL,'37 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1043.5900,0.0000),(563,'2017-11-10',95,362,1009.5800,0.0000,NULL,'38 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',1009.5800,0.0000),(564,'2017-12-11',95,362,974.8900,0.0000,NULL,'39 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',974.8900,0.0000),(565,'2017-01-10',95,361,0.0000,2668.1100,NULL,'28 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2668.1100),(566,'2017-02-10',95,361,0.0000,2666.6100,NULL,'29 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2666.6100),(567,'2017-03-10',95,361,0.0000,2665.0500,NULL,'30 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2665.0500),(568,'2017-04-10',95,361,0.0000,2663.4700,NULL,'31 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2663.4700),(569,'2017-05-10',95,361,0.0000,2661.8500,NULL,'32 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2661.8500),(570,'2017-06-12',95,361,0.0000,2660.2100,NULL,'33 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2660.2100),(571,'2017-07-10',95,361,0.0000,2658.5300,NULL,'34 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2658.5300),(572,'2017-08-10',95,361,0.0000,2656.8200,NULL,'35 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2656.8200),(573,'2017-09-11',95,361,0.0000,2655.0800,NULL,'36 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2655.0800),(574,'2017-10-10',95,361,0.0000,2653.3000,NULL,'37 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2653.3000),(575,'2017-11-10',95,361,0.0000,2651.4800,NULL,'38 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2651.4800),(576,'2017-12-11',95,361,0.0000,2649.6300,NULL,'39 – PROCREAUTO 2017','2014-10-30 01:51:37','2014-10-30 01:51:37',0.0000,2649.6300),(577,'2014-11-07',96,323,1000.0000,0.0000,NULL,'','2014-11-07 21:51:13','2014-11-07 21:51:13',1000.0000,0.0000),(578,'2014-11-07',96,323,0.0000,1000.0000,NULL,'','2014-11-07 21:51:13','2014-11-07 21:51:13',0.0000,1000.0000),(579,'2014-11-24',97,317,0.0000,100.0000,NULL,'hola','2014-11-24 14:33:25','2014-11-24 14:54:25',0.0000,100.0000),(580,'2014-11-24',97,317,100.0000,0.0000,NULL,'hola','2014-11-24 14:33:25','2014-11-24 14:54:25',100.0000,0.0000),(581,'2014-10-01',98,317,2972.1600,0.0000,NULL,NULL,'2014-11-24 14:43:27','2014-11-24 14:43:27',2972.1600,0.0000),(582,'2014-10-01',98,337,0.0000,2972.1600,NULL,NULL,'2014-11-24 14:43:27','2014-11-24 14:43:27',0.0000,2972.1600),(583,'2014-12-18',99,327,100.0000,0.0000,NULL,'','2014-12-18 16:10:39','2014-12-18 16:10:39',100.0000,0.0000),(584,'2014-12-18',99,355,0.0000,100.0000,NULL,'','2014-12-18 16:10:39','2014-12-18 16:10:39',0.0000,100.0000),(585,'2014-12-18',100,324,1500.0000,0.0000,NULL,'VISA A PAGAR','2014-12-18 22:20:19','2014-12-18 22:53:13',1500.0000,0.0000),(586,'2014-12-18',100,328,0.0000,1500.0000,NULL,'VISA A PAGAR','2014-12-18 22:20:19','2014-12-18 22:53:13',0.0000,1500.0000),(591,'2014-12-18',103,328,50.0000,0.0000,NULL,'Operacion:','2014-12-18 23:26:39','2014-12-18 23:26:39',50.0000,0.0000),(592,'2014-12-18',103,313,0.0000,50.0000,NULL,'Operacion:','2014-12-18 23:26:39','2014-12-18 23:26:39',0.0000,50.0000),(593,'2014-12-18',104,339,100.0000,0.0000,NULL,'Operacion:','2014-12-19 01:37:40','2014-12-19 01:37:40',100.0000,0.0000),(594,'2014-12-18',104,313,0.0000,100.0000,NULL,'Operacion:','2014-12-19 01:37:40','2014-12-19 01:37:40',0.0000,100.0000),(599,'2014-12-20',107,324,1234.0000,0.0000,NULL,'dic','2014-12-20 19:04:30','2014-12-20 19:04:30',1234.0000,0.0000),(600,'2014-12-20',107,328,0.0000,1234.0000,NULL,'dic','2014-12-20 19:04:30','2014-12-20 19:04:30',0.0000,1234.0000),(603,'2014-12-20',109,328,1500.0000,0.0000,NULL,'Operacion:','2014-12-20 19:06:49','2014-12-20 19:06:49',1500.0000,0.0000),(604,'2014-12-20',109,313,0.0000,1500.0000,NULL,'Operacion:','2014-12-20 19:06:49','2014-12-20 19:06:49',0.0000,1500.0000),(605,'2014-12-20',110,328,1000.0000,0.0000,NULL,'Operacion:','2014-12-20 19:11:48','2014-12-20 19:11:48',1000.0000,0.0000),(606,'2014-12-20',110,313,0.0000,1000.0000,NULL,'Operacion:','2014-12-20 19:11:48','2014-12-20 19:11:48',0.0000,1000.0000),(607,'2014-12-20',111,328,1500.0000,0.0000,NULL,'Operacion:','2014-12-20 19:17:36','2014-12-20 19:17:36',1500.0000,0.0000),(608,'2014-12-20',111,313,0.0000,1500.0000,NULL,'Operacion:','2014-12-20 19:17:36','2014-12-20 19:17:36',0.0000,1500.0000),(609,'2014-12-20',112,328,123.0000,0.0000,NULL,'Operacion:','2014-12-20 19:18:47','2014-12-20 19:18:47',123.0000,0.0000),(610,'2014-12-20',112,313,0.0000,123.0000,NULL,'Operacion:','2014-12-20 19:18:47','2014-12-20 19:18:47',0.0000,123.0000),(611,'2014-12-20',113,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 19:22:54','2014-12-20 19:22:54',1.0000,0.0000),(612,'2014-12-20',113,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 19:22:54','2014-12-20 19:22:54',0.0000,1.0000),(613,'2014-12-20',114,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 19:25:29','2014-12-20 19:25:29',1.0000,0.0000),(614,'2014-12-20',114,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 19:25:29','2014-12-20 19:25:29',0.0000,1.0000),(615,'2014-12-20',115,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 19:28:43','2014-12-20 19:28:43',1.0000,0.0000),(616,'2014-12-20',115,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 19:28:43','2014-12-20 19:28:43',0.0000,1.0000),(617,'2014-12-20',116,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 19:30:48','2014-12-20 19:30:48',1.0000,0.0000),(618,'2014-12-20',116,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 19:30:48','2014-12-20 19:30:48',0.0000,1.0000),(619,'2014-12-20',117,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 19:37:05','2014-12-20 19:37:05',1.0000,0.0000),(620,'2014-12-20',117,317,0.0000,1.0000,NULL,'Operacion:','2014-12-20 19:37:05','2014-12-20 19:37:05',0.0000,1.0000),(621,'2014-12-20',118,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 19:37:48','2014-12-20 19:37:48',1.0000,0.0000),(622,'2014-12-20',118,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 19:37:48','2014-12-20 19:37:48',0.0000,1.0000),(623,'2014-12-20',119,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 20:04:41','2014-12-20 20:04:41',1.0000,0.0000),(624,'2014-12-20',119,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 20:04:41','2014-12-20 20:04:41',0.0000,1.0000),(625,'2014-12-20',120,328,1.0000,0.0000,NULL,'Operacion:','2014-12-20 20:06:35','2014-12-20 20:06:35',1.0000,0.0000),(626,'2014-12-20',120,313,0.0000,1.0000,NULL,'Operacion:','2014-12-20 20:06:35','2014-12-20 20:06:35',0.0000,1.0000),(629,'2014-12-20',122,338,12.0000,0.0000,NULL,'Operacion:','2014-12-20 20:11:55','2014-12-20 20:11:55',12.0000,0.0000),(630,'2014-12-20',122,313,0.0000,12.0000,NULL,'Operacion:','2014-12-20 20:11:55','2014-12-20 20:11:55',0.0000,12.0000),(631,'2014-12-20',123,338,21312.0000,0.0000,NULL,'Operacion:','2014-12-20 20:14:02','2014-12-20 20:14:02',21312.0000,0.0000),(632,'2014-12-20',123,313,0.0000,21312.0000,NULL,'Operacion:','2014-12-20 20:14:02','2014-12-20 20:14:02',0.0000,21312.0000),(633,'2014-12-20',124,328,5000.0000,0.0000,NULL,'Operacion:','2014-12-20 20:14:20','2014-12-20 20:14:20',5000.0000,0.0000),(634,'2014-12-20',124,313,0.0000,5000.0000,NULL,'Operacion:','2014-12-20 20:14:20','2014-12-20 20:14:20',0.0000,5000.0000);
/*!40000 ALTER TABLE `rco_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_animales`
--

DROP TABLE IF EXISTS `rga_animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_animales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) NOT NULL DEFAULT '1',
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `madre_id` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rga_animales_on_madre_id` (`madre_id`),
  KEY `index_rga_animales_on_padre_id` (`padre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales`
--

LOCK TABLES `rga_animales` WRITE;
/*!40000 ALTER TABLE `rga_animales` DISABLE KEYS */;
INSERT INTO `rga_animales` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55'),(10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-30 02:05:55','2014-10-30 02:05:55');
/*!40000 ALTER TABLE `rga_animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_animales_registros`
--

DROP TABLE IF EXISTS `rga_animales_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_animales_registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_id` int(11) DEFAULT NULL,
  `registro_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rga_animales_registros_on_animal_id` (`animal_id`),
  KEY `index_rga_animales_registros_on_registro_id` (`registro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales_registros`
--

LOCK TABLES `rga_animales_registros` WRITE;
/*!40000 ALTER TABLE `rga_animales_registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `rga_animales_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_categorias`
--

DROP TABLE IF EXISTS `rga_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoriatipo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pesopromedio` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `index_rga_categorias_on_categoriatipo_id` (`categoriatipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categorias`
--

LOCK TABLES `rga_categorias` WRITE;
/*!40000 ALTER TABLE `rga_categorias` DISABLE KEYS */;
INSERT INTO `rga_categorias` VALUES (1,1,'OREJANO','OREJANO',NULL,1,'2014-07-24 21:10:41','2014-07-24 21:10:41',50.0000),(2,1,'TERNERAS','TERNERAS',NULL,2,'2014-07-24 21:10:41','2014-07-24 21:10:41',280.0000),(3,1,'TERNERAS LOPEZ','TERNERAS LOPEZ',NULL,2,'2014-07-24 21:10:41','2014-07-24 21:10:41',280.0000),(4,1,'TERNERAS RC','TERNERAS RC',NULL,2,'2014-07-24 21:10:41','2014-07-24 21:10:41',280.0000),(5,1,'TERNEROS','TERNEROS',NULL,2,'2014-07-24 21:10:41','2014-07-24 21:10:41',280.0000),(6,1,'TORITO','TORITO',NULL,4,'2014-07-24 21:10:41','2014-07-24 21:10:41',350.0000),(7,1,'TORO','TORO',NULL,4,'2014-07-24 21:10:41','2014-07-24 21:10:41',600.0000),(8,1,'VACA','VACA',NULL,3,'2014-07-24 21:10:41','2014-07-24 21:10:41',450.0000),(9,1,'VAQUILLONA 1S','VAQUILLONA 1S',NULL,3,'2014-07-24 21:10:41','2014-07-24 21:10:41',320.0000),(10,1,'VAQUILLONA 2S','VAQUILLONA 2S',NULL,3,'2014-07-24 21:10:41','2014-07-24 21:10:41',400.0000);
/*!40000 ALTER TABLE `rga_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_categoriatipos`
--

DROP TABLE IF EXISTS `rga_categoriatipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_categoriatipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos`
--

LOCK TABLES `rga_categoriatipos` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos` VALUES (1,1,'TERNERO','TERNERO','','2014-07-24 21:04:10','2014-07-24 21:48:04'),(2,1,'RECRIA','RECRIA','','2014-07-24 21:04:11','2014-07-28 21:54:23'),(3,1,'REP. HEMBRA','REP. HEMBRA','','2014-07-24 21:04:11','2014-07-28 21:54:29'),(4,1,'REP. MACHO','REP. MACHO','','2014-07-24 21:04:11','2014-10-30 03:03:21');
/*!40000 ALTER TABLE `rga_categoriatipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_categoriatipos_estados`
--

DROP TABLE IF EXISTS `rga_categoriatipos_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_categoriatipos_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoriatipo_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rga_categoriatipos_estados_on_categoriatipo_id` (`categoriatipo_id`),
  KEY `index_rga_categoriatipos_estados_on_estado_id` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos_estados`
--

LOCK TABLES `rga_categoriatipos_estados` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos_estados` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos_estados` VALUES (4,1,25),(5,1,26),(6,2,25),(7,3,25);
/*!40000 ALTER TABLE `rga_categoriatipos_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_categoriatipos_eventos`
--

DROP TABLE IF EXISTS `rga_categoriatipos_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_categoriatipos_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoriatipo_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rga_categoriatipos_eventos_on_categoriatipo_id` (`categoriatipo_id`),
  KEY `index_rga_categoriatipos_eventos_on_evento_id` (`evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos_eventos`
--

LOCK TABLES `rga_categoriatipos_eventos` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos_eventos` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos_eventos` VALUES (1,1,28),(2,1,33),(3,2,28),(4,3,27);
/*!40000 ALTER TABLE `rga_categoriatipos_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_estados`
--

DROP TABLE IF EXISTS `rga_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_estados`
--

LOCK TABLES `rga_estados` WRITE;
/*!40000 ALTER TABLE `rga_estados` DISABLE KEYS */;
INSERT INTO `rga_estados` VALUES (25,1,'21','AL PIE',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(26,1,'6','CRIA AL PIE',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(27,1,'31','DESCANSO',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(28,1,'32','DESCARTE',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(29,1,'23','DESTETADO',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(30,1,'2','PREÑADA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(31,1,'3','PREÑADA VENTA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(32,1,'24','RECRIA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(33,1,'7','SECA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(34,1,'1','SERVICIO',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(35,1,'22','SEÑALADO',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(36,1,'5','VACIA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(37,1,'4','CUT',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(38,26,'1',NULL,NULL,'2014-07-25 03:28:51','2014-07-25 03:28:51'),(39,27,'1',NULL,NULL,'2014-07-25 03:29:22','2014-07-25 03:29:22');
/*!40000 ALTER TABLE `rga_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_estados_eventos`
--

DROP TABLE IF EXISTS `rga_estados_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_estados_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rga_estados_eventos_on_estado_id` (`estado_id`),
  KEY `index_rga_estados_eventos_on_evento_id` (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_estados_eventos`
--

LOCK TABLES `rga_estados_eventos` WRITE;
/*!40000 ALTER TABLE `rga_estados_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rga_estados_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_eventos`
--

DROP TABLE IF EXISTS `rga_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `eventotipo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_eventos`
--

LOCK TABLES `rga_eventos` WRITE;
/*!40000 ALTER TABLE `rga_eventos` DISABLE KEYS */;
INSERT INTO `rga_eventos` VALUES (27,1,'-4','DESP. TRASLADO INTERNO','','2014-07-23 22:03:39','2014-07-23 22:26:17',1),(28,1,'-3','DESPACHO','','2014-07-23 22:03:39','2014-07-23 22:26:49',1),(29,1,'-2','MUERTE','','2014-07-23 22:03:39','2014-07-23 22:26:49',1),(30,1,'-1','RECUENTO NEGATIVO','','2014-07-23 22:03:39','2014-07-23 22:26:49',1),(31,1,'0','PARTO','','2014-07-23 22:03:39','2014-07-23 22:27:38',2),(32,1,'1','RECUENTO POSITIVO','','2014-07-23 22:03:39','2014-07-23 22:28:33',3),(33,1,'2','NACIMIENTO','','2014-07-23 22:03:40','2014-07-23 22:28:33',3),(34,1,'3','RECEPCION','','2014-07-23 22:03:40','2014-07-23 22:28:33',3),(35,1,'4','REC. TRASLADO INTERNO','','2014-07-23 22:03:40','2014-07-23 22:28:33',3),(36,1,'11','CAMBIO DE CATEGORIA','','2014-07-23 22:03:40','2014-07-23 22:28:56',4),(37,1,'12','DESTETE','','2014-07-23 22:03:40','2014-07-23 22:28:57',4),(38,1,'13','TACTO','','2014-07-23 22:03:40','2014-07-23 22:28:57',4),(39,1,'14','YERRA','','2014-07-23 22:03:40','2014-07-23 22:28:57',4);
/*!40000 ALTER TABLE `rga_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_eventotipos`
--

DROP TABLE IF EXISTS `rga_eventotipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_eventotipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_eventotipos`
--

LOCK TABLES `rga_eventotipos` WRITE;
/*!40000 ALTER TABLE `rga_eventotipos` DISABLE KEYS */;
INSERT INTO `rga_eventotipos` VALUES (1,1,'-1','EGRESO','** EL CODIGO DEFINE COMPORTAMIENTO** NO TOCAR **','2014-07-23 22:13:31','2014-07-28 21:52:42'),(2,1,'0','PARTO','** EL CODIGO DEFINE COMPORTAMIENTO** NO TOCAR **','2014-07-23 22:13:45','2014-07-28 21:52:52'),(3,1,'1','INGRESO','** EL CODIGO DEFINE COMPORTAMIENTO** NO TOCAR **','2014-07-23 22:13:55','2014-07-28 21:52:57'),(4,1,'2','CAMBIOS DE CAT','** EL CODIGO DEFINE COMPORTAMIENTO** NO TOCAR **','2014-07-23 22:28:07','2014-07-28 21:53:05');
/*!40000 ALTER TABLE `rga_eventotipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_registros`
--

DROP TABLE IF EXISTS `rga_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `establecimiento_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `origcategoria_id` int(11) DEFAULT NULL,
  `origrodeo_id` int(11) DEFAULT NULL,
  `origestado_id` int(11) DEFAULT NULL,
  `destcategoria_id` int(11) DEFAULT NULL,
  `destrodeo_id` int(11) DEFAULT NULL,
  `destestado_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `peso` decimal(8,2) NOT NULL DEFAULT '0.00',
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rga_registros_on_empresa_id` (`empresa_id`),
  KEY `index_rga_registros_on_establecimiento_id` (`establecimiento_id`),
  KEY `index_rga_registros_on_evento_id` (`evento_id`),
  KEY `index_rga_registros_on_origcategoria_id` (`origcategoria_id`),
  KEY `index_rga_registros_on_origrodeo_id` (`origrodeo_id`),
  KEY `index_rga_registros_on_origestado_id` (`origestado_id`),
  KEY `index_rga_registros_on_destcategoria_id` (`destcategoria_id`),
  KEY `index_rga_registros_on_destrodeo_id` (`destrodeo_id`),
  KEY `index_rga_registros_on_destestado_id` (`destestado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_registros`
--

LOCK TABLES `rga_registros` WRITE;
/*!40000 ALTER TABLE `rga_registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `rga_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rga_rodeos`
--

DROP TABLE IF EXISTS `rga_rodeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rga_rodeos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_rodeos`
--

LOCK TABLES `rga_rodeos` WRITE;
/*!40000 ALTER TABLE `rga_rodeos` DISABLE KEYS */;
INSERT INTO `rga_rodeos` VALUES (1,1,'R1','RODEO 1','','2014-07-26 04:59:38','2014-07-26 04:59:38');
/*!40000 ALTER TABLE `rga_rodeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140405161247'),('20140602235802'),('20140607163525'),('20140607231035'),('20140607234411'),('20140613210033'),('20140613210231'),('20140613210412'),('20140613210837'),('20140613212357'),('20140616214436'),('20140616214711'),('20140616215028'),('20140623182620'),('20140623232101'),('20140624184006'),('20140624184302'),('20140624230325'),('20140627211505'),('20140627211610'),('20140627212043'),('20140627212406'),('20140704220110'),('20140707140437'),('20140708154342'),('20140708172742'),('20140721145150'),('20140721155827'),('20140721161219'),('20140721211858'),('20140721214111'),('20140721215517'),('20140722002320'),('20140722143012'),('20140722143952'),('20140722144027'),('20140722230153'),('20140722231142'),('20140722231457'),('20140723163854'),('20140723164007'),('20140723204943'),('20140723205417'),('20140723220510'),('20140723220559'),('20140724201837'),('20140724201917'),('20140724204217'),('20140724204242'),('20140724210743'),('20140724223301'),('20140724223437'),('20140725004936'),('20140726041735'),('20140726045503'),('20140728225556'),('20140803005510'),('20140909134839'),('20140909143515'),('20140909145041'),('20140909153115'),('20140915144802'),('20141016203635'),('20141102170934'),('20141108011505');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-20 17:43:01
