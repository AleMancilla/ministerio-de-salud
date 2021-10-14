/*
Navicat MySQL Data Transfer

Source Server         : local_
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pncad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-09-27 21:59:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for personalsalud
-- ----------------------------
DROP TABLE IF EXISTS `personalsalud`;
CREATE TABLE `personalsalud` (
  `codpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `tipopersonal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codpersonal`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personalsalud
-- ----------------------------
INSERT INTO `personalsalud` VALUES ('14', 'Medicos');
INSERT INTO `personalsalud` VALUES ('15', 'Medicos tradicionales');
INSERT INTO `personalsalud` VALUES ('16', 'Enfermeras');
INSERT INTO `personalsalud` VALUES ('17', 'Tecnicos');
INSERT INTO `personalsalud` VALUES ('18', 'Otros profesionales en salud');
