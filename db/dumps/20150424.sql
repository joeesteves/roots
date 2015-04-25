-- MySQL dump 10.13  Distrib 5.6.23, for Linux (x86_64)
--
-- Host: localhost    Database: roots
-- ------------------------------------------------------
-- Server version	5.6.23

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
  `organizacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rad_operaciones_on_operaciontipo_id` (`operaciontipo_id`),
  KEY `index_rad_operaciones_on_ctaD_id` (`ctaD_id`),
  KEY `index_rad_operaciones_on_ctaH_id` (`ctaH_id`),
  KEY `index_rad_operaciones_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operaciones`
--

LOCK TABLES `rad_operaciones` WRITE;
/*!40000 ALTER TABLE `rad_operaciones` DISABLE KEYS */;
INSERT INTO `rad_operaciones` VALUES (169,'2015-03-15',2200.0000,7,1,NULL,NULL,'asdasd',1,'2015-04-15 15:32:35','2015-04-15 19:24:33',2200.0000,289,1,5),(173,'2015-04-07',5.0000,7,1,NULL,NULL,'asdad',1,'2015-04-15 17:14:37','2015-04-15 19:24:45',5.0000,301,1,1),(174,'2015-03-15',2696.0000,4,1,NULL,NULL,'fsddfsfd',1,'2015-04-15 19:15:31','2015-04-15 19:15:40',2696.8500,299,0,10),(175,'2015-03-01',1200.0000,4,1,NULL,NULL,'ssass',1,'2015-04-15 19:25:04','2015-04-15 19:25:34',1200.0000,304,0,5),(176,'2015-01-15',2693.0000,4,1,NULL,NULL,'sas',1,'2015-04-15 19:26:03','2015-04-15 19:26:12',2693.9500,305,0,10),(177,'2015-04-12',2696.8500,4,1,NULL,NULL,'',1,'2015-04-15 19:32:52','2015-04-15 20:02:55',2696.8500,308,0,10);
/*!40000 ALTER TABLE `rad_operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rad_operacionregistros`
--

DROP TABLE IF EXISTS `rad_operacionregistros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rad_operacionregistros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operacion_id` int(11) DEFAULT NULL,
  `cuenta_id` int(11) DEFAULT NULL,
  `saldo_tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rad_operacionregistros_on_operacion_id` (`operacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operacionregistros`
--

LOCK TABLES `rad_operacionregistros` WRITE;
/*!40000 ALTER TABLE `rad_operacionregistros` DISABLE KEYS */;
INSERT INTO `rad_operacionregistros` VALUES (436,169,338,'debe',1200.0000,'2015-04-15 15:32:35','2015-04-15 15:32:35'),(437,169,340,'debe',1000.0000,'2015-04-15 15:32:35','2015-04-15 15:32:35'),(438,169,395,'haber',2200.0000,'2015-04-15 15:32:35','2015-04-15 19:24:33'),(447,173,338,'debe',5.0000,'2015-04-15 17:14:37','2015-04-15 17:14:37'),(448,173,395,'haber',5.0000,'2015-04-15 17:14:37','2015-04-15 17:14:37'),(449,174,361,'debe',2696.8500,'2015-04-15 19:15:31','2015-04-15 19:15:31'),(450,174,313,'haber',2696.8500,'2015-04-15 19:15:31','2015-04-15 19:15:31'),(451,175,395,'debe',1200.0000,'2015-04-15 19:25:04','2015-04-15 19:25:04'),(452,175,313,'haber',1200.0000,'2015-04-15 19:25:04','2015-04-15 19:25:04'),(453,176,361,'debe',2693.9500,'2015-04-15 19:26:03','2015-04-15 19:26:03'),(454,176,313,'haber',2693.9500,'2015-04-15 19:26:03','2015-04-15 19:26:03'),(455,177,361,'debe',2696.8500,'2015-04-15 19:32:52','2015-04-15 19:32:52'),(456,177,313,'haber',2696.8500,'2015-04-15 19:32:52','2015-04-15 19:32:52');
/*!40000 ALTER TABLE `rad_operacionregistros` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operaciontipos`
--

LOCK TABLES `rad_operaciontipos` WRITE;
/*!40000 ALTER TABLE `rad_operaciontipos` DISABLE KEYS */;
INSERT INTO `rad_operaciontipos` VALUES (1,1,1,'INGRESO','2014-09-09 13:55:58','2014-09-09 13:55:58'),(2,1,-1,'EGRESOS','2014-09-09 13:56:11','2014-09-09 13:56:11'),(3,1,2,'COBRANZA','2014-09-09 13:57:26','2014-09-09 13:57:51'),(4,1,-2,'PAGOS','2014-09-09 13:57:34','2014-09-09 13:57:34'),(5,1,0,'MOV. DE FONDOS','2014-09-09 13:57:43','2014-09-09 13:57:43'),(6,1,3,'PROVISIÓN INGRESO','2015-02-20 19:42:00','2015-02-20 19:42:00'),(7,1,-3,'PROVISIÓN EGRESO','2015-02-20 19:42:24','2015-02-20 19:42:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_arboles`
--

LOCK TABLES `rba_arboles` WRITE;
/*!40000 ALTER TABLE `rba_arboles` DISABLE KEYS */;
INSERT INTO `rba_arboles` VALUES (1,'CUENTAS','rco/cuentas','2014-06-24 23:42:26','2014-06-27 13:32:09'),(13,'USUARIOS','rba/usuarios','2014-07-04 14:55:04','2014-07-22 21:45:21'),(20,'TIPOS DE ACTIVIDADES','rba/actividadtipos','2014-07-21 21:48:59','2014-07-21 21:48:59'),(22,'CAMPOS','rba/establecimientos','2014-07-25 21:17:12','2014-07-25 21:17:12'),(25,'Cat','rga/categorias','2014-11-06 17:53:46','2014-11-06 17:53:46');
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
  `idmascara` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_catfiscales`
--

LOCK TABLES `rba_catfiscales` WRITE;
/*!40000 ALTER TABLE `rba_catfiscales` DISABLE KEYS */;
INSERT INTO `rba_catfiscales` VALUES (1,'RINO','RESPONSABLE INSCRIPTO','','2014-06-07 23:33:37','2015-02-14 04:30:49','99-99999999-9'),(2,'MONO','MONOTRIBUTO','','2014-06-07 23:33:56','2015-02-14 04:31:01','99-99999999-9'),(3,'EMPO','EMPLEADO','','2015-02-14 04:32:11','2015-02-14 04:32:11','99-99999999-9');
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
INSERT INTO `rba_empresas` VALUES (1,'ERF','RANCHO FLOJO',1,'20-31624095-0',1,'2014-07-04 15:50:10','2014-07-04 15:50:10'),(2,'PRUEBA','PRUEBA',1,'21-13333212-2',2,'2014-07-23 14:29:46','2015-02-09 01:50:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_establecimientos`
--

LOCK TABLES `rba_establecimientos` WRITE;
/*!40000 ALTER TABLE `rba_establecimientos` DISABLE KEYS */;
INSERT INTO `rba_establecimientos` VALUES (1,'SJ','SAN JOSE','',360.00,'2014-07-21 15:05:26','2014-07-22 21:36:14',1,1),(2,'EA','EL ALTILLO','',0.00,'2014-07-21 15:06:03','2014-07-21 15:06:03',1,NULL),(3,'PR','pR','',0.00,'2014-07-21 16:02:57','2014-07-21 16:02:57',2,NULL),(7,'EM','EL MANGURLLO','',150.00,'2014-07-22 00:54:38','2014-07-22 00:54:38',1,1),(8,'PRUEBA','PRUEBA','',500.00,'2015-02-20 21:06:08','2015-02-20 21:06:08',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=870 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_items_nodos`
--

LOCK TABLES `rba_items_nodos` WRITE;
/*!40000 ALTER TABLE `rba_items_nodos` DISABLE KEYS */;
INSERT INTO `rba_items_nodos` VALUES (679,304,1),(683,308,1),(684,309,1),(685,310,1),(742,337,4),(746,345,12),(747,338,12),(750,346,12),(751,348,12),(752,347,12),(753,344,12),(754,349,12),(756,343,12),(757,340,12),(761,334,11),(762,339,12),(763,350,12),(764,342,12),(765,336,11),(766,325,15),(768,324,15),(770,319,13),(772,315,13),(773,316,13),(774,317,13),(775,318,13),(777,320,13),(779,322,13),(780,323,14),(784,352,13),(785,326,15),(800,353,11),(801,354,43),(802,355,13),(803,356,12),(804,357,12),(805,358,45),(820,5,50),(822,7,49),(823,8,49),(824,9,49),(825,10,49),(862,392,2),(863,393,15),(864,394,13),(865,8,40),(866,340,15),(867,327,15),(868,395,15),(869,396,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_lotes`
--

LOCK TABLES `rba_lotes` WRITE;
/*!40000 ALTER TABLE `rba_lotes` DISABLE KEYS */;
INSERT INTO `rba_lotes` VALUES (3,1,'em-l1','l1','',7,'2014-07-22 01:00:11','2014-07-22 01:00:11'),(4,1,'em-l12','l12','',7,'2014-07-22 01:00:36','2014-07-22 01:00:36'),(13,1,'','L1','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(14,1,'','L2','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(15,1,'','L3','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(16,1,'','L4','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(17,1,'','L5','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(18,1,'','L6','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(19,1,'','L7','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(20,1,'','L8','',1,'2014-07-25 22:31:59','2014-07-25 22:31:59'),(25,0,'','L9','',1,'2014-07-25 22:31:59','2014-07-25 22:32:19'),(26,1,'a','a','a',8,'2015-02-20 22:22:54','2015-02-20 22:22:54'),(27,1,'312','as','',8,'2015-02-20 22:22:54','2015-02-20 22:22:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_nodos`
--

LOCK TABLES `rba_nodos` WRITE;
/*!40000 ALTER TABLE `rba_nodos` DISABLE KEYS */;
INSERT INTO `rba_nodos` VALUES (1,'CUENTAS',1,'2014-06-24 23:42:26','2014-06-28 22:34:57',NULL),(2,'ACTIVO',1,'2014-06-24 23:42:44','2014-06-24 23:42:44',1),(3,'PASIVO',1,'2014-06-24 23:42:51','2014-06-27 13:30:36',1),(4,'PATRIMONIO NETO',1,'2014-06-24 23:43:00','2014-06-27 13:30:38',1),(11,'INGRESOS',1,'2014-06-27 14:17:44','2014-06-27 14:17:44',1),(12,'EGRESOS',1,'2014-06-27 14:17:52','2014-06-27 14:17:52',1),(13,'CAJAS & BANCOS',1,'2014-06-27 14:18:20','2014-06-27 14:18:48',2),(14,'CLIENTES',1,'2014-06-27 14:19:12','2014-06-27 14:20:06',2),(15,'DEUDAS CP',1,'2014-06-27 14:19:28','2014-10-04 16:08:14',3),(25,'Usuarios',13,'2014-07-04 14:55:04','2014-07-04 15:13:36',NULL),(26,'Activo',13,'2014-07-04 15:13:54','2014-07-04 15:13:54',25),(33,'TIPOS DE ACTIVIDADES',20,'2014-07-21 21:48:59','2014-07-21 21:48:59',NULL),(34,'AGROPECUARIAS',20,'2014-07-21 21:49:53','2014-07-21 21:49:53',33),(40,'CAMPOS',22,'2014-07-25 21:17:12','2014-07-25 21:17:12',NULL),(41,'Buenos Aires',22,'2014-07-25 21:17:41','2014-07-25 21:17:41',40),(42,'Sur',22,'2014-07-25 21:17:55','2014-07-25 21:17:55',41),(43,'DEUDAS LP',1,'2014-10-04 16:08:29','2014-10-04 16:08:29',3),(44,'NO-CORRIENTE',1,'2014-10-18 17:33:43','2014-10-18 17:33:43',2),(45,'BIENES DE USO',1,'2014-10-18 17:34:02','2014-10-18 17:34:02',44),(48,'Cat',25,'2014-11-06 17:53:46','2014-11-06 17:53:46',NULL),(49,'CRIA',25,'2014-11-06 17:54:47','2014-11-06 17:54:47',48),(50,'INVERNADA',25,'2014-11-06 17:55:02','2014-11-06 17:55:02',48);
/*!40000 ALTER TABLE `rba_nodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_organizaciones`
--

DROP TABLE IF EXISTS `rba_organizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_organizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catfiscal_id` int(11) DEFAULT NULL,
  `idfiscal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organizaciontipo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `empresagrupo_id` int(11) DEFAULT NULL,
  `domicilio` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_rba_organizaciones_on_catfiscal_id` (`catfiscal_id`),
  KEY `index_rba_organizaciones_on_organizaciontipo_id` (`organizaciontipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_organizaciones`
--

LOCK TABLES `rba_organizaciones` WRITE;
/*!40000 ALTER TABLE `rba_organizaciones` DISABLE KEYS */;
INSERT INTO `rba_organizaciones` VALUES (1,1,'FINNEGANS','',1,'30-69843145-4',1,'2015-02-13 22:52:19','2015-04-15 13:37:27',1,'VIRREY DEL PINO 2166, CAPITAL FEDERAL (CPA: C1426EGL)'),(2,1,'CCISSA','',1,'30-70826819-0',1,'2015-02-13 23:06:39','2015-02-14 01:21:56',1,NULL),(3,1,'EL AGUARA','',1,'30-66317074-7',1,'2015-02-14 01:22:43','2015-02-14 04:22:32',1,NULL),(5,1,'GERALDINE ORELLANA','',3,'27-37057702-7',1,'2015-02-14 04:29:34','2015-02-14 04:33:44',1,NULL),(6,1,'ROBERTO CANALI','',1,'32-16354654-6',1,'2015-02-17 16:33:08','2015-03-25 14:29:40',1,''),(8,1,'JOSE','',1,'20-31624095-0',1,'2015-02-17 16:36:06','2015-02-17 16:36:06',1,NULL),(9,1,'JOSE','',2,'20-31624095-0',1,'2015-02-17 16:48:13','2015-02-17 16:48:57',2,NULL),(10,1,'BNA','',1,'',1,'2015-04-15 18:29:43','2015-04-15 18:29:43',1,'');
/*!40000 ALTER TABLE `rba_organizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rba_organizaciontipos`
--

DROP TABLE IF EXISTS `rba_organizaciontipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rba_organizaciontipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_organizaciontipos`
--

LOCK TABLES `rba_organizaciontipos` WRITE;
/*!40000 ALTER TABLE `rba_organizaciontipos` DISABLE KEYS */;
INSERT INTO `rba_organizaciontipos` VALUES (1,'CLIENTES',1,'2015-02-13 21:57:54','2015-02-14 04:41:13',''),(2,'PROVEEDOR',1,'2015-02-13 21:58:06','2015-02-14 04:41:13',''),(3,'CLIENTE Y PROVEEDOR',1,'2015-02-13 21:59:20','2015-02-14 04:41:13','');
/*!40000 ALTER TABLE `rba_organizaciontipos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_aplicaciones`
--

LOCK TABLES `rco_aplicaciones` WRITE;
/*!40000 ALTER TABLE `rco_aplicaciones` DISABLE KEYS */;
INSERT INTO `rco_aplicaciones` VALUES (66,2449,2326,1200.0000,'2015-04-15 19:25:34','2015-04-15 19:25:34'),(69,2457,2427,2696.8500,'2015-04-15 20:02:55','2015-04-15 20:02:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_asientos`
--

LOCK TABLES `rco_asientos` WRITE;
/*!40000 ALTER TABLE `rco_asientos` DISABLE KEYS */;
INSERT INTO `rco_asientos` VALUES (290,'2015-04-15',1,1.0000,'Operacion:asdasd','2015-04-15 16:10:12','2015-04-15 16:10:12',1,1),(298,'2014-09-15',1,1.0000,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1,0),(300,'2015-03-15',1,1.0000,'Operacion:fsddfsfd','2015-04-15 19:15:40','2015-04-15 19:15:40',1,1),(301,'2015-04-07',1,1.0000,'Operacion:asdad','2015-04-15 19:24:45','2015-04-15 19:24:45',1,1),(304,'2015-03-01',1,1.0000,'Operacion:ssass','2015-04-15 19:25:34','2015-04-15 19:25:34',1,1),(306,'2015-01-15',1,1.0000,'Operacion:sas','2015-04-15 19:26:12','2015-04-15 19:26:12',1,1),(308,'2015-04-12',1,1.0000,'Operacion:','2015-04-15 20:02:55','2015-04-15 20:02:55',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cuentas`
--

LOCK TABLES `rco_cuentas` WRITE;
/*!40000 ALTER TABLE `rco_cuentas` DISABLE KEYS */;
INSERT INTO `rco_cuentas` VALUES (312,'RODADOS','RODADOS',1,'',12,1,'2014-06-27 14:12:20','2014-07-08 17:04:24'),(313,'CAJA GENERAL $','CAJA GENERAL $',1,'',3,1,'2014-06-27 14:12:20','2014-06-28 22:22:32'),(315,'BBVA CA','BBVA CA',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:22'),(316,'BBVA CTA CTE','BBVA CTA CTE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:32'),(317,'PROV CA','PROV CA',1,NULL,3,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(318,'CAJA GRIS $','CAJA GRIS $',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(319,'CAJA GRIS U$S','CAJA GRIS U$S',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:25'),(320,'CAJA GRIS UY','CAJA GRIS UY',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(321,'CAJA GRIS REAIS','CAJA GRIS REAIS',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(322,'CUENTA CANJE','CUENTA CANJE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(323,'POR COBRAR','POR COBRAR',1,'',4,1,'2014-06-27 14:12:21','2014-06-28 22:11:31'),(324,'BBVA VISA','BBVA VISA',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(325,'BBVA MASTER','BBVA MASTER',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(326,'PROV VISA','PROV VISA',1,'',9,1,'2014-06-27 14:12:21','2014-06-28 22:11:41'),(327,'SERVICIOS A PAGAR','SERVICIOS A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(328,'BBVA VISA A PAGAR','BBVA VISA A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(329,'BBVA MASTER A PAGAR','BBVA MASTER A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(330,'PROV VISA A PAGAR','PROV VISA A PAGAR',1,'',9,1,'2014-06-27 14:12:22','2014-06-28 22:11:41'),(331,'FC JOSE','SUELDO JOSE',1,'SERVICIOS FACTURADOS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(332,'SUELDO FLO','SUELDO FLO',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(333,'VET','VET',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(334,'ROOTS','ROOTS',1,'FC SERVICIOS ROOTS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(336,'REGALOS RECIBIDOS','REGALOS RECIBIDOS',1,'',6,1,'2014-06-27 14:12:22','2014-10-16 21:58:08'),(337,'CAPITAL','CAPITAL',1,'',5,1,'2014-06-27 14:12:22','2014-10-11 00:03:09'),(338,'ALQUILER','ALQUILER',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(339,'SUPERMERCADO','SUPERMERCADO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(340,'SERVICIOS','SERVICIOS',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(341,'AUTO','AUTO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(342,'VIAJES','VIAJES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(343,'REGALOS REALIZADOS','REGALOS REALIZADOS',1,'',7,1,'2014-06-27 14:12:23','2014-10-16 21:58:21'),(344,'GENERALES','GENERALES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(345,'ALMUERZOS','ALMUERZOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(346,'EDUCACION','EDUCACION',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(347,'EXTRA ORDINARIOS','EXTRA ORDINARIOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(348,'ENTRETENIMIENTO','ENTRETENIMIENTO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(349,'MANTENIMIENTO CUENTAS','MANTENIMIENTO CUENTAS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(350,'TELEFONO','TELEFONO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(351,'COMBUSTIBLE','COMBUSTIBLE',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(352,'BBVA COM','BBVA COM',1,'CUENTA COMITENTE',3,1,'2014-07-08 15:00:16','2014-07-08 15:07:16'),(353,'TUR','TURISMO',1,'',7,1,'2014-07-23 14:26:03','2014-07-23 14:26:03'),(354,'PROCREAUTO','PROCREAUTO',1,'',9,1,'2014-10-04 16:09:15','2015-04-15 18:33:13'),(355,'NACION CA','NACION CA',1,'',3,1,'2014-10-04 16:10:03','2014-10-04 16:10:03'),(356,'OBRA SOCIAL','OBRA SOCIAL',1,'',7,1,'2014-10-17 02:38:23','2014-10-17 02:38:23'),(357,'PERSONAL CASA','PERSONAL CASA',1,'',7,1,'2014-10-18 01:22:25','2014-10-18 01:22:25'),(358,'FLUENCE','FLUENCE',1,'',12,1,'2014-10-18 17:35:27','2015-02-14 04:24:13'),(361,'PROCREAUTO A PAGAR','PROCREAUTO A PAGAR',1,'',9,1,'2015-02-09 01:45:51','2015-02-09 12:41:29'),(371,'INTERESES BANCARIOS','INTERESES BANCARIOS',1,'',7,1,'2015-02-09 01:46:18','2015-02-09 12:09:09'),(381,'BNA CA','BNA CA',1,'',10,1,'2015-02-09 12:10:36','2015-02-09 12:15:04'),(391,'BBVA PF','BBVA PF',1,'',3,1,'2015-02-09 12:25:10','2015-02-09 12:25:10'),(392,'GN','GASTO GRAL',1,'',7,2,'2015-02-20 19:33:24','2015-02-20 19:33:24'),(393,'VISA','VISA',1,'',9,2,'2015-02-20 19:33:55','2015-02-20 19:33:55'),(394,'BP','BANCO PRUEBA',1,'',3,2,'2015-02-20 19:34:09','2015-02-20 19:34:09'),(395,'PPAO','PROVISIÓN EGRESOS',1,'',14,1,'2015-03-06 21:25:10','2015-03-06 21:25:10'),(396,'PAO2','PROV EGRESOS 2',1,'',14,1,'2015-03-25 15:04:15','2015-03-25 15:04:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_cuentatipos`
--

LOCK TABLES `rco_cuentatipos` WRITE;
/*!40000 ALTER TABLE `rco_cuentatipos` DISABLE KEYS */;
INSERT INTO `rco_cuentatipos` VALUES (3,'1.1','BANCOS & CAJAS',1,'','2014-06-24 19:05:08','2014-06-27 13:51:58'),(4,'1.2','CTA CTES ACTIVO',1,'','2014-06-24 19:05:21','2014-06-27 13:54:13'),(5,'3.0','PATRIMONIO NETO',1,'','2014-06-24 19:05:59','2014-06-27 13:52:21'),(6,'4.0','INGRESOS',1,'','2014-06-24 19:08:51','2014-06-27 13:52:21'),(7,'5.0','EGRESOS',1,'\r\n','2014-06-24 19:09:15','2014-06-27 13:52:21'),(8,'6.0','DIF DE INVENTARIO',1,'','2014-06-24 19:09:39','2014-06-27 13:52:21'),(9,'2.2','CTA CTE PASIVO',1,'','2014-06-27 13:49:07','2014-06-27 13:52:21'),(10,'1.0','ACTIVO',1,'','2014-06-27 13:52:38','2014-06-27 13:52:38'),(11,'2.0','PASIVO',1,'','2014-06-27 13:54:25','2014-06-27 13:54:25'),(12,'1.3','BIENES DE CAMBIO',1,'','2014-07-08 17:02:02','2014-10-18 17:35:10'),(13,'1.4','BIENES DE USO',1,'','2014-10-18 17:34:58','2014-10-18 17:34:58'),(14,'2.9','PROVISIÓN PASIVO',1,'\r\n','2015-03-06 21:24:29','2015-03-06 21:24:29'),(15,'1.9','PROVISIÓN ACTIVO',1,'','2015-03-06 21:24:44','2015-03-06 21:24:44');
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
  `organizacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rco_registros_on_asiento_id` (`asiento_id`),
  KEY `index_rco_registros_on_cuenta_id` (`cuenta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2459 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_registros`
--

LOCK TABLES `rco_registros` WRITE;
/*!40000 ALTER TABLE `rco_registros` DISABLE KEYS */;
INSERT INTO `rco_registros` VALUES (2324,'2015-04-15',290,338,1200.0000,0.0000,NULL,'Operacion:asdasd','2015-04-15 16:10:12','2015-04-15 16:10:12',1200.0000,0.0000,5),(2325,'2015-04-15',290,340,1000.0000,0.0000,NULL,'Operacion:asdasd','2015-04-15 16:10:12','2015-04-15 16:10:12',1000.0000,0.0000,5),(2326,'2015-04-15',290,395,0.0000,1200.0000,NULL,'Operacion:asdasd','2015-04-15 16:10:12','2015-04-15 16:10:12',0.0000,1200.0000,5),(2390,'2014-09-15',298,381,11231.5300,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',11231.5300,0.0000,NULL),(2391,'2014-09-15',298,354,0.0000,837.4200,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,837.4200,NULL),(2392,'2014-09-15',298,354,0.0000,854.1700,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,854.1700,NULL),(2393,'2014-09-15',298,354,0.0000,871.2500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,871.2500,NULL),(2394,'2014-09-15',298,354,0.0000,888.6700,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,888.6700,NULL),(2395,'2014-09-15',298,354,0.0000,906.4500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,906.4500,NULL),(2396,'2014-09-15',298,354,0.0000,924.5800,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,924.5800,NULL),(2397,'2014-09-15',298,354,0.0000,943.0700,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,943.0700,NULL),(2398,'2014-09-15',298,354,0.0000,961.9300,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,961.9300,NULL),(2399,'2014-09-15',298,354,0.0000,981.1700,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,981.1700,NULL),(2400,'2014-09-15',298,354,0.0000,1000.7900,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,1000.7900,NULL),(2401,'2014-09-15',298,354,0.0000,1020.8100,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,1020.8100,NULL),(2402,'2014-09-15',298,354,0.0000,1041.2200,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,1041.2200,NULL),(2403,'2015-01-12',298,354,837.4200,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',837.4200,0.0000,NULL),(2404,'2015-02-10',298,354,854.1700,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',854.1700,0.0000,NULL),(2405,'2015-03-10',298,354,871.2500,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',871.2500,0.0000,NULL),(2406,'2015-04-10',298,354,888.6700,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',888.6700,0.0000,NULL),(2407,'2015-05-11',298,354,906.4500,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',906.4500,0.0000,NULL),(2408,'2015-06-10',298,354,924.5800,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',924.5800,0.0000,NULL),(2409,'2015-07-10',298,354,943.0700,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',943.0700,0.0000,NULL),(2410,'2015-08-10',298,354,961.9300,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',961.9300,0.0000,NULL),(2411,'2015-09-10',298,354,981.1700,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',981.1700,0.0000,NULL),(2412,'2015-10-13',298,354,1000.7900,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1000.7900,0.0000,NULL),(2413,'2015-11-10',298,354,1020.8100,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1020.8100,0.0000,NULL),(2414,'2015-12-10',298,354,1041.2200,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1041.2200,0.0000,NULL),(2415,'2015-01-12',298,371,1859.4300,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1859.4300,0.0000,NULL),(2416,'2015-02-10',298,371,1841.7400,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1841.7400,0.0000,NULL),(2417,'2015-03-10',298,371,1823.7000,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1823.7000,0.0000,NULL),(2418,'2015-04-10',298,371,1805.2800,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1805.2800,0.0000,NULL),(2419,'2015-05-11',298,371,1786.5100,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1786.5100,0.0000,NULL),(2420,'2015-06-10',298,371,1767.3900,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1767.3900,0.0000,NULL),(2421,'2015-07-10',298,371,1747.8200,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1747.8200,0.0000,NULL),(2422,'2015-08-10',298,371,1727.9100,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1727.9100,0.0000,NULL),(2423,'2015-09-10',298,371,1707.5800,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1707.5800,0.0000,NULL),(2424,'2015-10-13',298,371,1686.8500,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1686.8500,0.0000,NULL),(2425,'2015-11-10',298,371,1665.7100,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1665.7100,0.0000,NULL),(2426,'2015-12-10',298,371,1644.1300,0.0000,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',1644.1300,0.0000,NULL),(2427,'2015-01-12',298,361,0.0000,2696.8500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,2696.8500,10),(2428,'2015-02-10',298,361,0.0000,2695.9100,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,2695.9100,10),(2429,'2015-03-10',298,361,0.0000,2694.9500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,2694.9500,10),(2430,'2015-04-10',298,361,0.0000,2693.9500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,2693.9500,10),(2431,'2015-05-11',298,361,0.0000,2692.9600,NULL,'PROCREAUTO 2015','2015-04-15 18:32:42','2015-04-15 18:32:42',0.0000,2692.9600,10),(2432,'2015-06-10',298,361,0.0000,2691.9700,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2691.9700,10),(2433,'2015-07-10',298,361,0.0000,2690.8900,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2690.8900,10),(2434,'2015-08-10',298,361,0.0000,2689.8400,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2689.8400,10),(2435,'2015-09-10',298,361,0.0000,2688.7500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2688.7500,10),(2436,'2015-10-13',298,361,0.0000,2687.6400,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2687.6400,10),(2437,'2015-11-10',298,361,0.0000,2686.5200,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2686.5200,10),(2438,'2015-12-10',298,361,0.0000,2685.3500,NULL,'PROCREAUTO 2015','2015-04-15 18:32:43','2015-04-15 18:32:43',0.0000,2685.3500,10),(2441,'2015-03-15',300,361,2696.8500,0.0000,NULL,'Operacion:fsddfsfd','2015-04-15 19:15:40','2015-04-15 19:15:40',2696.8500,0.0000,10),(2442,'2015-03-15',300,313,0.0000,2696.0000,NULL,'Operacion:fsddfsfd','2015-04-15 19:15:40','2015-04-15 19:15:40',0.0000,2696.0000,10),(2443,'2015-04-07',301,338,5.0000,0.0000,NULL,'Operacion:asdad','2015-04-15 19:24:45','2015-04-15 19:24:45',5.0000,0.0000,1),(2444,'2015-04-07',301,395,0.0000,5.0000,NULL,'Operacion:asdad','2015-04-15 19:24:45','2015-04-15 19:24:45',0.0000,5.0000,1),(2449,'2015-03-01',304,395,1200.0000,0.0000,NULL,'Operacion:ssass','2015-04-15 19:25:34','2015-04-15 19:25:34',1200.0000,0.0000,5),(2450,'2015-03-01',304,313,0.0000,1200.0000,NULL,'Operacion:ssass','2015-04-15 19:25:34','2015-04-15 19:25:34',0.0000,1200.0000,5),(2453,'2015-01-15',306,361,2693.9500,0.0000,NULL,'Operacion:sas','2015-04-15 19:26:12','2015-04-15 19:26:12',2693.9500,0.0000,10),(2454,'2015-01-15',306,313,0.0000,2693.0000,NULL,'Operacion:sas','2015-04-15 19:26:12','2015-04-15 19:26:12',0.0000,2693.0000,10),(2457,'2015-04-12',308,361,2696.8500,0.0000,NULL,'Operacion:','2015-04-15 20:02:55','2015-04-15 20:02:55',2696.8500,0.0000,10),(2458,'2015-04-12',308,313,0.0000,2696.8500,NULL,'Operacion:','2015-04-15 20:02:55','2015-04-15 20:02:55',0.0000,2696.8500,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales`
--

LOCK TABLES `rga_animales` WRITE;
/*!40000 ALTER TABLE `rga_animales` DISABLE KEYS */;
INSERT INTO `rga_animales` VALUES (116,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:04:40'),(117,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:04:40'),(118,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:04:40'),(119,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:05:23'),(120,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:05:23'),(121,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:05:23'),(122,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:05:23'),(123,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:13:50'),(124,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:13:50'),(125,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 20:53:08','2015-04-21 21:14:15'),(126,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 21:14:06','2015-04-21 21:14:16'),(127,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 21:14:06','2015-04-21 21:14:16'),(128,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(129,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 21:14:06','2015-04-21 21:40:00'),(130,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(131,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(132,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(133,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:14','2015-04-22 00:13:33'),(134,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:14','2015-04-22 00:13:33'),(135,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(136,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 18:34:12'),(137,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(138,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(139,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 18:34:29'),(140,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(141,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:33'),(142,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(143,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(144,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(145,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-22 00:13:15','2015-04-22 18:34:12'),(146,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(147,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(148,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(149,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(150,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(151,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(152,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(153,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(154,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(155,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-04-24 01:06:29','2015-04-24 01:06:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales_registros`
--

LOCK TABLES `rga_animales_registros` WRITE;
/*!40000 ALTER TABLE `rga_animales_registros` DISABLE KEYS */;
INSERT INTO `rga_animales_registros` VALUES (31,116,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(32,117,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(33,118,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(34,119,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(35,120,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(36,121,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(37,122,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(38,123,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(39,124,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(40,125,5,'2015-04-21 20:53:08','2015-04-21 20:53:08'),(53,117,7,'2015-04-21 21:04:40','2015-04-21 21:04:40'),(54,118,7,'2015-04-21 21:04:40','2015-04-21 21:04:40'),(57,121,8,'2015-04-21 21:05:23','2015-04-21 21:05:23'),(58,122,8,'2015-04-21 21:05:23','2015-04-21 21:05:23'),(59,123,9,'2015-04-21 21:13:50','2015-04-21 21:13:50'),(60,124,9,'2015-04-21 21:13:50','2015-04-21 21:13:50'),(61,126,10,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(62,127,10,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(63,128,10,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(64,129,10,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(65,130,10,'2015-04-21 21:14:06','2015-04-21 21:14:06'),(66,125,11,'2015-04-21 21:14:16','2015-04-21 21:14:16'),(67,126,11,'2015-04-21 21:14:16','2015-04-21 21:14:16'),(68,127,11,'2015-04-21 21:14:16','2015-04-21 21:14:16'),(69,129,12,'2015-04-21 21:40:00','2015-04-21 21:40:00'),(70,131,13,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(71,132,13,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(72,133,13,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(73,134,13,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(74,135,13,'2015-04-22 00:13:14','2015-04-22 00:13:14'),(75,136,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(76,137,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(77,138,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(78,139,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(79,140,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(80,141,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(81,142,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(82,143,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(83,144,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(84,145,13,'2015-04-22 00:13:15','2015-04-22 00:13:15'),(96,137,19,'2015-04-22 16:57:06','2015-04-22 16:57:06'),(97,138,19,'2015-04-22 16:57:06','2015-04-22 16:57:06'),(98,136,20,'2015-04-22 17:04:21','2015-04-22 17:04:21'),(99,145,20,'2015-04-22 17:04:21','2015-04-22 17:04:21'),(100,139,20,'2015-04-22 17:04:21','2015-04-22 17:04:21'),(101,128,21,'2015-04-22 17:05:06','2015-04-22 17:05:06'),(102,130,21,'2015-04-22 17:05:06','2015-04-22 17:05:06'),(103,137,21,'2015-04-22 17:05:06','2015-04-22 17:05:06'),(104,138,21,'2015-04-22 17:05:06','2015-04-22 17:05:06'),(105,136,22,'2015-04-22 18:34:12','2015-04-22 18:34:12'),(106,145,22,'2015-04-22 18:34:12','2015-04-22 18:34:12'),(107,139,23,'2015-04-22 18:34:29','2015-04-22 18:34:29'),(108,146,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(109,147,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(110,148,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(111,149,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(112,150,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(113,151,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(114,152,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(115,153,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(116,154,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(117,155,24,'2015-04-24 01:06:29','2015-04-24 01:06:29'),(118,148,25,'2015-04-24 01:06:51','2015-04-24 01:06:51');
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
INSERT INTO `rga_categoriatipos` VALUES (1,1,'TERNERO','TERNERO','','2014-07-24 21:04:10','2014-07-24 21:48:04'),(2,1,'RECRIA','RECRIA','','2014-07-24 21:04:11','2014-07-28 21:54:23'),(3,1,'REP. HEMBRA','REP. HEMBRA','','2014-07-24 21:04:11','2014-07-28 21:54:29'),(4,1,'REP. MACHO','REP. MACHO','','2014-07-24 21:04:11','2015-04-22 00:15:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos_estados`
--

LOCK TABLES `rga_categoriatipos_estados` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos_estados` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos_estados` VALUES (4,1,25),(6,2,25),(8,3,26),(9,3,30),(10,3,31),(11,3,33),(12,3,34),(13,2,32),(14,2,35),(15,4,27),(16,4,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_categoriatipos_eventos`
--

LOCK TABLES `rga_categoriatipos_eventos` WRITE;
/*!40000 ALTER TABLE `rga_categoriatipos_eventos` DISABLE KEYS */;
INSERT INTO `rga_categoriatipos_eventos` VALUES (1,1,28),(2,1,33),(3,2,28),(4,3,27),(5,3,29),(6,3,32),(7,3,38),(8,1,29),(9,3,35),(10,1,27),(11,1,30),(12,1,32),(13,1,35),(14,1,36),(15,1,37),(16,1,39),(17,2,27),(18,2,29),(19,2,30),(20,2,32),(21,2,34),(22,2,35),(23,2,36),(24,2,37),(25,2,39),(26,3,28),(27,3,30),(28,3,31),(29,3,34),(30,3,36),(31,4,27),(32,4,29),(33,4,30),(34,4,31),(35,4,32),(37,4,34),(38,4,35),(39,4,36),(40,4,37);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_estados`
--

LOCK TABLES `rga_estados` WRITE;
/*!40000 ALTER TABLE `rga_estados` DISABLE KEYS */;
INSERT INTO `rga_estados` VALUES (25,1,'21','AL PIE',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(26,1,'6','CRIA AL PIE',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(27,1,'31','DESCANSO',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(28,1,'32','DESCARTE',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(29,1,'23','DESTETADO',NULL,'2014-07-23 21:53:38','2014-07-23 21:53:38'),(30,1,'2','PREÑADA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(31,1,'3','PREÑADA VENTA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(32,1,'24','RECRIA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(33,1,'7','SECA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(34,1,'1','SERVICIO',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(35,1,'22','SEÑALADO',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(36,1,'5','VACIA',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39'),(37,1,'4','CUT',NULL,'2014-07-23 21:53:39','2014-07-23 21:53:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_estados_eventos`
--

LOCK TABLES `rga_estados_eventos` WRITE;
/*!40000 ALTER TABLE `rga_estados_eventos` DISABLE KEYS */;
INSERT INTO `rga_estados_eventos` VALUES (1,'O',25,29,'2015-04-21 17:20:53','2015-04-21 17:20:53'),(2,'O',26,29,'2015-04-21 17:20:53','2015-04-21 17:20:53'),(3,'O',27,29,'2015-04-21 17:20:53','2015-04-21 17:20:53'),(4,'O',28,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(5,'O',29,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(6,'O',30,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(7,'O',31,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(8,'O',32,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(9,'O',33,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(10,'O',34,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(11,'D',25,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(12,'D',26,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(13,'D',27,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(14,'D',28,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(15,'D',29,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(16,'D',30,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(17,'D',31,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(18,'D',32,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(19,'D',33,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(20,'D',34,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(21,'D',35,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(22,'D',36,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(23,'D',37,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(24,'O',34,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(25,'D',30,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(26,'D',31,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(27,'D',36,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(28,'O',25,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(29,'O',26,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(30,'O',27,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(31,'O',28,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(32,'O',29,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(33,'O',30,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(34,'O',31,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(35,'O',32,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(36,'O',33,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(37,'O',34,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(38,'O',25,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(39,'O',26,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(40,'O',27,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(41,'O',28,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(42,'O',29,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(43,'O',30,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(44,'O',31,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(45,'O',32,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(46,'O',33,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(47,'O',34,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(48,'O',35,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(49,'O',36,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(50,'O',37,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(51,'O',27,30,'2015-04-21 23:55:06','2015-04-21 23:55:06'),(52,'O',28,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(53,'O',29,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(54,'O',30,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(55,'O',31,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(56,'O',32,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(57,'O',33,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(58,'O',34,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(59,'O',35,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(60,'O',36,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(61,'O',37,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(62,'O',25,30,'2015-04-21 23:55:14','2015-04-21 23:55:14'),(63,'O',26,30,'2015-04-21 23:55:14','2015-04-21 23:55:14'),(64,'O',30,31,'2015-04-21 23:55:43','2015-04-21 23:55:44'),(65,'O',31,31,'2015-04-21 23:55:43','2015-04-21 23:55:44'),(66,'D',26,31,'2015-04-21 23:55:43','2015-04-21 23:55:44'),(67,'D',25,33,'2015-04-21 23:56:04','2015-04-21 23:56:04'),(68,'D',25,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(69,'D',26,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(70,'D',27,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(71,'D',28,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(72,'D',29,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(73,'D',30,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(74,'D',31,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(75,'D',32,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(76,'D',33,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(77,'D',34,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(78,'D',35,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(79,'D',36,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(80,'D',37,34,'2015-04-21 23:56:22','2015-04-21 23:56:23'),(81,'OD',25,35,'2015-04-21 23:56:34','2015-04-22 00:00:06'),(82,'D',26,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(83,'D',27,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(84,'D',28,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(85,'D',29,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(86,'D',30,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(87,'D',31,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(88,'D',32,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(89,'D',33,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(90,'D',34,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(91,'D',35,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(92,'D',36,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(93,'D',37,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(94,'OD',25,36,'2015-04-21 23:56:57','2015-04-21 23:56:57'),(95,'OD',26,36,'2015-04-21 23:56:57','2015-04-21 23:56:57'),(96,'OD',27,36,'2015-04-21 23:56:57','2015-04-21 23:56:57'),(97,'OD',28,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(98,'OD',29,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(99,'OD',30,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(100,'OD',31,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(101,'OD',32,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(102,'OD',33,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(103,'OD',34,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(104,'OD',35,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(105,'OD',36,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(106,'OD',37,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(107,'O',25,37,'2015-04-21 23:57:18','2015-04-21 23:57:18'),(108,'O',35,37,'2015-04-21 23:57:18','2015-04-21 23:57:18'),(109,'D',29,37,'2015-04-21 23:57:18','2015-04-21 23:57:18'),(110,'O',25,39,'2015-04-21 23:57:33','2015-04-21 23:57:33'),(111,'D',35,39,'2015-04-21 23:57:33','2015-04-21 23:57:33');
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
INSERT INTO `rga_eventos` VALUES (27,1,'DTIO','DESP. TRASLADO INTERNO','','2014-07-23 22:03:39','2015-04-22 20:48:45',1),(28,1,'DEPO','DESPACHO','','2014-07-23 22:03:39','2015-04-22 20:48:29',1),(29,1,'MUEE','MUERTE','','2014-07-23 22:03:39','2015-04-22 20:48:19',1),(30,1,'RNEO','RECUENTO NEGATIVO','','2014-07-23 22:03:39','2015-04-22 20:48:11',1),(31,1,'PARO','PARTO','','2014-07-23 22:03:39','2015-04-22 20:47:37',2),(32,1,'RPOO','RECUENTO POSITIVO','','2014-07-23 22:03:39','2015-04-22 20:47:08',3),(33,1,'NACO','NACIMIENTO','','2014-07-23 22:03:40','2015-04-22 20:46:39',3),(34,1,'RECN','RECEPCION','','2014-07-23 22:03:40','2015-04-22 20:49:00',3),(35,1,'RTIO','REC. TRASLADO INTERNO','','2014-07-23 22:03:40','2015-04-22 20:49:12',3),(36,1,'CCAA','CAMBIO DE CATEGORIA','','2014-07-23 22:03:40','2015-04-22 20:49:25',4),(37,1,'DESE','DESTETE','','2014-07-23 22:03:40','2015-04-22 20:49:34',4),(38,1,'TACO','TACTO','','2014-07-23 22:03:40','2015-04-22 20:49:49',4),(39,1,'YERA','YERRA','','2014-07-23 22:03:40','2015-04-22 20:50:02',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_registros`
--

LOCK TABLES `rga_registros` WRITE;
/*!40000 ALTER TABLE `rga_registros` DISABLE KEYS */;
INSERT INTO `rga_registros` VALUES (5,'2015-04-21',1,1,32,NULL,NULL,NULL,10,1,26,10,400.00,'','2015-04-21 20:53:08','2015-04-21 20:53:08'),(7,'2015-04-21',1,1,27,10,1,26,NULL,NULL,NULL,2,400.00,'','2015-04-21 21:04:40','2015-04-21 21:04:40'),(8,'2015-04-21',1,1,27,10,1,26,NULL,NULL,NULL,2,400.00,'','2015-04-21 21:05:23','2015-04-21 21:05:23'),(9,'2015-04-21',1,1,27,10,1,26,NULL,NULL,NULL,2,400.00,'','2015-04-21 21:13:50','2015-04-21 21:13:50'),(10,'2015-04-21',1,1,32,NULL,NULL,NULL,10,1,26,5,400.00,'','2015-04-21 21:14:06','2015-04-21 21:14:06'),(11,'2015-04-21',1,1,27,10,1,26,NULL,NULL,NULL,3,400.00,'','2015-04-21 21:14:15','2015-04-21 21:14:15'),(12,'2015-04-21',1,1,27,10,1,26,NULL,NULL,NULL,1,400.00,'','2015-04-21 21:40:00','2015-04-21 21:40:00'),(13,'2015-04-21',1,1,35,NULL,NULL,NULL,8,1,26,15,450.00,'','2015-04-22 00:13:14','2015-04-22 00:13:14'),(19,'2015-04-22',1,1,36,8,1,26,10,1,26,2,450.00,'','2015-04-22 16:57:06','2015-04-22 17:04:02'),(20,'2015-04-22',1,1,36,8,1,26,10,1,26,3,400.00,'','2015-04-22 17:04:21','2015-04-22 17:04:21'),(21,'2015-04-22',1,1,36,10,1,26,8,1,26,4,400.00,'','2015-04-22 17:05:06','2015-04-22 17:05:06'),(22,'2015-04-22',1,1,30,10,1,26,NULL,NULL,NULL,2,400.00,'','2015-04-22 18:34:12','2015-04-22 18:34:12'),(23,'2015-04-22',1,1,30,10,1,26,NULL,NULL,NULL,1,400.00,'','2015-04-22 18:34:29','2015-04-22 18:34:29'),(24,'2015-04-23',1,1,32,NULL,NULL,NULL,7,1,27,10,600.00,'','2015-04-24 01:06:28','2015-04-24 01:06:28'),(25,'2015-04-23',1,1,36,7,1,27,6,1,27,1,0.00,'','2015-04-24 01:06:51','2015-04-24 01:06:51');
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
INSERT INTO `schema_migrations` VALUES ('20140405161247'),('20140602235802'),('20140607163525'),('20140607231035'),('20140607234411'),('20140613210033'),('20140613210231'),('20140613210412'),('20140613210837'),('20140613212357'),('20140616214436'),('20140616214711'),('20140616215028'),('20140623182620'),('20140623232101'),('20140624184006'),('20140624184302'),('20140624230325'),('20140627211505'),('20140627211610'),('20140627212043'),('20140627212406'),('20140704220110'),('20140707140437'),('20140708154342'),('20140708172742'),('20140721145150'),('20140721155827'),('20140721161219'),('20140721211858'),('20140721214111'),('20140721215517'),('20140722002320'),('20140722143012'),('20140722143952'),('20140722144027'),('20140722230153'),('20140722231142'),('20140722231457'),('20140723163854'),('20140723164007'),('20140723204943'),('20140723205417'),('20140723220510'),('20140723220559'),('20140724201837'),('20140724201917'),('20140724204217'),('20140724204242'),('20140724210743'),('20140724223301'),('20140724223437'),('20140725004936'),('20140726041735'),('20140726045503'),('20140728225556'),('20140803005510'),('20140909134839'),('20140909143515'),('20140909145041'),('20140909153115'),('20140915144802'),('20141016203635'),('20141102170934'),('20141108011505'),('20150213215013'),('20150213215450'),('20150213221629'),('20150213225428'),('20150217163030'),('20150218125809'),('20150220201031'),('20150220214150'),('20150313155818'),('20150313174257'),('20150325193735');
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

-- Dump completed on 2015-04-24 22:25:19
