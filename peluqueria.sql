-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2018 a las 03:46:58
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `peluqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `binnacle`
--

CREATE TABLE IF NOT EXISTS `binnacle` (
  `id` int(10) unsigned NOT NULL,
  `action` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `recordid` int(10) unsigned NOT NULL,
  `table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE IF NOT EXISTS `distrito` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(10) unsigned NOT NULL,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacto_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `ruc`, `razon`, `direccion`, `telefono`, `contacto_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '12345678910', 'GARZATEC', '-', '-', 1, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuoption`
--

CREATE TABLE IF NOT EXISTS `menuoption` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-expand',
  `menuoptioncategory_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menuoption`
--

INSERT INTO `menuoption` (`id`, `name`, `link`, `order`, `icon`, `menuoptioncategory_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Categoría de opción de menu', 'categoriaopcionmenu', 1, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(2, 'Opción de menu', 'opcionmenu', 2, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(3, 'Tipos de usuario', 'tipousuario', 3, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(4, 'Usuario', 'usuario', 4, 'glyphicon glyphicon-expand', 3, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(5, 'Tipo de cambio', 'changetype', 1, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2017-09-09 20:44:15', '2017-09-09 20:44:15'),
(6, 'Categorias', 'category', 2, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2017-09-09 19:45:55', NULL),
(7, 'Marcas', 'mark', 3, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2017-09-09 19:46:06', NULL),
(8, 'Unidades', 'unit', 4, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(9, 'Productos', 'product', 5, 'glyphicon glyphicon-expand', 1, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(10, 'Tipo trabajador', 'workertype', 1, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(11, 'Clientes', 'customer', 2, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(12, 'Proveedores', 'provider', 3, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL),
(13, 'Trabajadores', 'employee', 4, 'glyphicon glyphicon-expand', 2, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuoptioncategory`
--

CREATE TABLE IF NOT EXISTS `menuoptioncategory` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'glyphicon glyphicon-expand',
  `menuoptioncategory_id` int(10) unsigned DEFAULT NULL,
  `position` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, '2017_08_28_120756_crear_tabla_rolpersona', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(10) unsigned NOT NULL,
  `usertype_id` int(10) unsigned NOT NULL,
  `menuoption_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission`
--

INSERT INTO `permission` (`id`, `usertype_id`, `menuoption_id`, `created_at`, `updated_at`) VALUES
(14, 2, 11, '2017-07-23 22:17:31', '2017-07-23 22:17:31'),
(15, 2, 4, '2017-07-23 22:17:31', '2017-07-23 22:17:31'),
(21, 1, 6, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(22, 1, 7, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(23, 1, 8, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(24, 1, 9, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(25, 1, 10, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(26, 1, 11, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(27, 1, 12, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(28, 1, 13, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(29, 1, 1, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(30, 1, 2, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(31, 1, 3, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(32, 1, 4, '2017-09-09 20:40:44', '2017-09-09 20:40:44'),
(33, 3, 6, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(34, 3, 7, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(35, 3, 8, '2017-09-09 20:44:05', '2017-09-09 20:44:05'),
(36, 3, 9, '2017-09-09 20:44:05', '2017-09-09 20:44:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `personamaestro_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `empresa_id`, `personamaestro_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personamaestro`
--

CREATE TABLE IF NOT EXISTS `personamaestro` (
  `id` int(10) unsigned NOT NULL,
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personamaestro`
--

INSERT INTO `personamaestro` (`id`, `nombres`, `apellidos`, `razonsocial`, `dni`, `ruc`, `direccion`, `telefono`, `celular`, `email`, `fechanacimiento`, `distrito_id`, `observation`, `type`, `secondtype`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Principal', 'Administrador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-23 22:17:30', '2017-07-23 22:17:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `rolpersona` (
  `id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `persona_id` int(10) unsigned NOT NULL,
  `rol_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rolpersona`
--

INSERT INTO `rolpersona` (`id`, `empresa_id`, `persona_id`, `rol_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 4, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL),
(2, 1, 1, 3, '2017-08-28 05:00:00', '2017-08-28 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'H',
  `usertype_id` int(10) unsigned NOT NULL,
  `persona_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `state`, `usertype_id`, `persona_id`, `empresa_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '$2y$10$Lnq4K5KFkhR1uoQjtxbKTefiePia77Zu59YVYBMbdwoU1Ks7IsixW', 'H', 1, 1, 1, 'eFZEwXrokFVUiif6RONaiQagoSXlHnYiMETAIf2UIkwkPKppseziSl0qvNYz', '2017-07-23 22:17:32', '2017-07-23 22:17:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD PRIMARY KEY (`id`), ADD KEY `binnacle_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id`), ADD KEY `distrito_provincia_id_foreign` (`provincia_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `empresa_ruc_unique` (`ruc`), ADD KEY `empresa_contacto_id_foreign` (`contacto_id`);

--
-- Indices de la tabla `menuoption`
--
ALTER TABLE `menuoption`
  ADD PRIMARY KEY (`id`), ADD KEY `menuoption_menuoptioncategory_id_foreign` (`menuoptioncategory_id`);

--
-- Indices de la tabla `menuoptioncategory`
--
ALTER TABLE `menuoptioncategory`
  ADD PRIMARY KEY (`id`), ADD KEY `menuoptioncategory_menuoptioncategory_id_foreign` (`menuoptioncategory_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`), ADD KEY `permission_usertype_id_foreign` (`usertype_id`), ADD KEY `permission_menuoption_id_foreign` (`menuoption_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`), ADD KEY `persona_personamaestro_id_foreign` (`personamaestro_id`), ADD KEY `persona_empresa_id_foreign` (`empresa_id`);

--
-- Indices de la tabla `personamaestro`
--
ALTER TABLE `personamaestro`
  ADD PRIMARY KEY (`id`), ADD KEY `person_distrito_id_foreign` (`distrito_id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`), ADD KEY `provincia_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rolpersona`
--
ALTER TABLE `rolpersona`
  ADD PRIMARY KEY (`id`), ADD KEY `rolpersona_persona_id_foreign` (`persona_id`), ADD KEY `rolpersona_empresa_id_foreign` (`empresa_id`), ADD KEY `rolpersona_rol_id_foreign` (`rol_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_login_unique` (`login`), ADD UNIQUE KEY `empresa_id` (`empresa_id`), ADD KEY `user_usertype_id_foreign` (`usertype_id`), ADD KEY `user_person_id_foreign` (`persona_id`);

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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `menuoption`
--
ALTER TABLE `menuoption`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `menuoptioncategory`
--
ALTER TABLE `menuoptioncategory`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `personamaestro`
--
ALTER TABLE `personamaestro`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `rolpersona`
--
ALTER TABLE `rolpersona`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
ADD CONSTRAINT `user_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
