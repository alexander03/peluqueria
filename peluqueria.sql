-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: peluqueria
-- ------------------------------------------------------
-- Server version	5.6.38-log

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
-- Table structure for table `binnacle`
--

DROP TABLE IF EXISTS `binnacle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binnacle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `recordid` int(10) unsigned NOT NULL,
  `table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `binnacle_user_id_foreign` (`user_id`),
  CONSTRAINT `binnacle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binnacle`
--

LOCK TABLES `binnacle` WRITE;
/*!40000 ALTER TABLE `binnacle` DISABLE KEYS */;
INSERT INTO `binnacle` VALUES (1,'I','2018-05-11 14:56:40','Lucho',1,1,'categoria','{\"name\":\"CATEGORIA 1\",\"updated_at\":\"2018-05-11 09:56:40\",\"created_at\":\"2018-05-11 09:56:40\",\"id\":1}','2018-05-11 14:56:40','2018-05-11 14:56:40',NULL),(2,'I','2018-05-11 14:56:46','Lucho',1,2,'categoria','{\"name\":\"CATEGORIA 2\",\"updated_at\":\"2018-05-11 09:56:45\",\"created_at\":\"2018-05-11 09:56:45\",\"id\":2}','2018-05-11 14:56:46','2018-05-11 14:56:46',NULL),(3,'I','2018-05-11 14:56:52','Lucho',1,3,'categoria','{\"name\":\"CATEGORIA 3\",\"updated_at\":\"2018-05-11 09:56:52\",\"created_at\":\"2018-05-11 09:56:52\",\"id\":3}','2018-05-11 14:56:52','2018-05-11 14:56:52',NULL),(4,'I','2018-05-11 14:57:03','Lucho',1,1,'marca','{\"name\":\"MARCA 1\",\"updated_at\":\"2018-05-11 09:57:03\",\"created_at\":\"2018-05-11 09:57:03\",\"id\":1}','2018-05-11 14:57:03','2018-05-11 14:57:03',NULL),(5,'I','2018-05-11 14:57:23','Lucho',1,2,'marca','{\"name\":\"MARCA 2\",\"updated_at\":\"2018-05-11 09:57:23\",\"created_at\":\"2018-05-11 09:57:23\",\"id\":2}','2018-05-11 14:57:23','2018-05-11 14:57:23',NULL),(6,'I','2018-05-11 14:57:29','Lucho',1,3,'marca','{\"name\":\"MARCA 3\",\"updated_at\":\"2018-05-11 09:57:29\",\"created_at\":\"2018-05-11 09:57:29\",\"id\":3}','2018-05-11 14:57:29','2018-05-11 14:57:29',NULL),(7,'I','2018-05-11 14:57:37','Lucho',1,1,'unidad','{\"name\":\"UNIDAD 1\",\"updated_at\":\"2018-05-11 09:57:37\",\"created_at\":\"2018-05-11 09:57:37\",\"id\":1}','2018-05-11 14:57:37','2018-05-11 14:57:37',NULL),(8,'I','2018-05-11 14:57:42','Lucho',1,2,'unidad','{\"name\":\"UNIDAD 2\",\"updated_at\":\"2018-05-11 09:57:42\",\"created_at\":\"2018-05-11 09:57:42\",\"id\":2}','2018-05-11 14:57:42','2018-05-11 14:57:42',NULL),(9,'I','2018-05-11 14:57:47','Lucho',1,3,'unidad','{\"name\":\"UNIDAD 3\",\"updated_at\":\"2018-05-11 09:57:47\",\"created_at\":\"2018-05-11 09:57:47\",\"id\":3}','2018-05-11 14:57:47','2018-05-11 14:57:47',NULL),(10,'I','2018-05-11 14:58:37','Lucho',1,1,'producto','{\"descripcion\":\"PRODUCTO 1\",\"precioventa\":\"159.90\",\"marca_id\":\"1\",\"categoria_id\":\"1\",\"unidad_id\":\"1\",\"updated_at\":\"2018-05-11 09:58:37\",\"created_at\":\"2018-05-11 09:58:37\",\"id\":1}','2018-05-11 14:58:37','2018-05-11 14:58:37',NULL),(11,'I','2018-05-11 14:58:48','Lucho',1,2,'producto','{\"descripcion\":\"PRODUCTO 2\",\"precioventa\":\"459.90\",\"marca_id\":\"2\",\"categoria_id\":\"2\",\"unidad_id\":\"2\",\"updated_at\":\"2018-05-11 09:58:48\",\"created_at\":\"2018-05-11 09:58:48\",\"id\":2}','2018-05-11 14:58:48','2018-05-11 14:58:48',NULL),(12,'I','2018-05-11 14:59:05','Lucho',1,3,'producto','{\"descripcion\":\"PRODUCTO 3\",\"precioventa\":\"1699.90\",\"marca_id\":\"3\",\"categoria_id\":\"3\",\"unidad_id\":\"3\",\"updated_at\":\"2018-05-11 09:59:05\",\"created_at\":\"2018-05-11 09:59:05\",\"id\":3}','2018-05-11 14:59:05','2018-05-11 14:59:05',NULL);
/*!40000 ALTER TABLE `binnacle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'CATEGORIA 1','2018-05-11 14:56:40','2018-05-11 14:56:40',NULL),(2,'CATEGORIA 2','2018-05-11 14:56:45','2018-05-11 14:56:45',NULL),(3,'CATEGORIA 3','2018-05-11 14:56:52','2018-05-11 14:56:52',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Lambayeque','2018-05-14 05:00:00','2018-05-14 05:00:00',NULL);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distrito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `distrito_provincia_id_foreign` (`provincia_id`),
  CONSTRAINT `distrito_provincia_id_foreign` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Saña',1,'2018-05-14 05:00:00','2018-05-14 05:00:00',NULL);
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacto_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empresa_ruc_unique` (`ruc`),
  KEY `empresa_contacto_id_foreign` (`contacto_id`),
  CONSTRAINT `empresa_contacto_id_foreign` FOREIGN KEY (`contacto_id`) REFERENCES `personamaestro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'12345678910','GARZATEC','-','-',1,'2017-08-28 05:00:00','2017-08-28 05:00:00',NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'MARCA 1','2018-05-11 14:57:03','2018-05-11 14:57:03',NULL),(2,'MARCA 2','2018-05-11 14:57:23','2018-05-11 14:57:23',NULL),(3,'MARCA 3','2018-05-11 14:57:29','2018-05-11 14:57:29',NULL);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuoption`
--

DROP TABLE IF EXISTS `menuoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuoption` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-expand',
  `menuoptioncategory_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menuoption_menuoptioncategory_id_foreign` (`menuoptioncategory_id`),
  CONSTRAINT `menuoption_menuoptioncategory_id_foreign` FOREIGN KEY (`menuoptioncategory_id`) REFERENCES `menuoptioncategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuoption`
--

LOCK TABLES `menuoption` WRITE;
/*!40000 ALTER TABLE `menuoption` DISABLE KEYS */;
INSERT INTO `menuoption` VALUES (1,'Categoría de opción de menu','categoriaopcionmenu',1,'glyphicon glyphicon-expand',3,'2017-07-23 22:17:30','2017-07-23 22:17:30',NULL),(2,'Opción de menu','opcionmenu',2,'glyphicon glyphicon-expand',3,'2017-07-23 22:17:30','2017-07-23 22:17:30',NULL),(3,'Tipos de usuario','tipousuario',3,'glyphicon glyphicon-expand',3,'2017-07-23 22:17:30','2017-07-23 22:17:30',NULL),(4,'Usuario','usuario',4,'glyphicon glyphicon-expand',3,'2017-07-23 22:17:30','2017-07-23 22:17:30',NULL),(5,'Tipo de cambio','changetype',1,'glyphicon glyphicon-expand',1,'2017-07-23 22:17:30','2017-09-09 20:44:15','2017-09-09 20:44:15'),(6,'Categorias','categoria',2,'glyphicon glyphicon-expand',1,'2017-07-23 22:17:30','2018-05-11 20:05:51',NULL),(7,'Marcas','marca',3,'glyphicon glyphicon-expand',1,'2017-07-23 22:17:30','2018-05-11 20:05:56',NULL),(8,'Unidades','unidad',4,'glyphicon glyphicon-expand',1,'2017-07-23 22:17:30','2018-05-11 20:06:02',NULL),(9,'Productos','producto',5,'glyphicon glyphicon-expand',1,'2017-07-23 22:17:30','2018-05-11 20:06:08',NULL),(10,'Tipo trabajador','workertype',1,'glyphicon glyphicon-expand',2,'2017-07-23 22:17:30','2017-07-23 22:17:30',NULL),(11,'Clientes','cliente',2,'glyphicon glyphicon-expand',2,'2017-07-23 22:17:30','2018-05-23 17:17:33',NULL),(12,'Proveedores','proveedor',3,'glyphicon glyphicon-expand',2,'2017-07-23 22:17:30','2018-05-23 17:17:45',NULL),(13,'Trabajadores','trabajador',4,'glyphicon glyphicon-expand',2,'2017-07-23 22:17:30','2018-05-23 17:18:02',NULL),(14,'Sucursal','sucursal',1,'glyphicon glyphicon-expand',1,'2018-05-15 15:50:57','2018-05-15 16:20:54',NULL),(15,'Ventas','ventas',1,'glyphicon glyphicon-expand',4,'2018-05-23 17:15:13','2018-05-23 17:18:23',NULL),(16,'Caja','caja',2,'glyphicon glyphicon-expand',4,'2018-05-23 17:15:31','2018-05-23 17:18:29',NULL),(17,'Cierre Caja','reportecierrecaja',1,'glyphicon glyphicon-expand',5,'2018-05-23 17:21:30','2018-05-23 17:21:30',NULL),(18,'Productividad','reporteproductividad',2,'glyphicon glyphicon-expand',5,'2018-05-23 17:22:56','2018-05-23 17:22:56',NULL),(19,'Historico Trabajador','reportehistoricotrabajador',3,'glyphicon glyphicon-expand',5,'2018-05-23 17:23:31','2018-05-23 17:23:31',NULL),(20,'Recaudacion','reporterecaudacion',4,'glyphicon glyphicon-expand',5,'2018-05-23 17:24:37','2018-05-23 17:24:37',NULL),(21,'Comisiones','reportecomisiones',5,'glyphicon glyphicon-expand',5,'2018-05-23 17:25:05','2018-05-23 17:25:05',NULL);
/*!40000 ALTER TABLE `menuoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuoptioncategory`
--

DROP TABLE IF EXISTS `menuoptioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuoptioncategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-expand',
  `menuoptioncategory_id` int(10) unsigned DEFAULT NULL,
  `position` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menuoptioncategory_menuoptioncategory_id_foreign` (`menuoptioncategory_id`),
  CONSTRAINT `menuoptioncategory_menuoptioncategory_id_foreign` FOREIGN KEY (`menuoptioncategory_id`) REFERENCES `menuoptioncategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuoptioncategory`
--

LOCK TABLES `menuoptioncategory` WRITE;
/*!40000 ALTER TABLE `menuoptioncategory` DISABLE KEYS */;
INSERT INTO `menuoptioncategory` VALUES (1,'Administración',2,'fa fa-bank',NULL,'V','2017-07-23 22:17:30','2018-05-23 17:11:40',NULL),(2,'Personas',3,'fa fa-bank',NULL,'V','2017-07-23 22:17:30','2018-05-23 17:11:46',NULL),(3,'Usuarios',4,'fa fa-bank',NULL,'V','2017-07-23 22:17:30','2018-05-23 17:11:51',NULL),(4,'Peluqueria',1,'fa fa-bank',NULL,'V','2018-05-23 17:11:34','2018-05-23 17:11:34',NULL),(5,'Reportes',5,'fa fa-bank',NULL,'V','2018-05-23 17:12:05','2018-05-23 17:12:05',NULL);
/*!40000 ALTER TABLE `menuoptioncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2017_03_22_142422_crear_tabla_departamento',1),(2,'2017_03_22_142444_crear_tabla_provincia',1),(3,'2017_03_22_142546_crear_tabla_distrito',1),(4,'2017_03_22_142709_crear_tabla_workertype',1),(5,'2017_03_22_142724_crear_tabla_person',1),(6,'2017_03_22_142751_crear_tabla_menuoptioncategory',1),(7,'2017_03_22_142804_crear_tabla_menuoption',1),(8,'2017_03_22_142828_crear_tabla_usertype',1),(9,'2017_03_22_142904_crear_tabla_permission',1),(10,'2017_03_22_142921_crear_tabla_user',1),(11,'2017_03_22_142939_crear_tabla_binnacle',1),(12,'2017_08_24_161501_crear_tabla_empresa',2),(13,'2017_08_28_120330_crear_tabla_persona',3),(14,'2017_08_28_120756_crear_tabla_rolpersona',3),(15,'2018_05_10_115933_crear_tabla_categoria',4),(16,'2018_05_11_083449_crear_tabla_marca',4),(17,'2018_05_11_084049_crear_tabla_unidad',4),(18,'2018_05_11_084238_crear_tabla_producto',4),(20,'2018_05_15_103607_crear_tabla_sucursal',5),(21,'2018_05_16_211523_crear_tabla_operacion',6),(22,'2018_05_16_212332_crear_tabla_operacion_menu',7),(24,'2018_05_16_213515_crear_tabla_permiso_operacion',8),(25,'2018_05_23_123325_create_tabla_sevicio',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion`
--

DROP TABLE IF EXISTS `operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion`
--

LOCK TABLES `operacion` WRITE;
/*!40000 ALTER TABLE `operacion` DISABLE KEYS */;
INSERT INTO `operacion` VALUES (1,'Nuevo','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(2,'Editar','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(3,'Eliminar','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(4,'Extornar','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(5,'Apertura de caja','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(6,'Cierre de caja','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(7,'Permisos','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(8,'Operaciones','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(9,'Anular','2018-05-16 05:00:00','2018-05-16 05:00:00',NULL);
/*!40000 ALTER TABLE `operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion_menu`
--

DROP TABLE IF EXISTS `operacion_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operacion_id` int(10) unsigned NOT NULL,
  `menuoption_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operacion_menu_operacion_id_foreign` (`operacion_id`),
  KEY `operacion_menu_menuoption_id_foreign` (`menuoption_id`),
  CONSTRAINT `operacion_menu_menuoption_id_foreign` FOREIGN KEY (`menuoption_id`) REFERENCES `menuoption` (`id`),
  CONSTRAINT `operacion_menu_operacion_id_foreign` FOREIGN KEY (`operacion_id`) REFERENCES `operacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion_menu`
--

LOCK TABLES `operacion_menu` WRITE;
/*!40000 ALTER TABLE `operacion_menu` DISABLE KEYS */;
INSERT INTO `operacion_menu` VALUES (1,1,1,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(2,2,1,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(3,3,1,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(4,1,2,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(5,2,2,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(6,3,2,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(7,1,3,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(8,2,3,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(9,3,3,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(10,1,4,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(11,2,4,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(12,3,4,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(13,1,5,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(14,2,5,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(15,3,5,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(16,1,6,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(17,2,6,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(18,3,6,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(19,1,7,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(20,2,7,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(21,3,7,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(22,1,8,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(23,2,8,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(24,3,8,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(25,1,9,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(26,2,9,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(27,3,9,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(28,1,10,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(29,2,10,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(30,3,10,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(31,1,11,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(32,2,11,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(33,3,11,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(34,1,12,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(35,2,12,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(36,3,12,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(37,1,13,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(38,2,13,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(39,3,13,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(40,1,14,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(41,2,14,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(42,3,14,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(43,7,3,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(44,8,3,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(45,1,15,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(46,9,15,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(47,5,16,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(48,6,16,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL);
/*!40000 ALTER TABLE `operacion_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso_operacion`
--

DROP TABLE IF EXISTS `permiso_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso_operacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operacionmenu_id` int(10) unsigned NOT NULL,
  `usertype_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permiso_operacion_operacionmenu_id_foreign` (`operacionmenu_id`),
  KEY `permiso_operacion_usertype_id_foreign` (`usertype_id`),
  CONSTRAINT `permiso_operacion_operacionmenu_id_foreign` FOREIGN KEY (`operacionmenu_id`) REFERENCES `operacion_menu` (`id`),
  CONSTRAINT `permiso_operacion_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso_operacion`
--

LOCK TABLES `permiso_operacion` WRITE;
/*!40000 ALTER TABLE `permiso_operacion` DISABLE KEYS */;
INSERT INTO `permiso_operacion` VALUES (292,16,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(293,17,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(294,18,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(295,19,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(296,20,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(297,21,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(298,22,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(299,23,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(300,24,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(301,25,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(302,26,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(303,27,3,'2018-05-18 17:54:43','2018-05-18 17:54:43'),(411,40,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(412,41,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(413,42,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(414,25,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(415,26,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(416,27,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(417,31,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(418,32,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(419,33,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(420,34,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(421,35,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(422,36,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(423,37,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(424,38,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(425,39,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(426,10,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(427,11,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(428,12,2,'2018-05-19 05:05:47','2018-05-19 05:05:47'),(429,16,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(430,17,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(431,25,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(432,27,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(433,38,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(434,7,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(435,8,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(436,9,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(437,43,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(438,44,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(439,10,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(440,11,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(441,12,4,'2018-05-19 05:06:04','2018-05-19 05:06:04'),(442,40,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(443,41,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(444,42,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(445,16,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(446,17,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(447,18,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(448,19,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(449,20,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(450,21,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(451,22,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(452,23,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(453,24,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(454,25,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(455,26,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(456,27,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(457,28,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(458,29,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(459,30,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(460,31,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(461,32,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(462,33,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(463,34,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(464,35,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(465,36,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(466,37,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(467,38,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(468,39,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(469,1,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(470,2,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(471,3,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(472,4,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(473,5,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(474,6,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(475,7,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(476,8,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(477,9,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(478,43,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(479,44,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(480,10,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(481,11,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(482,12,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(483,45,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(484,46,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(485,47,1,'2018-05-23 17:28:44','2018-05-23 17:28:44'),(486,48,1,'2018-05-23 17:28:44','2018-05-23 17:28:44');
/*!40000 ALTER TABLE `permiso_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usertype_id` int(10) unsigned NOT NULL,
  `menuoption_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_usertype_id_foreign` (`usertype_id`),
  KEY `permission_menuoption_id_foreign` (`menuoption_id`),
  CONSTRAINT `permission_menuoption_id_foreign` FOREIGN KEY (`menuoption_id`) REFERENCES `menuoption` (`id`),
  CONSTRAINT `permission_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (33,3,6,'2017-09-09 20:44:05','2017-09-09 20:44:05'),(34,3,7,'2017-09-09 20:44:05','2017-09-09 20:44:05'),(35,3,8,'2017-09-09 20:44:05','2017-09-09 20:44:05'),(36,3,9,'2017-09-09 20:44:05','2017-09-09 20:44:05'),(82,4,6,'2018-05-19 03:12:46','2018-05-19 03:12:46'),(83,4,9,'2018-05-19 03:12:47','2018-05-19 03:12:47'),(84,4,13,'2018-05-19 03:12:47','2018-05-19 03:12:47'),(85,4,1,'2018-05-19 03:12:47','2018-05-19 03:12:47'),(86,4,3,'2018-05-19 03:12:47','2018-05-19 03:12:47'),(87,4,4,'2018-05-19 03:12:47','2018-05-19 03:12:47'),(118,2,14,'2018-05-19 05:05:38','2018-05-19 05:05:38'),(119,2,9,'2018-05-19 05:05:38','2018-05-19 05:05:38'),(120,2,11,'2018-05-19 05:05:38','2018-05-19 05:05:38'),(121,2,12,'2018-05-19 05:05:38','2018-05-19 05:05:38'),(122,2,13,'2018-05-19 05:05:38','2018-05-19 05:05:38'),(123,2,4,'2018-05-19 05:05:38','2018-05-19 05:05:38'),(144,1,14,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(145,1,6,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(146,1,7,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(147,1,8,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(148,1,9,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(149,1,11,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(150,1,12,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(151,1,13,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(152,1,1,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(153,1,2,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(154,1,3,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(155,1,4,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(156,1,15,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(157,1,16,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(158,1,17,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(159,1,18,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(160,1,19,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(161,1,20,'2018-05-23 17:31:38','2018-05-23 17:31:38'),(162,1,21,'2018-05-23 17:31:38','2018-05-23 17:31:38');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `personamaestro_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_personamaestro_id_foreign` (`personamaestro_id`),
  KEY `persona_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `persona_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `persona_personamaestro_id_foreign` FOREIGN KEY (`personamaestro_id`) REFERENCES `personamaestro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1,1,'2017-08-28 05:00:00','2017-08-28 05:00:00',NULL),(2,1,2,'2018-05-17 05:00:00','2018-05-17 05:00:00',NULL),(3,1,3,'2018-05-23 17:30:42','2018-05-23 17:30:42',NULL),(4,1,4,'2018-05-23 17:31:08','2018-05-23 17:31:08',NULL),(5,1,5,'2018-05-23 17:41:07','2018-05-23 17:41:07',NULL),(6,1,6,'2018-05-23 17:41:58','2018-05-23 17:41:58',NULL),(7,1,7,'2018-05-23 18:01:05','2018-05-23 18:01:05',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personamaestro`
--

DROP TABLE IF EXISTS `personamaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personamaestro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razonsocial` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `distrito_id` int(10) unsigned DEFAULT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci,
  `type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtype` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comision` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_distrito_id_foreign` (`distrito_id`),
  CONSTRAINT `person_distrito_id_foreign` FOREIGN KEY (`distrito_id`) REFERENCES `distrito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personamaestro`
--

LOCK TABLES `personamaestro` WRITE;
/*!40000 ALTER TABLE `personamaestro` DISABLE KEYS */;
INSERT INTO `personamaestro` VALUES (1,'Luis Edgardo','Acuña Guevara',NULL,'76665698',NULL,'Calle 7 de Junio #106','074 311203','942952225','luis@gmail.com','1998-05-22',1,NULL,'C',NULL,NULL,'2017-07-23 22:17:30','2017-07-23 22:17:30',NULL),(2,'Luis Edgardo','Acuña Guevara',NULL,'76665698',NULL,'Av. Emiliano Niño #114','071-311203','942952225','warrioshacks@gmail.com','1998-05-22',1,NULL,'E',NULL,NULL,'2018-05-16 05:00:00','2018-05-16 05:00:00',NULL),(3,NULL,NULL,'PROVEEDOR DEMO',NULL,'20987888383',NULL,NULL,'988383883',NULL,NULL,1,NULL,'P','N',NULL,'2018-05-23 17:30:42','2018-05-23 17:30:42',NULL),(4,'JAMES','CARRILLO CONTRERAS',NULL,'72155722',NULL,NULL,NULL,'984384838',NULL,NULL,1,NULL,'T','N',2,'2018-05-23 17:31:08','2018-05-23 18:04:04',NULL),(5,'JUAN','SIESQUEN',NULL,'72155724',NULL,NULL,NULL,'949348388',NULL,NULL,1,NULL,'T','N',NULL,'2018-05-23 17:41:07','2018-05-23 17:41:07',NULL),(6,'JUAN JOSE','ALARCON SANCHEZ',NULL,'87676565',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'C','N',NULL,'2018-05-23 17:41:58','2018-05-23 17:41:58',NULL),(7,'ANTHONY','LOPEZ',NULL,'98438483',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'T','N',1,'2018-05-23 18:01:05','2018-05-23 18:01:05',NULL);
/*!40000 ALTER TABLE `personamaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precioventa` decimal(10,2) NOT NULL,
  `marca_id` int(10) unsigned NOT NULL,
  `unidad_id` int(10) unsigned NOT NULL,
  `categoria_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_marca_id_foreign` (`marca_id`),
  KEY `producto_unidad_id_foreign` (`unidad_id`),
  KEY `producto_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `producto_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `producto_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  CONSTRAINT `producto_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'PRODUCTO 1',159.90,1,1,1,'2018-05-11 14:58:37','2018-05-11 14:58:37',NULL),(2,'PRODUCTO 2',459.90,2,2,2,'2018-05-11 14:58:48','2018-05-11 14:58:48',NULL),(3,'PRODUCTO 3',1699.90,3,3,3,'2018-05-11 14:59:05','2018-05-11 14:59:05',NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provincia_departamento_id_foreign` (`departamento_id`),
  CONSTRAINT `provincia_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Chiclayo',1,'2018-05-14 05:00:00','2018-05-14 05:00:00',NULL);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'CLIENTE','2017-07-23 22:17:32','2017-07-23 22:17:32',NULL),(2,'PROVEEDOR','2017-07-23 22:17:32','2017-07-23 22:17:32',NULL),(3,'EMPLEADO','2017-07-23 22:17:32','2017-07-23 22:17:32',NULL),(4,'USUARIO','2017-07-23 22:17:32','2017-07-23 22:17:32',NULL);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolpersona`
--

DROP TABLE IF EXISTS `rolpersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolpersona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `persona_id` int(10) unsigned NOT NULL,
  `rol_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rolpersona_persona_id_foreign` (`persona_id`),
  KEY `rolpersona_empresa_id_foreign` (`empresa_id`),
  KEY `rolpersona_rol_id_foreign` (`rol_id`),
  CONSTRAINT `rolpersona_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `rolpersona_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  CONSTRAINT `rolpersona_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolpersona`
--

LOCK TABLES `rolpersona` WRITE;
/*!40000 ALTER TABLE `rolpersona` DISABLE KEYS */;
INSERT INTO `rolpersona` VALUES (1,1,1,4,'2017-08-28 05:00:00','2017-08-28 05:00:00',NULL),(2,1,1,3,'2017-08-28 05:00:00','2017-08-28 05:00:00',NULL);
/*!40000 ALTER TABLE `rolpersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `comision1` decimal(10,2) NOT NULL,
  `comision2` decimal(10,2) NOT NULL,
  `comision3` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `sucursal_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'sucursal 1','Av. Luis Gonzales #1420','074-485976',1,'2018-05-15 05:00:00','2018-05-15 16:49:07',NULL),(2,'sucursal 2','Av. Emiliano Niño #114','074-485963',1,'2018-05-17 02:10:52','2018-05-17 02:10:52',NULL);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (1,'UNIDAD 1','2018-05-11 14:57:37','2018-05-11 14:57:37',NULL),(2,'UNIDAD 2','2018-05-11 14:57:42','2018-05-11 14:57:42',NULL),(3,'UNIDAD 3','2018-05-11 14:57:47','2018-05-11 14:57:47',NULL);
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'H',
  `usertype_id` int(10) unsigned NOT NULL,
  `persona_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_unique` (`login`),
  UNIQUE KEY `empresa_id` (`empresa_id`),
  KEY `user_usertype_id_foreign` (`usertype_id`),
  KEY `user_person_id_foreign` (`persona_id`),
  CONSTRAINT `empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `user_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2y$10$d7pz1IkCSCRCR5iF5epwKuNrlQY41ab.qTaA3te5g/LUe.I.D6LVW','H',1,1,1,'cZCcfHHd806hmjYMv0Fv0ltpDQDy1Ke7OvbyJArv6zCTDUhGA2UkDz4qyLhf','2017-07-23 22:17:32','2018-05-18 01:25:24',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'ADMINISTRADOR PRINCIPAL','2017-07-23 22:17:31','2017-07-23 22:17:31',NULL),(2,'ADMINISTRADOR','2017-07-23 22:17:31','2017-07-23 22:17:31',NULL),(3,'SECRETARIA','2017-07-23 22:17:31','2017-07-23 22:17:31',NULL),(4,'OPERARIO','2017-07-23 22:17:31','2017-07-23 22:17:31',NULL);
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-23 13:07:10
