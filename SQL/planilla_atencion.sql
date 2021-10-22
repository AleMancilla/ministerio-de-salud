/*
Navicat MySQL Data Transfer

Source Server         : local_
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pncad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-10-21 18:46:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for planilla_atencion
-- ----------------------------
DROP TABLE IF EXISTS `planilla_atencion`;
CREATE TABLE `planilla_atencion` (
  `usuario` varchar(20) DEFAULT NULL,
  `cod_planilla` int(4) NOT NULL AUTO_INCREMENT,
  `cod_edan` int(4) DEFAULT NULL,
  `depto` varchar(20) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `comunidad` varchar(100) DEFAULT NULL,
  `nomestablecimiento` varchar(70) CHARACTER SET latin1 DEFAULT NULL,
  `gerencia_red` varchar(70) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `evento` varchar(50) DEFAULT NULL,
  `nombre_responsable` varchar(50) DEFAULT NULL,
  `cargo_responsable` varchar(50) DEFAULT NULL,
  `telf_responsable` varchar(10) DEFAULT NULL,
  `enviado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_planilla`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planilla_atencion
-- ----------------------------
INSERT INTO `planilla_atencion` VALUES ('jose atencion', '6', '10', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Comunidad San jorge', 'MUNICIPAL SANTA ROSA', 'Guarayos', '200', '2018-05-11', '12:49:03', 'Inundación lenta', 'jose quisbert', 'medico safci', '71038236', 'SI');
INSERT INTO `planilla_atencion` VALUES ('jose atencion', '7', '11', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Barrio San Juan', 'GUARAYOS', 'Guarayos', '20', '2018-05-11', '12:55:48', 'Convulsión social', 'jorge', 'presidente otb', '000', 'SI');
INSERT INTO `planilla_atencion` VALUES ('fabiola', '8', '19', 'LA PAZ', 'LA PAZ', 'Calacoto', 'ACHUMANI', null, null, '2018-05-11', '15:27:27', 'Mazamorra', 'Fabiola Michel', 'Punto Focal de Departamento de Emergencias en Salu', '72061509', 'SI');
INSERT INTO `planilla_atencion` VALUES ('fabiola', '9', '19', 'LA PAZ', 'LA PAZ', 'Calacoto', 'ACHUMANI PROSALUD', null, null, '2018-05-11', '15:38:11', 'Mazamorra', 'Fabiola Michel', 'Punto Focal de Departamento de Emergencias en Salu', '72061509', 'SI');
INSERT INTO `planilla_atencion` VALUES ('edwin', '10', '22', 'LA PAZ', 'EL ALTO', 'El ALTO', '12 DE OCTUBRE', '2', '22222', '2018-05-11', '16:01:42', 'Biológico', 'franz', 'medico', '78766059', 'SI');
INSERT INTO `planilla_atencion` VALUES ('keilahelen', '11', '20', 'COCHABAMBA', 'CHIMORE', 'SANTA Anita', 'SANTA ANITA', 'Red Indigena de Salud', '450', '2018-01-05', '14:30:00', 'Desporde de rio (inund. rapida)', 'David Delgado', 'Lic en enfermeria', '67596222', 'SI');
INSERT INTO `planilla_atencion` VALUES ('rubencastillo', '12', '12', 'COCHABAMBA', 'CHIMORE', 'Barrio mapajo', 'ESTANO PALMITO', 'Ivirgarzama', '200', '2018-03-06', '16:41:37', 'Desporde de rio (inund. rapida)', 'Rubén Castillo', 'Responsable vigilancia epidemiológica', '73765220', 'SI');
INSERT INTO `planilla_atencion` VALUES ('jose atencion', '13', '11', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Barrio San Juan', 'MUNICIPAL SANTA ROSA', 'Guarayos', '500', '2018-05-12', '07:23:20', 'Convulsión social', 'carlos', 'presidente de barrio', '555555', 'SI');
INSERT INTO `planilla_atencion` VALUES ('jose atencion', '14', '10', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Comunidad San jorge', 'SAN PABLO', 'Guarayos', '2000', '2018-05-12', '07:38:37', 'Inundación lenta', 'alvis', 'enfermero', '33333', 'SI');
INSERT INTO `planilla_atencion` VALUES ('ronaldali', '15', '25', 'PANDO', 'COBIJA', 'Mapajo', 'MAPAJO', 'Red 01 cobija', '11205', '2018-05-18', '11:29:23', 'Desporde de rio (inund. rapida)', 'Ivan sobrino pereira', 'Tecnico salud ambiental7', '71262418', 'SI');
INSERT INTO `planilla_atencion` VALUES ('remylazaro', '16', '25', 'BENI', 'TRINIDAD', 'Comunidad Puerto Ballivian', 'PUERTO BALLIVIAN', '01', '1100', '2018-05-15', '13:08:34', 'Desporde de rio (inund. rapida)', 'Dr. Ariel Sejas', 'jefe medico de area', '73914881', 'SI');
INSERT INTO `planilla_atencion` VALUES ('ronaldali', '17', '25', 'PANDO', 'BELLA FLOR', 'Comunidad palacio', 'CON CAMAS SANTA LUCIA', 'Red 01 cobija', '150', '2018-05-18', '13:20:41', 'Desporde de rio (inund. rapida)', 'Ivan sobrino pereira', 'Tecnico salud ambiental', '71262418', 'SI');
INSERT INTO `planilla_atencion` VALUES ('jose atencion', '18', '10', 'SANTA CRUZ', 'ASCENCION DE GUARAYOS', 'Comunidad San jorge', 'CERRO GRANDE', 'guarayos', '100', '2018-05-15', '20:40:22', 'Inundación lenta', 'carlos', 'salud', '2222', 'SI');
