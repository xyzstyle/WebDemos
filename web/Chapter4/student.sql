/*
Navicat MySQL Data Transfer

Source Server         : MySqlConnetion
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-12-03 20:48:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jspuser
-- ----------------------------
DROP TABLE IF EXISTS `jspuser`;
CREATE TABLE `jspuser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jspuser
-- ----------------------------
INSERT INTO `jspuser` VALUES ('1', '张三', '123456', '北京');
INSERT INTO `jspuser` VALUES ('2', '李四', '234567', '上海');
INSERT INTO `jspuser` VALUES ('3', '王五', '345678', '杭州');
INSERT INTO `jspuser` VALUES ('4', '郑六', '456789', '温州');
INSERT INTO `jspuser` VALUES ('5', '刘七', '567890', '宁波kk');
