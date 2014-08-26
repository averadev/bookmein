-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2014 a las 23:41:32
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bookmein`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `puesto` varchar(255) DEFAULT NULL,
  `recibe_notificacion` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `email`, `nombre`, `apellido`, `puesto`, `recibe_notificacion`) VALUES
(1, 'admin', '123', 'cetina_14@hotmail.com', 'Adminstrador', ' admin', 'Adminstrador', 1),
(6, 'gengiscb', '12345', 'gengiscb@gmail.com', 'Gengis', 'Cetina', 'Desarrollador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estado`
--

CREATE TABLE IF NOT EXISTS `cat_estado` (
  `id` int(11) unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_estado`
--

INSERT INTO `cat_estado` (`id`, `nombre`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Coahuila'),
(8, 'Colima'),
(9, 'Distrito Federal'),
(10, 'Durango'),
(11, 'Guanajuato'),
(12, 'Guerrero'),
(13, 'Hidalgo'),
(14, 'Jalisco'),
(15, 'MichoacÃ¡n'),
(16, 'Morelos'),
(17, 'MÃ©xico'),
(18, 'Nayarit'),
(19, 'Nuevo LeÃ³n'),
(20, 'Oaxaca'),
(21, 'Puebla'),
(22, 'QuerÃ©taro'),
(23, 'Quintana Roo'),
(24, 'San Luis PotosÃ­'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz'),
(31, 'YucatÃ¡n'),
(32, 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_status_reservacion`
--

CREATE TABLE IF NOT EXISTS `cat_status_reservacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_status_reservacion`
--

INSERT INTO `cat_status_reservacion` (`id`, `nombre`) VALUES
(1, 'Tentativo'),
(2, 'Pagado'),
(3, 'CheckIn'),
(4, 'CheckOut');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('2d2743ed1fffc79ae4c0e453d56f4382', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 1409011492, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ap_paterno` varchar(45) NOT NULL,
  `ap_materno` varchar(45) DEFAULT NULL,
  `completo` varchar(255) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `ap_paterno`, `ap_materno`, `completo`, `telefono`, `email`, `apellido`) VALUES
(1, 'Jimmy', 'Pat', '', 'Jimmy Pat ', '123456789', 'libr@hotmail.com', NULL),
(2, 'Juan', 'Perez', '', 'Juan Perez ', '123456789', 'juanperez@gmail.com', NULL),
(3, 'Herneto', 'Pat', '', 'Herneto Pat ', '123456789', 'libr@hotmail.com', NULL),
(4, 'Popeye', 'Perez', '', 'Popeye Perez ', '123456789', 'juanperez@gmail.com', NULL),
(6, 'Jose', 'Pat', '', 'Jose Pat ', '123456789', 'libr@hotmail.com', NULL),
(7, 'Antonio', 'Perez', '', 'Antonio Perez ', '123456789', 'juanperez@gmail.com', NULL),
(8, 'Alberto', 'Vera', 'Espitia', 'Alberto Vera Espitia', '787878', 'mrfeto@gmail.com', NULL),
(9, 'Andrea', 'Espitia', 'Mancera', 'Andrea Espitia Mancera', '87894564', 'correo@mail.com', NULL),
(10, 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com', NULL),
(11, 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com', NULL),
(12, 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com', NULL),
(13, 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com', NULL),
(14, 'Andrew', 'Perez', 'Ruiz', 'Andrew Perez Ruiz', '95262632', 'correo@mail.com', NULL),
(15, 'Miriam', 'Angeles', 'Perez', 'Miriam Angeles Perez', '01-898-5452', 'mail@correo.com', NULL),
(16, 'Alberto', 'Vera', 'Espitia', 'Alberto Vera Espitia', '8745-5451', 'mail@gmail.com', NULL),
(17, 'Mario', 'Smith', 'Obrian', 'Mario Smith Obrian', '9523121', 'mail@secure.com', NULL),
(18, 'Alberto', 'Vera', 'Espitia', 'Alberto Vera Espitia', '998-784-9856', 'mrfeto@gmail.com', NULL),
(19, 'Maria Pilar', 'Ruiz', 'Guitierrez', 'Maria Pilar Ruiz Guitierrez', '789-45645-65456', 'maria@gmail.com', NULL),
(20, 'albe', 'wdssd', 'fsfd', 'albe wdssd fsfd', '54545645', 'mail@mail.com', NULL),
(21, 'as', 'asas', 'asas', 'as asas asas', 'sasas', 'qqwæ@xdsd.com', NULL),
(22, 'sas', 'asasasa', 'sasas', 'sas asasasa sasas', 'sas', 'as@zsas.com', NULL),
(23, 'Alberto', 'Vera', 'Esptitia', 'Alberto Vera Esptitia', '998-888-9999', 'email@gmail.com', NULL),
(24, 'sas', 'asas', 'asa', 'sas asas asa', 'asas', 'as@sasss.com', NULL),
(25, 'asdsad', 'dsadasd', 'asdasd', 'asdsad dsadasd asdasd', 'sdadas', 'sad@dsdsd.com', NULL),
(26, 'Gengis', 'Cetina', '', 'Gengis Cetina ', '1234567890', 'gengiscb@gmail.com', NULL),
(27, 'asas', 'as', 'as', 'asas as as', 'asasas', 'as@asdasd.com', NULL),
(28, 'asas', 'asas', 'sasas', 'asas asas sasas', 'asas', 'asas@asas.com', NULL),
(29, 'Gengis', 'Cetina', 'B.', 'Gengis Cetina B.', '9981000000', 'gengiscb@gmail.com', NULL),
(30, 'Gengis', 'Cetina', 'B', 'Gengis Cetina B', '23123123213', 'gengiscb@gmail.com', NULL),
(31, 'gen', 'sdcsc', 'fdf', 'gen sdcsc fdf', '45454545', 'gengiscb@gmail.com', NULL),
(32, 'sddq', 'ddq', 'dsdsd', 'sddq ddq dsdsd', '113515156', 'gengiscb@gmail.com', NULL),
(33, 'cvqvfvf', 'fdfd', 'fdfd', 'cvqvfvf fdfd fdfd', 'ddfdf', 'gengiscb@gmail.com', NULL),
(34, 'cdcw', 'dcdc', 'cdcd', 'cdcw dcdc cdcd', '65456465465', 'gengiscb@gmail.com', NULL),
(35, 'xsxs', 'xs', 'xs', 'xsxs xs xs', '427285275', 'gengiscb@gmail.com', NULL),
(36, 'gengis', 'ckmck', 'kcdkm', 'gengis ckmck kcdkm', '616545456', 'gengiscb@gmail.com', NULL),
(37, 'Gengis', 'Cetina', 'Balam', 'Gengis Cetina Balam', '99951554', 'gengiscb@gmail.com', NULL),
(38, 'Gengis', 'Cetina', 'Balam', 'Gengis Cetina Balam', '99810000000', 'gengiscb@gmail.com', NULL),
(39, 'gengis', 'cet', 'bal', 'gengis cet bal', '99880000', 'gengiscb@gmail.com', NULL),
(40, 'eede', 'dee', 'dede', 'eede dee dede', '59595959', 'gengiscb@gmail.com', NULL),
(41, 'dsds', 'dsd', 'dsd', 'dsds dsd dsd', '1232323', 'gengiscb@gmail.com', NULL),
(42, 'ssds', 'dsds', 'dsds', 'ssds dsds dsds', '1565454554', 'gengiscb@gmail.com', NULL),
(43, 'swsw', 'swsw', 'sws', 'swsw swsw sws', '456464564', 'gengiscb@gmail.com', NULL),
(44, 'dsds', 'dsd', 'dads', 'dsds dsd dads', '1656556', 'gengiscb@gmial.com', NULL),
(45, 'dde', 'de', 'edw', 'dde de edw', '233234234', 'gengiscb@gmail.com', NULL),
(46, 'Gengis', 'Cetina', 'B.', 'Gengis Cetina B.', '998800000', 'gengiscb@gmail.com', NULL),
(47, 'Prueba', 'otra', 'otra', 'Prueba otra otra', '546546555', 'prueba@gmail.com', NULL),
(48, 'sws', 'swsw', 'sws', 'sws swsw sws', '5645455|', 'otra@gmail.com', NULL),
(49, 'swsw', 'ddsd', 'dsds', 'swsw ddsd dsds', '23424', 'uno@gmail.com', NULL),
(50, 'gengiss', 'cetina', 'b', 'gengiss cetina b', '99880000000', 'gengis@gmail.com', NULL),
(51, 'd', 'de', 'de', 'd de de', '155115', 'gen@mail.com', NULL),
(52, 'sw', 'sw', 'sw', 'sw sw sw', '55454', 'ddd@dddd.com', NULL),
(53, 'dsd', 'dsd', 'ds', 'dsd dsd ds', '5564646', 'gen@gmail.com', NULL),
(54, 'dde', 'de', 'de', 'dde de de', '54554', 'ndnbd@mkmn.com', NULL),
(55, 'dccd', 'cdc', 'cd', 'dccd cdc cd', '145665', 'dcd@dddd.com', NULL),
(56, 'd', 'de', 'de', 'd de de', '51545', 'dede@gmail.com', NULL),
(57, 'Gengis', 'Cetina', 'Balam', 'Gengis Cetina Balam', '988000000', 'gen@gmail.com', NULL),
(58, 'dcd', 'cd', 'cd', 'dcd cd cd', 'cd', 'cd', NULL),
(59, 'de', 'de', 'de', 'de de de', 'de', 'de', NULL),
(60, 'de', 'de', 'de', 'de de de', 'de', 'de', NULL),
(61, 'de', 'de', 'de', 'de de de', 'de', 'de', NULL),
(62, 'de', 'de', 'de', 'de de de', 'de', 'de', NULL),
(63, 'dcd', 'cd', 'cd', 'dcd cd cd', 'cd', 'cd', NULL),
(64, 'dsept', 'setp', 'spt', 'dsept setp spt', '7878', 'dhdh@mail.com', NULL),
(65, 'xs', 'xs', 'xs', 'xs xs xs', 'xs', 'xssx@xsxs.xsx', NULL),
(66, 'xs', 'xs', 'xs', 'xs xs xs', 'xs', 'xsxs@cdc.com', NULL),
(67, 'cd', 'cd', 'cd', 'cd cd cd', 'cd', 'cd@mail.com', NULL),
(68, 'jkl', 'kjljkl', 'jljkljklj', 'jkl kjljkl jljkljklj', 'ljljkljkl', 'kljkljk@dadad.com', NULL),
(69, 'cd', 'cd', '', 'cd cd', 'cd', 'cdxs@mail.com', 'cd'),
(70, 'aa', 'bb', 'cc', 'aa bb', '54954', 'mail@mail.com', 'bb'),
(71, 'xx', 'xs', 'xs', 'xx xs', 'xs', 'xss@xsx.com', 'xs'),
(72, 'dcd', 'cd', '', 'dcd cd', 'cd', 'cdc@mail.com', 'cd'),
(73, 'dcd', 'cd', '', 'dcd cd', 'cd', 'cdc@mail.com', 'cd'),
(74, 'dcd', 'cd', '', 'dcd cd', 'cd', 'cdc@mail.com', 'cd'),
(75, 'cdcd', 'cdc', '', 'cdcd cdc', 'cd', 'cdcd@ccdcd.com', 'cdc'),
(76, 'Gengis', 'Cetina B.', '', 'Gengis Cetina B.', '9988000000', 'gengis@mail.com', 'Cetina B.'),
(77, 'xs', 'xs', '', 'xs xs', 'x', 'xs@mail.com', 'xs'),
(78, 'cdc', 'cdcd', '', 'cdc cdcd', 'scd', 'cdds@mail.com', 'cdcd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE IF NOT EXISTS `disponibilidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipos_habitacion_id` int(11) NOT NULL,
  `disponibilidad` int(11) NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_disponibilidad_tipos_habitacion1` (`tipos_habitacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`id`, `tipos_habitacion_id`, `disponibilidad`, `fecha_actualizacion`) VALUES
(1, 5, 14, '2012-01-05 06:22:42'),
(2, 6, 10, '2012-01-05 06:22:53'),
(4, 7, 2, '2012-01-05 06:23:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `event` text NOT NULL,
  `picture_1` varchar(255) NOT NULL DEFAULT '',
  `picture_2` varchar(255) NOT NULL DEFAULT '',
  `day` int(4) NOT NULL DEFAULT '0',
  `month` int(4) NOT NULL DEFAULT '0',
  `year` int(4) NOT NULL DEFAULT '0',
  `date` varchar(128) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`event_id`, `location`, `title`, `event`, `picture_1`, `picture_2`, `day`, `month`, `year`, `date`, `time`) VALUES
(1, '', 'Fully booked', 'All rooms are booked', '', '', 10, 7, 2010, '1278738000', '01:34'),
(2, '', 'Room is not available today', 'All rooms are booked', '', '', 11, 7, 2010, '1278824400', '00:00'),
(3, '', 'Room is not available today', 'All rooms are booked', '', '', 12, 7, 2010, '1278910800', '00:00'),
(4, '', 'Room is not available today', 'All rooms are booked', '', '', 13, 7, 2010, '1278997200', '00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE IF NOT EXISTS `habitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precioStd` double NOT NULL,
  `precioAdultoExtra` double DEFAULT NULL,
  `precioNinioExtra` double DEFAULT NULL,
  `capacidadStd` int(11) DEFAULT NULL,
  `disponibilidad` int(11) DEFAULT '1',
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `nombre`, `descripcion`, `precioStd`, `precioAdultoExtra`, `precioNinioExtra`, `capacidadStd`, `disponibilidad`, `status`) VALUES
(7, 'Habitación San Justo', 'Recamara interior sin ventana, cama queen-size.', 128, 180, 0, 2, 3, 1),
(8, 'Habitación Sol', 'Recamara interior, cama queen-size con ventana al patio interior.', 128, 0, 0, 2, 3, 1),
(9, 'Habitación Luna', 'Recamara interior, cama queen-size con ventana al patio interior.', 128, 0, 0, 2, 3, 1),
(10, 'Habitación San Jose', 'Recamara interior sin ventana, 2 camas queen-size, espaciosa.', 149, 0, 0, 4, 1, 1),
(11, 'Habitación Princesa', 'Recamara interior sin ventana, cama queen-size.', 128, 0, 0, 2, 1, 1),
(12, 'Habitación San Felipe', 'Recamara interior sin ventana, 2 camas queen-size.', 149, 0, 0, 4, 1, 1),
(13, 'Habitación San Geronimo', 'Pequeña y acogedora recamara interior, cama queen-size.', 95, 0, 0, 2, 1, 1),
(14, 'Suite Presidencial', 'Nuestro Suite mas comodo y lujoso, acceso doble al balcón, con dos habitaciones privadas y la comodidad de dos salas. La cocina en granito con todos los enseres en acero inoxidable y bañera de hidroma', 269, 0, 0, 5, 1, 1),
(15, 'Suite Fortaleza', 'Suite con acceso al balcón, una sola habitación con 2 camas queen-size y un futón.\nSala y comedor, muy espacioso y con los techos altos caracteristicos del viejo San Juan.', 199, 0, 0, 5, 1, 1),
(16, 'Suite San Sebastian', 'Suite en patio interior con 2 recamaras, 2 camas queen-size y futón.\nCuenta con sala, comedor y cocina completamente equipada.', 239, 0, 0, 5, 1, 1),
(17, 'Suite San Cristobal', 'Suite con 2 recamaras, 2 camas queen-size y 1 futón.\nCuenta con 2 baños, comedor y una sala grande y amplia, en patio interior.', 249, 0, 0, 5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE IF NOT EXISTS `promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id`, `nombre`, `fechaInicio`, `fechaFin`, `status`) VALUES
(13, 'Temporada Mayo-Junio', '2014-05-01', '2014-06-15', 1),
(14, 'Promoción Mes Patrio', '2014-09-01', '2014-09-30', 1),
(15, 'holas', '2014-06-24', '2014-06-26', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE IF NOT EXISTS `reservacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `fechaLlegada` datetime NOT NULL,
  `fechaSalida` datetime NOT NULL,
  `estadoReservacionId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Volcado de datos para la tabla `reservacion`
--

INSERT INTO `reservacion` (`id`, `codigo`, `clienteId`, `fechaLlegada`, `fechaSalida`, `estadoReservacionId`) VALUES
(2, '1002', 2, '2011-12-20 00:00:00', '2011-12-24 00:00:00', 4),
(9, '1009', 12, '2014-06-02 00:00:00', '2014-06-03 00:00:00', 1),
(11, '1011', 14, '2014-06-02 00:00:00', '2014-06-03 00:00:00', 4),
(12, '1012', 15, '2014-06-04 00:00:00', '2014-06-05 00:00:00', 1),
(13, '1013', 16, '2014-06-03 00:00:00', '2014-06-04 00:00:00', 2),
(14, '1014', 17, '2014-07-17 00:00:00', '2014-07-22 00:00:00', 1),
(15, '1015', 18, '2014-06-06 00:00:00', '2014-06-07 00:00:00', 1),
(16, '1016', 19, '2014-06-07 00:00:00', '2014-06-08 00:00:00', 1),
(17, '1017', 20, '2014-06-08 00:00:00', '2014-06-09 00:00:00', 1),
(18, '1018', 21, '2014-06-11 00:00:00', '2014-06-12 00:00:00', 1),
(19, '1019', 22, '2014-06-11 00:00:00', '2014-06-11 00:00:00', 1),
(20, '1020', 23, '2014-07-15 00:00:00', '2014-07-16 00:00:00', 2),
(21, '1021', 24, '2014-07-15 00:00:00', '2014-07-16 00:00:00', 1),
(22, '1022', 25, '2014-07-15 00:00:00', '2014-07-16 00:00:00', 1),
(23, '1023', 26, '2014-07-18 00:00:00', '2014-07-22 00:00:00', 3),
(24, '1024', 27, '2014-07-24 00:00:00', '2014-07-24 00:00:00', 1),
(25, '1025', 28, '2014-07-25 00:00:00', '2014-07-26 00:00:00', 1),
(26, '1026', 29, '2014-07-25 00:00:00', '2014-07-30 00:00:00', 1),
(27, '1027', 30, '2014-07-29 00:00:00', '2014-07-31 00:00:00', 1),
(28, '1028', 31, '2014-07-29 00:00:00', '2014-07-31 00:00:00', 1),
(29, '1029', 32, '2014-07-29 00:00:00', '2014-07-31 00:00:00', 1),
(30, '1030', 33, '2014-07-29 00:00:00', '2014-07-31 00:00:00', 1),
(31, '1031', 34, '2014-08-01 00:00:00', '2014-08-05 00:00:00', 1),
(32, '1032', 35, '2014-07-31 00:00:00', '2014-08-06 00:00:00', 1),
(33, '1033', 36, '2014-07-30 00:00:00', '2014-08-01 00:00:00', 1),
(34, '1034', 37, '2014-07-30 00:00:00', '2014-08-02 00:00:00', 1),
(35, '1035', 38, '2014-07-31 00:00:00', '2014-08-01 00:00:00', 1),
(36, '1036', 39, '2014-07-31 00:00:00', '2014-08-02 00:00:00', 1),
(37, '1037', 40, '2014-07-31 00:00:00', '2014-08-01 00:00:00', 1),
(38, '1038', 41, '2014-07-31 00:00:00', '2014-08-01 00:00:00', 1),
(39, '1039', 42, '2014-09-01 00:00:00', '2014-09-10 00:00:00', 1),
(40, '1040', 43, '2014-09-01 00:00:00', '2014-09-03 00:00:00', 1),
(41, '1041', 44, '2014-08-24 00:00:00', '2014-08-27 00:00:00', 1),
(42, '1042', 45, '2014-08-20 00:00:00', '2014-08-22 00:00:00', 1),
(43, '1043', 46, '2014-08-20 00:00:00', '2014-08-22 00:00:00', 1),
(44, '1044', 47, '2014-09-24 00:00:00', '2014-08-26 00:00:00', 1),
(45, '1045', 48, '2014-08-12 00:00:00', '2014-08-14 00:00:00', 1),
(46, '1046', 49, '2014-08-19 00:00:00', '2014-08-21 00:00:00', 1),
(47, '1047', 50, '2014-08-13 00:00:00', '2014-08-15 00:00:00', 1),
(48, '1048', 51, '2014-08-13 00:00:00', '2014-08-14 00:00:00', 1),
(49, '1049', 52, '2014-08-14 00:00:00', '2014-08-17 00:00:00', 1),
(50, '1050', 53, '2014-08-20 00:00:00', '2014-08-21 00:00:00', 1),
(51, '1051', 54, '2014-08-29 00:00:00', '2014-08-31 00:00:00', 1),
(52, '1052', 55, '2014-08-29 00:00:00', '2014-08-31 00:00:00', 4),
(53, '1053', 56, '2014-08-16 00:00:00', '2014-08-18 00:00:00', 1),
(54, '1054', 57, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(55, '1055', 58, '2014-08-22 00:00:00', '2014-08-25 00:00:00', 1),
(56, '1056', 59, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(57, '1057', 60, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(58, '1058', 61, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(59, '1059', 62, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(60, '1060', 63, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(61, '1061', 64, '2014-09-01 00:00:00', '2014-09-03 00:00:00', 1),
(62, '1062', 65, '2014-08-14 00:00:00', '2014-08-14 00:00:00', 1),
(63, '1063', 66, '2014-08-15 00:00:00', '2014-08-15 00:00:00', 1),
(64, '1064', 67, '2014-08-15 00:00:00', '2014-08-15 00:00:00', 1),
(65, '1065', 68, '2014-08-18 00:00:00', '2014-08-18 00:00:00', 1),
(66, '1066', 69, '2014-08-19 00:00:00', '2014-08-19 00:00:00', 1),
(67, '1067', 70, '2014-08-22 00:00:00', '2014-08-24 00:00:00', 1),
(68, '1068', 71, '2014-08-20 00:00:00', '2014-08-22 00:00:00', 1),
(69, '1069', 72, '2014-08-19 00:00:00', '2014-08-19 00:00:00', 1),
(70, '1070', 73, '2014-08-19 00:00:00', '2014-08-19 00:00:00', 1),
(71, '1071', 74, '2014-08-19 00:00:00', '2014-08-19 00:00:00', 1),
(72, '1072', 75, '2014-08-29 00:00:00', '2014-08-31 00:00:00', 1),
(73, '1073', 76, '2014-08-29 00:00:00', '2014-08-30 00:00:00', 1),
(74, '1074', 77, '2014-08-20 00:00:00', '2014-08-20 00:00:00', 1),
(75, '1075', 78, '2015-01-14 00:00:00', '2015-01-16 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_admin_users`
--

CREATE TABLE IF NOT EXISTS `tbl_admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `user_type` enum('SA','A') DEFAULT 'SA' COMMENT 'SA: Super Admin,A: Admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_admin_users`
--

INSERT INTO `tbl_admin_users` (`id`, `username`, `email`, `password`, `block`, `user_type`) VALUES
(1, 'demo', 'abhishek@devzone.co.in', '7e466fc01a0c7932e96a4a925b11b06a', 0, 'SA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_reservation_master`
--

CREATE TABLE IF NOT EXISTS `tb_reservation_master` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `teenagers` int(11) NOT NULL,
  `status` char(3) NOT NULL,
  `customer_first_name` varchar(200) NOT NULL,
  `customer_last_name` varchar(200) NOT NULL,
  `address` mediumtext NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` varchar(200) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Volcado de datos para la tabla `tb_reservation_master`
--

INSERT INTO `tb_reservation_master` (`reservation_id`, `room_id`, `check_in_date`, `check_out_date`, `adults`, `children`, `teenagers`, `status`, `customer_first_name`, `customer_last_name`, `address`, `city`, `state`, `zip_code`, `country`, `telephone`, `email`, `amount`) VALUES
(58, 34, '2010-12-17', '2010-12-19', 1, 0, 0, '', 'Developer', 'Site', 'Lane-2', 'Cancun', 'test', '454545', 'Mexico', '34343', 'archanaunnidp14@hotmail.com', '321.48'),
(57, 49, '2010-11-02', '2010-11-03', 1, 0, 0, '', 'Ron', 'Carlisle', 'First road', 'Xcalak', 'Quintana roo', '78678', 'Mexico', '361 937 3565', 'corpusdude69@aol.com', '53.58'),
(56, 37, '2010-09-18', '2010-09-26', 1, 1, 1, '', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', '4343434', 'Mexico', '434343', 'archanaunni@gmail.com', '857.28'),
(52, 53, '2010-09-07', '2010-09-09', 2, 1, 1, '', 'Jose Maria', 'Pastor', 'Director General', 'Cancun', 'Palya', '5454545', 'Mexico', '4545454', 'archanaunni@gmail.com', '321.48'),
(53, 49, '2010-09-10', '2010-09-12', 1, 1, 0, '', 'Deepak', 'Krishna', 'General Manager', 'Great Cochin', 'Kerala', '989898', 'Mexico', '343433', 'archanaunni@gmail.com', '116.28'),
(54, 46, '2010-09-21', '2010-09-23', 1, 1, 0, '', 'Nombre', 'Apellidos', 'DirecciÃƒÂ³n', 'Ciudad', 'Provincia', '4343343', 'Mexico', '3434343', 'archanaunni@gmail.com', '116.28'),
(55, 40, '2010-09-22', '2010-09-25', 1, 1, 1, '', 'Nombre', 'Apellidos', 'DirecciÃƒÂ³n', 'Ciudad', 'Provincia', '4343434', 'Mexico', '45454545', 'archanaunni@gmail.com', '321.48'),
(46, 26, '2010-08-01', '2010-08-04', 1, 1, 0, '', 'ffffsss', 'llllll', 'aaaaa', 'cccccc', 'sssss', '4343434', 'Mexico', '6566565', 'dsdsds@oooo.com', '399.60'),
(50, 44, '2010-09-04', '2010-09-06', 1, 0, 0, '', 'Unni', 'Raj', 'TEst', 'test', 'tesst', '4343434', 'Mexico', '4545454', 'archanaunni@gmail.com', '107.16'),
(51, 38, '2010-09-11', '2010-09-13', 1, 0, 0, '', 'Reema', 'Unni', 'Manager', 'Cochin', 'Kerala', '897978', 'Mexico', '98978888', 'archanaunni@gmail.com', '107.16'),
(59, 51, '2010-12-17', '2010-12-19', 1, 0, 0, '', 'Developer', 'Site', 'Lane-2', 'Cancun', 'test', '454545', 'Mexico', '34343', 'archanaunnidp14@hotmail.com', '321.48'),
(60, 35, '2010-12-17', '2010-12-19', 1, 0, 0, '', 'Developer', 'Site', 'Lane-2', 'Cancun', 'test', '454545', 'Mexico', '34343', 'archanaunnidp14@hotmail.com', '321.48'),
(61, 44, '2011-08-05', '2011-08-06', 1, 0, 0, '', 'Kathleen', 'Campbell', '4729 NE Wistaria Dr.', 'Portland', 'Oregon', '97213', 'United States of America', '5035156225', 'kathy.campbell@chemeketa.edu', '157.32'),
(62, 46, '2011-08-05', '2011-08-06', 1, 0, 0, '', 'Kathleen', 'Campbell', '4729 NE Wistaria Dr.', 'Portland', 'Oregon', '97213', 'United States of America', '5035156225', 'kathy.campbell@chemeketa.edu', '157.32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_room_master`
--

CREATE TABLE IF NOT EXISTS `tb_room_master` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(20) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` char(3) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Volcado de datos para la tabla `tb_room_master`
--

INSERT INTO `tb_room_master` (`room_id`, `room_number`, `type_id`, `status`) VALUES
(7, '101', 0, 'AV'),
(8, '102', 0, 'AV'),
(9, '103', 0, 'AV'),
(10, '104', 0, 'AV'),
(11, '105', 0, 'AV'),
(12, '106', 0, 'AV'),
(13, '107', 0, 'AV'),
(14, '108', 0, 'AV'),
(15, '109', 0, 'AV'),
(16, '110', 0, 'AV'),
(17, '111', 0, 'AV'),
(18, '112', 0, 'AV'),
(19, '113', 0, 'AV'),
(20, '114', 0, 'AV'),
(21, '115', 0, 'AV'),
(22, '116', 0, 'AV'),
(23, '117', 0, 'AV'),
(33, '213', 0, 'AV'),
(32, '212', 0, 'AV'),
(31, '211', 0, 'AV'),
(27, '01', 0, 'AV'),
(28, '02', 0, 'AV'),
(29, '03', 0, 'AV'),
(30, '04', 0, 'AV'),
(34, '214', 0, 'AV'),
(35, '215', 0, 'AV'),
(36, '216', 0, 'AV'),
(37, '217', 0, 'AV'),
(38, '218', 0, 'AV'),
(39, '221', 0, 'AV'),
(40, '222', 0, 'AV'),
(41, '223', 0, 'AV'),
(42, '224', 0, 'AV'),
(43, '225', 0, 'AV'),
(44, '226', 0, 'AV'),
(45, '227', 0, 'AV'),
(46, '228', 0, 'AV'),
(47, '231', 0, 'AV'),
(48, '232', 0, 'AV'),
(49, '233', 0, 'AV'),
(50, '234', 0, 'AV'),
(51, '235', 0, 'AV'),
(52, '236', 0, 'AV'),
(53, '237', 0, 'AV'),
(54, '238', 0, 'AV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_special_rate`
--

CREATE TABLE IF NOT EXISTS `tb_special_rate` (
  `id_special_rate` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `adult_rate` float(8,2) NOT NULL,
  `child_rate` float(8,2) NOT NULL,
  `teenage_rate` float(8,2) NOT NULL,
  PRIMARY KEY (`id_special_rate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `tb_special_rate`
--

INSERT INTO `tb_special_rate` (`id_special_rate`, `type_id`, `from_date`, `to_date`, `adult_rate`, `child_rate`, `teenage_rate`) VALUES
(3, 7, '2010-08-25', '2010-12-23', 47.00, 4.00, 43.00),
(5, 7, '2010-12-24', '2011-01-03', 64.00, 4.00, 60.00),
(7, 7, '2011-01-04', '2011-04-15', 58.00, 4.00, 54.00),
(6, 7, '2011-04-16', '2011-04-30', 67.50, 4.00, 63.50),
(8, 7, '2011-05-01', '2011-07-07', 49.00, 4.00, 45.00),
(9, 7, '2011-07-08', '2011-08-24', 58.00, 4.00, 54.00),
(10, 7, '2011-08-25', '2011-12-23', 49.00, 4.00, 45.00),
(11, 8, '2010-08-25', '2010-12-23', 55.00, 4.00, 51.00),
(12, 8, '2010-12-24', '2011-01-03', 73.00, 4.00, 69.00),
(13, 8, '2011-01-04', '2011-04-15', 66.50, 4.00, 62.50),
(14, 8, '2011-04-16', '2011-04-30', 76.00, 4.00, 72.00),
(15, 8, '2011-05-01', '2011-07-07', 58.00, 4.00, 54.00),
(16, 8, '2011-07-08', '2011-08-24', 66.50, 4.00, 62.50),
(17, 8, '2011-08-25', '2011-12-23', 58.00, 4.00, 54.00),
(18, 9, '2010-08-25', '2010-12-23', 73.00, 4.00, 69.00),
(19, 9, '2010-12-24', '2011-01-03', 92.00, 4.00, 88.00),
(20, 9, '2011-01-04', '2011-04-15', 85.00, 4.00, 81.00),
(21, 9, '2011-04-16', '2011-04-30', 95.00, 4.00, 91.00),
(25, 9, '2011-07-08', '2011-08-24', 85.00, 4.00, 81.00),
(24, 9, '2011-05-01', '2011-07-07', 74.50, 4.00, 70.50),
(26, 9, '2011-08-25', '2011-12-23', 74.50, 4.00, 70.50),
(27, 13, '2010-08-25', '2010-12-23', 82.50, 4.00, 78.50),
(28, 13, '2010-12-24', '2011-01-03', 101.50, 4.00, 97.50),
(29, 13, '2011-01-04', '2011-04-15', 94.50, 4.00, 90.50),
(30, 13, '2011-04-16', '2011-04-30', 104.00, 4.00, 100.00),
(31, 13, '2011-05-01', '2011-07-07', 84.00, 4.00, 80.00),
(32, 13, '2011-07-08', '2011-08-24', 94.50, 4.00, 90.50),
(33, 13, '2011-08-25', '2011-12-23', 84.00, 4.00, 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_type_master`
--

CREATE TABLE IF NOT EXISTS `tb_type_master` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_master` varchar(255) NOT NULL,
  `eng_type_master` varchar(255) NOT NULL,
  `room_rate` float(8,2) NOT NULL,
  `child_rate` float(8,2) NOT NULL,
  `teenage_rate` float(8,2) NOT NULL,
  `tax_rate` float(8,2) NOT NULL,
  `description` longtext NOT NULL,
  `eng_description` longtext NOT NULL,
  `sorder` int(3) NOT NULL,
  `photos` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `tb_type_master`
--

INSERT INTO `tb_type_master` (`type_id`, `type_master`, `eng_type_master`, `room_rate`, `child_rate`, `teenage_rate`, `tax_rate`, `description`, `eng_description`, `sorder`, `photos`) VALUES
(8, 'Superior', 'Superior', 55.00, 4.00, 51.00, 14.00, 'Superior. Aire acondicionado, internet inalÃƒÂ¡mbrico gratuito, tv con cable, caja de seguridad tamaÃƒÂ±o laptop.', 'Superior. Air conditioning, complimentary wireless internet, cable tv, laptop size safe deposit box.', 2, 'superior.jpg'),
(7, 'EstÃƒÂ¡ndar', 'Standard', 47.00, 4.00, 43.00, 14.00, 'EstÃƒÂ¡ndar. Aire acondicionado, tv con cable, internet inalÃƒÂ¡mbrico gratuito, caja de seguridad tamaÃƒÂ±o laptop.', 'Standard. Air conditioning, cable tv, complimentary wireless internet, laptop size safe deposit box.', 1, 'Habitacion.JPG'),
(9, 'Jr. Suite', 'Jr. Suite', 73.00, 4.00, 69.00, 14.00, 'Jr. Suite. Planta baja, aire acondicionado, internet inalÃƒÂ¡mbrico gratuito, tv con cable, caja de seguridad tamaÃƒÂ±o laptop, minibar, comedor.', 'Jr. Suite. Ground floor, complimentary wireless internet, cable tv, laptop size safe deposit box, minibar, dining table.', 3, 'fotos-3.png'),
(13, 'Suite', 'Suite', 82.00, 4.00, 78.00, 14.00, 'Suite. Planta baja, 30 m2, aire acondicionado, internet inalÃƒÂ¡mbico gratuito, tv pantalla plana 32 pulgadas con cable, minibar, comedor, caja de seguridad tamaÃƒÂ±o laptop.', 'Suite. Ground floor, 320 ft2, air conditioning, complimentary wireless internet, 32 inch flat screen cable tv, minibar, dining table, laptop size safe deposit box.', 4, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_type_room`
--

CREATE TABLE IF NOT EXISTS `tb_type_room` (
  `id_type_room` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  PRIMARY KEY (`id_type_room`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Volcado de datos para la tabla `tb_type_room`
--

INSERT INTO `tb_type_room` (`id_type_room`, `id_type`, `id_room`, `room_no`) VALUES
(42, 8, 16, '110'),
(33, 8, 7, '101'),
(41, 8, 15, '109'),
(34, 8, 8, '102'),
(40, 8, 14, '108'),
(35, 8, 9, '103'),
(39, 8, 13, '107'),
(38, 8, 12, '106'),
(18, 7, 26, '120'),
(17, 13, 26, '120'),
(37, 8, 11, '105'),
(16, 9, 25, '119'),
(36, 8, 10, '104'),
(23, 13, 0, '1'),
(91, 13, 27, '01'),
(25, 9, 0, '2'),
(26, 9, 0, '3'),
(30, 9, 28, '02'),
(31, 9, 29, '03'),
(32, 9, 30, '04'),
(43, 8, 17, '111'),
(44, 8, 18, '112'),
(45, 8, 19, '113'),
(46, 8, 20, '114'),
(47, 8, 21, '115'),
(48, 8, 22, '116'),
(49, 8, 23, '117'),
(50, 7, 31, '211'),
(51, 7, 32, '212'),
(52, 7, 33, '213'),
(53, 7, 34, '214'),
(54, 7, 35, '215'),
(55, 7, 36, '216'),
(56, 7, 37, '217'),
(57, 7, 38, '218'),
(58, 7, 0, '221'),
(59, 7, 0, '222'),
(60, 7, 0, '223'),
(61, 7, 0, '224'),
(62, 7, 0, '225'),
(63, 7, 0, '226'),
(64, 7, 0, '227'),
(65, 7, 0, '228'),
(66, 7, 0, '231'),
(67, 7, 0, '232'),
(68, 7, 0, '233'),
(69, 7, 0, '234'),
(70, 7, 0, '235'),
(71, 7, 0, '236'),
(72, 7, 0, '237'),
(73, 7, 0, '238'),
(74, 7, 39, '221'),
(75, 7, 40, '222'),
(76, 7, 41, '223'),
(77, 7, 42, '224'),
(78, 7, 43, '225'),
(79, 7, 44, '226'),
(80, 7, 45, '227'),
(81, 7, 46, '228'),
(82, 7, 47, '231'),
(83, 7, 48, '232'),
(84, 7, 49, '233'),
(85, 7, 50, '234'),
(86, 7, 51, '235'),
(87, 7, 52, '236'),
(88, 7, 53, '237'),
(89, 7, 54, '238');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

CREATE TABLE IF NOT EXISTS `temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `temporada`
--

INSERT INTO `temporada` (`id`, `nombre`, `fechaInicio`, `fechaFin`, `status`) VALUES
(3, 'Spring Break', '2014-04-02', '2014-04-25', 1),
(6, 'Verano', '2014-07-06', '2014-08-24', 1),
(8, 'Independencia de Mexico', '2014-09-10', '2014-09-16', 1),
(11, 'Epoca Navideña', '2014-03-06', '2014-03-21', 1),
(12, 'sadasd', '2014-05-24', '2014-05-24', 0),
(13, 'qwqwqw', '2014-05-26', '2014-05-26', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xref_dispon_temporadas`
--

CREATE TABLE IF NOT EXISTS `xref_dispon_temporadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temporadas_id` int(11) NOT NULL,
  `tipos_habitacion_id` int(11) NOT NULL,
  `disponibilidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xref_tipos_temporadas_tipos_habitacion` (`tipos_habitacion_id`),
  KEY `fk_xref_tipos_temporadas_temporadas1` (`temporadas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xref_habitacion_promocion`
--

CREATE TABLE IF NOT EXISTS `xref_habitacion_promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promocionId` int(11) NOT NULL,
  `habitacionId` int(11) NOT NULL,
  `precioStd` double DEFAULT NULL,
  `precioAdultoExtra` double DEFAULT NULL,
  `precioNinioExtra` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=149 ;

--
-- Volcado de datos para la tabla `xref_habitacion_promocion`
--

INSERT INTO `xref_habitacion_promocion` (`id`, `promocionId`, `habitacionId`, `precioStd`, `precioAdultoExtra`, `precioNinioExtra`) VALUES
(129, 14, 5, 11, 22, 33),
(130, 14, 6, NULL, 44, 55),
(131, 14, 7, NULL, 66, 7777),
(135, 15, 5, 33, 44, 555),
(136, 15, 6, NULL, 55, NULL),
(144, 13, 7, 110, 0, NULL),
(145, 13, 8, 110, NULL, NULL),
(146, 13, 9, 110, NULL, NULL),
(147, 13, 10, 130, NULL, NULL),
(148, 13, 17, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xref_habitacion_reservacion`
--

CREATE TABLE IF NOT EXISTS `xref_habitacion_reservacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservacionId` int(11) NOT NULL,
  `habitacionId` int(11) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `promocionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Volcado de datos para la tabla `xref_habitacion_reservacion`
--

INSERT INTO `xref_habitacion_reservacion` (`id`, `reservacionId`, `habitacionId`, `precio`, `cantidad`, `promocionId`) VALUES
(1, 1, 7, 250, 1, 1),
(2, 2, 7, 250, 1, 2),
(3, 3, 8, 250, 1, 2),
(4, 4, 8, 700, 1, 1),
(5, 5, 9, 250, 1, 2),
(6, 6, 9, 250, 1, 2),
(7, 7, 9, 700, 1, 2),
(8, 9, 7, 110, 1, 13),
(9, 10, 7, 110, 1, 13),
(10, 11, 7, 110, 1, 13),
(11, 11, 8, 110, 1, 13),
(12, 12, 7, 110, 1, 13),
(13, 13, 7, 110, 1, 13),
(14, 14, 7, 640, 1, 0),
(15, 15, 7, 1, 1, 13),
(16, 16, 7, 1, 0, 13),
(17, 17, 7, 1, 1, 13),
(18, 18, 8, 1, 1, 13),
(19, 19, 7, 1, 1, 13),
(20, 20, 7, 128, 1, 0),
(21, 21, 9, 128, 1, 0),
(22, 22, 14, 269, 1, 0),
(23, 23, 8, 512, 1, 0),
(24, 24, 7, 128, 1, 0),
(25, 25, 7, 128, 1, 0),
(26, 26, 8, 640, 1, 0),
(27, 27, 7, 256, 1, 0),
(28, 28, 9, 256, 1, 0),
(29, 29, 11, 256, 1, 0),
(30, 30, 12, 298, 1, 0),
(31, 31, 8, 512, 1, 0),
(32, 32, 13, 570, 1, 0),
(33, 33, 14, 538, 1, 0),
(34, 34, 15, 597, 1, 0),
(35, 35, 8, 128, 1, 0),
(36, 36, 16, 478, 1, 0),
(37, 37, 10, 149, 1, 0),
(38, 38, 17, 249, 1, 0),
(39, 39, 7, 1152, 1, 14),
(40, 40, 8, 256, 1, 0),
(41, 41, 7, 384, 1, 0),
(42, 42, 7, 256, 1, 0),
(43, 43, 8, 256, 1, 0),
(44, 44, 8, -3712, 1, 0),
(45, 45, 7, 256, 1, 0),
(46, 46, 10, 298, 1, 0),
(47, 47, 8, 256, 1, 0),
(48, 48, 9, 128, 1, 0),
(49, 49, 10, 447, 1, 0),
(50, 50, 9, 128, 1, 0),
(51, 51, 7, 256, 1, 0),
(52, 52, 8, 256, 1, 0),
(53, 53, 7, 256, 1, 0),
(54, 53, 8, 256, 1, 0),
(55, 53, 17, 498, 1, 0),
(56, 53, 14, 538, 1, 0),
(57, 54, 11, 128, 1, 0),
(58, 55, 11, 384, 1, 0),
(59, 55, 9, 384, 1, 0),
(60, 56, 13, 95, 1, 0),
(61, 57, 13, 95, 1, 0),
(62, 58, 13, 95, 1, 0),
(63, 59, 13, 95, 1, 0),
(64, 60, 12, 149, 1, 0),
(65, 61, 9, 256, 1, 0),
(66, 61, 10, 298, 1, 0),
(67, 62, 15, 199, 1, 0),
(68, 63, 16, 239, 1, 0),
(69, 64, 14, 269, 1, 0),
(70, 65, 13, 95, 1, 0),
(71, 66, 16, 239, 1, 0),
(72, 67, 7, 256, 1, 0),
(73, 68, 7, 256, 1, 0),
(74, 69, 9, 128, 1, 0),
(75, 70, 12, 149, 1, 0),
(76, 71, 15, 199, 1, 0),
(77, 72, 11, 256, 1, 0),
(78, 73, 7, 128, 1, 0),
(79, 74, 7, 128, 1, 0),
(80, 75, 7, 512, 2, 0),
(81, 75, 8, 256, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xref_habitacion_temporada`
--

CREATE TABLE IF NOT EXISTS `xref_habitacion_temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temporadaId` int(11) NOT NULL,
  `habitacionId` int(11) NOT NULL,
  `precioStd` double DEFAULT NULL,
  `precioAdultoExtra` double DEFAULT NULL,
  `precioNinioExtra` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=122 ;

--
-- Volcado de datos para la tabla `xref_habitacion_temporada`
--

INSERT INTO `xref_habitacion_temporada` (`id`, `temporadaId`, `habitacionId`, `precioStd`, `precioAdultoExtra`, `precioNinioExtra`) VALUES
(113, 3, 5, 1000, 1000, 1000),
(114, 3, 6, 200, 200, 200),
(115, 3, 7, 3, NULL, 3),
(116, 3, 11, 5, NULL, 5),
(117, 3, 12, 6, 6, NULL),
(118, 3, 13, NULL, 7, 7),
(119, 13, 5, 22, 333333, 333),
(120, 13, 6, NULL, NULL, 4444),
(121, 13, 7, NULL, 44, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `xref_dispon_temporadas`
--
ALTER TABLE `xref_dispon_temporadas`
  ADD CONSTRAINT `xref_dispon_temporadas_ibfk_1` FOREIGN KEY (`temporadas_id`) REFERENCES `temporada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `xref_dispon_temporadas_ibfk_2` FOREIGN KEY (`tipos_habitacion_id`) REFERENCES `habitacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
