-- --------------------------------------------------------
-- Host:                         10.0.65.30
-- Versión del servidor:         5.6.35 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para RedSocial
CREATE DATABASE IF NOT EXISTS `RedSocial` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `RedSocial`;


-- Volcando estructura para tabla RedSocial.Amigos
CREATE TABLE IF NOT EXISTS `Amigos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seguido` int(11) DEFAULT NULL,
  `seguidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla RedSocial.Amigos: ~4 rows (aproximadamente)
DELETE FROM `Amigos`;
/*!40000 ALTER TABLE `Amigos` DISABLE KEYS */;
INSERT INTO `Amigos` (`id`, `seguido`, `seguidor`) VALUES
	(1, 2, NULL);
INSERT INTO `Amigos` (`id`, `seguido`, `seguidor`) VALUES
	(3, 2, 6);
INSERT INTO `Amigos` (`id`, `seguido`, `seguidor`) VALUES
	(4, 3, 6);
INSERT INTO `Amigos` (`id`, `seguido`, `seguidor`) VALUES
	(5, 5, 6);
/*!40000 ALTER TABLE `Amigos` ENABLE KEYS */;


-- Volcando estructura para tabla RedSocial.Publicaciones
CREATE TABLE IF NOT EXISTS `Publicaciones` (
  `IDPubli` bigint(20) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Contenido` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FHCreado` datetime DEFAULT NULL,
  `IDUser` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IDPubli`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla RedSocial.Publicaciones: ~10 rows (aproximadamente)
DELETE FROM `Publicaciones`;
/*!40000 ALTER TABLE `Publicaciones` DISABLE KEYS */;
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(1, 'titulo', 'Hola, soy HOMERO', '', '2017-05-17 11:53:00', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(2, 'a', 'a', 'C:fakepathSin título3.png', '2017-05-17 15:38:26', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(3, 'qwew', '1234', 'C:fakepathSin título3.png', '2017-05-17 15:44:06', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(4, 'fuygfvbnm,', 'WHAT IS YOUR MIND¿?', 'C:fakepathSin título3.png', '2017-05-17 15:46:27', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(5, 'wq', 'wq', 'C:fakepathdrupal.pdf', '2017-05-17 15:51:07', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(6, 'aA', 'a', 'C:fakepathdrupal.pdf', '2017-05-17 15:57:40', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(7, 'qw', 'wq', 'C:fakepathSin título3.png', '2017-05-17 16:29:01', '3');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(8, 'seagrams-tonica', '1234567891011', '', '2017-05-17 17:30:29', '4');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(9, 'No bajo que tengo que estudiar', ':(', '', '2017-05-20 21:40:32', '5');
INSERT INTO `Publicaciones` (`IDPubli`, `Titulo`, `Contenido`, `img`, `FHCreado`, `IDUser`) VALUES
	(10, 'Comprando anillo :)', ':)', '', '2017-05-20 23:56:48', '6');
/*!40000 ALTER TABLE `Publicaciones` ENABLE KEYS */;


-- Volcando estructura para tabla RedSocial.Usuarios
CREATE TABLE IF NOT EXISTS `Usuarios` (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de usuario',
  `Apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'Apellidos de usuario',
  `Pais` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Pais de procedencia del usuario',
  `Email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FHNacimiento` date DEFAULT NULL,
  `Descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla RedSocial.Usuarios: ~5 rows (aproximadamente)
DELETE FROM `Usuarios`;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` (`ID`, `Nombre`, `Apellidos`, `Pais`, `Email`, `Password`, `FHNacimiento`, `Descripcion`) VALUES
	(2, 'hugo perico', 'Perexz', 'España', 'huugoo95@gmail.com', '', NULL, 'Chico listo');
INSERT INTO `Usuarios` (`ID`, `Nombre`, `Apellidos`, `Pais`, `Email`, `Password`, `FHNacimiento`, `Descripcion`) VALUES
	(3, 'Juan lopez', 'López', 'España', 'juanin@mail.com', 'juanin', '1995-09-17', 'Influencer.');
INSERT INTO `Usuarios` (`ID`, `Nombre`, `Apellidos`, `Pais`, `Email`, `Password`, `FHNacimiento`, `Descripcion`) VALUES
	(4, 'Diego Gallu', NULL, 'España', 'diego@gallu.es', 'barcelo', NULL, 'Nobody said it was easy');
INSERT INTO `Usuarios` (`ID`, `Nombre`, `Apellidos`, `Pais`, `Email`, `Password`, `FHNacimiento`, `Descripcion`) VALUES
	(5, 'Adrian Tudoli', NULL, 'España', 'tudoli@worker.es', 'abcd1234.', '1995-03-17', 'Trabajador nato');
INSERT INTO `Usuarios` (`ID`, `Nombre`, `Apellidos`, `Pais`, `Email`, `Password`, `FHNacimiento`, `Descripcion`) VALUES
	(6, 'Patricio Gabriel Sanchez', NULL, 'España', 'Patrick@rude.es', 'sanchez', '1995-06-02', 'Informático. Socialmente estéril');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;


-- Volcando estructura para tabla RedSocial.Visitas
CREATE TABLE IF NOT EXISTS `Visitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userA` int(11) DEFAULT NULL,
  `userB` int(11) DEFAULT NULL,
  `FHVisita` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla RedSocial.Visitas: ~73 rows (aproximadamente)
DELETE FROM `Visitas`;
/*!40000 ALTER TABLE `Visitas` DISABLE KEYS */;
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(1, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(2, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(3, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(4, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(5, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(6, 5, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(7, 5, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(8, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(9, 5, 4, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(10, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(11, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(12, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(13, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(14, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(15, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(16, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(17, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(18, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(19, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(20, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(21, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(22, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(23, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(24, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(25, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(26, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(27, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(28, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(29, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(30, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(31, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(32, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(33, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(34, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(35, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(36, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(37, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(38, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(39, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(40, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(41, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(42, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(43, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(44, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(45, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(46, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(47, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(48, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(49, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(50, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(51, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(52, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(53, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(54, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(55, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(56, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(57, 6, 2, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(58, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(59, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(60, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(61, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(62, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(63, 6, 3, NULL);
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(64, 6, 3, '2017-05-31 16:11:54');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(65, 3, 5, '2018-04-19 09:32:11');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(66, 3, 5, '2018-04-19 09:32:17');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(67, 3, 5, '2018-04-19 09:37:11');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(68, 3, 5, '2018-04-19 09:40:19');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(69, 3, 5, '2018-04-19 09:40:27');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(70, 3, 5, '2018-04-19 12:11:02');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(71, 3, 5, '2018-04-19 12:12:09');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(72, 3, 6, '2018-04-19 12:12:26');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(73, 3, 2, '2018-04-19 12:22:39');
INSERT INTO `Visitas` (`id`, `userA`, `userB`, `FHVisita`) VALUES
	(74, 3, 2, '2018-04-19 12:51:02');
/*!40000 ALTER TABLE `Visitas` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
