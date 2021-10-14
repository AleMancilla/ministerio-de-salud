/*
Navicat MySQL Data Transfer

Source Server         : local_
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pncad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-09-27 21:59:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evento
-- ----------------------------
DROP TABLE IF EXISTS `evento`;
CREATE TABLE `evento` (
  `codevento` int(11) NOT NULL AUTO_INCREMENT,
  `nomevento` varchar(50) DEFAULT NULL,
  `snis` varchar(50) DEFAULT NULL,
  `num_snis` int(11) DEFAULT NULL,
  PRIMARY KEY (`codevento`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evento
-- ----------------------------
INSERT INTO `evento` VALUES ('1', 'Sequia', 'Otros', '22');
INSERT INTO `evento` VALUES ('2', 'Granizada', 'Helada/Granizada/Nevada', '18');
INSERT INTO `evento` VALUES ('3', 'Mazamorra', 'Otros', '22');
INSERT INTO `evento` VALUES ('4', 'Incendio', 'Incendio', '19');
INSERT INTO `evento` VALUES ('5', 'Deslizamiento', 'Deslizamiento/Sismo/Terremoto', '20');
INSERT INTO `evento` VALUES ('6', 'Helada', 'Helada/Granizada/Nevada', '18');
INSERT INTO `evento` VALUES ('8', 'Inundación lenta', 'Inundación lenta', '21');
INSERT INTO `evento` VALUES ('9', 'Convulsión social', 'Otros', '22');
INSERT INTO `evento` VALUES ('10', 'Accidentes por prod. y sust. peligrosas', 'Otros', '22');
INSERT INTO `evento` VALUES ('11', 'Desporde de rio (inund. rapida)', 'Otros', '22');
INSERT INTO `evento` VALUES ('12', 'Plagas', 'Otros', '22');
INSERT INTO `evento` VALUES ('13', 'Biológico', 'Otros', '22');
INSERT INTO `evento` VALUES ('14', 'Riada', 'Riada', '17');
INSERT INTO `evento` VALUES ('16', 'Nevada', 'Helada/Granizada/Nevada', '18');
INSERT INTO `evento` VALUES ('17', 'Terremoto', 'Deslizamiento/Sismo/Terremoto', '20');
INSERT INTO `evento` VALUES ('18', 'Otros de excepción', 'Otros', '22');
