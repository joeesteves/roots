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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operaciones`
--

LOCK TABLES `rad_operaciones` WRITE;
/*!40000 ALTER TABLE `rad_operaciones` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_operacionregistros`
--

LOCK TABLES `rad_operacionregistros` WRITE;
/*!40000 ALTER TABLE `rad_operacionregistros` DISABLE KEYS */;
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
INSERT INTO `rba_items_nodos` VALUES (677,302,1),(678,303,1),(679,304,1),(683,308,1),(684,309,1),(685,310,1),(742,337,4),(746,345,12),(747,338,12),(750,346,12),(751,348,12),(752,347,12),(753,344,12),(754,349,12),(756,343,12),(757,340,12),(761,334,11),(762,339,12),(763,350,12),(764,342,12),(765,336,11),(766,325,15),(768,324,15),(770,319,13),(772,315,13),(773,316,13),(774,317,13),(775,318,13),(777,320,13),(779,322,13),(780,323,14),(784,352,13),(785,326,15),(800,353,11),(801,354,43),(802,355,13),(803,356,12),(804,357,12),(805,358,45),(817,2,50),(818,3,50),(819,4,50),(820,5,50),(821,6,50),(822,7,49),(823,8,49),(824,9,49),(825,10,49),(862,392,2),(863,393,15),(864,394,13),(865,8,40),(866,340,15),(867,327,15),(868,395,15),(869,396,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rba_organizaciones`
--

LOCK TABLES `rba_organizaciones` WRITE;
/*!40000 ALTER TABLE `rba_organizaciones` DISABLE KEYS */;
INSERT INTO `rba_organizaciones` VALUES (1,1,'FINNEGANS','',1,'30-69843145-4',1,'2015-02-13 22:52:19','2015-04-15 13:37:27',1,'VIRREY DEL PINO 2166, CAPITAL FEDERAL (CPA: C1426EGL)'),(2,1,'CCISSA','',1,'30-70826819-0',1,'2015-02-13 23:06:39','2015-02-14 01:21:56',1,NULL),(3,1,'EL AGUARA','',1,'30-66317074-7',1,'2015-02-14 01:22:43','2015-02-14 04:22:32',1,NULL),(5,1,'GERALDINE ORELLANA','',3,'27-37057702-7',1,'2015-02-14 04:29:34','2015-02-14 04:33:44',1,NULL),(6,1,'ROBERTO CANALI','',1,'32-16354654-6',1,'2015-02-17 16:33:08','2015-03-25 14:29:40',1,''),(8,1,'JOSE','',1,'20-31624095-0',1,'2015-02-17 16:36:06','2015-02-17 16:36:06',1,NULL),(9,1,'JOSE','',2,'20-31624095-0',1,'2015-02-17 16:48:13','2015-02-17 16:48:57',2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_aplicaciones`
--

LOCK TABLES `rco_aplicaciones` WRITE;
/*!40000 ALTER TABLE `rco_aplicaciones` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_asientos`
--

LOCK TABLES `rco_asientos` WRITE;
/*!40000 ALTER TABLE `rco_asientos` DISABLE KEYS */;
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
INSERT INTO `rco_cuentas` VALUES (312,'RODADOS','RODADOS',1,'',12,1,'2014-06-27 14:12:20','2014-07-08 17:04:24'),(313,'CAJA GENERAL $','CAJA GENERAL $',1,'',3,1,'2014-06-27 14:12:20','2014-06-28 22:22:32'),(315,'BBVA CA','BBVA CA',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:22'),(316,'BBVA CTA CTE','BBVA CTA CTE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:32'),(317,'PROV CA','PROV CA',1,NULL,3,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(318,'CAJA GRIS $','CAJA GRIS $',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(319,'CAJA GRIS U$S','CAJA GRIS U$S',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:25'),(320,'CAJA GRIS UY','CAJA GRIS UY',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(321,'CAJA GRIS REAIS','CAJA GRIS REAIS',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(322,'CUENTA CANJE','CUENTA CANJE',1,'',3,1,'2014-06-27 14:12:21','2014-06-28 22:22:33'),(323,'POR COBRAR','POR COBRAR',1,'',4,1,'2014-06-27 14:12:21','2014-06-28 22:11:31'),(324,'BBVA VISA','BBVA VISA',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(325,'BBVA MASTER','BBVA MASTER',1,NULL,9,1,'2014-06-27 14:12:21','2014-06-27 14:12:21'),(326,'PROV VISA','PROV VISA',1,'',9,1,'2014-06-27 14:12:21','2014-06-28 22:11:41'),(327,'SERVICIOS A PAGAR','SERVICIOS A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(328,'BBVA VISA A PAGAR','BBVA VISA A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(329,'BBVA MASTER A PAGAR','BBVA MASTER A PAGAR',1,NULL,9,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(330,'PROV VISA A PAGAR','PROV VISA A PAGAR',1,'',9,1,'2014-06-27 14:12:22','2014-06-28 22:11:41'),(331,'FC JOSE','SUELDO JOSE',1,'SERVICIOS FACTURADOS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(332,'SUELDO FLO','SUELDO FLO',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(333,'VET','VET',1,'',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(334,'ROOTS','ROOTS',1,'FC SERVICIOS ROOTS',6,1,'2014-06-27 14:12:22','2014-06-27 14:22:23'),(336,'REGALOS RECIBIDOS','REGALOS RECIBIDOS',1,'',6,1,'2014-06-27 14:12:22','2014-10-16 21:58:08'),(337,'CAPITAL','CAPITAL',1,'',5,1,'2014-06-27 14:12:22','2014-10-11 00:03:09'),(338,'ALQUILER','ALQUILER',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(339,'SUPERMERCADO','SUPERMERCADO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(340,'SERVICIOS','SERVICIOS',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(341,'AUTO','AUTO',1,NULL,7,1,'2014-06-27 14:12:22','2014-06-27 14:12:22'),(342,'VIAJES','VIAJES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(343,'REGALOS REALIZADOS','REGALOS REALIZADOS',1,'',7,1,'2014-06-27 14:12:23','2014-10-16 21:58:21'),(344,'GENERALES','GENERALES',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(345,'ALMUERZOS','ALMUERZOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(346,'EDUCACION','EDUCACION',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(347,'EXTRA ORDINARIOS','EXTRA ORDINARIOS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(348,'ENTRETENIMIENTO','ENTRETENIMIENTO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(349,'MANTENIMIENTO CUENTAS','MANTENIMIENTO CUENTAS',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(350,'TELEFONO','TELEFONO',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(351,'COMBUSTIBLE','COMBUSTIBLE',1,NULL,7,1,'2014-06-27 14:12:23','2014-06-27 14:12:23'),(352,'BBVA COM','BBVA COM',1,'CUENTA COMITENTE',3,1,'2014-07-08 15:00:16','2014-07-08 15:07:16'),(353,'TUR','TURISMO',1,'',7,1,'2014-07-23 14:26:03','2014-07-23 14:26:03'),(354,'PROCREAUTO','PROCREAUTO',1,'',11,1,'2014-10-04 16:09:15','2015-02-09 12:15:21'),(355,'NACION CA','NACION CA',1,'',3,1,'2014-10-04 16:10:03','2014-10-04 16:10:03'),(356,'OBRA SOCIAL','OBRA SOCIAL',1,'',7,1,'2014-10-17 02:38:23','2014-10-17 02:38:23'),(357,'PERSONAL CASA','PERSONAL CASA',1,'',7,1,'2014-10-18 01:22:25','2014-10-18 01:22:25'),(358,'FLUENCE','FLUENCE',1,'',12,1,'2014-10-18 17:35:27','2015-02-14 04:24:13'),(361,'PROCREAUTO A PAGAR','PROCREAUTO A PAGAR',1,'',9,1,'2015-02-09 01:45:51','2015-02-09 12:41:29'),(371,'INTERESES BANCARIOS','INTERESES BANCARIOS',1,'',7,1,'2015-02-09 01:46:18','2015-02-09 12:09:09'),(381,'BNA CA','BNA CA',1,'',10,1,'2015-02-09 12:10:36','2015-02-09 12:15:04'),(391,'BBVA PF','BBVA PF',1,'',3,1,'2015-02-09 12:25:10','2015-02-09 12:25:10'),(392,'GN','GASTO GRAL',1,'',7,2,'2015-02-20 19:33:24','2015-02-20 19:33:24'),(393,'VISA','VISA',1,'',9,2,'2015-02-20 19:33:55','2015-02-20 19:33:55'),(394,'BP','BANCO PRUEBA',1,'',3,2,'2015-02-20 19:34:09','2015-02-20 19:34:09'),(395,'PPAO','PROVISIÓN EGRESOS',1,'',14,1,'2015-03-06 21:25:10','2015-03-06 21:25:10'),(396,'PAO2','PROV EGRESOS 2',1,'',14,1,'2015-03-25 15:04:15','2015-03-25 15:04:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=2321 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rco_registros`
--

LOCK TABLES `rco_registros` WRITE;
/*!40000 ALTER TABLE `rco_registros` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales`
--

LOCK TABLES `rga_animales` WRITE;
/*!40000 ALTER TABLE `rga_animales` DISABLE KEYS */;
INSERT INTO `rga_animales` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:21','2015-02-20 13:27:21'),(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:21','2015-02-20 13:27:21'),(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(13,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(16,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(17,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(18,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(19,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(21,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(24,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(26,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(28,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(29,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(30,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(31,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(32,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:22','2015-02-20 13:27:22'),(33,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(34,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(35,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(36,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(37,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(38,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(39,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(40,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(41,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(42,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(43,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(44,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(45,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(46,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(47,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(48,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(49,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(51,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(52,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(53,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(54,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(55,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(56,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(57,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(58,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(59,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(60,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(61,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(62,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(63,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(64,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(65,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(66,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:23','2015-02-20 13:27:23'),(67,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(68,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(69,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(70,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(71,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(72,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(73,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(74,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(75,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(76,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(77,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(78,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(79,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(80,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(81,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(82,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(83,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(84,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(85,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(86,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(87,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(88,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(89,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(90,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(91,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(92,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(93,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(94,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(95,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(96,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(97,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(98,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(99,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24'),(100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-20 13:27:24','2015-02-20 13:27:24');
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
INSERT INTO `rga_categoriatipos` VALUES (1,1,'TERNERO','TERNERO','','2014-07-24 21:04:10','2014-07-24 21:48:04'),(2,1,'RECRIA','RECRIA','','2014-07-24 21:04:11','2014-07-28 21:54:23'),(3,1,'REP. HEMBRA','REP. HEMBRA','','2014-07-24 21:04:11','2014-07-28 21:54:29'),(4,1,'REP. MACHO','REP. MACHO',NULL,'2014-07-24 21:04:11','2014-07-24 21:04:11');
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

-- Dump completed on 2015-04-15 11:07:22
