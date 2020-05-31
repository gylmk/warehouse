/*
Navicat MySQL Data Transfer

Source Server         : rt
Source Server Version : 50644
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2020-05-31 09:38:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` varchar(255) NOT NULL,
  `amount` double DEFAULT NULL,
  `goodname` varchar(255) DEFAULT NULL,
  `nm` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `storeid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5DF975694D00C6C` (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('101', '300', '苹果', 'pg', '斤', '1234');
INSERT INTO `goods` VALUES ('2fd9ddb1-d3ec-4704-96ef-8f6c140deb34', '200', '香蕉', 'xj', '斤', '6708cb0b-fb84-401f-8d5e-046d68f5602b');
INSERT INTO `goods` VALUES ('5e5ca5ff-61dc-43b9-ab8d-b38860d8aece', '200', '梨子', 'lz', '个', '8a8183e64c20b238014c20b57bca0000');
INSERT INTO `goods` VALUES ('995885', '200', '香蕉', 'xj', '斤', null);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` varchar(255) NOT NULL,
  `amount` double DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `remain` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `historyid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK373FE4946B4D75D4` (`historyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('20785336', '100', '2019-11-17 22:12:14', '200', '入库', 'admin', '995885');
INSERT INTO `history` VALUES ('3789a248-3427-4ed8-8322-786295d35afc', '200', '2017-12-31 16:05:50', '200', '入库', 'admin', '5e5ca5ff-61dc-43b9-ab8d-b38860d8aece');
INSERT INTO `history` VALUES ('4350643b-b212-4de7-84c6-b265f3307805', '200', '2017-12-31 16:06:34', '200', '入库', 'admin', '2fd9ddb1-d3ec-4704-96ef-8f6c140deb34');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('2', '无量山', '云南', '东方不败');
INSERT INTO `store` VALUES ('6708cb0b-fb84-401f-8d5e-046d68f5602', '京东仓库', '北京', '刘强东');
INSERT INTO `store` VALUES ('69549000', '云逸', '上海', '小孟');
INSERT INTO `store` VALUES ('8a8182df4c1ffe85014c20hjkbjkmkl112', '爱巢', '上海', '小孟');
INSERT INTO `store` VALUES ('8a8183e64c20b238014c20b57bca0000', '二虎仓库', '北京', '栓虎');
INSERT INTO `store` VALUES ('905', '二虎仓库1', '清海', '栓虎');
INSERT INTO `store` VALUES ('936229', '黑木崖', '云南', '任我行');
INSERT INTO `store` VALUES ('976', '云逸', '北京1', '小虎');
INSERT INTO `store` VALUES ('f96bcd2a-ece5-4cc4-ad7e-649d0687a0f3', '菜鸟仓库', '武汉', '马云');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` varchar(255) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `userinfo` VALUES ('2', 'admin', 'admin');
