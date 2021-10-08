-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-10-2021 a las 01:28:30
-- Versión del servidor: 8.0.26
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coronaticket3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

DROP TABLE IF EXISTS `artistas`;
CREATE TABLE IF NOT EXISTS `artistas` (
  `art_id` int NOT NULL AUTO_INCREMENT,
  `art_usu` int NOT NULL,
  `art_descripcion` text,
  `art_biografia` text,
  `art_url` text,
  PRIMARY KEY (`art_id`),
  KEY `FK_art_usu` (`art_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`art_id`, `art_usu`, `art_descripcion`, `art_biografia`, `art_url`) VALUES
(1, 5, 'aasdasdasd', 'aasdasdsadasdadasdasdasdasdas', 'www.hola.com'),
(2, 6, 'Cantante de rock', 'Uruguayo, 20 a?os', 'www.juanpa.com'),
(3, 9, 'soy un artistaaaaaaaaaaaaaa', 'tengo 20 años', 'https://www.artista1.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_nombre` (`cat_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_espectaculos`
--

DROP TABLE IF EXISTS `categorias_espectaculos`;
CREATE TABLE IF NOT EXISTS `categorias_espectaculos` (
  `cat_id` int NOT NULL,
  `espec_id` int NOT NULL,
  KEY `cat_id_categoria` (`cat_id`),
  KEY `espec_id_espectaculo` (`espec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `comp_usu` int DEFAULT NULL,
  `comp_fecha` date DEFAULT NULL,
  PRIMARY KEY (`comp_id`),
  KEY `compra_usu_idx` (`comp_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_linea`
--

DROP TABLE IF EXISTS `compra_linea`;
CREATE TABLE IF NOT EXISTS `compra_linea` (
  `comp_lin_id` int NOT NULL AUTO_INCREMENT,
  `comp_lin_comp_id` int DEFAULT NULL,
  `comp_lin_prod` int DEFAULT NULL,
  `comp_lin_tipo` int DEFAULT NULL,
  `comp_lin_precio` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`comp_lin_id`),
  KEY `complin_idx` (`comp_lin_comp_id`),
  KEY `conlintipo_idx` (`comp_lin_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_paquetes`
--

DROP TABLE IF EXISTS `compra_paquetes`;
CREATE TABLE IF NOT EXISTS `compra_paquetes` (
  `compra_id` int NOT NULL AUTO_INCREMENT,
  `compra_paq_id` int NOT NULL,
  `compra_usu_id` int NOT NULL,
  `compra_fecha` date NOT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `compra_paq_id` (`compra_paq_id`),
  KEY `compra_usu_id` (`compra_usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espetaculos`
--

DROP TABLE IF EXISTS `espetaculos`;
CREATE TABLE IF NOT EXISTS `espetaculos` (
  `espec_id` int NOT NULL AUTO_INCREMENT,
  `espec_artista` int DEFAULT NULL,
  `espec_plataforma` int DEFAULT NULL,
  `espec_nombre` varchar(250) DEFAULT NULL,
  `espec_descripcion` text,
  `espec_duracion` double(15,2) DEFAULT NULL,
  `espec_cant_min_espect` int DEFAULT NULL,
  `espec_cant_max_espect` int DEFAULT NULL,
  `espec_url` varchar(2000) DEFAULT NULL,
  `espec_fecha_registro` date DEFAULT NULL,
  `espec_costo` double(15,2) DEFAULT NULL,
  `espec_estado` char(1) NOT NULL,
  `espec_imagen` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`espec_id`),
  UNIQUE KEY `espec_nombre` (`espec_nombre`),
  KEY `espe_art_idx` (`espec_artista`),
  KEY `espec_plat_idx` (`espec_plataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `espetaculos`
--

INSERT INTO `espetaculos` (`espec_id`, `espec_artista`, `espec_plataforma`, `espec_nombre`, `espec_descripcion`, `espec_duracion`, `espec_cant_min_espect`, `espec_cant_max_espect`, `espec_url`, `espec_fecha_registro`, `espec_costo`, `espec_estado`, `espec_imagen`) VALUES
(2, 2, 1, 'Rock de los 90', 'asdasdasd', 90.00, 20, 100, 'www.cualquiercosa.com', '2021-09-20', 200.00, '', ''),
(6, 2, 1, 'asdad', 'asdsad', 225.00, 22, 222, 'sadasd', '2021-09-05', 123.00, '', ''),
(7, 2, 2, 'asdasd', 'asdfafsasf', 14.00, 15, 200, 'https://www.hola.com', '2021-09-07', 1200.00, '', ''),
(8, 3, 1, 'Espectaculo 1', 'asdokashjndlas', 90.00, 90, 120, 'https://www.twitch.tv/espec1', '2021-09-08', 200.00, '', ''),
(9, 3, 1, 'AntelArenaSSS', 'Algo', 23.00, 50, 1000, 'corona.com', '2021-10-04', 55.00, 'a', 'imgur:com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

DROP TABLE IF EXISTS `funcion`;
CREATE TABLE IF NOT EXISTS `funcion` (
  `fun_id` int NOT NULL AUTO_INCREMENT,
  `fun_espec_id` int DEFAULT NULL,
  `fun_nombre` varchar(250) DEFAULT NULL,
  `fun_fecha_registro` date DEFAULT NULL,
  `fun_hora_inicio` time NOT NULL,
  `fun_fecha_inicio` date NOT NULL,
  `fun_imagen` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`fun_id`),
  UNIQUE KEY `fun_nombre` (`fun_nombre`),
  KEY `fun_escp_idx` (`fun_espec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`fun_id`, `fun_espec_id`, `fun_nombre`, `fun_fecha_registro`, `fun_hora_inicio`, `fun_fecha_inicio`, `fun_imagen`) VALUES
(1, 2, 'Buitres', '2021-09-05', '16:30:34', '2021-09-06', NULL),
(2, 2, 'asd', '2021-09-05', '14:14:00', '2021-12-12', NULL),
(3, 2, 'dfsdfsdf', '2021-09-05', '14:14:00', '2021-12-12', NULL),
(4, 2, 'La vela', '2021-09-06', '15:15:00', '2021-10-14', NULL),
(5, 2, 'WOS', '2021-09-06', '16:14:00', '2022-12-08', NULL),
(6, 2, 'NTVG', '2021-09-06', '16:18:00', '2022-04-04', NULL),
(7, 2, 'sdffsdfsdgsdfg', '2021-09-06', '18:29:00', '2022-04-03', NULL),
(8, 2, 'asdad', '2021-09-07', '00:00:00', '2021-01-01', NULL),
(10, 2, 'asdadadadad', '2021-09-07', '00:00:00', '2021-01-01', NULL),
(15, 2, 'Funcion 1', '2021-09-08', '04:08:00', '2021-03-02', NULL),
(16, 8, 'Funcion 1 de espec', '2021-09-08', '02:09:00', '2021-02-02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion_artista`
--

DROP TABLE IF EXISTS `funcion_artista`;
CREATE TABLE IF NOT EXISTS `funcion_artista` (
  `funart_fun_id` int DEFAULT NULL,
  `funart_art_id` int DEFAULT NULL,
  `fun_nombre` varchar(45) DEFAULT NULL,
  `funart_vigente` char(1) DEFAULT NULL,
  KEY `funart_fun_idx` (`funart_fun_id`),
  KEY `funart_art_idx` (`funart_art_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `funcion_artista`
--

INSERT INTO `funcion_artista` (`funart_fun_id`, `funart_art_id`, `fun_nombre`, `funart_vigente`) VALUES
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(2, 2, NULL, NULL),
(7, 2, NULL, NULL),
(15, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
CREATE TABLE IF NOT EXISTS `paquetes` (
  `paq_id` int NOT NULL AUTO_INCREMENT,
  `paq_nombre` varchar(250) NOT NULL,
  `paq_descripcion` text,
  `paq_fecha_inicio` date DEFAULT NULL,
  `paq_fecha_fin` date DEFAULT NULL,
  `paq_descuento` double(15,2) DEFAULT NULL,
  `paq_costo` double DEFAULT NULL,
  `paq_fecha_compra` date DEFAULT NULL,
  `paq_fecha_alta` date DEFAULT NULL,
  `paq_vigente` tinyint(1) NOT NULL,
  `paq_imagen` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`paq_id`),
  UNIQUE KEY `paq_nombre` (`paq_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`paq_id`, `paq_nombre`, `paq_descripcion`, `paq_fecha_inicio`, `paq_fecha_fin`, `paq_descuento`, `paq_costo`, `paq_fecha_compra`, `paq_fecha_alta`, `paq_vigente`, `paq_imagen`) VALUES
(2, 'paquete2', 'asd', '2021-02-02', '2021-03-03', 23.00, NULL, NULL, '2021-09-05', 0, NULL),
(3, 'paquete3', 'asdasdas', '2022-11-01', '2021-07-31', 14.00, NULL, NULL, '2021-09-05', 0, NULL),
(4, 'PaqueteNumero1', 'este es el paquete 1', '2021-02-02', '2022-02-03', 20.00, NULL, NULL, '2021-09-08', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_espetaculos`
--

DROP TABLE IF EXISTS `paquete_espetaculos`;
CREATE TABLE IF NOT EXISTS `paquete_espetaculos` (
  `paqespec_paq_id` int DEFAULT NULL,
  `paqespec_espec_id` int DEFAULT NULL,
  `paqespec_paq_vigente` char(1) DEFAULT NULL,
  KEY `paq_espect_idx` (`paqespec_espec_id`),
  KEY `paq_paq_idx` (`paqespec_paq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `paquete_espetaculos`
--

INSERT INTO `paquete_espetaculos` (`paqespec_paq_id`, `paqespec_espec_id`, `paqespec_paq_vigente`) VALUES
(2, 2, NULL),
(4, 8, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguidores`
--

DROP TABLE IF EXISTS `seguidores`;
CREATE TABLE IF NOT EXISTS `seguidores` (
  `usu_id` int NOT NULL,
  `usu_seguidor` int NOT NULL,
  UNIQUE KEY `usu_id` (`usu_id`,`usu_seguidor`),
  KEY `usu_id_seguidor` (`usu_seguidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `seguidores`
--

INSERT INTO `seguidores` (`usu_id`, `usu_seguidor`) VALUES
(6, 5),
(5, 6),
(9, 6),
(5, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `tp_id` int NOT NULL AUTO_INCREMENT,
  `tp_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`tp_id`, `tp_nombre`) VALUES
(1, 'Plataforma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_nick` varchar(50) DEFAULT NULL,
  `usu_nombre` varchar(250) DEFAULT NULL,
  `usu_apellido` varchar(250) DEFAULT NULL,
  `usu_mail` varchar(250) DEFAULT NULL,
  `usu_nacimiento` date DEFAULT NULL,
  `usu_contrasenia` varchar(255) DEFAULT NULL,
  `usu_imagen` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`usu_id`),
  UNIQUE KEY `usu_nick` (`usu_nick`),
  UNIQUE KEY `usu_mail` (`usu_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_nick`, `usu_nombre`, `usu_apellido`, `usu_mail`, `usu_nacimiento`, `usu_contrasenia`, `usu_imagen`) VALUES
(3, 'ju0wi', 'Pablo', 'Peculio', 'pablopeculio@cras-dev.com', '2001-07-13', 'contraPablo', NULL),
(5, 'Pepe123', 'Pablo', 'Peculiopess', 'pepe@cras-dev.com', '2000-02-12', NULL, NULL),
(6, 'Juanpa', 'Juan Pablo', 'Peculios', 'pablopeculio@pepe.com', '2001-07-13', NULL, NULL),
(7, 'fede', 'Federico', 'Rodriguez', 'fede@gmail.com', '2001-10-11', NULL, NULL),
(8, 'Pedrito', 'Pedro', 'Perez', 'pepe@gmail.com', '2003-12-31', NULL, NULL),
(9, 'artista1', 'Artista', 'Art', 'artista@gmail.com', '2002-10-08', NULL, NULL),
(11, 'feder', 'Federico', 'Rodriguez', 'federzvz@gmail.com', '2021-09-29', '4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2', ''),
(12, 'feder2', 'Federico', 'Rodriguez', 'federzvz2@gmail.com', '2021-10-12', 'add92273c86a1f08eda682b40f1142f7db68ea7cd67cdf1b283f80f451fd78ff', ''),
(13, 'feder2323', 'Federico', 'Rodriguez', 'federzvzasdasd@gmail.com', '2021-09-29', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', ''),
(14, 'root', 'rootname', 'rootlastname', 'root@gmail.com', '2021-09-27', '4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_funcion`
--

DROP TABLE IF EXISTS `usuario_funcion`;
CREATE TABLE IF NOT EXISTS `usuario_funcion` (
  `funcion_id` int NOT NULL,
  `usu_id` int NOT NULL,
  `fechaRegistro` date NOT NULL,
  `registro_id` int NOT NULL AUTO_INCREMENT,
  `canjeado` tinyint(1) NOT NULL,
  `paquete_id` int NOT NULL,
  PRIMARY KEY (`registro_id`),
  KEY `usu_id_usuario` (`usu_id`),
  KEY `fun_id_funcion` (`funcion_id`),
  KEY `paquete_id` (`paquete_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores_tipo`
--

DROP TABLE IF EXISTS `valores_tipo`;
CREATE TABLE IF NOT EXISTS `valores_tipo` (
  `tp_id` int NOT NULL,
  `vp_id` int NOT NULL AUTO_INCREMENT,
  `vp_nombre` varchar(250) DEFAULT NULL,
  `vp_valor_1` text,
  `vp_valor_2` text,
  `vp_vigente` char(1) DEFAULT NULL,
  PRIMARY KEY (`vp_id`),
  KEY `vp_tipo_idx` (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `valores_tipo`
--

INSERT INTO `valores_tipo` (`tp_id`, `vp_id`, `vp_nombre`, `vp_valor_1`, `vp_valor_2`, `vp_vigente`) VALUES
(1, 1, 'Twitch', 'https://www.twitch.tv', 'plataforma de streaming', NULL),
(1, 2, 'YouTube', 'https://www.youtube.com', 'Videos', NULL),
(1, 3, 'Pepito', 'https://www.pepito.com', 'asdasd', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `FK_art_usu` FOREIGN KEY (`art_usu`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `categorias_espectaculos`
--
ALTER TABLE `categorias_espectaculos`
  ADD CONSTRAINT `cat_id_categoria` FOREIGN KEY (`cat_id`) REFERENCES `categorias` (`cat_id`),
  ADD CONSTRAINT `espec_id_espectaculo` FOREIGN KEY (`espec_id`) REFERENCES `espetaculos` (`espec_id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_usu` FOREIGN KEY (`comp_usu`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `compra_linea`
--
ALTER TABLE `compra_linea`
  ADD CONSTRAINT `complin` FOREIGN KEY (`comp_lin_comp_id`) REFERENCES `compra` (`comp_id`),
  ADD CONSTRAINT `conlintipo` FOREIGN KEY (`comp_lin_tipo`) REFERENCES `valores_tipo` (`vp_id`);

--
-- Filtros para la tabla `compra_paquetes`
--
ALTER TABLE `compra_paquetes`
  ADD CONSTRAINT `compra_paquetes_ibfk_1` FOREIGN KEY (`compra_paq_id`) REFERENCES `paquetes` (`paq_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `compra_paquetes_ibfk_2` FOREIGN KEY (`compra_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `espetaculos`
--
ALTER TABLE `espetaculos`
  ADD CONSTRAINT `espe_art` FOREIGN KEY (`espec_artista`) REFERENCES `artistas` (`art_id`),
  ADD CONSTRAINT `espec_plat` FOREIGN KEY (`espec_plataforma`) REFERENCES `valores_tipo` (`vp_id`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `fun_escp` FOREIGN KEY (`fun_espec_id`) REFERENCES `espetaculos` (`espec_id`);

--
-- Filtros para la tabla `funcion_artista`
--
ALTER TABLE `funcion_artista`
  ADD CONSTRAINT `funart_art` FOREIGN KEY (`funart_art_id`) REFERENCES `artistas` (`art_id`),
  ADD CONSTRAINT `funart_fun` FOREIGN KEY (`funart_fun_id`) REFERENCES `funcion` (`fun_id`);

--
-- Filtros para la tabla `paquete_espetaculos`
--
ALTER TABLE `paquete_espetaculos`
  ADD CONSTRAINT `paq_espect` FOREIGN KEY (`paqespec_espec_id`) REFERENCES `espetaculos` (`espec_id`),
  ADD CONSTRAINT `paq_paq` FOREIGN KEY (`paqespec_paq_id`) REFERENCES `paquetes` (`paq_id`);

--
-- Filtros para la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD CONSTRAINT `usu_id_seguidor` FOREIGN KEY (`usu_seguidor`) REFERENCES `usuario` (`usu_id`),
  ADD CONSTRAINT `usu_id_usuarioSeg` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `usuario_funcion`
--
ALTER TABLE `usuario_funcion`
  ADD CONSTRAINT `fun_id_funcion` FOREIGN KEY (`funcion_id`) REFERENCES `funcion` (`fun_id`),
  ADD CONSTRAINT `usu_id_usuario` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`),
  ADD CONSTRAINT `usuario_funcion_ibfk_1` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`paq_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `valores_tipo`
--
ALTER TABLE `valores_tipo`
  ADD CONSTRAINT `vp_tipo` FOREIGN KEY (`tp_id`) REFERENCES `tipo` (`tp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
