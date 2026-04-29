-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-04-2026 a las 18:32:14
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `abv_library`
--
CREATE DATABASE IF NOT EXISTS `abv_library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `abv_library`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `correo_electronico` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_de_registro` date DEFAULT (curdate()),
  PRIMARY KEY (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`correo_electronico`, `fecha_de_registro`) VALUES
('abel.pg@escom.mx', '2026-03-05'),
('cliente2@gmail.com', '2026-04-21'),
('cliente7_new@gmail.com', '2026-04-21'),
('juan.perez@gmail.com', '2026-04-01'),
('vanya.cc@escom.mx', '2026-03-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `correo_electronico` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Auxiliar',
  PRIMARY KEY (`correo_electronico`)
) ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`correo_electronico`, `rol`) VALUES
('admin.biblio@ipn.mx', 'Administrador'),
('dueno1@gmail.com', 'Dueno'),
('maria.lopez@outlook.com', 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int NOT NULL,
  `precio_total` float NOT NULL,
  `cantidad_de_libros` int NOT NULL,
  `fecha` date DEFAULT (curdate()),
  `id_venta` int DEFAULT NULL,
  `id_prestamo` int DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_venta` (`id_venta`),
  KEY `id_prestamo` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `precio_total`, `cantidad_de_libros`, `fecha`, `id_venta`, `id_prestamo`) VALUES
(2001, 850.5, 2, '2026-04-14', 9001, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_incluye_lib`
--

DROP TABLE IF EXISTS `factura_incluye_lib`;
CREATE TABLE IF NOT EXISTS `factura_incluye_lib` (
  `id_factura` int NOT NULL,
  `isbn` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_factura`,`isbn`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

DROP TABLE IF EXISTS `libro`;
CREATE TABLE IF NOT EXISTS `libro` (
  `isbn` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editorial` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anio_publicacion` date DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`isbn`, `titulo`, `autor`, `editorial`, `version`, `anio_publicacion`) VALUES
('978-013-110163-0', 'The C Programming Language', 'Kernighan & Ritchie', 'Prentice Hall', '2nd Edition', '1988-04-01'),
('978-026-203384-8', 'Introduction to Algorithms', 'Cormen', 'MIT Press', '3rd Edition', '2009-07-31'),
('978-149-191039-9', 'Learning SQL', 'Alan Beaulieu', 'O Reilly', '2nd Edition', '2016-03-20'),
('978-3-16-148410-0', '', '', NULL, NULL, NULL),
('978-607-15-1212-3', 'Fundamentos de Bases de Datos', 'Silberschatz', 'McGraw-Hill', '6ta Edición', '2019-01-01'),
('978-844-154-153-5', 'Clean Code', 'Robert C. Martin', 'Anaya Multimedia', '1ra Edición', '2012-05-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lib_pres`
--

DROP TABLE IF EXISTS `lib_pres`;
CREATE TABLE IF NOT EXISTS `lib_pres` (
  `id_prestamo` int NOT NULL,
  `isbn` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int DEFAULT '1',
  PRIMARY KEY (`id_prestamo`,`isbn`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lib_pres`
--

INSERT INTO `lib_pres` (`id_prestamo`, `isbn`, `cantidad`) VALUES
(501, '978-607-15-1212-3', 1),
(502, '978-013-110163-0', 1),
(502, '978-844-154-153-5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lib_venta`
--

DROP TABLE IF EXISTS `lib_venta`;
CREATE TABLE IF NOT EXISTS `lib_venta` (
  `id_venta` int NOT NULL,
  `isbn` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int DEFAULT '1',
  PRIMARY KEY (`id_venta`,`isbn`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lib_venta`
--

INSERT INTO `lib_venta` (`id_venta`, `isbn`, `cantidad`) VALUES
(1, '978-013-110163-0', 1),
(9001, '978-149-191039-9', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `correo_electronico` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ap_paterno` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ap_materno` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_exterior` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_interior` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'CDMX',
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Ciudad de México',
  PRIMARY KEY (`correo_electronico`),
  UNIQUE KEY `telefono` (`telefono`)
) ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`correo_electronico`, `nombre`, `ap_paterno`, `ap_materno`, `fecha_de_nacimiento`, `telefono`, `calle`, `num_exterior`, `num_interior`, `codigo_postal`, `ciudad`, `estado`) VALUES
('a@gmail.com', '', '', NULL, '0000-00-00', '123', NULL, NULL, NULL, NULL, 'CDMX', 'Ciudad de México'),
('abel.pg@escom.mx', 'Abel', 'Pineda', 'Godinez', '2006-04-18', '5587654321', 'Unidad Profesional Adolfo López Mateos', '10', NULL, '07738', 'Gustavo A. Madero', 'CDMX'),
('admin.biblio@ipn.mx', 'Edward', 'Cullen', 'Hernandez', '1970-02-21', '5511223344', 'Wilfrido Massieu', '300', NULL, '07738', 'Gustavo A. Madero', 'CDMX'),
('cliente2@gmail.com', 'Ana', 'Lopez', NULL, '2000-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cliente7_new@gmail.com', 'Luis', 'Perez', NULL, '2000-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dueno1@gmail.com', 'Carlos', 'Gomez', NULL, '1990-01-01', NULL, NULL, NULL, NULL, NULL, 'CDMX', 'Ciudad de México'),
('juan.perez@gmail.com', 'Juan', 'Pérez', 'García', '1990-01-01', '5544332211', 'Joyas', '123', NULL, '01000', 'Álvaro Obregón', 'CDMX'),
('maria.lopez@outlook.com', 'María', 'López', 'Sánchez', '1985-08-25', '5566778899', 'Reforma', '500', NULL, '06600', 'Cuauhtémoc', 'CDMX'),
('test@gmail.com', '', '', NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, 'CDMX', 'Ciudad de México'),
('vanya.cc@escom.mx', 'Vanya', 'Castillo', 'Castillo', '2006-09-06', '5512345678', 'Av. Juan de Dios Bátiz', 'S/N', NULL, '07738', 'Gustavo A. Madero', 'CDMX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE IF NOT EXISTS `prestamo` (
  `id_prestamo` int NOT NULL,
  `multa` int DEFAULT '0',
  `dia_de_inicio` date NOT NULL DEFAULT (curdate()),
  `dia_de_vencimiento` date NOT NULL,
  `dia_de_entrega` date DEFAULT NULL,
  `cantidad_de_libros` int DEFAULT '1',
  `correo_cliente` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo_empleado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `correo_cliente` (`correo_cliente`),
  KEY `correo_empleado` (`correo_empleado`)
) ;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `multa`, `dia_de_inicio`, `dia_de_vencimiento`, `dia_de_entrega`, `cantidad_de_libros`, `correo_cliente`, `correo_empleado`) VALUES
(1, 0, '2026-04-21', '2026-05-10', NULL, 1, 'cliente2@gmail.com', NULL),
(501, 0, '2026-04-10', '2026-04-17', NULL, 1, 'vanya.cc@escom.mx', 'maria.lopez@outlook.com'),
(502, 50, '2026-03-20', '2026-03-27', '2026-03-30', 2, 'abel.pg@escom.mx', 'maria.lopez@outlook.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`) VALUES
(101, 'Librería Gandhi'),
(102, 'Editorial McGraw-Hill México'),
(103, 'Amazon Books Distribution');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prov_suministra_lib`
--

DROP TABLE IF EXISTS `prov_suministra_lib`;
CREATE TABLE IF NOT EXISTS `prov_suministra_lib` (
  `id_proveedor` int NOT NULL,
  `isbn` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_proveedor`,`isbn`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prov_suministra_lib`
--

INSERT INTO `prov_suministra_lib` (`id_proveedor`, `isbn`) VALUES
(103, '978-013-110163-0'),
(101, '978-607-15-1212-3'),
(102, '978-607-15-1212-3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int NOT NULL,
  `fecha` date DEFAULT (curdate()),
  `hora` time DEFAULT (curtime()),
  `total_pagado` float DEFAULT '0',
  `metodo_de_pago` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Efectivo',
  `correo_electronico` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `correo_electronico` (`correo_electronico`)
) ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `hora`, `total_pagado`, `metodo_de_pago`, `correo_electronico`) VALUES
(1, '2026-04-21', '14:02:53', 0, 'Efectivo', NULL),
(9001, '2026-04-14', '10:30:00', 850.5, 'Tarjeta', 'admin.biblio@ipn.mx');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`correo_electronico`) REFERENCES `persona` (`correo_electronico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`correo_electronico`) REFERENCES `persona` (`correo_electronico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura_incluye_lib`
--
ALTER TABLE `factura_incluye_lib`
  ADD CONSTRAINT `factura_incluye_lib_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `factura_incluye_lib_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);

--
-- Filtros para la tabla `lib_pres`
--
ALTER TABLE `lib_pres`
  ADD CONSTRAINT `lib_pres_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`),
  ADD CONSTRAINT `lib_pres_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);

--
-- Filtros para la tabla `lib_venta`
--
ALTER TABLE `lib_venta`
  ADD CONSTRAINT `lib_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `lib_venta_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`correo_cliente`) REFERENCES `cliente` (`correo_electronico`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`correo_empleado`) REFERENCES `empleado` (`correo_electronico`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `prov_suministra_lib`
--
ALTER TABLE `prov_suministra_lib`
  ADD CONSTRAINT `prov_suministra_lib_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `prov_suministra_lib_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`correo_electronico`) REFERENCES `empleado` (`correo_electronico`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
