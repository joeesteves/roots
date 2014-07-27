CREATE DATABASE  IF NOT EXISTS `roots_dev` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `roots_dev`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: roots_dev
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_arboles`
--

LOCK TABLES `rba_arboles` WRITE;
/*!40000 ALTER TABLE `rba_arboles` DISABLE KEYS */;
INSERT INTO `rba_arboles` VALUES (1,'CUENTAS','rco/cuentas','2014-06-24 23:42:26','2014-06-27 13:32:09'),(12,'MONEDAS','rco/monedas','2014-06-27 21:56:26','2014-06-27 21:56:26'),(13,'USUARIOS','rba/usuarios','2014-07-04 14:55:04','2014-07-22 21:45:21'),(14,'GRUPOS','rba/empresagrupos','2014-07-19 23:18:30','2014-07-19 23:18:30'),(20,'TIPOS DE ACTIVIDADES','rba/actividadtipos','2014-07-21 21:48:59','2014-07-21 21:48:59'),(21,'ESTADOS','rga/estados','2014-07-23 21:54:09','2014-07-23 21:54:09'),(22,'CAMPOS','rba/establecimientos','2014-07-25 21:17:12','2014-07-25 21:17:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=836 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_items_nodos`
--

LOCK TABLES `rba_items_nodos` WRITE;
/*!40000 ALTER TABLE `rba_items_nodos` DISABLE KEYS */;
INSERT INTO `rba_items_nodos` VALUES (566,191,1),(567,192,1),(568,193,1),(569,194,1),(570,195,1),(571,196,1),(572,197,1),(573,198,1),(574,199,1),(575,200,1),(576,201,1),(577,202,1),(578,203,1),(579,204,1),(580,205,1),(581,206,1),(582,207,1),(583,208,1),(584,209,1),(585,210,1),(586,211,1),(587,212,1),(588,213,1),(589,214,1),(590,215,1),(591,216,1),(592,217,1),(593,218,1),(594,219,1),(595,220,1),(596,221,1),(597,222,1),(598,223,1),(599,224,1),(600,225,1),(601,226,1),(602,227,1),(603,228,1),(604,229,1),(605,230,1),(606,231,1),(607,232,1),(608,233,1),(609,234,1),(610,235,1),(611,236,1),(612,237,1),(613,238,1),(614,239,1),(615,240,1),(616,241,1),(617,242,1),(618,243,1),(619,244,1),(620,245,1),(621,246,1),(622,247,1),(623,248,1),(624,249,1),(625,250,1),(626,251,1),(627,252,1),(628,253,1),(629,254,1),(630,255,1),(631,256,1),(632,257,1),(633,258,1),(634,259,1),(635,260,1),(636,261,1),(637,262,1),(638,263,1),(639,264,1),(640,265,1),(641,266,1),(642,267,1),(643,268,1),(644,269,1),(645,270,1),(647,272,1),(648,273,1),(649,274,1),(650,275,1),(651,276,1),(652,277,1),(653,278,1),(654,279,1),(655,280,1),(656,281,1),(657,282,1),(658,283,1),(659,284,1),(660,285,1),(661,286,1),(662,287,1),(663,288,1),(664,289,1),(665,290,1),(666,291,1),(667,292,1),(668,293,1),(669,294,1),(670,295,1),(671,296,1),(672,297,1),(673,298,1),(674,299,1),(675,300,1),(676,301,1),(677,302,1),(678,303,1),(679,304,1),(680,305,1),(681,306,1),(682,307,1),(683,308,1),(684,309,1),(685,310,1),(686,311,1),(727,312,2),(742,337,4),(746,345,12),(747,338,12),(748,341,12),(749,351,12),(750,346,12),(751,348,12),(752,347,12),(753,344,12),(754,349,12),(756,343,12),(757,340,12),(758,331,11),(759,332,11),(760,333,11),(761,334,11),(762,339,12),(763,350,12),(764,342,12),(765,336,11),(766,325,15),(767,329,15),(768,324,15),(769,328,15),(770,319,13),(772,315,13),(773,316,13),(774,317,13),(775,318,13),(776,313,13),(777,320,13),(778,321,13),(779,322,13),(780,323,14),(783,327,15),(784,352,13),(785,326,15),(800,353,11),(802,330,15),(816,34,36),(817,30,36),(818,31,36),(819,36,36),(820,37,36),(822,33,36),(823,32,38),(824,35,38),(826,29,38),(827,27,39),(828,28,39),(830,1,40),(835,7,42);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_nodos`
--

LOCK TABLES `rba_nodos` WRITE;
/*!40000 ALTER TABLE `rba_nodos` DISABLE KEYS */;
INSERT INTO `rba_nodos` VALUES (1,'CUENTAS',1,'2014-06-24 23:42:26','2014-06-28 22:34:57',NULL),(2,'ACTIVO',1,'2014-06-24 23:42:44','2014-06-24 23:42:44',1),(3,'PASIVO',1,'2014-06-24 23:42:51','2014-06-27 13:30:36',1),(4,'PATRIMONIO NETO',1,'2014-06-24 23:43:00','2014-06-27 13:30:38',1),(11,'INGRESOS',1,'2014-06-27 14:17:44','2014-06-27 14:17:44',1),(12,'EGRESOS',1,'2014-06-27 14:17:52','2014-06-27 14:17:52',1),(13,'CAJAS & BANCOS',1,'2014-06-27 14:18:20','2014-06-27 14:18:48',2),(14,'CLIENTES',1,'2014-06-27 14:19:12','2014-06-27 14:20:06',2),(15,'DEUDAS',1,'2014-06-27 14:19:28','2014-06-27 14:19:28',3),(23,'MONEDAS',12,'2014-06-27 21:56:26','2014-06-27 21:56:26',NULL),(25,'Usuarios',13,'2014-07-04 14:55:04','2014-07-04 15:13:36',NULL),(26,'Activo',13,'2014-07-04 15:13:54','2014-07-04 15:13:54',25),(27,'GRUPOS',14,'2014-07-19 23:18:30','2014-07-19 23:18:30',NULL),(33,'TIPOS DE ACTIVIDADES',20,'2014-07-21 21:48:59','2014-07-21 21:48:59',NULL),(34,'AGROPECUARIAS',20,'2014-07-21 21:49:53','2014-07-21 21:49:53',33),(35,'ESTADOS',21,'2014-07-23 21:54:09','2014-07-23 21:54:09',NULL),(36,'HEMBRAS',21,'2014-07-23 21:54:34','2014-07-23 21:54:34',35),(37,'MACHOS',21,'2014-07-23 21:54:47','2014-07-23 21:54:47',35),(38,'TERNEROS',21,'2014-07-23 21:55:06','2014-07-23 21:55:06',35),(39,'GENERAL',21,'2014-07-23 21:56:05','2014-07-23 21:56:05',35),(40,'CAMPOS',22,'2014-07-25 21:17:12','2014-07-25 21:17:12',NULL),(41,'Buenos Aires',22,'2014-07-25 21:17:41','2014-07-25 21:17:41',40),(42,'Sur',22,'2014-07-25 21:17:55','2014-07-25 21:17:55',41);
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
  PRIMARY KEY (`id`),
  KEY `index_rco_asientos_on_moneda_id` (`moneda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_asientos`
--

LOCK TABLES `rco_asientos` WRITE;
/*!40000 ALTER TABLE `rco_asientos` DISABLE KEYS */;
INSERT INTO `rco_asientos` VALUES (32,'2014-07-03',1,1.0000,'SALDO INICIAL JOSE','2014-07-08 15:11:55','2014-07-08 15:14:14',NULL),(33,'2014-07-03',1,1.0000,'SALDO INCIAL FLO','2014-07-08 15:15:07','2014-07-08 15:15:07',NULL),(37,'2014-07-03',2,8.0000,'DOLARES','2014-07-08 20:54:07','2014-07-08 20:54:07',NULL),(39,'2014-07-03',1,1.0000,'CCISSA JUNIO','2014-07-19 23:03:02','2014-07-19 23:03:02',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cuentas`
--

LOCK TABLES `rco_cuentas` WRITE;
/*!40000 ALTER TABLE `rco_cuentas` DISABLE KEYS */;
INSERT INTO `rco_cuentas` VALUES (312,'RODADOS','RODADOS',1,'',12,1,'2014-06-27 14:12:20','2014-07-08 17:04:24'),(313,'CAJA GENERAL $','CAJA GENERAL $',1,'',3,1,'2014-06-27 14:12:20','2014-06-28 22:22:32'),(315,'BBVA CA','BBVA CA',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:22'),(316,'BBVA CTA CTE','BBVA CTA CTE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:32'),(317,'PROV CA','PROV CA',1,NULL,3,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(318,'CAJA GRIS $','CAJA GRIS $',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(319,'CAJA GRIS U$S','CAJA GRIS U$S',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:25'),(320,'CAJA GRIS UY','CAJA GRIS UY',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(321,'CAJA GRIS REAIS','CAJA GRIS REAIS',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(322,'CUENTA CANJE','CUENTA CANJE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(323,'POR COBRAR','POR COBRAR',1,'',4,1,'2014-06-27 14:12:21','2014-06-28 22:11:31'),(324,'BBVA VISA','BBVA VISA',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(325,'BBVA MASTER','BBVA MASTER',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(326,'PROV VISA','PROV VISA',1,'',9,1,'2014-06-27 14:12:21','2014-06-28 22:11:41'),(327,'SERVICIOS A PAGAR','SERVICIOS A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(328,'BBVA VISA A PAGAR','BBVA VISA A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(329,'BBVA MASTER A PAGAR','BBVA MASTER A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(330,'PROV VISA A PAGAR','PROV VISA A PAGAR',1,'',9,1,'2014-06-27 14:12:22','2014-06-28 22:11:41'),(331,'FC JOSE','SUELDO JOSE',1,'SERVICIOS FACTURADOS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(332,'SUELDO FLO','SUELDO FLO',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(333,'VET','VET',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(334,'ROOTS','ROOTS',1,'FC SERVICIOS ROOTS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(336,'REGALOS','REGALOS',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(337,'CAPITAL','CAPITAL',1,'',7,1,'2014-06-27 14:12:22','2014-06-28 22:21:42'),(338,'ALQUILER','ALQUILER',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(339,'SUPERMERCADO','SUPERMERCADO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(340,'SERVICIOS','SERVICIOS',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(341,'AUTO','AUTO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(342,'VIAJES','VIAJES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(343,'REGALOS','REGALOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(344,'GENERALES','GENERALES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(345,'ALMUERZOS','ALMUERZOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(346,'EDUCACION','EDUCACION',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(347,'EXTRA ORDINARIOS','EXTRA ORDINARIOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(348,'ENTRETENIMIENTO','ENTRETENIMIENTO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(349,'MANTENIMIENTO CUENTAS','MANTENIMIENTO CUENTAS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(350,'TELEFONO','TELEFONO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(351,'COMBUSTIBLE','COMBUSTIBLE',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(352,'BBVA COM','BBVA COM',1,'CUENTA COMITENTE',3,1,'2014-07-08 15:00:16','2014-07-08 15:07:16'),(353,'TUR','TURISMO',1,'',7,1,'2014-07-23 14:26:03','2014-07-23 14:26:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cuentatipos`
--

LOCK TABLES `rco_cuentatipos` WRITE;
/*!40000 ALTER TABLE `rco_cuentatipos` DISABLE KEYS */;
INSERT INTO `rco_cuentatipos` VALUES (3,'1.1','BANCOS & CAJAS',1,'','2014-06-24 19:05:08','2014-06-27 13:51:58'),(4,'1.2','CTA CTES ACTIVO',1,'','2014-06-24 19:05:21','2014-06-27 13:54:13'),(5,'3.0','PATRIMONIO NETO',1,'','2014-06-24 19:05:59','2014-06-27 13:52:21'),(6,'4.0','INGRESOS',1,'','2014-06-24 19:08:51','2014-06-27 13:52:21'),(7,'5.0','EGRESOS',1,'\r\n','2014-06-24 19:09:15','2014-06-27 13:52:21'),(8,'6.0','DIF DE INVENTARIO',1,'','2014-06-24 19:09:39','2014-06-27 13:52:21'),(9,'2.2','CTA CTE PASIVO',1,'','2014-06-27 13:49:07','2014-06-27 13:52:21'),(10,'1.0','ACTIVO',1,'','2014-06-27 13:52:38','2014-06-27 13:52:38'),(11,'2.0','PASIVO',1,'','2014-06-27 13:54:25','2014-06-27 13:54:25'),(12,'1.3','BIENES',1,'','2014-07-08 17:02:02','2014-07-08 17:02:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_registros`
--

LOCK TABLES `rco_registros` WRITE;
/*!40000 ALTER TABLE `rco_registros` DISABLE KEYS */;
INSERT INTO `rco_registros` VALUES (75,NULL,32,315,25464.0200,0.0000,NULL,'SALDO INICIAL','2014-07-08 15:11:55','2014-07-08 15:12:11',25464.0200,0.0000),(76,NULL,32,352,2022.8600,0.0000,NULL,'SIDERAR (3.84)','2014-07-08 15:11:55','2014-07-08 15:11:55',2022.8600,0.0000),(77,NULL,32,352,1331.1500,0.0000,NULL,'EDENOR (6.6)','2014-07-08 15:11:55','2014-07-08 15:11:55',1331.1500,0.0000),(78,NULL,32,323,10000.0000,0.0000,NULL,'PRESTAMO A PAPA','2014-07-08 15:11:55','2014-07-08 15:11:55',10000.0000,0.0000),(79,NULL,32,323,6000.0000,0.0000,NULL,'FC JUNIO CCISSA','2014-07-08 15:11:55','2014-07-08 15:11:55',6000.0000,0.0000),(80,NULL,32,337,0.0000,44818.0300,NULL,'CAPITAL INICIAL','2014-07-08 15:11:55','2014-07-08 15:11:55',0.0000,44818.0300),(81,NULL,33,317,28207.1400,0.0000,NULL,'SALDO INCIAL PROVINCIA','2014-07-08 15:15:07','2014-07-08 15:15:07',28207.1400,0.0000),(82,NULL,33,337,0.0000,28207.1400,NULL,'CAPITAL INICIAL','2014-07-08 15:15:07','2014-07-08 15:16:11',0.0000,28207.1400),(89,NULL,37,319,6304.0000,0.0000,NULL,'SALDO INICIAL SOB (201406)','2014-07-08 20:54:07','2014-07-08 20:54:07',788.0000,0.0000),(90,NULL,37,319,3200.0000,0.0000,NULL,'AHORRO JUNIO','2014-07-08 20:54:07','2014-07-08 20:54:07',400.0000,0.0000),(91,NULL,37,319,24000.0000,0.0000,NULL,'SALDO INICIAL SOB (201401)','2014-07-08 20:54:07','2014-07-08 20:54:07',3000.0000,0.0000),(92,NULL,37,337,0.0000,33504.0000,NULL,'CAPITAL INICIAL U$S','2014-07-08 20:54:07','2014-07-08 20:54:07',0.0000,4188.0000),(95,NULL,39,315,6000.0000,0.0000,NULL,'CCISSA JUNIO','2014-07-19 23:03:02','2014-07-19 23:03:02',6000.0000,0.0000),(96,NULL,39,323,0.0000,6000.0000,NULL,'CCISSA JUNIO (TRANSFERENCIA)','2014-07-19 23:03:02','2014-07-19 23:03:02',0.0000,6000.0000);
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
  `estado` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales`
--

LOCK TABLES `rga_animales` WRITE;
/*!40000 ALTER TABLE `rga_animales` DISABLE KEYS */;
INSERT INTO `rga_animales` VALUES (1,1,'1','1','1','Rp1','r','',1,1,'2014-07-23 21:39:36','2014-07-23 21:44:41'),(2,1,'2','2','2','Rp2','2','2',1,1,'2014-07-23 21:40:44','2014-07-23 21:44:56'),(3,1,'3','3','3','3','3','',2,1,'2014-07-23 21:41:05','2014-07-23 21:41:05'),(4,1,'12','12','12','rp-12','1','',2,1,'2014-07-23 21:42:02','2014-07-23 21:42:02'),(5,1,'a1','a1','a1','a1','a1','a1',NULL,NULL,'2014-07-24 00:45:52','2014-07-24 00:45:52'),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:00','2014-07-26 05:04:00'),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:01','2014-07-26 05:04:01'),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:01','2014-07-26 05:04:01'),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:01','2014-07-26 05:04:01'),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:01','2014-07-26 05:04:01'),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:01','2014-07-26 05:04:01'),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:04:01','2014-07-26 05:04:01'),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:17','2014-07-26 05:06:17'),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:17','2014-07-26 05:06:17'),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:17','2014-07-26 05:06:17'),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:17','2014-07-26 05:06:17'),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:18','2014-07-26 05:06:18'),(46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:19','2014-07-26 05:06:19'),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:19','2014-07-26 05:06:19'),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:19','2014-07-26 05:06:19'),(49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:19','2014-07-26 05:06:19'),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-26 05:06:19','2014-07-26 05:06:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `rga_categoriatipos` VALUES (1,1,'TERNERO','TERNERO','','2014-07-24 21:04:10','2014-07-24 21:48:04'),(2,1,'RECRIA','RECRIA',NULL,'2014-07-24 21:04:11','2014-07-24 21:04:11'),(3,1,'REP. HEMBRA','REP. HEMBRA',NULL,'2014-07-24 21:04:11','2014-07-24 21:04:11'),(4,1,'REP. MACHO','REP. MACHO',NULL,'2014-07-24 21:04:11','2014-07-24 21:04:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos_estados`
--

LOCK TABLES `rga_categoriatipos_estados` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos_estados` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos_estados` VALUES (4,1,25),(5,1,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos_eventos`
--

LOCK TABLES `rga_categoriatipos_eventos` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos_eventos` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos_eventos` VALUES (1,1,28),(2,1,33);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_estados_eventos`
--

LOCK TABLES `rga_estados_eventos` WRITE;
/*!40000 ALTER TABLE `rga_estados_eventos` DISABLE KEYS */;
INSERT INTO `rga_estados_eventos` VALUES (6,'O',26,27,'2014-07-25 04:00:02','2014-07-25 05:03:21'),(7,'O',30,27,'2014-07-25 04:05:57','2014-07-25 04:05:57'),(9,'O',27,27,'2014-07-25 04:14:16','2014-07-25 04:14:17'),(10,'O',28,27,'2014-07-25 04:14:52','2014-07-25 04:14:52');
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
INSERT INTO `rga_eventotipos` VALUES (1,1,'O','EGRESO','','2014-07-23 22:13:31','2014-07-25 04:23:40'),(2,1,'P','PARTO','','2014-07-23 22:13:45','2014-07-25 04:24:13'),(3,1,'D','INGRESO','','2014-07-23 22:13:55','2014-07-25 04:23:55'),(4,1,'OD','CAMBIOS DE CAT','','2014-07-23 22:28:07','2014-07-25 04:24:26');
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
  `cantidad` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_registros`
--

LOCK TABLES `rga_registros` WRITE;
/*!40000 ALTER TABLE `rga_registros` DISABLE KEYS */;
INSERT INTO `rga_registros` VALUES (1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'2014-07-26 04:34:37','2014-07-26 04:34:37');
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
INSERT INTO `schema_migrations` VALUES ('20140405161247'),('20140602235802'),('20140607163525'),('20140607231035'),('20140607234411'),('20140613210033'),('20140613210231'),('20140613210412'),('20140613210837'),('20140613212357'),('20140616214436'),('20140616214711'),('20140616215028'),('20140623182620'),('20140623232101'),('20140624184006'),('20140624184302'),('20140624230325'),('20140627211505'),('20140627211610'),('20140627212043'),('20140627212406'),('20140704220110'),('20140707140437'),('20140708154342'),('20140708172742'),('20140721145150'),('20140721155827'),('20140721161219'),('20140721211858'),('20140721214111'),('20140721215517'),('20140722002320'),('20140722143012'),('20140722143952'),('20140722144027'),('20140722230153'),('20140722231142'),('20140722231457'),('20140723163854'),('20140723164007'),('20140723204943'),('20140723205417'),('20140723220510'),('20140723220559'),('20140724201837'),('20140724201917'),('20140724204217'),('20140724204242'),('20140724210743'),('20140724223301'),('20140724223437'),('20140725004936'),('20140726041735'),('20140726045503');
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

-- Dump completed on 2014-07-26 21:10:29
