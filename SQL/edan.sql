/*
Navicat MySQL Data Transfer

Source Server         : local_
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pncad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-09-27 21:58:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for edan
-- ----------------------------
DROP TABLE IF EXISTS `edan`;
CREATE TABLE `edan` (
  `cod_edan` int(4) NOT NULL AUTO_INCREMENT,
  `evento` varchar(50) DEFAULT NULL,
  `clase_evento` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `continua` varchar(2) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `dreccion` varchar(70) DEFAULT NULL,
  `tel_fc` varchar(10) DEFAULT NULL,
  `tel_cc` varchar(10) DEFAULT NULL,
  `depto` varchar(20) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `comunidad` varchar(100) DEFAULT NULL,
  `tiene_coord` varchar(1) DEFAULT NULL,
  `coordenada_x` varchar(20) DEFAULT NULL,
  `coordenada_y` varchar(20) DEFAULT NULL,
  `aereo` varchar(10) DEFAULT NULL,
  `terrestre` varchar(10) DEFAULT NULL,
  `fluvial` varchar(10) DEFAULT NULL,
  `ferroviario` varchar(10) DEFAULT NULL,
  `partida` varchar(50) DEFAULT NULL,
  `hora_llegada` varchar(2) DEFAULT NULL,
  `clima` varchar(10) DEFAULT NULL,
  `medio_comunicacion` varchar(30) DEFAULT NULL,
  `viviendas` int(11) DEFAULT NULL,
  `familias` int(11) DEFAULT NULL,
  `agua` varchar(10) DEFAULT NULL,
  `basura` varchar(10) DEFAULT NULL,
  `alcantarillado` varchar(10) DEFAULT NULL,
  `electricidad` varchar(10) DEFAULT NULL,
  `telecom` varchar(10) DEFAULT NULL,
  `transporte` varchar(10) DEFAULT NULL,
  `heridos` int(11) DEFAULT NULL,
  `muertos` int(11) DEFAULT NULL,
  `desaparecidos` int(11) DEFAULT NULL,
  `acciones_prioritarias` mediumtext,
  `lugar_lle` varchar(50) DEFAULT NULL,
  `fecha_lle` date DEFAULT NULL,
  `hora_lle` time DEFAULT NULL,
  `responsable_lle` varchar(50) DEFAULT NULL,
  `cargo_lle` varchar(50) DEFAULT NULL,
  `telf_fijo_lle` varchar(10) DEFAULT NULL,
  `telf_cel_lle` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `fechap` date DEFAULT NULL,
  `enviado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_edan`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edan
-- ----------------------------
INSERT INTO `edan` VALUES ('9', 'Inundación lenta', null, '2018-05-11', '12:14:44', 'no', 'José', 'Medico', 'joseqf3gmail.com', '71038236', '71038236', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'San Pablo', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', 'Ascensión', '20', 'nublado', 'telf_movil', '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', null, 'Ascensión', '2018-05-11', '12:14:44', 'José Quisbert', 'Coordinador municipal Safci Mi Salud', '71038236', '71038236', 'joseqf3@gmail.com', 'jose', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('10', 'Inundación lenta', null, '2018-05-11', '12:25:42', 'no', 'José', 'Medico', 'Ascensión', '71038236', '71038236', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Comunidad San jorge', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', 'Ascensión', '2', null, null, '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', null, null, '2018-05-11', '12:25:42', null, null, null, null, null, 'jose', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('11', 'Convulsión social', null, '2018-05-11', '12:27:13', 'no', 'Julio', 'Presidente barrial', 'Barrio Fe y Alegría', '0000000', '71038236', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Barrio San Juan', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', 'Ascensión', '1', 'conviento', 'telf_movil,radio_emi', '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', null, null, '2018-05-11', '12:27:13', 'Medico', 'Medico', '71038236', '000', 'joseqf3@gmail.com', 'jose', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('12', 'Desporde de rio (inund. rapida)', null, '2018-05-11', '13:54:38', 'si', 'Remy lazaro', 'Responsable del programa de desastres', 'C/mosetenez 125', '0', '72872161', 'BENI', 'TRINIDAD', 'Puerto almacen', 'n', null, null, 'sindano', 'afectado', 'sindano', 'sindano', 'Trinidad', '1', 'lluvioso', 'telf_movil', '30', '49', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', 'Evacuación de familias afectadas', null, '2018-05-11', '13:54:38', null, null, null, null, null, 'remy', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('17', 'Desporde de rio (inund. rapida)', null, '2017-12-23', '14:21:21', 'si', 'Hector Orosco', 'CLS', 'LA MISION', null, '60374426', 'COCHABAMBA', 'CHIMORE', 'Rio Chapare', 'n', null, null, 'sindano', 'destruido', 'afectado', 'sindano', 'Chimore', '3', 'lluvioso', 'telf_movil', '5', '75', 'afectado', 'noexiste', 'noexiste', 'afectado', 'afectado', 'afectado', '0', '0', '0', 'Atencion medica brigada a todas las.comunidades afectadas\r\nEvacuación de viviendas afectadas\r\nEducacion en acciones de prevencion con agua segura', 'CHIMORE', '2017-12-23', '20:00:00', 'MARIBEL MARCOS SILES', 'MEDICA MI SALUD  LA MISION', null, '72799070', null, 'keila', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('18', 'Desporde de rio (inund. rapida)', null, '2015-02-22', '22:50:00', 'no', 'Juan Perez Moscozo', 'Comunario', 'Comunidad Palacio', '00000000', '72311456', 'PANDO', 'BELLA FLOR', 'Florida', 'n', null, null, 'sindano', 'afectado', 'sindano', 'sindano', 'De Cobija', '5', 'lluvioso', 'radio', '15', '20', 'noexiste', 'noexiste', 'noexiste', 'noexiste', 'noexiste', 'afectado', '0', '0', '0', 'Atencion medica. Dotacion de potabilizadores de agua.', 'Comunidad florida', '2015-02-23', '08:30:00', 'Ivan sobrino pereira', 'Tec. De programa salud ambiental', '0000000000', '72630011', 'Ivan@hotmail.com', 'ronald', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('19', 'Mazamorra', null, '2018-05-11', '14:35:27', 'si', 'Fabiola Michel', 'PF Emergencias OPS', 'Callo 18 de Calacoto, 1234', '2979730', '72061509', 'LA PAZ', 'LA PAZ', 'Calacoto', 'y', null, null, 'sindano', 'afectado', 'sindano', 'sindano', 'Plaza El Estudainte, zona Central', '1', 'lluvioso', 'telf_fijo,television,radio_emi', '0', '0', 'destruido', 'noexiste', 'destruido', 'destruido', 'destruido', 'noexiste', '0', '0', '0', 'Coordinacion con la gerencie red\r\nCoordinaci[on con el COE Municipal\r\nReporte al PNCAD\r\nRevision insumos y recursos disponibles', 'Calacoto', '2018-05-11', '14:35:27', 'Fabiola Michel', 'PF Departamento de Emergencias Sanitarias OPS', '2979730', '72061509', 'michelif@paho.org', 'Michel', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('20', 'Desporde de rio (inund. rapida)', null, '2012-02-18', '04:35:24', 'si', 'Maria mamani choque', 'Presidente de barrio', 'Barrio mapajo', '00000000', '71123534', 'PANDO', 'COBIJA', 'Barrio mapajo', 'n', null, null, 'sindano', 'afectado', 'sindano', 'sindano', 'Zona central', '1', 'lluvioso', 'telf_fijo,telf_movil,televisio', '20', '70', 'afectado', 'afectado', 'afectado', 'afectado', 'sindano', 'afectado', '0', '0', '0', 'Atencion medica integral', 'Cobija', '2012-02-19', '14:35:24', 'Ronald ali', 'Resp. Programa salud ambiental y desastres', '0000000000', '71262418', 'ronaldalito@hotmail.com', 'ronald', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('21', 'Plagas', null, '2018-05-08', '14:59:04', 'si', 'Fabiola Michel', 'PF Departamento de Emergencias en Salud PHE', 'Sacaba, barrio petrolero', '2979730', '72061509', 'COCHABAMBA', 'SACABA', 'los porteros', 'y', null, null, 'sindano', 'sindano', 'sindano', 'sindano', null, null, null, null, '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', null, null, '2018-05-11', '14:59:04', null, null, null, null, null, 'Michel', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('22', 'Biológico', null, '2018-05-11', '15:42:59', 'si', 'franz colque', 'medico', null, null, '78766059', 'LA PAZ', 'EL ALTO', 'El ALTO', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', 'Terrestre', '2', 'lluvioso', 'radio,telf_fijo,telf_movil,tel', '2', '40', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '1', '3', '3', 'Prevención', 'la paz', '2018-05-11', '15:42:59', 'franz colque', 'medico', '22308735', '78766059', 'franzcoti@hotmail.com', 'franzcoti', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('23', 'Desporde de rio (inund. rapida)', null, '2018-02-14', '16:34:08', 'si', 'Cindy Palabral', 'Medico', null, null, '72052874', 'LA PAZ', 'PALCA', 'Palca', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', 'San Pedro', '2', 'lluvioso', 'radio,telf_fijo,telf_movil,tel', '33', '18', 'destruido', 'afectado', 'destruido', 'afectado', 'afectado', 'afectado', '0', '0', '0', 'Movilización de 3 médicos, 2 enfermeros, 4 internos', 'Palca', '2018-05-11', '16:34:08', 'Cindy Palabral', 'Medico', null, '72052874', null, 'cindy', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('24', 'Desporde de rio (inund. rapida)', null, '2018-05-11', '16:05:49', 'si', 'Sr. Carlos López', 'Presidente comunidad Pedro Ignacio Muiba', 'Frente a escuela', null, '72192275', 'BENI', 'SAN JAVIER(BNI)', 'Comunidad Pedro Ignacio Muiba', 'n', null, null, 'sindano', 'afectado', 'sindano', 'sindano', 'Trinidad', '4', 'lluvioso', 'telf_fijo', '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', 'Desplazamiento de Brigada médica y evacuación de familias afectadas', null, '2018-05-11', '17:05:49', null, null, null, null, null, 'remy', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('25', 'Desporde de rio (inund. rapida)', null, '2018-05-11', '17:41:04', 'no', 'Dr Carlos Sejas', 'Jefe médico centro de Salud Ballivian', 'C/isiboro N 344', '0', '73914881', 'BENI', 'TRINIDAD', 'Comunidad Puerto Ballivian', 'n', null, null, 'sindano', 'afectado', 'sindano', 'sindano', 'Trinidad', '1', 'nublado', 'telf_movil', '10', '15', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', 'Evacuación de familias afectadas', 'Puerto Ballivian', '2018-05-11', '17:41:04', 'Dr Sejas', 'Jefe medico', null, '73914881', null, 'remy', '2018-05-11', 'SI');
INSERT INTO `edan` VALUES ('26', 'Deslizamiento', null, '2018-05-21', '15:50:44', 'no', 'cdsc', 'cdscds', null, null, '3333', 'CHUQUISACA', 'CULPINA', 'cdscds', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', null, null, null, null, '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', null, null, '2018-05-21', '15:50:44', null, null, null, null, null, 'keila', '2018-05-21', 'NO');
INSERT INTO `edan` VALUES ('27', 'Nevada', null, '2021-09-27', '12:49:21', 'no', 'aaaaaa', 'vfdvf', null, null, '43545', 'CHUQUISACA', 'SAN LUCAS', 'san lucas', 'n', null, null, 'sindano', 'sindano', 'sindano', 'sindano', null, null, null, null, '0', '0', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', 'sindano', '0', '0', '0', null, null, '2021-09-27', '12:49:21', null, null, null, null, null, 'tecnico1', '2021-09-27', 'NO');
