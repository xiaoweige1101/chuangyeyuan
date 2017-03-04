/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : chuangyeyuan

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-03-04 13:15:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cyy_budget
-- ----------------------------
DROP TABLE IF EXISTS `cyy_budget`;
CREATE TABLE `cyy_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestId` int(11) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `waterMoney` int(11) DEFAULT NULL,
  `electMoney` int(11) DEFAULT NULL,
  `networkMoney` int(11) DEFAULT NULL,
  `rentMoney` int(11) DEFAULT NULL,
  `totalMoney` int(11) DEFAULT NULL,
  `rentStartDate` date DEFAULT NULL,
  `rentEntEndDate` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_budget_guestId` (`guestId`),
  KEY `PK_budget_roomId` (`roomId`),
  KEY `PK_budget_userId` (`userId`),
  CONSTRAINT `PK_budget_guestId` FOREIGN KEY (`guestId`) REFERENCES `cyy_guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_budget_roomId` FOREIGN KEY (`roomId`) REFERENCES `cyy_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_budget_userId` FOREIGN KEY (`userId`) REFERENCES `ly_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_budget
-- ----------------------------

-- ----------------------------
-- Table structure for cyy_building
-- ----------------------------
DROP TABLE IF EXISTS `cyy_building`;
CREATE TABLE `cyy_building` (
  `id` int(48) NOT NULL AUTO_INCREMENT,
  `buildingName` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_building
-- ----------------------------

-- ----------------------------
-- Table structure for cyy_building_user
-- ----------------------------
DROP TABLE IF EXISTS `cyy_building_user`;
CREATE TABLE `cyy_building_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `buildingId` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_bu_buildingId` (`buildingId`),
  KEY `PK_userId` (`uId`),
  CONSTRAINT `PK_bu_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `cyy_building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_userId` FOREIGN KEY (`uId`) REFERENCES `ly_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_building_user
-- ----------------------------

-- ----------------------------
-- Table structure for cyy_guest
-- ----------------------------
DROP TABLE IF EXISTS `cyy_guest`;
CREATE TABLE `cyy_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDNo` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `sex` varchar(32) DEFAULT NULL,
  `guranteeMoney` int(11) DEFAULT NULL,
  `guranteeMoneyTakeInDate` date DEFAULT NULL,
  `guranteeMoneyTakeOutDate` date DEFAULT NULL,
  `guranteeMoneyState` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_guest
-- ----------------------------

-- ----------------------------
-- Table structure for cyy_room
-- ----------------------------
DROP TABLE IF EXISTS `cyy_room`;
CREATE TABLE `cyy_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buildingId` int(11) DEFAULT NULL,
  `roomName` varchar(64) DEFAULT NULL,
  `roomPrice` int(11) DEFAULT NULL,
  `waterRecord` int(11) DEFAULT NULL,
  `electRecord` int(11) DEFAULT NULL,
  `lastBudgetId` int(11) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_buildingId` (`buildingId`),
  CONSTRAINT `PK_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `cyy_building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_room
-- ----------------------------

-- ----------------------------
-- Table structure for cyy_room_live_record
-- ----------------------------
DROP TABLE IF EXISTS `cyy_room_live_record`;
CREATE TABLE `cyy_room_live_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomId` int(11) DEFAULT NULL,
  `guestId` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_roomId` (`roomId`),
  KEY `PK_guestId` (`guestId`),
  CONSTRAINT `PK_guestId` FOREIGN KEY (`guestId`) REFERENCES `cyy_guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_roomId` FOREIGN KEY (`roomId`) REFERENCES `cyy_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_room_live_record
-- ----------------------------

-- ----------------------------
-- Table structure for ly_buttom
-- ----------------------------
DROP TABLE IF EXISTS `ly_buttom`;
CREATE TABLE `ly_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `buttom` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_buttom
-- ----------------------------
INSERT INTO `ly_buttom` VALUES ('1', '新增', '<button type=\"button\" id=\"addFun\" class=\"btn btn-primary marR10\">新增</button>', '');
INSERT INTO `ly_buttom` VALUES ('2', '编辑', '<button type=\"button\" id=\"editFun\" class=\"btn btn-info marR10\">编辑</button>', null);
INSERT INTO `ly_buttom` VALUES ('3', '删除', '<button type=\"button\" id=\"delFun\" class=\"btn btn-danger marR10\">删除</button>', null);
INSERT INTO `ly_buttom` VALUES ('4', '上传', '<button type=\"button\" id=\"upLoad\" class=\"btn btn-primary marR10\">上传</button>', null);
INSERT INTO `ly_buttom` VALUES ('5', '下载', '<button type=\"button\" id=\"downLoad\" class=\"btn btn-primary marR10\">下载</button>', null);
INSERT INTO `ly_buttom` VALUES ('6', '上移', '<button type=\"button\" id=\"lyGridUp\" class=\"btn btn-success marR10\">上移</button>', null);
INSERT INTO `ly_buttom` VALUES ('7', '下移', '<button type=\"button\" id=\"lyGridDown\" class=\"btn btn btn-grey marR10\">下移</button>', null);
INSERT INTO `ly_buttom` VALUES ('8', '分配权限', '<button type=\"button\" id=\"permissions\" class=\"btn btn btn-grey marR10\">分配权限</button>', null);

-- ----------------------------
-- Table structure for ly_log
-- ----------------------------
DROP TABLE IF EXISTS `ly_log`;
CREATE TABLE `ly_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `methods` varchar(30) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_log
-- ----------------------------

-- ----------------------------
-- Table structure for ly_resources
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '主页', '0', 'homepage', '0', '/homepage/homepage.shtml', '0', 'fa-tag', '0', '主页');
INSERT INTO `ly_resources` VALUES ('2', '大楼管理', '0', 'buildManagement', '0', '/manage/building/list.shtml', '0', 'fa-tag', '0', '大楼管理');
INSERT INTO `ly_resources` VALUES ('3', '房间管理', '0', 'roomManagement', '0', '/manage/room/list.shtml', '0', 'fa-tag', '0', '房间管理');
INSERT INTO `ly_resources` VALUES ('4', '租客管理', '0', 'guestManagement', '0', '/manage/guest/list.shtml', '0', 'fa-tag', '0', '房客管理');
INSERT INTO `ly_resources` VALUES ('5', '账单管理', '0', 'budgetManagement', '0', '/manage/budget/list.shtml', '0', 'fa-tag', '0', '账单管理');
INSERT INTO `ly_resources` VALUES ('6', '操作日志管理', '0', 'ly_log', '0', '/log/list.shtml', '0', 'fa-tag', '0', '操作日志管理');

-- ----------------------------
-- Table structure for ly_res_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_res_user`;
CREATE TABLE `ly_res_user` (
  `resId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_res_user
-- ----------------------------
INSERT INTO `ly_res_user` VALUES ('1', '3');
INSERT INTO `ly_res_user` VALUES ('2', '3');
INSERT INTO `ly_res_user` VALUES ('3', '3');
INSERT INTO `ly_res_user` VALUES ('4', '3');
INSERT INTO `ly_res_user` VALUES ('5', '3');
INSERT INTO `ly_res_user` VALUES ('6', '3');

-- ----------------------------
-- Table structure for ly_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_role`;
CREATE TABLE `ly_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
INSERT INTO `ly_role` VALUES ('1', '0', '管理员', 'admin', '管理员');
INSERT INTO `ly_role` VALUES ('2', '0', '普通角色', 'simple', '普通角色');
INSERT INTO `ly_role` VALUES ('3', '0', '超级管理员', 'SUPER', '超级管理员');

-- ----------------------------
-- Table structure for ly_server_info
-- ----------------------------
DROP TABLE IF EXISTS `ly_server_info`;
CREATE TABLE `ly_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_server_info
-- ----------------------------

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `credentialsSalt` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `locked` varchar(3) DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('1', '蓝缘', 'simple', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '0', '1', '2015-05-17 22:23:15', '0');
INSERT INTO `ly_user` VALUES ('2', '超级管理员', 'ROOT', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '0000', '1', '2015-05-23 17:39:37', '0');
INSERT INTO `ly_user` VALUES ('3', '管理员', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '3434', '1', '2015-05-23 17:39:39', '0');

-- ----------------------------
-- Table structure for ly_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `ly_userlogin`;
CREATE TABLE `ly_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('1', '3', 'admin', '2017-03-04 13:03:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('2', '3', 'admin', '2017-03-04 13:04:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('3', '3', 'admin', '2017-03-04 13:05:29', '127.0.0.1');

-- ----------------------------
-- Table structure for ly_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE `ly_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------
INSERT INTO `ly_user_role` VALUES ('1', '2');
INSERT INTO `ly_user_role` VALUES ('2', '3');
INSERT INTO `ly_user_role` VALUES ('3', '1');
