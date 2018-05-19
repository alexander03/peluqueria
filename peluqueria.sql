-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2018 a las 17:29:44
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peluqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `binnacle`
--

CREATE TABLE `binnacle` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `recordid` int(10) UNSIGNED NOT NULL,
  `table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `binnacle`
--

INSERT INTO `binnacle` (`id`, `action`, `date`, `ip`, `user_id`, `recordid`, `table`, `detail`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'I', '2018-05-11 14:56:40', 'Lucho', 1, 1, 'categoria', '{\"name\":\"CATEGORIA 1\",\"updated_at\":\"2018-05-11 09:56:40\",\"created_at\":\"2018-05-11 09:56:40\",\"id\":1}', '2018-05-11 14:56:40', '2018-05-11 14:56:40', NULL),
(2, 'I', '2018-05-11 14:56:46', 'Lucho', 1, 2, 'categoria', '{\"name\":\"CATEGORIA 2\",\"updated_at\":\"2018-05-11 09:56:45\",\"created_at\":\"2018-05-11 09:56:45\",\"id\":2}', '2018-05-11 14:56:46', '2018-05-11 14:56:46', NULL),
(3, 'I', '2018-05-11 14:56:52', 'Lucho', 1, 3, 'categoria', '{\"name\":\"CATEGORIA 3\",\"updated_at\":\"2018-05-11 09:56:52\",\"created_at\":\"2018-05-11 09:56:52\",\"id\":3}', '2018-05-11 14:56:52', '2018-05-11 14:56:52', NULL),
(4, 'I', '2018-05-11 14:57:03', 'Lucho', 1, 1, 'marca', '{\"name\":\"MARCA 1\",\"updated_at\":\"2018-05-11 09:57:03\",\"created_at\":\"2018-05-11 09:57:03\",\"id\":1}', '2018-05-11 14:57:03', '2018-05-11 14:57:03', NULL),
(5, 'I', '2018-05-11 14:57:23', 'Lucho', 1, 2, 'marca', '{\"name\":\"MARCA 2\",\"updated_at\":\"2018-05-11 09:57:23\",\"created_at\":\"2018-05-11 09:57:23\",\"id\":2}', '2018-05-11 14:57:23', '2018-05-11 14:57:23', NULL),
(6, 'I', '2018-05-11 14:57:29', 'Lucho', 1, 3, 'marca', '{\"name\":\"MARCA 3\",\"updated_at\":\"2018-05-11 09:57:29\",\"created_at\":\"2018-05-11 09:57:29\",\"id\":3}', '2018-05-11 14:57:29', '2018-05-11 14:57:29', NULL),
(7, 'I', '2018-05-11 14:57:37', 'Lucho', 1, 1, 'unidad', '{\"name\":\"UNIDAD 1\",\"updated_at\":\"2018-05-11 09:57:37\",\"created_at\":\"2018-05-11 09:57:37\",\"id\":1}', '2018-05-11 14:57:37', '2018-05-11 14:57:37', NULL),
(8, 'I', '2018-05-11 14:57:42', 'Lucho', 1, 2, 'unidad', '{\"name\":\"UNIDAD 2\",\"updated_at\":\"2018-05-11 09:57:42\",\"created_at\":\"2018-05-11 09:57:42\",\"id\":2}', '2018-05-11 14:57:42', '2018-05-11 14:57:42', NULL),
(9, 'I', '2018-05-11 14:57:47', 'Lucho', 1, 3, 'unidad', '{\"name\":\"UNIDAD 3\",\"updated_at\":\"2018-05-11 09:57:47\",\"created_at\":\"2018-05-11 09:57:47\",\"id\":3}', '2018-05-11 14:57:47', '2018-05-11 14:57:47', NULL),
(10, 'I', '2018-05-11 14:58:37', 'Lucho', 1, 1, 'producto', '{\"descripcion\":\"PRODUCTO 1\",\"precioventa\":\"159.90\",\"marca_id\":\"1\",\"categoria_id\":\"1\",\"unidad_id\":\"1\",\"updated_at\":\"2018-05-11 09:58:37\",\"created_at\":\"2018-05-11 09:58:37\",\"id\":1}', '2018-05-11 14:58:37', '2018-05-11 14:58:37', NULL),
(11, 'I', '2018-05-11 14:58:48', 'Lucho', 1, 2, 'producto', '{\"descripcion\":\"PRODUCTO 2\",\"precioventa\":\"459.90\",\"marca_id\":\"2\",\"categoria_id\":\"2\",\"unidad_id\":\"2\",\"updated_at\":\"2018-05-11 09:58:48\",\"created_at\":\"2018-05-11 09:58:48\",\"id\":2}', '2018-05-11 14:58:48', '2018-05-11 14:58:48', NULL),
(12, 'I', '2018-05-11 14:59:05', 'Lucho', 1, 3, 'producto', '{\"descripcion\":\"PRODUCTO 3\",\"precioventa\":\"1699.90\",\"marca_id\":\"3\",\"categoria_id\":\"3\",\"unidad_id\":\"3\",\"updated_at\":\"2018-05-11 09:59:05\",\"created_at\":\"2018-05-11 09:59:05\",\"id\":3}', '2018-05-11 14:59:05', '2018-05-11 14:59:05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CATEGORIA 1', '2018-05-11 14:56:40', '2018-05-11 14:56:40', NULL),
(2, 'CATEGORIA 2', '2018-05-11 14:56:45', '2018-05-11 14:56:45', NULL),
(3, 'CATEGORIA 3', '2018-05-11 14:56:52', '2018-05-11 14:56:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Lambayeque', '2018-05-14 05:00:00', '2018-05-14 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id`, `nombre`, `provincia_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Saña', 1, '2018-05-14 05:00:00', '2018-05-14 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(10) UNSIGNED NOT NULL,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacto_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `ruc`, `razon`, `direccion`, `telefono`, `contacto_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '12345678910', 'GARZATEC', '-', '-', 1, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MARCA 1', '2018-05-11 14:57:03', '2018-05-11 14:57:03', NULL),
(2, 'MARCA 2', '2018-05-11 14:57:23', '2018-05-11 14:57:23', NULL),
(3, 'MARCA 3', '2018-05-11 14:57:29', '2018-05-11 14:57:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuoption`
--

CREATE TABLE `menuoption` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-expand',
  `menuoptioncategory_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menuoption`
--

INSERT INTO `menuoption` (`id`, `name`, `link`, `order`, `icon`, `menuoptioncategory_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Categoría de opción de menu', 'categoriaopcionmenu', 1, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(2, 'Opción de menu', 'opcionmenu', 2, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(3, 'Tipos de usuario', 'tipousuario', 3, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(4, 'Usuario', 'usuario', 4, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(5, 'Tipo de cambio', 'changetype', 1, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2017-09-09 20:44:15', '2017-09-09 20:44:15'),
(6, 'Categorias', 'categoria', 2, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2018-05-11 20:05:51', NULL),
(7, 'Marcas', 'marca', 3, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2018-05-11 20:05:56', NULL),
(8, 'Unidades', 'unidad', 4, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2018-05-11 20:06:02', NULL),
(9, 'Productos', 'producto', 5, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2018-05-11 20:06:08', NULL),
(10, 'Tipo trabajador', 'workertype', 1, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(11, 'Clientes', 'customer', 2, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2018-05-11 17:02:38', NULL),
(12, 'Proveedores', 'provider', 3, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(13, 'Trabajadores', 'employee', 4, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(14, 'Sucursal', 'sucursal', 1, 'glyphicon glyphicon-expand', 1, '2018-05-15 15:50:57', '2018-05-15 16:20:54', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuoptioncategory`
--

CREATE TABLE `menuoptioncategory` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-expand',
  `menuoptioncategory_id` int(10) UNSIGNED DEFAULT NULL,
  `position` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menuoptioncategory`
--

INSERT INTO `menuoptioncategory` (`id`, `name`, `order`, `icon`, `menuoptioncategory_id`, `position`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administración', 1, 'fa fa-bank', NULL, 'V', '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(2, 'Personas', 2, 'fa fa-bank', NULL, 'V', '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(3, 'Usuarios', 3, 'fa fa-bank', NULL, 'V', '2017-07-23 22:17:30', '2017-09-09 20:54:51', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_03_22_142422_crear_tabla_departamento', 1),
(2, '2017_03_22_142444_crear_tabla_provincia', 1),
(3, '2017_03_22_142546_crear_tabla_distrito', 1),
(4, '2017_03_22_142709_crear_tabla_workertype', 1),
(5, '2017_03_22_142724_crear_tabla_person', 1),
(6, '2017_03_22_142751_crear_tabla_menuoptioncategory', 1),
(7, '2017_03_22_142804_crear_tabla_menuoption', 1),
(8, '2017_03_22_142828_crear_tabla_usertype', 1),
(9, '2017_03_22_142904_crear_tabla_permission', 1),
(10, '2017_03_22_142921_crear_tabla_user', 1),
(11, '2017_03_22_142939_crear_tabla_binnacle', 1),
(12, '2017_08_24_161501_crear_tabla_empresa', 2),
(13, '2017_08_28_120330_crear_tabla_persona', 3),
(14, '2017_08_28_120756_crear_tabla_rolpersona', 3),
(15, '2018_05_10_115933_crear_tabla_categoria', 4),
(16, '2018_05_11_083449_crear_tabla_marca', 4),
(17, '2018_05_11_084049_crear_tabla_unidad', 4),
(18, '2018_05_11_084238_crear_tabla_producto', 4),
(20, '2018_05_15_103607_crear_tabla_sucursal', 5),
(21, '2018_05_16_211523_crear_tabla_operacion', 6),
(22, '2018_05_16_212332_crear_tabla_operacion_menu', 7),
(24, '2018_05_16_213515_crear_tabla_permiso_operacion', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `operacion`
--

INSERT INTO `operacion` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nuevo', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(2, 'Editar', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(3, 'Eliminar', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(4, 'Extornar', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(5, 'Apertura de caja', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(6, 'Cierre de caja', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(7, 'Permisos', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(8, 'Operaciones', '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion_menu`
--

CREATE TABLE `operacion_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `operacion_id` int(10) UNSIGNED NOT NULL,
  `menuoption_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `operacion_menu`
--

INSERT INTO `operacion_menu` (`id`, `operacion_id`, `menuoption_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(2, 2, 1, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(3, 3, 1, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(4, 1, 2, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(5, 2, 2, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(6, 3, 2, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(7, 1, 3, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(8, 2, 3, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(9, 3, 3, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(10, 1, 4, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(11, 2, 4, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(12, 3, 4, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(13, 1, 5, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(14, 2, 5, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(15, 3, 5, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(16, 1, 6, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(17, 2, 6, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(18, 3, 6, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(19, 1, 7, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(20, 2, 7, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(21, 3, 7, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(22, 1, 8, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(23, 2, 8, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(24, 3, 8, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(25, 1, 9, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(26, 2, 9, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(27, 3, 9, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(28, 1, 10, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(29, 2, 10, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(30, 3, 10, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(31, 1, 11, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(32, 2, 11, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(33, 3, 11, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(34, 1, 12, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(35, 2, 12, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(36, 3, 12, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(37, 1, 13, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(38, 2, 13, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(39, 3, 13, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(40, 1, 14, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(41, 2, 14, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(42, 3, 14, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(43, 7, 3, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL),
(44, 8, 3, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_operacion`
--

CREATE TABLE `permiso_operacion` (
  `id` int(10) UNSIGNED NOT NULL,
  `operacionmenu_id` int(10) UNSIGNED NOT NULL,
  `usertype_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permiso_operacion`
--

INSERT INTO `permiso_operacion` (`id`, `operacionmenu_id`, `usertype_id`, `created_at`, `updated_at`) VALUES
(220, 40, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(221, 41, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(222, 42, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(223, 16, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(224, 17, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(225, 18, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(226, 19, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(227, 20, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(228, 21, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(229, 22, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(230, 23, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(231, 24, 1, '2018-05-18 17:54:33', '2018-05-18 17:54:33'),
(232, 25, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(233, 26, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(234, 27, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(235, 28, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(236, 29, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(237, 30, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(238, 31, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(239, 32, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(240, 33, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(241, 34, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(242, 35, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(243, 36, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(244, 37, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(245, 38, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(246, 39, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(247, 1, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(248, 2, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(249, 3, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(250, 4, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(251, 5, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(252, 6, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(253, 7, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(254, 8, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(255, 9, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(256, 43, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(257, 44, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(258, 10, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(259, 11, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(260, 12, 1, '2018-05-18 17:54:34', '2018-05-18 17:54:34'),
(292, 16, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(293, 17, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(294, 18, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(295, 19, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(296, 20, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(297, 21, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(298, 22, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(299, 23, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(300, 24, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(301, 25, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(302, 26, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(303, 27, 3, '2018-05-18 17:54:43', '2018-05-18 17:54:43'),
(411, 40, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(412, 41, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(413, 42, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(414, 25, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(415, 26, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(416, 27, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(417, 31, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(418, 32, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(419, 33, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(420, 34, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(421, 35, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(422, 36, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(423, 37, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(424, 38, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(425, 39, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(426, 10, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(427, 11, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(428, 12, 2, '2018-05-19 05:05:47', '2018-05-19 05:05:47'),
(429, 16, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(430, 17, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(431, 25, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(432, 27, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(433, 38, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(434, 7, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(435, 8, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(436, 9, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(437, 43, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(438, 44, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(439, 10, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(440, 11, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04'),
(441, 12, 4, '2018-05-19 05:06:04', '2018-05-19 05:06:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

CREATE TABLE `permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `usertype_id` int(10) UNSIGNED NOT NULL,
  `menuoption_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission`
--

INSERT INTO `permission` (`id`, `usertype_id`, `menuoption_id`, `created_at`, `updated_at`) VALUES
(33, 3, 6, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(34, 3, 7, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(35, 3, 8, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(36, 3, 9, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(37, 1, 14, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(38, 1, 6, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(39, 1, 7, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(40, 1, 8, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(41, 1, 9, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(42, 1, 10, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(43, 1, 11, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(44, 1, 12, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(45, 1, 13, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(46, 1, 1, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(47, 1, 2, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(48, 1, 3, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(49, 1, 4, '2018-05-15 15:51:44', '2018-05-15 15:51:44'),
(82, 4, 6, '2018-05-19 03:12:46', '2018-05-19 03:12:46'),
(83, 4, 9, '2018-05-19 03:12:47', '2018-05-19 03:12:47'),
(84, 4, 13, '2018-05-19 03:12:47', '2018-05-19 03:12:47'),
(85, 4, 1, '2018-05-19 03:12:47', '2018-05-19 03:12:47'),
(86, 4, 3, '2018-05-19 03:12:47', '2018-05-19 03:12:47'),
(87, 4, 4, '2018-05-19 03:12:47', '2018-05-19 03:12:47'),
(118, 2, 14, '2018-05-19 05:05:38', '2018-05-19 05:05:38'),
(119, 2, 9, '2018-05-19 05:05:38', '2018-05-19 05:05:38'),
(120, 2, 11, '2018-05-19 05:05:38', '2018-05-19 05:05:38'),
(121, 2, 12, '2018-05-19 05:05:38', '2018-05-19 05:05:38'),
(122, 2, 13, '2018-05-19 05:05:38', '2018-05-19 05:05:38'),
(123, 2, 4, '2018-05-19 05:05:38', '2018-05-19 05:05:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `personamaestro_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `empresa_id`, `personamaestro_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL),
(2, 1, 2, '2018-05-17 05:00:00', '2018-05-17 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personamaestro`
--

CREATE TABLE `personamaestro` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `distrito_id` int(10) UNSIGNED DEFAULT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci,
  `type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtype` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personamaestro`
--

INSERT INTO `personamaestro` (`id`, `nombres`, `apellidos`, `razonsocial`, `dni`, `ruc`, `direccion`, `telefono`, `celular`, `email`, `fechanacimiento`, `distrito_id`, `observation`, `type`, `secondtype`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Luis Edgardo', 'Acuña Guevara', NULL, '76665698', NULL, 'Calle 7 de Junio #106', '074 311203', '942952225', 'luis@gmail.com', '1998-05-22', 1, NULL, 'C', NULL, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(2, 'Luis Edgardo', 'Acuña Guevara', NULL, '76665698', NULL, 'Av. Emiliano Niño #114', '071-311203', '942952225', 'warrioshacks@gmail.com', '1998-05-22', 1, NULL, 'E', NULL, '2018-05-16 05:00:00', '2018-05-16 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precioventa` decimal(10,2) NOT NULL,
  `marca_id` int(10) UNSIGNED NOT NULL,
  `unidad_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `descripcion`, `precioventa`, `marca_id`, `unidad_id`, `categoria_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PRODUCTO 1', '159.90', 1, 1, 1, '2018-05-11 14:58:37', '2018-05-11 14:58:37', NULL),
(2, 'PRODUCTO 2', '459.90', 2, 2, 2, '2018-05-11 14:58:48', '2018-05-11 14:58:48', NULL),
(3, 'PRODUCTO 3', '1699.90', 3, 3, 3, '2018-05-11 14:59:05', '2018-05-11 14:59:05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`, `departamento_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Chiclayo', 1, '2018-05-14 05:00:00', '2018-05-14 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CLIENTE', '2017-07-23 22:17:32', '2017-07-23 22:17:32', NULL),
(2, 'PROVEEDOR', '2017-07-23 22:17:32', '2017-07-23 22:17:32', NULL),
(3, 'EMPLEADO', '2017-07-23 22:17:32', '2017-07-23 22:17:32', NULL),
(4, 'USUARIO', '2017-07-23 22:17:32', '2017-07-23 22:17:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolpersona`
--

CREATE TABLE `rolpersona` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `persona_id` int(10) UNSIGNED NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rolpersona`
--

INSERT INTO `rolpersona` (`id`, `empresa_id`, `persona_id`, `rol_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 4, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL),
(2, 1, 1, 3, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `nombre`, `direccion`, `telefono`, `empresa_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sucursal 1', 'Av. Luis Gonzales #1420', '074-485976', 1, '2018-05-15 05:00:00', '2018-05-15 16:49:07', NULL),
(2, 'sucursal 2', 'Av. Emiliano Niño #114', '074-485963', 1, '2018-05-17 02:10:52', '2018-05-17 02:10:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UNIDAD 1', '2018-05-11 14:57:37', '2018-05-11 14:57:37', NULL),
(2, 'UNIDAD 2', '2018-05-11 14:57:42', '2018-05-11 14:57:42', NULL),
(3, 'UNIDAD 3', '2018-05-11 14:57:47', '2018-05-11 14:57:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'H',
  `usertype_id` int(10) UNSIGNED NOT NULL,
  `persona_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `state`, `usertype_id`, `persona_id`, `empresa_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '$2y$10$d7pz1IkCSCRCR5iF5epwKuNrlQY41ab.qTaA3te5g/LUe.I.D6LVW', 'H', 4, 1, 1, 'l2oIffy4IxWQcxHK3hVvOdaiLlHeRuNW9rhTjD9ZqWKCdWzRbuGVPPQIqwAS', '2017-07-23 22:17:32', '2018-05-18 01:25:24', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usertype`
--

CREATE TABLE `usertype` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usertype`
--

INSERT INTO `usertype` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ADMINISTRADOR PRINCIPAL', '2017-07-23 22:17:31', '2017-07-23 22:17:31', NULL),
(2, 'ADMINISTRADOR', '2017-07-23 22:17:31', '2017-07-23 22:17:31', NULL),
(3, 'SECRETARIA', '2017-07-23 22:17:31', '2017-07-23 22:17:31', NULL),
(4, 'OPERARIO', '2017-07-23 22:17:31', '2017-07-23 22:17:31', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binnacle_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_provincia_id_foreign` (`provincia_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empresa_ruc_unique` (`ruc`),
  ADD KEY `empresa_contacto_id_foreign` (`contacto_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menuoption`
--
ALTER TABLE `menuoption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menuoption_menuoptioncategory_id_foreign` (`menuoptioncategory_id`);

--
-- Indices de la tabla `menuoptioncategory`
--
ALTER TABLE `menuoptioncategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menuoptioncategory_menuoptioncategory_id_foreign` (`menuoptioncategory_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operacion_menu`
--
ALTER TABLE `operacion_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operacion_menu_operacion_id_foreign` (`operacion_id`),
  ADD KEY `operacion_menu_menuoption_id_foreign` (`menuoption_id`);

--
-- Indices de la tabla `permiso_operacion`
--
ALTER TABLE `permiso_operacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permiso_operacion_operacionmenu_id_foreign` (`operacionmenu_id`),
  ADD KEY `permiso_operacion_usertype_id_foreign` (`usertype_id`);

--
-- Indices de la tabla `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_usertype_id_foreign` (`usertype_id`),
  ADD KEY `permission_menuoption_id_foreign` (`menuoption_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_personamaestro_id_foreign` (`personamaestro_id`),
  ADD KEY `persona_empresa_id_foreign` (`empresa_id`);

--
-- Indices de la tabla `personamaestro`
--
ALTER TABLE `personamaestro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_distrito_id_foreign` (`distrito_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_marca_id_foreign` (`marca_id`),
  ADD KEY `producto_unidad_id_foreign` (`unidad_id`),
  ADD KEY `producto_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincia_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rolpersona`
--
ALTER TABLE `rolpersona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rolpersona_persona_id_foreign` (`persona_id`),
  ADD KEY `rolpersona_empresa_id_foreign` (`empresa_id`),
  ADD KEY `rolpersona_rol_id_foreign` (`rol_id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal_empresa_id_foreign` (`empresa_id`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_login_unique` (`login`),
  ADD UNIQUE KEY `empresa_id` (`empresa_id`),
  ADD KEY `user_usertype_id_foreign` (`usertype_id`),
  ADD KEY `user_person_id_foreign` (`persona_id`);

--
-- Indices de la tabla `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `menuoption`
--
ALTER TABLE `menuoption`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `menuoptioncategory`
--
ALTER TABLE `menuoptioncategory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `operacion_menu`
--
ALTER TABLE `operacion_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `permiso_operacion`
--
ALTER TABLE `permiso_operacion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;
--
-- AUTO_INCREMENT de la tabla `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `personamaestro`
--
ALTER TABLE `personamaestro`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `rolpersona`
--
ALTER TABLE `rolpersona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `binnacle`
--
ALTER TABLE `binnacle`
  ADD CONSTRAINT `binnacle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `distrito_provincia_id_foreign` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_contacto_id_foreign` FOREIGN KEY (`contacto_id`) REFERENCES `personamaestro` (`id`);

--
-- Filtros para la tabla `menuoption`
--
ALTER TABLE `menuoption`
  ADD CONSTRAINT `menuoption_menuoptioncategory_id_foreign` FOREIGN KEY (`menuoptioncategory_id`) REFERENCES `menuoptioncategory` (`id`);

--
-- Filtros para la tabla `menuoptioncategory`
--
ALTER TABLE `menuoptioncategory`
  ADD CONSTRAINT `menuoptioncategory_menuoptioncategory_id_foreign` FOREIGN KEY (`menuoptioncategory_id`) REFERENCES `menuoptioncategory` (`id`);

--
-- Filtros para la tabla `operacion_menu`
--
ALTER TABLE `operacion_menu`
  ADD CONSTRAINT `operacion_menu_menuoption_id_foreign` FOREIGN KEY (`menuoption_id`) REFERENCES `menuoption` (`id`),
  ADD CONSTRAINT `operacion_menu_operacion_id_foreign` FOREIGN KEY (`operacion_id`) REFERENCES `operacion` (`id`);

--
-- Filtros para la tabla `permiso_operacion`
--
ALTER TABLE `permiso_operacion`
  ADD CONSTRAINT `permiso_operacion_operacionmenu_id_foreign` FOREIGN KEY (`operacionmenu_id`) REFERENCES `operacion_menu` (`id`),
  ADD CONSTRAINT `permiso_operacion_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`);

--
-- Filtros para la tabla `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_menuoption_id_foreign` FOREIGN KEY (`menuoption_id`) REFERENCES `menuoption` (`id`),
  ADD CONSTRAINT `permission_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `persona_personamaestro_id_foreign` FOREIGN KEY (`personamaestro_id`) REFERENCES `personamaestro` (`id`);

--
-- Filtros para la tabla `personamaestro`
--
ALTER TABLE `personamaestro`
  ADD CONSTRAINT `person_distrito_id_foreign` FOREIGN KEY (`distrito_id`) REFERENCES `distrito` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `producto_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `producto_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `rolpersona`
--
ALTER TABLE `rolpersona`
  ADD CONSTRAINT `rolpersona_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `rolpersona_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `rolpersona_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `user_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
