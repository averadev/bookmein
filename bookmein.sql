/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : bookmein

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2014-07-15 15:56:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '0', 'your@email.net');

-- ----------------------------
-- Table structure for `cat_estado`
-- ----------------------------
DROP TABLE IF EXISTS `cat_estado`;
CREATE TABLE `cat_estado` (
  `id` int(11) unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cat_estado
-- ----------------------------
INSERT INTO `cat_estado` VALUES ('1', 'Aguascalientes');
INSERT INTO `cat_estado` VALUES ('2', 'Baja California');
INSERT INTO `cat_estado` VALUES ('3', 'Baja California Sur');
INSERT INTO `cat_estado` VALUES ('4', 'Campeche');
INSERT INTO `cat_estado` VALUES ('5', 'Chiapas');
INSERT INTO `cat_estado` VALUES ('6', 'Chihuahua');
INSERT INTO `cat_estado` VALUES ('7', 'Coahuila');
INSERT INTO `cat_estado` VALUES ('8', 'Colima');
INSERT INTO `cat_estado` VALUES ('9', 'Distrito Federal');
INSERT INTO `cat_estado` VALUES ('10', 'Durango');
INSERT INTO `cat_estado` VALUES ('11', 'Guanajuato');
INSERT INTO `cat_estado` VALUES ('12', 'Guerrero');
INSERT INTO `cat_estado` VALUES ('13', 'Hidalgo');
INSERT INTO `cat_estado` VALUES ('14', 'Jalisco');
INSERT INTO `cat_estado` VALUES ('15', 'MichoacÃ¡n');
INSERT INTO `cat_estado` VALUES ('16', 'Morelos');
INSERT INTO `cat_estado` VALUES ('17', 'MÃ©xico');
INSERT INTO `cat_estado` VALUES ('18', 'Nayarit');
INSERT INTO `cat_estado` VALUES ('19', 'Nuevo LeÃ³n');
INSERT INTO `cat_estado` VALUES ('20', 'Oaxaca');
INSERT INTO `cat_estado` VALUES ('21', 'Puebla');
INSERT INTO `cat_estado` VALUES ('22', 'QuerÃ©taro');
INSERT INTO `cat_estado` VALUES ('23', 'Quintana Roo');
INSERT INTO `cat_estado` VALUES ('24', 'San Luis PotosÃ­');
INSERT INTO `cat_estado` VALUES ('25', 'Sinaloa');
INSERT INTO `cat_estado` VALUES ('26', 'Sonora');
INSERT INTO `cat_estado` VALUES ('27', 'Tabasco');
INSERT INTO `cat_estado` VALUES ('28', 'Tamaulipas');
INSERT INTO `cat_estado` VALUES ('29', 'Tlaxcala');
INSERT INTO `cat_estado` VALUES ('30', 'Veracruz');
INSERT INTO `cat_estado` VALUES ('31', 'YucatÃ¡n');
INSERT INTO `cat_estado` VALUES ('32', 'Zacatecas');

-- ----------------------------
-- Table structure for `cat_status_reservacion`
-- ----------------------------
DROP TABLE IF EXISTS `cat_status_reservacion`;
CREATE TABLE `cat_status_reservacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cat_status_reservacion
-- ----------------------------
INSERT INTO `cat_status_reservacion` VALUES ('1', 'Tentativo');
INSERT INTO `cat_status_reservacion` VALUES ('2', 'Pagado');
INSERT INTO `cat_status_reservacion` VALUES ('3', 'CheckIn');
INSERT INTO `cat_status_reservacion` VALUES ('4', 'CheckOut');

-- ----------------------------
-- Table structure for `ci_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('845b7c41f9c0ba9da41375e6b664bcff', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.97 Safari/537.36', '1405353999', 'a:6:{s:9:\"user_data\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:8:\"username\";s:4:\"demo\";s:5:\"email\";s:22:\"abhishek@devzone.co.in\";s:14:\"is_admin_login\";b:1;s:9:\"user_type\";s:2:\"SA\";}');

-- ----------------------------
-- Table structure for `clientes`
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ap_paterno` varchar(45) NOT NULL,
  `ap_materno` varchar(45) DEFAULT NULL,
  `completo` varchar(255) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Jimmy', 'Pat', '', 'Jimmy Pat ', '123456789', 'libr@hotmail.com');
INSERT INTO `clientes` VALUES ('2', 'Juan', 'Perez', '', 'Juan Perez ', '123456789', 'juanperez@gmail.com');
INSERT INTO `clientes` VALUES ('3', 'Herneto', 'Pat', '', 'Herneto Pat ', '123456789', 'libr@hotmail.com');
INSERT INTO `clientes` VALUES ('4', 'Popeye', 'Perez', '', 'Popeye Perez ', '123456789', 'juanperez@gmail.com');
INSERT INTO `clientes` VALUES ('6', 'Jose', 'Pat', '', 'Jose Pat ', '123456789', 'libr@hotmail.com');
INSERT INTO `clientes` VALUES ('7', 'Antonio', 'Perez', '', 'Antonio Perez ', '123456789', 'juanperez@gmail.com');
INSERT INTO `clientes` VALUES ('8', 'Alberto', 'Vera', 'Espitia', 'Alberto Vera Espitia', '787878', 'mrfeto@gmail.com');
INSERT INTO `clientes` VALUES ('9', 'Andrea', 'Espitia', 'Mancera', 'Andrea Espitia Mancera', '87894564', 'correo@mail.com');
INSERT INTO `clientes` VALUES ('10', 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com');
INSERT INTO `clientes` VALUES ('11', 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com');
INSERT INTO `clientes` VALUES ('12', 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com');
INSERT INTO `clientes` VALUES ('13', 'Veronica', 'Vera', 'Espitia', 'Veronica Vera Espitia', '89748561', 'correo@gmail.com');
INSERT INTO `clientes` VALUES ('14', 'Andrew', 'Perez', 'Ruiz', 'Andrew Perez Ruiz', '95262632', 'correo@mail.com');
INSERT INTO `clientes` VALUES ('15', 'Miriam', 'Angeles', 'Perez', 'Miriam Angeles Perez', '01-898-5452', 'mail@correo.com');
INSERT INTO `clientes` VALUES ('16', 'Alberto', 'Vera', 'Espitia', 'Alberto Vera Espitia', '8745-5451', 'mail@gmail.com');
INSERT INTO `clientes` VALUES ('17', 'Mario', 'Smith', 'Obrian', 'Mario Smith Obrian', '9523121', 'mail@secure.com');
INSERT INTO `clientes` VALUES ('18', 'Alberto', 'Vera', 'Espitia', 'Alberto Vera Espitia', '998-784-9856', 'mrfeto@gmail.com');
INSERT INTO `clientes` VALUES ('19', 'Maria Pilar', 'Ruiz', 'Guitierrez', 'Maria Pilar Ruiz Guitierrez', '789-45645-65456', 'maria@gmail.com');
INSERT INTO `clientes` VALUES ('20', 'albe', 'wdssd', 'fsfd', 'albe wdssd fsfd', '54545645', 'mail@mail.com');
INSERT INTO `clientes` VALUES ('21', 'as', 'asas', 'asas', 'as asas asas', 'sasas', 'qqwæ@xdsd.com');
INSERT INTO `clientes` VALUES ('22', 'sas', 'asasasa', 'sasas', 'sas asasasa sasas', 'sas', 'as@zsas.com');
INSERT INTO `clientes` VALUES ('23', 'Alberto', 'Vera', 'Esptitia', 'Alberto Vera Esptitia', '998-888-9999', 'email@gmail.com');
INSERT INTO `clientes` VALUES ('24', 'sas', 'asas', 'asa', 'sas asas asa', 'asas', 'as@sasss.com');
INSERT INTO `clientes` VALUES ('25', 'asdsad', 'dsadasd', 'asdasd', 'asdsad dsadasd asdasd', 'sdadas', 'sad@dsdsd.com');

-- ----------------------------
-- Table structure for `disponibilidad`
-- ----------------------------
DROP TABLE IF EXISTS `disponibilidad`;
CREATE TABLE `disponibilidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipos_habitacion_id` int(11) NOT NULL,
  `disponibilidad` int(11) NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_disponibilidad_tipos_habitacion1` (`tipos_habitacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of disponibilidad
-- ----------------------------
INSERT INTO `disponibilidad` VALUES ('1', '5', '14', '2012-01-05 00:22:42');
INSERT INTO `disponibilidad` VALUES ('2', '6', '10', '2012-01-05 00:22:53');
INSERT INTO `disponibilidad` VALUES ('4', '7', '2', '2012-01-05 00:23:02');

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('1', '', 'Fully booked', 'All rooms are booked', '', '', '10', '7', '2010', '1278738000', '01:34');
INSERT INTO `events` VALUES ('2', '', 'Room is not available today', 'All rooms are booked', '', '', '11', '7', '2010', '1278824400', '00:00');
INSERT INTO `events` VALUES ('3', '', 'Room is not available today', 'All rooms are booked', '', '', '12', '7', '2010', '1278910800', '00:00');
INSERT INTO `events` VALUES ('4', '', 'Room is not available today', 'All rooms are booked', '', '', '13', '7', '2010', '1278997200', '00:00');

-- ----------------------------
-- Table structure for `habitacion`
-- ----------------------------
DROP TABLE IF EXISTS `habitacion`;
CREATE TABLE `habitacion` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of habitacion
-- ----------------------------
INSERT INTO `habitacion` VALUES ('7', 'Habitación San Justo', 'Recamara interior sin ventana, cama queen-size.', '128', '0', '0', '2', '1', '1');
INSERT INTO `habitacion` VALUES ('8', 'Habitación Sol', 'Recamara interior, cama queen-size con ventana al patio interior.', '128', '0', '0', '2', '1', '1');
INSERT INTO `habitacion` VALUES ('9', 'Habitación Luna', 'Recamara interior, cama queen-size con ventana al patio interior.', '128', '0', '0', '2', '1', '1');
INSERT INTO `habitacion` VALUES ('10', 'Habitación San Jose', 'Recamara interior sin ventana, 2 camas queen-size, espaciosa.', '149', '0', '0', '4', '1', '1');
INSERT INTO `habitacion` VALUES ('11', 'Habitación Princesa', 'Recamara interior sin ventana, cama queen-size.', '128', '0', '0', '2', '1', '1');
INSERT INTO `habitacion` VALUES ('12', 'Habitación San Felipe', 'Recamara interior sin ventana, 2 camas queen-size.', '149', '0', '0', '4', '1', '1');
INSERT INTO `habitacion` VALUES ('13', 'Habitación San Geronimo', 'Pequeña y acogedora recamara interior, cama queen-size.', '95', '0', '0', '2', '1', '1');
INSERT INTO `habitacion` VALUES ('14', 'Suite Presidencial', 'Nuestro Suite mas comodo y lujoso, acceso doble al balcón, con dos habitaciones privadas y la comodidad de dos salas. La cocina en granito con todos los enseres en acero inoxidable y bañera de hidroma', '269', '0', '0', '5', '1', '1');
INSERT INTO `habitacion` VALUES ('15', 'Suite Fortaleza', 'Suite con acceso al balcón, una sola habitación con 2 camas queen-size y un futón.\nSala y comedor, muy espacioso y con los techos altos caracteristicos del viejo San Juan.', '199', '0', '0', '5', '1', '1');
INSERT INTO `habitacion` VALUES ('16', 'Suite San Sebastian', 'Suite en patio interior con 2 recamaras, 2 camas queen-size y futón.\nCuenta con sala, comedor y cocina completamente equipada.', '239', '0', '0', '5', '1', '1');
INSERT INTO `habitacion` VALUES ('17', 'Suite San Cristobal', 'Suite con 2 recamaras, 2 camas queen-size y 1 futón.\nCuenta con 2 baños, comedor y una sala grande y amplia, en patio interior.', '249', '0', '0', '5', '1', '1');

-- ----------------------------
-- Table structure for `promocion`
-- ----------------------------
DROP TABLE IF EXISTS `promocion`;
CREATE TABLE `promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of promocion
-- ----------------------------
INSERT INTO `promocion` VALUES ('13', 'Temporada Mayo-Junio', '2014-05-01', '2014-06-15', '1');
INSERT INTO `promocion` VALUES ('14', 'Promoción Mes Patrio', '2014-09-01', '2014-09-30', '1');
INSERT INTO `promocion` VALUES ('15', 'holas', '2014-06-24', '2014-06-26', '0');

-- ----------------------------
-- Table structure for `reservacion`
-- ----------------------------
DROP TABLE IF EXISTS `reservacion`;
CREATE TABLE `reservacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `fechaLlegada` datetime NOT NULL,
  `fechaSalida` datetime NOT NULL,
  `estadoReservacionId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reservacion
-- ----------------------------
INSERT INTO `reservacion` VALUES ('2', '1002', '2', '2011-12-20 00:00:00', '2011-12-24 00:00:00', '4');
INSERT INTO `reservacion` VALUES ('9', '1009', '12', '2014-06-02 00:00:00', '2014-06-03 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('11', '1011', '14', '2014-06-02 00:00:00', '2014-06-03 00:00:00', '2');
INSERT INTO `reservacion` VALUES ('12', '1012', '15', '2014-06-04 00:00:00', '2014-06-05 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('13', '1013', '16', '2014-06-03 00:00:00', '2014-06-04 00:00:00', '2');
INSERT INTO `reservacion` VALUES ('14', '1014', '17', '2014-07-17 00:00:00', '2014-07-22 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('15', '1015', '18', '2014-06-06 00:00:00', '2014-06-07 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('16', '1016', '19', '2014-06-07 00:00:00', '2014-06-08 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('17', '1017', '20', '2014-06-08 00:00:00', '2014-06-09 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('18', '1018', '21', '2014-06-11 00:00:00', '2014-06-12 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('19', '1019', '22', '2014-06-11 00:00:00', '2014-06-11 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('20', '1020', '23', '2014-07-15 00:00:00', '2014-07-16 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('21', '1021', '24', '2014-07-15 00:00:00', '2014-07-16 00:00:00', '1');
INSERT INTO `reservacion` VALUES ('22', '1022', '25', '2014-07-15 00:00:00', '2014-07-16 00:00:00', '1');

-- ----------------------------
-- Table structure for `tb_reservation_master`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reservation_master`;
CREATE TABLE `tb_reservation_master` (
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
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reservation_master
-- ----------------------------
INSERT INTO `tb_reservation_master` VALUES ('58', '34', '2010-12-17', '2010-12-19', '1', '0', '0', '', 'Developer', 'Site', 'Lane-2', 'Cancun', 'test', '454545', 'Mexico', '34343', 'archanaunnidp14@hotmail.com', '321.48');
INSERT INTO `tb_reservation_master` VALUES ('57', '49', '2010-11-02', '2010-11-03', '1', '0', '0', '', 'Ron', 'Carlisle', 'First road', 'Xcalak', 'Quintana roo', '78678', 'Mexico', '361 937 3565', 'corpusdude69@aol.com', '53.58');
INSERT INTO `tb_reservation_master` VALUES ('56', '37', '2010-09-18', '2010-09-26', '1', '1', '1', '', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', '4343434', 'Mexico', '434343', 'archanaunni@gmail.com', '857.28');
INSERT INTO `tb_reservation_master` VALUES ('52', '53', '2010-09-07', '2010-09-09', '2', '1', '1', '', 'Jose Maria', 'Pastor', 'Director General', 'Cancun', 'Palya', '5454545', 'Mexico', '4545454', 'archanaunni@gmail.com', '321.48');
INSERT INTO `tb_reservation_master` VALUES ('53', '49', '2010-09-10', '2010-09-12', '1', '1', '0', '', 'Deepak', 'Krishna', 'General Manager', 'Great Cochin', 'Kerala', '989898', 'Mexico', '343433', 'archanaunni@gmail.com', '116.28');
INSERT INTO `tb_reservation_master` VALUES ('54', '46', '2010-09-21', '2010-09-23', '1', '1', '0', '', 'Nombre', 'Apellidos', 'DirecciÃƒÂ³n', 'Ciudad', 'Provincia', '4343343', 'Mexico', '3434343', 'archanaunni@gmail.com', '116.28');
INSERT INTO `tb_reservation_master` VALUES ('55', '40', '2010-09-22', '2010-09-25', '1', '1', '1', '', 'Nombre', 'Apellidos', 'DirecciÃƒÂ³n', 'Ciudad', 'Provincia', '4343434', 'Mexico', '45454545', 'archanaunni@gmail.com', '321.48');
INSERT INTO `tb_reservation_master` VALUES ('46', '26', '2010-08-01', '2010-08-04', '1', '1', '0', '', 'ffffsss', 'llllll', 'aaaaa', 'cccccc', 'sssss', '4343434', 'Mexico', '6566565', 'dsdsds@oooo.com', '399.60');
INSERT INTO `tb_reservation_master` VALUES ('50', '44', '2010-09-04', '2010-09-06', '1', '0', '0', '', 'Unni', 'Raj', 'TEst', 'test', 'tesst', '4343434', 'Mexico', '4545454', 'archanaunni@gmail.com', '107.16');
INSERT INTO `tb_reservation_master` VALUES ('51', '38', '2010-09-11', '2010-09-13', '1', '0', '0', '', 'Reema', 'Unni', 'Manager', 'Cochin', 'Kerala', '897978', 'Mexico', '98978888', 'archanaunni@gmail.com', '107.16');
INSERT INTO `tb_reservation_master` VALUES ('59', '51', '2010-12-17', '2010-12-19', '1', '0', '0', '', 'Developer', 'Site', 'Lane-2', 'Cancun', 'test', '454545', 'Mexico', '34343', 'archanaunnidp14@hotmail.com', '321.48');
INSERT INTO `tb_reservation_master` VALUES ('60', '35', '2010-12-17', '2010-12-19', '1', '0', '0', '', 'Developer', 'Site', 'Lane-2', 'Cancun', 'test', '454545', 'Mexico', '34343', 'archanaunnidp14@hotmail.com', '321.48');
INSERT INTO `tb_reservation_master` VALUES ('61', '44', '2011-08-05', '2011-08-06', '1', '0', '0', '', 'Kathleen', 'Campbell', '4729 NE Wistaria Dr.', 'Portland', 'Oregon', '97213', 'United States of America', '5035156225', 'kathy.campbell@chemeketa.edu', '157.32');
INSERT INTO `tb_reservation_master` VALUES ('62', '46', '2011-08-05', '2011-08-06', '1', '0', '0', '', 'Kathleen', 'Campbell', '4729 NE Wistaria Dr.', 'Portland', 'Oregon', '97213', 'United States of America', '5035156225', 'kathy.campbell@chemeketa.edu', '157.32');

-- ----------------------------
-- Table structure for `tb_room_master`
-- ----------------------------
DROP TABLE IF EXISTS `tb_room_master`;
CREATE TABLE `tb_room_master` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(20) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` char(3) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_room_master
-- ----------------------------
INSERT INTO `tb_room_master` VALUES ('7', '101', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('8', '102', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('9', '103', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('10', '104', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('11', '105', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('12', '106', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('13', '107', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('14', '108', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('15', '109', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('16', '110', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('17', '111', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('18', '112', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('19', '113', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('20', '114', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('21', '115', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('22', '116', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('23', '117', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('33', '213', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('32', '212', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('31', '211', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('27', '01', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('28', '02', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('29', '03', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('30', '04', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('34', '214', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('35', '215', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('36', '216', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('37', '217', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('38', '218', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('39', '221', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('40', '222', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('41', '223', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('42', '224', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('43', '225', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('44', '226', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('45', '227', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('46', '228', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('47', '231', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('48', '232', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('49', '233', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('50', '234', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('51', '235', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('52', '236', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('53', '237', '0', 'AV');
INSERT INTO `tb_room_master` VALUES ('54', '238', '0', 'AV');

-- ----------------------------
-- Table structure for `tb_special_rate`
-- ----------------------------
DROP TABLE IF EXISTS `tb_special_rate`;
CREATE TABLE `tb_special_rate` (
  `id_special_rate` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `adult_rate` float(8,2) NOT NULL,
  `child_rate` float(8,2) NOT NULL,
  `teenage_rate` float(8,2) NOT NULL,
  PRIMARY KEY (`id_special_rate`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_special_rate
-- ----------------------------
INSERT INTO `tb_special_rate` VALUES ('3', '7', '2010-08-25', '2010-12-23', '47.00', '4.00', '43.00');
INSERT INTO `tb_special_rate` VALUES ('5', '7', '2010-12-24', '2011-01-03', '64.00', '4.00', '60.00');
INSERT INTO `tb_special_rate` VALUES ('7', '7', '2011-01-04', '2011-04-15', '58.00', '4.00', '54.00');
INSERT INTO `tb_special_rate` VALUES ('6', '7', '2011-04-16', '2011-04-30', '67.50', '4.00', '63.50');
INSERT INTO `tb_special_rate` VALUES ('8', '7', '2011-05-01', '2011-07-07', '49.00', '4.00', '45.00');
INSERT INTO `tb_special_rate` VALUES ('9', '7', '2011-07-08', '2011-08-24', '58.00', '4.00', '54.00');
INSERT INTO `tb_special_rate` VALUES ('10', '7', '2011-08-25', '2011-12-23', '49.00', '4.00', '45.00');
INSERT INTO `tb_special_rate` VALUES ('11', '8', '2010-08-25', '2010-12-23', '55.00', '4.00', '51.00');
INSERT INTO `tb_special_rate` VALUES ('12', '8', '2010-12-24', '2011-01-03', '73.00', '4.00', '69.00');
INSERT INTO `tb_special_rate` VALUES ('13', '8', '2011-01-04', '2011-04-15', '66.50', '4.00', '62.50');
INSERT INTO `tb_special_rate` VALUES ('14', '8', '2011-04-16', '2011-04-30', '76.00', '4.00', '72.00');
INSERT INTO `tb_special_rate` VALUES ('15', '8', '2011-05-01', '2011-07-07', '58.00', '4.00', '54.00');
INSERT INTO `tb_special_rate` VALUES ('16', '8', '2011-07-08', '2011-08-24', '66.50', '4.00', '62.50');
INSERT INTO `tb_special_rate` VALUES ('17', '8', '2011-08-25', '2011-12-23', '58.00', '4.00', '54.00');
INSERT INTO `tb_special_rate` VALUES ('18', '9', '2010-08-25', '2010-12-23', '73.00', '4.00', '69.00');
INSERT INTO `tb_special_rate` VALUES ('19', '9', '2010-12-24', '2011-01-03', '92.00', '4.00', '88.00');
INSERT INTO `tb_special_rate` VALUES ('20', '9', '2011-01-04', '2011-04-15', '85.00', '4.00', '81.00');
INSERT INTO `tb_special_rate` VALUES ('21', '9', '2011-04-16', '2011-04-30', '95.00', '4.00', '91.00');
INSERT INTO `tb_special_rate` VALUES ('25', '9', '2011-07-08', '2011-08-24', '85.00', '4.00', '81.00');
INSERT INTO `tb_special_rate` VALUES ('24', '9', '2011-05-01', '2011-07-07', '74.50', '4.00', '70.50');
INSERT INTO `tb_special_rate` VALUES ('26', '9', '2011-08-25', '2011-12-23', '74.50', '4.00', '70.50');
INSERT INTO `tb_special_rate` VALUES ('27', '13', '2010-08-25', '2010-12-23', '82.50', '4.00', '78.50');
INSERT INTO `tb_special_rate` VALUES ('28', '13', '2010-12-24', '2011-01-03', '101.50', '4.00', '97.50');
INSERT INTO `tb_special_rate` VALUES ('29', '13', '2011-01-04', '2011-04-15', '94.50', '4.00', '90.50');
INSERT INTO `tb_special_rate` VALUES ('30', '13', '2011-04-16', '2011-04-30', '104.00', '4.00', '100.00');
INSERT INTO `tb_special_rate` VALUES ('31', '13', '2011-05-01', '2011-07-07', '84.00', '4.00', '80.00');
INSERT INTO `tb_special_rate` VALUES ('32', '13', '2011-07-08', '2011-08-24', '94.50', '4.00', '90.50');
INSERT INTO `tb_special_rate` VALUES ('33', '13', '2011-08-25', '2011-12-23', '84.00', '4.00', '80.00');

-- ----------------------------
-- Table structure for `tb_type_master`
-- ----------------------------
DROP TABLE IF EXISTS `tb_type_master`;
CREATE TABLE `tb_type_master` (
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_type_master
-- ----------------------------
INSERT INTO `tb_type_master` VALUES ('8', 'Superior', 'Superior', '55.00', '4.00', '51.00', '14.00', 'Superior. Aire acondicionado, internet inalÃƒÂ¡mbrico gratuito, tv con cable, caja de seguridad tamaÃƒÂ±o laptop.', 'Superior. Air conditioning, complimentary wireless internet, cable tv, laptop size safe deposit box.', '2', 'superior.jpg');
INSERT INTO `tb_type_master` VALUES ('7', 'EstÃƒÂ¡ndar', 'Standard', '47.00', '4.00', '43.00', '14.00', 'EstÃƒÂ¡ndar. Aire acondicionado, tv con cable, internet inalÃƒÂ¡mbrico gratuito, caja de seguridad tamaÃƒÂ±o laptop.', 'Standard. Air conditioning, cable tv, complimentary wireless internet, laptop size safe deposit box.', '1', 'Habitacion.JPG');
INSERT INTO `tb_type_master` VALUES ('9', 'Jr. Suite', 'Jr. Suite', '73.00', '4.00', '69.00', '14.00', 'Jr. Suite. Planta baja, aire acondicionado, internet inalÃƒÂ¡mbrico gratuito, tv con cable, caja de seguridad tamaÃƒÂ±o laptop, minibar, comedor.', 'Jr. Suite. Ground floor, complimentary wireless internet, cable tv, laptop size safe deposit box, minibar, dining table.', '3', 'fotos-3.png');
INSERT INTO `tb_type_master` VALUES ('13', 'Suite', 'Suite', '82.00', '4.00', '78.00', '14.00', 'Suite. Planta baja, 30 m2, aire acondicionado, internet inalÃƒÂ¡mbico gratuito, tv pantalla plana 32 pulgadas con cable, minibar, comedor, caja de seguridad tamaÃƒÂ±o laptop.', 'Suite. Ground floor, 320 ft2, air conditioning, complimentary wireless internet, 32 inch flat screen cable tv, minibar, dining table, laptop size safe deposit box.', '4', '');

-- ----------------------------
-- Table structure for `tb_type_room`
-- ----------------------------
DROP TABLE IF EXISTS `tb_type_room`;
CREATE TABLE `tb_type_room` (
  `id_type_room` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  PRIMARY KEY (`id_type_room`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_type_room
-- ----------------------------
INSERT INTO `tb_type_room` VALUES ('42', '8', '16', '110');
INSERT INTO `tb_type_room` VALUES ('33', '8', '7', '101');
INSERT INTO `tb_type_room` VALUES ('41', '8', '15', '109');
INSERT INTO `tb_type_room` VALUES ('34', '8', '8', '102');
INSERT INTO `tb_type_room` VALUES ('40', '8', '14', '108');
INSERT INTO `tb_type_room` VALUES ('35', '8', '9', '103');
INSERT INTO `tb_type_room` VALUES ('39', '8', '13', '107');
INSERT INTO `tb_type_room` VALUES ('38', '8', '12', '106');
INSERT INTO `tb_type_room` VALUES ('18', '7', '26', '120');
INSERT INTO `tb_type_room` VALUES ('17', '13', '26', '120');
INSERT INTO `tb_type_room` VALUES ('37', '8', '11', '105');
INSERT INTO `tb_type_room` VALUES ('16', '9', '25', '119');
INSERT INTO `tb_type_room` VALUES ('36', '8', '10', '104');
INSERT INTO `tb_type_room` VALUES ('23', '13', '0', '1');
INSERT INTO `tb_type_room` VALUES ('91', '13', '27', '01');
INSERT INTO `tb_type_room` VALUES ('25', '9', '0', '2');
INSERT INTO `tb_type_room` VALUES ('26', '9', '0', '3');
INSERT INTO `tb_type_room` VALUES ('30', '9', '28', '02');
INSERT INTO `tb_type_room` VALUES ('31', '9', '29', '03');
INSERT INTO `tb_type_room` VALUES ('32', '9', '30', '04');
INSERT INTO `tb_type_room` VALUES ('43', '8', '17', '111');
INSERT INTO `tb_type_room` VALUES ('44', '8', '18', '112');
INSERT INTO `tb_type_room` VALUES ('45', '8', '19', '113');
INSERT INTO `tb_type_room` VALUES ('46', '8', '20', '114');
INSERT INTO `tb_type_room` VALUES ('47', '8', '21', '115');
INSERT INTO `tb_type_room` VALUES ('48', '8', '22', '116');
INSERT INTO `tb_type_room` VALUES ('49', '8', '23', '117');
INSERT INTO `tb_type_room` VALUES ('50', '7', '31', '211');
INSERT INTO `tb_type_room` VALUES ('51', '7', '32', '212');
INSERT INTO `tb_type_room` VALUES ('52', '7', '33', '213');
INSERT INTO `tb_type_room` VALUES ('53', '7', '34', '214');
INSERT INTO `tb_type_room` VALUES ('54', '7', '35', '215');
INSERT INTO `tb_type_room` VALUES ('55', '7', '36', '216');
INSERT INTO `tb_type_room` VALUES ('56', '7', '37', '217');
INSERT INTO `tb_type_room` VALUES ('57', '7', '38', '218');
INSERT INTO `tb_type_room` VALUES ('58', '7', '0', '221');
INSERT INTO `tb_type_room` VALUES ('59', '7', '0', '222');
INSERT INTO `tb_type_room` VALUES ('60', '7', '0', '223');
INSERT INTO `tb_type_room` VALUES ('61', '7', '0', '224');
INSERT INTO `tb_type_room` VALUES ('62', '7', '0', '225');
INSERT INTO `tb_type_room` VALUES ('63', '7', '0', '226');
INSERT INTO `tb_type_room` VALUES ('64', '7', '0', '227');
INSERT INTO `tb_type_room` VALUES ('65', '7', '0', '228');
INSERT INTO `tb_type_room` VALUES ('66', '7', '0', '231');
INSERT INTO `tb_type_room` VALUES ('67', '7', '0', '232');
INSERT INTO `tb_type_room` VALUES ('68', '7', '0', '233');
INSERT INTO `tb_type_room` VALUES ('69', '7', '0', '234');
INSERT INTO `tb_type_room` VALUES ('70', '7', '0', '235');
INSERT INTO `tb_type_room` VALUES ('71', '7', '0', '236');
INSERT INTO `tb_type_room` VALUES ('72', '7', '0', '237');
INSERT INTO `tb_type_room` VALUES ('73', '7', '0', '238');
INSERT INTO `tb_type_room` VALUES ('74', '7', '39', '221');
INSERT INTO `tb_type_room` VALUES ('75', '7', '40', '222');
INSERT INTO `tb_type_room` VALUES ('76', '7', '41', '223');
INSERT INTO `tb_type_room` VALUES ('77', '7', '42', '224');
INSERT INTO `tb_type_room` VALUES ('78', '7', '43', '225');
INSERT INTO `tb_type_room` VALUES ('79', '7', '44', '226');
INSERT INTO `tb_type_room` VALUES ('80', '7', '45', '227');
INSERT INTO `tb_type_room` VALUES ('81', '7', '46', '228');
INSERT INTO `tb_type_room` VALUES ('82', '7', '47', '231');
INSERT INTO `tb_type_room` VALUES ('83', '7', '48', '232');
INSERT INTO `tb_type_room` VALUES ('84', '7', '49', '233');
INSERT INTO `tb_type_room` VALUES ('85', '7', '50', '234');
INSERT INTO `tb_type_room` VALUES ('86', '7', '51', '235');
INSERT INTO `tb_type_room` VALUES ('87', '7', '52', '236');
INSERT INTO `tb_type_room` VALUES ('88', '7', '53', '237');
INSERT INTO `tb_type_room` VALUES ('89', '7', '54', '238');

-- ----------------------------
-- Table structure for `tbl_admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin_users`;
CREATE TABLE `tbl_admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `user_type` enum('SA','A') DEFAULT 'SA' COMMENT 'SA: Super Admin,A: Admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_admin_users
-- ----------------------------
INSERT INTO `tbl_admin_users` VALUES ('1', 'demo', 'abhishek@devzone.co.in', '7e466fc01a0c7932e96a4a925b11b06a', '0', 'SA');

-- ----------------------------
-- Table structure for `temporada`
-- ----------------------------
DROP TABLE IF EXISTS `temporada`;
CREATE TABLE `temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of temporada
-- ----------------------------
INSERT INTO `temporada` VALUES ('3', 'Spring Break', '2014-04-02', '2014-04-25', '1');
INSERT INTO `temporada` VALUES ('6', 'Verano', '2014-07-06', '2014-08-24', '1');
INSERT INTO `temporada` VALUES ('8', 'Independencia de Mexico', '2014-09-10', '2014-09-16', '1');
INSERT INTO `temporada` VALUES ('11', 'Epoca Navideña', '2014-03-06', '2014-03-21', '1');
INSERT INTO `temporada` VALUES ('12', 'sadasd', '2014-05-24', '2014-05-24', '0');
INSERT INTO `temporada` VALUES ('13', 'qwqwqw', '2014-05-26', '2014-05-26', '0');

-- ----------------------------
-- Table structure for `xref_dispon_temporadas`
-- ----------------------------
DROP TABLE IF EXISTS `xref_dispon_temporadas`;
CREATE TABLE `xref_dispon_temporadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temporadas_id` int(11) NOT NULL,
  `tipos_habitacion_id` int(11) NOT NULL,
  `disponibilidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xref_tipos_temporadas_tipos_habitacion` (`tipos_habitacion_id`),
  KEY `fk_xref_tipos_temporadas_temporadas1` (`temporadas_id`),
  CONSTRAINT `xref_dispon_temporadas_ibfk_1` FOREIGN KEY (`temporadas_id`) REFERENCES `temporada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `xref_dispon_temporadas_ibfk_2` FOREIGN KEY (`tipos_habitacion_id`) REFERENCES `habitacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of xref_dispon_temporadas
-- ----------------------------

-- ----------------------------
-- Table structure for `xref_habitacion_promocion`
-- ----------------------------
DROP TABLE IF EXISTS `xref_habitacion_promocion`;
CREATE TABLE `xref_habitacion_promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promocionId` int(11) NOT NULL,
  `habitacionId` int(11) NOT NULL,
  `precioStd` double DEFAULT NULL,
  `precioAdultoExtra` double DEFAULT NULL,
  `precioNinioExtra` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of xref_habitacion_promocion
-- ----------------------------
INSERT INTO `xref_habitacion_promocion` VALUES ('129', '14', '5', '11', '22', '33');
INSERT INTO `xref_habitacion_promocion` VALUES ('130', '14', '6', null, '44', '55');
INSERT INTO `xref_habitacion_promocion` VALUES ('131', '14', '7', null, '66', '7777');
INSERT INTO `xref_habitacion_promocion` VALUES ('135', '15', '5', '33', '44', '555');
INSERT INTO `xref_habitacion_promocion` VALUES ('136', '15', '6', null, '55', null);
INSERT INTO `xref_habitacion_promocion` VALUES ('144', '13', '7', '110', '0', null);
INSERT INTO `xref_habitacion_promocion` VALUES ('145', '13', '8', '110', null, null);
INSERT INTO `xref_habitacion_promocion` VALUES ('146', '13', '9', '110', null, null);
INSERT INTO `xref_habitacion_promocion` VALUES ('147', '13', '10', '130', null, null);
INSERT INTO `xref_habitacion_promocion` VALUES ('148', '13', '17', '1', null, null);

-- ----------------------------
-- Table structure for `xref_habitacion_reservacion`
-- ----------------------------
DROP TABLE IF EXISTS `xref_habitacion_reservacion`;
CREATE TABLE `xref_habitacion_reservacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservacionId` int(11) NOT NULL,
  `habitacionId` int(11) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `promocionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of xref_habitacion_reservacion
-- ----------------------------
INSERT INTO `xref_habitacion_reservacion` VALUES ('1', '1', '7', '250', '1', '1');
INSERT INTO `xref_habitacion_reservacion` VALUES ('2', '2', '7', '250', '1', '2');
INSERT INTO `xref_habitacion_reservacion` VALUES ('3', '3', '8', '250', '1', '2');
INSERT INTO `xref_habitacion_reservacion` VALUES ('4', '4', '8', '700', '1', '1');
INSERT INTO `xref_habitacion_reservacion` VALUES ('5', '5', '9', '250', '1', '2');
INSERT INTO `xref_habitacion_reservacion` VALUES ('6', '6', '9', '250', '1', '2');
INSERT INTO `xref_habitacion_reservacion` VALUES ('7', '7', '9', '700', '1', '2');
INSERT INTO `xref_habitacion_reservacion` VALUES ('8', '9', '7', '110', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('9', '10', '7', '110', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('10', '11', '7', '110', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('11', '11', '8', '110', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('12', '12', '7', '110', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('13', '13', '7', '110', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('14', '14', '7', '640', '1', '0');
INSERT INTO `xref_habitacion_reservacion` VALUES ('15', '15', '7', '1', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('16', '16', '7', '1', '0', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('17', '17', '7', '1', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('18', '18', '8', '1', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('19', '19', '7', '1', '1', '13');
INSERT INTO `xref_habitacion_reservacion` VALUES ('20', '20', '7', '128', '1', '0');
INSERT INTO `xref_habitacion_reservacion` VALUES ('21', '21', '9', '128', '1', '0');
INSERT INTO `xref_habitacion_reservacion` VALUES ('22', '22', '14', '269', '1', '0');

-- ----------------------------
-- Table structure for `xref_habitacion_temporada`
-- ----------------------------
DROP TABLE IF EXISTS `xref_habitacion_temporada`;
CREATE TABLE `xref_habitacion_temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temporadaId` int(11) NOT NULL,
  `habitacionId` int(11) NOT NULL,
  `precioStd` double DEFAULT NULL,
  `precioAdultoExtra` double DEFAULT NULL,
  `precioNinioExtra` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of xref_habitacion_temporada
-- ----------------------------
INSERT INTO `xref_habitacion_temporada` VALUES ('113', '3', '5', '1000', '1000', '1000');
INSERT INTO `xref_habitacion_temporada` VALUES ('114', '3', '6', '200', '200', '200');
INSERT INTO `xref_habitacion_temporada` VALUES ('115', '3', '7', '3', null, '3');
INSERT INTO `xref_habitacion_temporada` VALUES ('116', '3', '11', '5', null, '5');
INSERT INTO `xref_habitacion_temporada` VALUES ('117', '3', '12', '6', '6', null);
INSERT INTO `xref_habitacion_temporada` VALUES ('118', '3', '13', null, '7', '7');
INSERT INTO `xref_habitacion_temporada` VALUES ('119', '13', '5', '22', '333333', '333');
INSERT INTO `xref_habitacion_temporada` VALUES ('120', '13', '6', null, null, '4444');
INSERT INTO `xref_habitacion_temporada` VALUES ('121', '13', '7', null, '44', null);
