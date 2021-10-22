/*
Navicat MySQL Data Transfer

Source Server         : local_
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pncad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-10-21 18:47:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for planilla_detalle
-- ----------------------------
DROP TABLE IF EXISTS `planilla_detalle`;
CREATE TABLE `planilla_detalle` (
  `cod_detalle` int(4) NOT NULL AUTO_INCREMENT,
  `cod_planilla` int(4) DEFAULT NULL,
  `edad` int(4) DEFAULT NULL,
  `sexo` varchar(6) DEFAULT NULL,
  `diagnostico` varchar(50) DEFAULT NULL,
  `cantidad` int(4) DEFAULT NULL,
  PRIMARY KEY (`cod_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planilla_detalle
-- ----------------------------
INSERT INTO `planilla_detalle` VALUES ('48', '6', '4', 'h', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('49', '6', '62', 'm', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('50', '6', '50', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('51', '7', '52', 'h', 'Causas de atención', '1');
INSERT INTO `planilla_detalle` VALUES ('52', '7', '45', 'h', 'Otras causas', '1');
INSERT INTO `planilla_detalle` VALUES ('53', '8', '15', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('54', '8', '56', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('55', '8', '67', 'h', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('56', '9', '65', 'h', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('57', '9', '34', 'm', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('58', '9', '12', 'h', 'Afecciones de piel Sarcoptosis', '1');
INSERT INTO `planilla_detalle` VALUES ('59', '9', '3', 'm', 'Diarrea con deshidratación grave', '1');
INSERT INTO `planilla_detalle` VALUES ('60', '9', '40', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('61', '9', '15', 'h', 'Infección respiratoria aguda (IRA) con neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('62', '9', '23', 'm', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('63', '9', '45', 'h', 'Diarrea con deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('64', '9', '26', 'h', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('65', '9', '45', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('66', '9', '2', 'h', 'Diarrea con deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('67', '9', '35', 'h', 'Infección respiratoria aguda (IRA) con neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('68', '9', '38', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('69', '9', '23', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('70', '9', '56', 'h', 'Sindrome febril(no especificado en el formulario)', '1');
INSERT INTO `planilla_detalle` VALUES ('71', '9', '17', 'h', 'Infecciones de Transmisión Sexual(ITS)', '1');
INSERT INTO `planilla_detalle` VALUES ('72', '9', '33', 'h', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('73', '9', '45', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('74', '9', '60', 'm', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('75', '9', '45', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('76', '9', '37', 'h', 'Diarrea con deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('77', '9', '24', 'h', 'Afecciones de piel Sarcoptosis', '1');
INSERT INTO `planilla_detalle` VALUES ('78', '9', '18', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('79', '9', '67', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('80', '9', '54', 'm', 'Sospecha de Meningitis', '1');
INSERT INTO `planilla_detalle` VALUES ('81', '9', '43', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('82', '9', '32', 'm', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('83', '9', '23', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('84', '9', '32', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('85', '9', '14', 'h', 'Diarrea con deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('86', '10', '33', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('87', '10', '22', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('88', '10', '45', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('89', '10', '23', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('90', '11', '28', 'm', 'Infección respiratoria aguda (IRA) sin neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('91', '11', '22', 'm', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('92', '11', '18', 'm', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('93', '11', '1', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('94', '11', '36', 'm', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('95', '11', '2', 'h', 'Parasitosis intestinal', '1');
INSERT INTO `planilla_detalle` VALUES ('96', '11', '23', 'm', 'Otras causas', '1');
INSERT INTO `planilla_detalle` VALUES ('97', '11', '8', 'm', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('98', '11', '23', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('99', '11', '3', 'm', 'Parasitosis intestinal', '1');
INSERT INTO `planilla_detalle` VALUES ('100', '11', '57', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('101', '11', '21', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('102', '11', '57', 'h', 'Traumatismo y otras de causa externa', '1');
INSERT INTO `planilla_detalle` VALUES ('103', '11', '40', 'h', 'Lumbalgia', '1');
INSERT INTO `planilla_detalle` VALUES ('104', '11', '35', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('105', '11', '0', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('106', '11', '1', 'h', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('107', '11', '25', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('108', '11', '6', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('109', '11', '57', 'm', 'Otras causas', '1');
INSERT INTO `planilla_detalle` VALUES ('110', '11', '60', 'm', 'Lumbalgia', '1');
INSERT INTO `planilla_detalle` VALUES ('111', '11', '27', 'm', 'Infección respiratoria aguda (IRA) sin neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('112', '12', '38', 'h', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('113', '12', '22', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('114', '12', '18', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('115', '12', '44', 'm', 'Mordedura de perro', '1');
INSERT INTO `planilla_detalle` VALUES ('116', '12', '45', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('117', '12', '12', 'm', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('118', '12', '33', 'm', 'Diarrea con deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('119', '12', '2', 'h', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('120', '12', '4', 'h', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('122', '13', '23', 'h', 'Odontalgia', '1');
INSERT INTO `planilla_detalle` VALUES ('123', '13', '2', 'm', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('124', '13', '43', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('125', '13', '5', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('126', '13', '76', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('127', '13', '63', 'm', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('128', '13', '3', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('129', '13', '2', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('130', '13', '7', 'h', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('131', '13', '56', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('132', '13', '1', 'h', 'Infección respiratoria aguda (IRA) con neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('133', '13', '23', 'h', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('134', '13', '51', 'm', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('135', '13', '14', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('136', '13', '15', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('137', '13', '2', 'm', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('138', '13', '38', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('139', '13', '3', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('140', '13', '45', 'm', 'Afecciones de piel Sarcoptosis', '1');
INSERT INTO `planilla_detalle` VALUES ('141', '13', '19', 'm', 'Infecciones de Transmisión Sexual(ITS)', '1');
INSERT INTO `planilla_detalle` VALUES ('142', '13', '20', 'h', 'Sintomático Respiratorio', '1');
INSERT INTO `planilla_detalle` VALUES ('143', '13', '7', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('144', '13', '32', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('145', '13', '67', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('146', '13', '59', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('147', '13', '26', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('148', '13', '5', 'm', 'Odontalgia', '1');
INSERT INTO `planilla_detalle` VALUES ('149', '13', '8', 'h', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('150', '13', '9', 'm', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('151', '13', '58', 'h', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('152', '14', '1', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('153', '14', '2', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('154', '14', '3', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('155', '14', '4', 'm', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('156', '14', '5', 'h', 'Parasitosis intestinal', '1');
INSERT INTO `planilla_detalle` VALUES ('157', '14', '6', 'm', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('158', '14', '7', 'h', 'Odontalgia', '1');
INSERT INTO `planilla_detalle` VALUES ('159', '14', '8', 'm', 'Causas de atención', '1');
INSERT INTO `planilla_detalle` VALUES ('160', '14', '9', 'h', 'Otras causas', '1');
INSERT INTO `planilla_detalle` VALUES ('161', '14', '10', 'm', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('162', '14', '11', 'h', 'Parasitosis intestinal', '1');
INSERT INTO `planilla_detalle` VALUES ('163', '14', '12', 'h', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('164', '14', '13', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('165', '14', '14', 'h', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('166', '14', '15', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('167', '14', '16', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('168', '14', '17', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('169', '14', '18', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('170', '14', '19', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('171', '14', '20', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('172', '14', '21', 'h', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('173', '14', '22', 'm', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('174', '14', '23', 'h', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('175', '14', '24', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('176', '14', '25', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('177', '14', '26', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('178', '14', '27', 'm', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('179', '14', '28', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('180', '14', '29', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('181', '14', '30', 'm', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('182', '15', '7', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('183', '15', '11', 'm', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('184', '15', '15', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('185', '15', '12', 'm', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('186', '15', '5', 'm', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('187', '15', '4', 'm', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('188', '15', '6', 'm', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('189', '15', '7', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('190', '15', '9', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('191', '15', '13', 'm', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('192', '15', '12', 'm', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('193', '15', '18', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('194', '15', '56', 'h', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('196', '16', '5', 'h', 'Infección respiratoria aguda (IRA) sin neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('197', '16', '10', 'm', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('198', '16', '45', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('199', '16', '26', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('200', '16', '31', 'm', 'Infección respiratoria aguda (IRA) sin neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('201', '16', '34', 'm', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('202', '16', '38', 'm', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('203', '16', '41', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('204', '16', '52', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('205', '16', '54', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('206', '16', '62', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('207', '16', '1', 'h', 'Infección respiratoria aguda (IRA) sin neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('208', '16', '5', 'h', 'Otras causas', '1');
INSERT INTO `planilla_detalle` VALUES ('209', '16', '14', 'm', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('210', '16', '10', 'h', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('211', '16', '11', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('212', '16', '22', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('213', '16', '26', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('214', '16', '37', 'h', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('215', '16', '35', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('216', '16', '7', 'h', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('217', '16', '11', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('218', '16', '45', 'm', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('219', '16', '44', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('220', '16', '51', 'h', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('221', '16', '48', 'm', 'Odontalgia', '1');
INSERT INTO `planilla_detalle` VALUES ('222', '16', '55', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('223', '16', '52', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('224', '16', '61', 'm', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('225', '16', '65', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('226', '17', '15', 'm', 'Sospecha de Dengue', '1');
INSERT INTO `planilla_detalle` VALUES ('227', '17', '12', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('228', '17', '11', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('229', '17', '7', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('230', '17', '5', 'h', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('231', '17', '7', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('232', '17', '5', 'h', 'Afecciones de piel Sarcoptosis', '1');
INSERT INTO `planilla_detalle` VALUES ('233', '17', '23', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('234', '17', '8', 'h', 'Afecciones de piel Piodermitis', '1');
INSERT INTO `planilla_detalle` VALUES ('235', '17', '4', 'm', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('236', '17', '23', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('237', '17', '45', 'h', 'Diabetes', '1');
INSERT INTO `planilla_detalle` VALUES ('238', '17', '57', 'm', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('239', '17', '59', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('240', '17', '24', 'm', 'Sospecha de Dengue', '1');
INSERT INTO `planilla_detalle` VALUES ('241', '17', '61', 'm', 'Afecciones de piel Sarcoptosis', '1');
INSERT INTO `planilla_detalle` VALUES ('242', '17', '15', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('243', '17', '61', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('244', '17', '3', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('245', '17', '45', 'h', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('246', '17', '13', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('247', '17', '43', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('248', '17', '5', 'h', 'Afecciones de piel Micosis', '1');
INSERT INTO `planilla_detalle` VALUES ('249', '17', '7', 'm', 'Afecciones de piel Sarcoptosis', '1');
INSERT INTO `planilla_detalle` VALUES ('250', '17', '21', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('251', '17', '34', 'h', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('252', '17', '21', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('253', '17', '34', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('254', '17', '12', 'h', 'Lesiones punzocortantes', '1');
INSERT INTO `planilla_detalle` VALUES ('255', '18', '32', 'h', 'Infecciones de Transmisión Sexual(ITS)', '1');
INSERT INTO `planilla_detalle` VALUES ('256', '18', '1', 'm', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('257', '18', '2', 'h', 'Afecciones de piel Otras', '1');
INSERT INTO `planilla_detalle` VALUES ('258', '18', '3', 'm', 'Infección respiratoria aguda (IRA) sin neumonia', '1');
INSERT INTO `planilla_detalle` VALUES ('259', '18', '4', 'h', 'Disenteria', '1');
INSERT INTO `planilla_detalle` VALUES ('260', '18', '5', 'm', 'Diarrea sin deshidratación', '1');
INSERT INTO `planilla_detalle` VALUES ('261', '18', '6', 'h', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('263', '18', '8', 'm', 'Causas de atención', '1');
INSERT INTO `planilla_detalle` VALUES ('264', '18', '9', 'h', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('265', '18', '10', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('266', '18', '12', 'h', 'Transtorno psicológico', '1');
INSERT INTO `planilla_detalle` VALUES ('267', '18', '13', 'm', 'Traumatismo y otras de causa externa', '1');
INSERT INTO `planilla_detalle` VALUES ('268', '18', '14', 'h', 'Sintomático Respiratorio', '1');
INSERT INTO `planilla_detalle` VALUES ('269', '18', '15', 'h', 'Lesiones punzocortantes', '1');
INSERT INTO `planilla_detalle` VALUES ('270', '18', '16', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('271', '18', '17', 'h', 'Traumatismo y otras de causa externa', '1');
INSERT INTO `planilla_detalle` VALUES ('272', '18', '18', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('273', '18', '19', 'h', 'Sospecha de Tétanos', '1');
INSERT INTO `planilla_detalle` VALUES ('274', '18', '20', 'h', 'Accidentes por ofidios', '1');
INSERT INTO `planilla_detalle` VALUES ('275', '18', '21', 'h', 'Amigdalitis', '1');
INSERT INTO `planilla_detalle` VALUES ('276', '18', '22', 'h', 'Conjuntivitis', '1');
INSERT INTO `planilla_detalle` VALUES ('277', '18', '23', 'm', 'Infección Aguda de Oido', '1');
INSERT INTO `planilla_detalle` VALUES ('278', '18', '24', 'm', 'Causas gineco-obstétricas', '1');
INSERT INTO `planilla_detalle` VALUES ('279', '18', '26', 'h', 'Enfermedades transmitidas por alimentos(ETA)', '1');
INSERT INTO `planilla_detalle` VALUES ('280', '18', '27', 'm', 'Infección del Tracto Urinario (ITU)', '1');
INSERT INTO `planilla_detalle` VALUES ('281', '18', '56', 'h', 'Hipertensión arterial', '1');
INSERT INTO `planilla_detalle` VALUES ('282', '18', '62', 'm', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('283', '18', '30', 'h', 'Gastritis', '1');
INSERT INTO `planilla_detalle` VALUES ('284', '18', '69', 'h', 'Hipertensión arterial', '1');
