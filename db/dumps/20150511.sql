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
  `comprobante` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rad_operaciones_on_operaciontipo_id` (`operaciontipo_id`),
  KEY `index_rad_operaciones_on_ctaD_id` (`ctaD_id`),
  KEY `index_rad_operaciones_on_ctaH_id` (`ctaH_id`),
  KEY `index_rad_operaciones_on_empresa_id` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `rba_items_nodos` VALUES (742,337,4),(746,345,12),(747,338,12),(750,346,12),(751,348,12),(752,347,12),(753,344,12),(754,349,12),(756,343,12),(757,340,12),(761,334,11),(762,339,12),(763,350,12),(764,342,12),(765,336,11),(766,325,15),(768,324,15),(770,319,13),(777,320,13),(779,322,13),(780,323,14),(784,352,13),(785,326,15),(800,353,11),(801,354,43),(802,355,13),(803,356,12),(804,357,12),(805,358,45),(862,392,2),(863,393,15),(864,394,13),(866,340,15),(867,327,15),(868,395,15),(869,396,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales`
--

LOCK TABLES `rga_animales` WRITE;
/*!40000 ALTER TABLE `rga_animales` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_animales_registros`
--

LOCK TABLES `rga_animales_registros` WRITE;
/*!40000 ALTER TABLE `rga_animales_registros` DISABLE KEYS */;
INSERT INTO `rga_animales_registros` VALUES (158,186,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(159,187,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(160,188,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(161,189,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(162,190,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(163,191,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(164,192,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(165,193,32,'2015-04-27 19:39:56','2015-04-27 19:39:56'),(166,194,32,'2015-04-27 19:39:57','2015-04-27 19:39:57'),(167,195,32,'2015-04-27 19:39:57','2015-04-27 19:39:57'),(168,196,33,'2015-04-27 19:40:52','2015-04-27 19:40:52'),(169,197,33,'2015-04-27 19:40:52','2015-04-27 19:40:52'),(170,198,33,'2015-04-27 19:40:52','2015-04-27 19:40:52'),(171,199,33,'2015-04-27 19:40:52','2015-04-27 19:40:52'),(172,200,33,'2015-04-27 19:40:52','2015-04-27 19:40:52'),(173,196,34,'2015-04-27 19:41:11','2015-04-27 19:41:11'),(174,197,34,'2015-04-27 19:41:11','2015-04-27 19:41:11'),(175,201,35,'2015-04-27 19:48:50','2015-04-27 19:48:50'),(176,202,35,'2015-04-27 19:48:50','2015-04-27 19:48:50'),(179,205,37,'2015-04-27 19:54:43','2015-04-27 19:54:43'),(180,206,37,'2015-04-27 19:54:43','2015-04-27 19:54:43'),(181,207,38,'2015-04-27 19:54:59','2015-04-27 19:54:59'),(182,208,38,'2015-04-27 19:54:59','2015-04-27 19:54:59'),(183,207,39,'2015-04-27 19:55:09','2015-04-27 19:55:09'),(184,209,40,'2015-04-27 20:10:56','2015-04-27 20:10:56'),(185,210,40,'2015-04-27 20:10:56','2015-04-27 20:10:56'),(186,211,40,'2015-04-27 20:10:56','2015-04-27 20:10:56'),(187,212,40,'2015-04-27 20:10:56','2015-04-27 20:10:56'),(188,213,40,'2015-04-27 20:10:56','2015-04-27 20:10:56'),(189,209,41,'2015-04-27 20:11:15','2015-04-27 20:11:15'),(190,210,41,'2015-04-27 20:11:15','2015-04-27 20:11:15'),(191,209,42,'2015-04-27 21:06:47','2015-04-27 21:06:47'),(192,210,42,'2015-04-27 21:06:47','2015-04-27 21:06:47'),(193,214,43,'2015-04-27 21:07:11','2015-04-27 21:07:11'),(194,215,43,'2015-04-27 21:07:11','2015-04-27 21:07:11'),(195,216,43,'2015-04-27 21:07:11','2015-04-27 21:07:11'),(196,217,43,'2015-04-27 21:07:11','2015-04-27 21:07:11'),(197,218,43,'2015-04-27 21:07:11','2015-04-27 21:07:11'),(198,216,44,'2015-04-27 21:07:20','2015-04-27 21:07:20'),(199,217,44,'2015-04-27 21:07:20','2015-04-27 21:07:20'),(200,218,44,'2015-04-27 21:07:20','2015-04-27 21:07:20'),(201,219,45,'2015-04-27 21:17:20','2015-04-27 21:17:20'),(202,220,45,'2015-04-27 21:17:20','2015-04-27 21:17:20'),(203,221,45,'2015-04-27 21:17:20','2015-04-27 21:17:20'),(204,222,45,'2015-04-27 21:17:20','2015-04-27 21:17:20'),(205,223,45,'2015-04-27 21:17:20','2015-04-27 21:17:20'),(206,219,46,'2015-04-27 21:17:28','2015-04-27 21:17:28'),(207,220,46,'2015-04-27 21:17:28','2015-04-27 21:17:28'),(208,222,47,'2015-04-27 21:17:40','2015-04-27 21:17:40'),(209,224,48,'2015-04-27 21:52:57','2015-04-27 21:52:57'),(210,225,49,'2015-04-27 21:53:56','2015-04-27 21:53:56'),(211,226,49,'2015-04-27 21:53:56','2015-04-27 21:53:56'),(212,227,49,'2015-04-27 21:53:56','2015-04-27 21:53:56'),(213,225,50,'2015-04-27 21:54:09','2015-04-27 21:54:09'),(214,1,1,'2015-04-28 12:56:56','2015-04-28 12:56:56'),(215,2,2,'2015-04-28 12:59:08','2015-04-28 12:59:08'),(216,3,2,'2015-04-28 12:59:08','2015-04-28 12:59:08'),(217,4,2,'2015-04-28 12:59:08','2015-04-28 12:59:08'),(218,2,3,'2015-04-28 12:59:32','2015-04-28 12:59:32'),(219,3,3,'2015-04-28 12:59:32','2015-04-28 12:59:32'),(220,2,4,'2015-04-28 13:55:10','2015-04-28 13:55:10'),(221,1,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(222,2,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(223,3,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(224,4,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(225,5,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(226,6,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(227,7,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(228,8,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(229,9,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(230,10,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(231,11,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(232,12,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(233,13,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(234,14,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(235,15,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(236,16,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(237,17,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(238,18,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(239,19,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(240,20,1,'2015-05-11 23:11:50','2015-05-11 23:11:50'),(241,21,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(242,22,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(243,23,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(244,24,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(245,25,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(246,26,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(247,27,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(248,28,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(249,29,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(250,30,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(251,31,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(252,32,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(253,33,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(254,34,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(255,35,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(256,36,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(257,37,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(258,38,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(259,39,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(260,40,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(261,41,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(262,42,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(263,43,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(264,44,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(265,45,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(266,46,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(267,47,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(268,48,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(269,49,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(270,50,1,'2015-05-11 23:11:51','2015-05-11 23:11:51'),(271,51,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(272,52,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(273,53,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(274,54,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(275,55,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(276,56,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(277,57,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(278,58,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(279,59,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(280,60,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(281,61,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(282,62,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(283,63,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(284,64,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(285,65,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(286,66,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(287,67,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(288,68,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(289,69,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(290,70,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(291,71,1,'2015-05-11 23:11:52','2015-05-11 23:11:52'),(292,72,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(293,73,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(294,74,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(295,75,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(296,76,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(297,77,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(298,78,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(299,79,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(300,80,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(301,81,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(302,82,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(303,83,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(304,84,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(305,85,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(306,86,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(307,87,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(308,88,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(309,89,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(310,90,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(311,91,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(312,92,1,'2015-05-11 23:11:53','2015-05-11 23:11:53'),(313,93,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(314,94,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(315,95,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(316,96,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(317,97,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(318,98,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(319,99,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(320,100,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(321,101,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(322,102,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(323,103,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(324,104,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(325,105,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(326,106,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(327,107,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(328,108,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(329,109,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(330,110,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(331,111,1,'2015-05-11 23:11:54','2015-05-11 23:11:54'),(332,112,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(333,113,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(334,114,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(335,115,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(336,116,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(337,117,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(338,118,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(339,119,1,'2015-05-11 23:11:55','2015-05-11 23:11:55'),(340,120,1,'2015-05-11 23:11:55','2015-05-11 23:11:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rga_estados_eventos`
--

LOCK TABLES `rga_estados_eventos` WRITE;
/*!40000 ALTER TABLE `rga_estados_eventos` DISABLE KEYS */;
INSERT INTO `rga_estados_eventos` VALUES (1,'O',25,29,'2015-04-21 17:20:53','2015-04-21 17:20:53'),(2,'O',26,29,'2015-04-21 17:20:53','2015-04-21 17:20:53'),(3,'O',27,29,'2015-04-21 17:20:53','2015-04-21 17:20:53'),(4,'O',28,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(5,'O',29,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(6,'O',30,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(7,'O',31,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(8,'O',32,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(9,'O',33,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(10,'O',34,29,'2015-04-21 17:20:53','2015-04-21 17:20:54'),(11,'D',25,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(12,'D',26,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(13,'D',27,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(14,'D',28,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(15,'D',29,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(16,'D',30,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(17,'D',31,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(18,'D',32,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(19,'D',33,32,'2015-04-21 17:21:30','2015-04-21 17:21:31'),(20,'D',34,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(21,'D',35,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(22,'D',36,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(23,'D',37,32,'2015-04-21 17:21:31','2015-04-21 17:21:31'),(24,'O',34,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(25,'D',30,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(26,'D',31,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(27,'D',36,38,'2015-04-21 17:30:49','2015-04-21 17:30:49'),(28,'O',25,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(29,'O',26,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(30,'O',27,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(31,'O',28,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(32,'O',29,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(33,'O',30,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(34,'O',31,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(35,'O',32,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(36,'O',33,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(37,'O',34,27,'2015-04-21 20:49:08','2015-04-21 21:38:40'),(38,'O',25,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(39,'O',26,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(40,'O',27,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(41,'O',28,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(42,'O',29,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(43,'O',30,28,'2015-04-21 23:54:50','2015-04-21 23:54:50'),(44,'O',31,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(45,'O',32,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(46,'O',33,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(47,'O',34,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(48,'O',35,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(49,'O',36,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(50,'O',37,28,'2015-04-21 23:54:50','2015-04-21 23:54:51'),(51,'O',27,30,'2015-04-21 23:55:06','2015-04-21 23:55:06'),(52,'O',28,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(53,'O',29,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(54,'O',30,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(55,'O',31,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(56,'O',32,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(57,'O',33,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(58,'O',34,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(59,'O',35,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(60,'O',36,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(61,'O',37,30,'2015-04-21 23:55:06','2015-04-21 23:55:07'),(62,'O',25,30,'2015-04-21 23:55:14','2015-04-21 23:55:14'),(63,'O',26,30,'2015-04-21 23:55:14','2015-04-21 23:55:14'),(64,'O',30,31,'2015-04-21 23:55:43','2015-04-21 23:55:44'),(65,'O',31,31,'2015-04-21 23:55:43','2015-04-21 23:55:44'),(66,'D',26,31,'2015-04-21 23:55:43','2015-04-21 23:55:44'),(67,'D',25,33,'2015-04-21 23:56:04','2015-04-21 23:56:04'),(68,'D',25,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(69,'D',26,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(70,'D',27,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(71,'D',28,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(72,'D',29,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(73,'D',30,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(74,'D',31,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(75,'D',32,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(76,'D',33,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(77,'D',34,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(78,'D',35,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(79,'D',36,34,'2015-04-21 23:56:22','2015-04-21 23:56:22'),(80,'D',37,34,'2015-04-21 23:56:22','2015-04-21 23:56:23'),(81,'OD',25,35,'2015-04-21 23:56:34','2015-04-22 00:00:06'),(82,'D',26,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(83,'D',27,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(84,'D',28,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(85,'D',29,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(86,'D',30,35,'2015-04-21 23:56:34','2015-04-21 23:56:34'),(87,'D',31,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(88,'D',32,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(89,'D',33,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(90,'D',34,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(91,'D',35,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(92,'D',36,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(93,'D',37,35,'2015-04-21 23:56:34','2015-04-21 23:56:35'),(94,'OD',25,36,'2015-04-21 23:56:57','2015-04-21 23:56:57'),(95,'OD',26,36,'2015-04-21 23:56:57','2015-04-27 18:43:47'),(96,'OD',27,36,'2015-04-21 23:56:57','2015-04-21 23:56:57'),(97,'OD',28,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(98,'OD',29,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(99,'OD',30,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(100,'OD',31,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(101,'OD',32,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(102,'OD',33,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(103,'OD',34,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(104,'OD',35,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(105,'OD',36,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(106,'OD',37,36,'2015-04-21 23:56:57','2015-04-21 23:56:58'),(107,'O',25,37,'2015-04-21 23:57:18','2015-04-21 23:57:18'),(108,'O',35,37,'2015-04-21 23:57:18','2015-04-21 23:57:18'),(109,'D',29,37,'2015-04-21 23:57:18','2015-04-21 23:57:18'),(110,'O',25,39,'2015-04-21 23:57:33','2015-04-21 23:57:33'),(111,'D',35,39,'2015-04-21 23:57:33','2015-04-21 23:57:33'),(112,'O',35,29,'2015-04-25 15:32:23','2015-04-25 15:32:23'),(113,'O',36,29,'2015-04-25 15:32:23','2015-04-25 15:32:23'),(114,'O',37,29,'2015-04-25 15:32:23','2015-04-25 15:32:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `schema_migrations` VALUES ('20140405161247'),('20140602235802'),('20140607163525'),('20140607231035'),('20140607234411'),('20140613210033'),('20140613210231'),('20140613210412'),('20140613210837'),('20140613212357'),('20140616214436'),('20140616214711'),('20140616215028'),('20140623182620'),('20140623232101'),('20140624184006'),('20140624184302'),('20140624230325'),('20140627211505'),('20140627211610'),('20140627212043'),('20140627212406'),('20140704220110'),('20140707140437'),('20140708154342'),('20140708172742'),('20140721145150'),('20140721155827'),('20140721161219'),('20140721211858'),('20140721214111'),('20140721215517'),('20140722002320'),('20140722143012'),('20140722143952'),('20140722144027'),('20140722230153'),('20140722231142'),('20140722231457'),('20140723163854'),('20140723164007'),('20140723204943'),('20140723205417'),('20140723220510'),('20140723220559'),('20140724201837'),('20140724201917'),('20140724204217'),('20140724204242'),('20140724210743'),('20140724223301'),('20140724223437'),('20140725004936'),('20140726041735'),('20140726045503'),('20140728225556'),('20140803005510'),('20140909134839'),('20140909143515'),('20140909145041'),('20140909153115'),('20140915144802'),('20141016203635'),('20141102170934'),('20141108011505'),('20150213215013'),('20150213215450'),('20150213221629'),('20150213225428'),('20150217163030'),('20150218125809'),('20150220201031'),('20150220214150'),('20150313155818'),('20150313174257'),('20150325193735'),('20150511134833');
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

-- Dump completed on 2015-05-11 20:15:46
