/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50610
Source Host           : 127.0.0.1:3306
Source Database       : crab

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2019-11-06 14:33:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cusname` varchar(25) DEFAULT NULL,
  `accountnumber` varchar(25) DEFAULT NULL,
  `pwd` varchar(25) DEFAULT NULL,
  `sex` varchar(25) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `companyid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('5', '张家辉', 'zjh', '123456', '男', '15236230225', '1');
INSERT INTO `customer` VALUES ('6', '刘德华', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('7', '成龙', 'cl', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('8', '刘德fsd', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('10', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('11', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('12', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('13', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('14', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('15', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('16', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('17', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('18', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('19', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('20', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('21', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('22', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('23', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('24', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('25', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('26', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('27', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('28', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('29', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('30', 'sdf德dsf', 'ldh', '123456', '男', '15236230225', '2');
INSERT INTO `customer` VALUES ('31', '成龙', 'cl', '123456', '男', '15236230225', '1');
INSERT INTO `customer` VALUES ('34', '刘德华', 'ldh', '123456', '女', '15236230225', '1');
INSERT INTO `customer` VALUES ('36', '4545', '4545', '123456', '男', '15236230269', '1001');
