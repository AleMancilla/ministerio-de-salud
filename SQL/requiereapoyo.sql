/*
Navicat MySQL Data Transfer

Source Server         : local_
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pncad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-09-27 21:59:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for requiereapoyo
-- ----------------------------
DROP TABLE IF EXISTS `requiereapoyo`;
CREATE TABLE `requiereapoyo` (
  `codrequeri` varchar(12) NOT NULL,
  `nomrequeri` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`codrequeri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requiereapoyo
-- ----------------------------
INSERT INTO `requiereapoyo` VALUES ('1', 'Medicamentos e insumos médicos');
INSERT INTO `requiereapoyo` VALUES ('2', 'Agua y saneamiento ambiental');
INSERT INTO `requiereapoyo` VALUES ('3', 'Productos químicos (plaguicidas e insecticidas)');
INSERT INTO `requiereapoyo` VALUES ('4', 'Alimentos y bebidas');
INSERT INTO `requiereapoyo` VALUES ('5', 'Albergue vivienda electricidad construcción');
INSERT INTO `requiereapoyo` VALUES ('6', 'Necesidades personales');
INSERT INTO `requiereapoyo` VALUES ('7', 'Recursos humanos');
INSERT INTO `requiereapoyo` VALUES ('8', 'Equipamiento médico');
INSERT INTO `requiereapoyo` VALUES ('9', 'Carpa para consultorio ambulante');
INSERT INTO `requiereapoyo` VALUES ('10', 'Combustibles y lubricantes');
INSERT INTO `requiereapoyo` VALUES ('11', 'Material eléctrico');
INSERT INTO `requiereapoyo` VALUES ('12', 'Generadores eléctricos');
