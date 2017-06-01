/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : chuangyeyuan

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-05-26 13:06:04
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
  `otherMoney` int(11) DEFAULT NULL,
  `rentMoney` int(11) DEFAULT NULL,
  `totalMoney` int(11) DEFAULT NULL,
  `rentStartDate` date DEFAULT NULL,
  `rentEntEndDate` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_budget_guestId` (`guestId`),
  KEY `PK_budget_roomId` (`roomId`),
  KEY `PK_budget_userId` (`userId`),
  CONSTRAINT `PK_budget_guestId` FOREIGN KEY (`guestId`) REFERENCES `cyy_guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_budget_roomId` FOREIGN KEY (`roomId`) REFERENCES `cyy_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_budget_userId` FOREIGN KEY (`userId`) REFERENCES `ly_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_budget
-- ----------------------------
INSERT INTO `cyy_budget` VALUES ('1', '1', '1', '100', '200', '300', '4000', '500', '2017-05-07', '2017-05-07', '3', '详情', '2017-05-07 15:03:06', '2017-05-07 15:03:09');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `build_name_uniq_key` (`buildingName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_building
-- ----------------------------
INSERT INTO `cyy_building` VALUES ('1', '1号楼', '2017年开始', '2017-03-10 13:14:37', '2017-03-10 13:14:40');
INSERT INTO `cyy_building` VALUES ('2', '2号楼', '2017年2月开始', '2017-03-10 16:07:00', '2017-03-10 16:07:02');
INSERT INTO `cyy_building` VALUES ('3', '3', '3', '2017-03-12 17:20:05', '2017-03-12 17:20:07');
INSERT INTO `cyy_building` VALUES ('4', '4', '3', '2017-03-12 17:20:05', '2017-03-12 17:20:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_building_user
-- ----------------------------
INSERT INTO `cyy_building_user` VALUES ('1', '3', '1', '2017-03-11 20:19:15', '2017-03-11 20:19:17');
INSERT INTO `cyy_building_user` VALUES ('3', '3', '2', '2017-03-16 20:50:16', '2017-03-16 20:50:18');

-- ----------------------------
-- Table structure for cyy_guest
-- ----------------------------
DROP TABLE IF EXISTS `cyy_guest`;
CREATE TABLE `cyy_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDNo` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `sex` varchar(32) DEFAULT NULL,
  `phonenumber` varchar(32) DEFAULT NULL,
  `guranteeMoney` varchar(32) DEFAULT NULL,
  `guranteeMoneyTakeInDate` date DEFAULT NULL,
  `guranteeMoneyTakeOutDate` date DEFAULT NULL,
  `guranteeMoneyState` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_guest
-- ----------------------------
INSERT INTO `cyy_guest` VALUES ('1', '321281198611236520', '张三丰', '男', '18012345678', '1000', '2017-04-09', null, '未提取', '描述', '2017-04-09 17:35:01', '2017-04-09 17:35:03');
INSERT INTO `cyy_guest` VALUES ('2', '1', '1', '1', '', '', null, null, null, '', '2017-04-30 22:47:45', '2017-04-30 22:47:45');

-- ----------------------------
-- Table structure for cyy_room
-- ----------------------------
DROP TABLE IF EXISTS `cyy_room`;
CREATE TABLE `cyy_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buildingId` int(11) DEFAULT NULL,
  `roomName` varchar(64) DEFAULT NULL,
  `currentGuestId` int(11) DEFAULT NULL,
  `roomPrice` int(11) DEFAULT NULL,
  `lastRent` int(11) DEFAULT NULL,
  `lastRentTime` datetime DEFAULT NULL,
  `nextRentTime` datetime DEFAULT NULL,
  `detail` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_buildingId` (`buildingId`),
  KEY `PK_currentGuestId` (`currentGuestId`),
  CONSTRAINT `PK_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `cyy_building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_currentGuestId` FOREIGN KEY (`currentGuestId`) REFERENCES `cyy_guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cyy_room
-- ----------------------------
INSERT INTO `cyy_room` VALUES ('1', '1', '101', '1', '100', '100', '2017-04-09 18:09:05', '2017-04-09 18:09:07', '101房间', '2017-03-26 19:28:26', '2017-03-26 19:28:28');
INSERT INTO `cyy_room` VALUES ('2', '1', '102', null, '101', null, null, null, '102房间', '2017-03-26 19:28:51', '2017-03-26 19:28:52');
INSERT INTO `cyy_room` VALUES ('3', '1', '103', null, '101', null, null, null, '103房间', '2017-03-26 19:29:33', '2017-03-26 19:29:35');
INSERT INTO `cyy_room` VALUES ('4', '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `cyy_room` VALUES ('5', '2', '1023', null, '200', null, null, null, '发送到', '2017-05-14 20:41:39', '2017-05-14 20:41:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '主页', '0', 'homepage', '0', '/user/homepage.shtml', '1', 'fa-tag', '0', '主页');
INSERT INTO `ly_resources` VALUES ('2', '合伙人管理', '0', 'account', '1', '/user/list.shtml', '2', 'fa-tag', '0', '合伙人管理');
INSERT INTO `ly_resources` VALUES ('3', '大楼管理', '0', 'buildManagement', '0', '/building/list.shtml', '3', 'fa-tag', '0', '大楼管理');
INSERT INTO `ly_resources` VALUES ('4', '房间管理', '0', 'roomManagement', '0', '/room/list.shtml', '4', 'fa-tag', '0', '房间管理');
INSERT INTO `ly_resources` VALUES ('5', '租客管理', '0', 'guestManagement', '0', '/guest/list.shtml', '5', 'fa-tag', '0', '房客管理');
INSERT INTO `ly_resources` VALUES ('6', '账单管理', '0', 'budgetManagement', '0', '/budget/list.shtml', '6', 'fa-tag', '0', '账单管理');
INSERT INTO `ly_resources` VALUES ('7', '操作日志管理', '0', 'ly_log', '0', '/log/list.shtml', '8', 'fa-tag', '0', '操作日志管理');
INSERT INTO `ly_resources` VALUES ('8', '新增用户', '2', 'account_add', '1', '/user/addUI.shtml', '2', 'fa-tag', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('9', '修改用户', '2', 'account_edit', '1', '/user/editUI.shtml', '2', 'fa-tag', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('10', '删除用户', '2', 'account_delete', '1', '/user/deleteById.shtml', '2', 'fa-tag', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('11', '新增大楼', '3', 'building_add', '1', '/building/addUI.shtml', '2', 'fa-tag', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addBuilding&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('12', '修改大楼', '3', 'building_edit', '1', '/building/editUI.shtml', '2', 'fa-tag', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editBuilding&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('13', '删除大楼', '3', 'building_delete', '1', '/building/deleteById.shtml', '2', 'fa-tag', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delBuilding&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');

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
INSERT INTO `ly_res_user` VALUES ('7', '3');
INSERT INTO `ly_res_user` VALUES ('8', '3');
INSERT INTO `ly_res_user` VALUES ('9', '3');
INSERT INTO `ly_res_user` VALUES ('10', '3');
INSERT INTO `ly_res_user` VALUES ('11', '3');
INSERT INTO `ly_res_user` VALUES ('12', '3');
INSERT INTO `ly_res_user` VALUES ('13', '3');
INSERT INTO `ly_res_user` VALUES ('14', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('3', '管理员', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '3434', '1', '2017-04-03 22:44:25', '0');
INSERT INTO `ly_user` VALUES ('5', '张伟', '18016290912', 'ad9b55b5b563cfb7dddbc1a49dd97cc6', 'bfdfbca24425b585c93369b29e171637', null, '0', '2017-03-25 19:40:10', '0');
INSERT INTO `ly_user` VALUES ('6', '戚金平', '13612345678', '1194fbe2002535f8579529c060df4f41', 'd2b4760451a6e9454a900a29bee645d9', null, '0', '2017-03-25 19:40:47', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('1', '3', 'admin', '2017-03-04 13:03:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('2', '3', 'admin', '2017-03-04 13:04:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('3', '3', 'admin', '2017-03-04 13:05:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('4', '3', 'admin', '2017-03-04 13:25:39', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('5', '3', 'admin', '2017-03-04 13:33:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('6', '3', 'admin', '2017-03-04 13:49:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('7', '3', 'admin', '2017-03-04 13:52:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('8', '3', 'admin', '2017-03-04 13:59:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('9', '3', 'admin', '2017-03-04 13:59:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('10', '3', 'admin', '2017-03-04 13:59:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('11', '3', 'admin', '2017-03-04 14:00:59', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('12', '3', 'admin', '2017-03-04 14:06:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('13', '3', 'admin', '2017-03-04 14:07:09', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('14', '3', 'admin', '2017-03-04 14:52:22', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('15', '3', 'admin', '2017-03-04 14:53:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('16', '3', 'admin', '2017-03-04 14:55:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('17', '3', 'admin', '2017-03-04 15:02:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('18', '3', 'admin', '2017-03-10 12:54:02', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('19', '3', 'admin', '2017-03-10 12:54:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('20', '3', 'admin', '2017-03-10 13:09:58', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('21', '3', 'admin', '2017-03-10 13:10:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('22', '3', 'admin', '2017-03-10 13:12:24', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('23', '3', 'admin', '2017-03-10 13:13:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('24', '3', 'admin', '2017-03-10 15:42:39', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('25', '3', 'admin', '2017-03-10 15:44:01', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('26', '3', 'admin', '2017-03-10 15:47:13', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('27', '3', 'admin', '2017-03-10 15:50:24', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('28', '3', 'admin', '2017-03-10 15:56:07', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('29', '3', 'admin', '2017-03-10 16:04:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('30', '3', 'admin', '2017-03-10 16:06:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('31', '3', 'admin', '2017-03-10 16:13:43', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('32', '3', 'admin', '2017-03-10 16:15:20', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('33', '3', 'admin', '2017-03-10 16:41:45', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('34', '3', 'admin', '2017-03-10 16:52:09', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('35', '3', 'admin', '2017-03-10 16:55:14', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('36', '3', 'admin', '2017-03-10 18:37:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('37', '3', 'admin', '2017-03-11 19:18:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('38', '3', 'admin', '2017-03-11 19:26:09', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('39', '3', 'admin', '2017-03-11 19:27:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('40', '3', 'admin', '2017-03-11 19:39:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('41', '3', 'admin', '2017-03-11 19:46:46', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('42', '3', 'admin', '2017-03-11 20:14:46', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('43', '3', 'admin', '2017-03-11 20:16:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('44', '3', 'admin', '2017-03-11 21:00:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('45', '3', 'admin', '2017-03-11 21:01:55', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('46', '3', 'admin', '2017-03-11 21:39:59', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('47', '3', 'admin', '2017-03-11 21:59:13', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('48', '3', 'admin', '2017-03-11 22:43:50', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('49', '3', 'admin', '2017-03-11 22:49:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('50', '3', 'admin', '2017-03-12 11:33:02', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('51', '3', 'admin', '2017-03-12 11:48:58', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('52', '3', 'admin', '2017-03-12 14:07:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('53', '3', 'admin', '2017-03-12 14:53:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('54', '3', 'admin', '2017-03-12 15:15:09', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('55', '3', 'admin', '2017-03-12 16:00:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('56', '3', 'admin', '2017-03-12 16:17:17', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('57', '3', 'admin', '2017-03-12 16:18:31', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('58', '3', 'admin', '2017-03-12 16:23:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('59', '3', 'admin', '2017-03-12 16:51:45', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('60', '3', 'admin', '2017-03-12 17:08:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('61', '3', 'admin', '2017-03-12 17:13:03', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('62', '3', 'admin', '2017-03-12 17:31:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('63', '3', 'admin', '2017-03-12 18:30:33', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('64', '3', 'admin', '2017-03-12 18:32:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('65', '3', 'admin', '2017-03-12 18:38:13', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('66', '3', 'admin', '2017-03-12 20:39:31', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('67', '3', 'admin', '2017-03-12 20:49:24', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('68', '3', 'admin', '2017-03-12 21:07:19', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('69', '3', 'admin', '2017-03-12 22:03:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('70', '3', 'admin', '2017-03-12 22:41:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('71', '3', 'admin', '2017-03-12 22:43:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('72', '3', 'admin', '2017-03-16 20:49:06', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('73', '3', 'admin', '2017-03-16 21:07:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('74', '3', 'admin', '2017-03-16 21:17:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('75', '3', 'admin', '2017-03-18 13:36:15', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('76', '3', 'admin', '2017-03-25 19:38:53', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('77', '3', 'admin', '2017-03-25 23:17:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('78', '3', 'admin', '2017-03-28 20:04:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('79', '3', 'admin', '2017-04-06 22:09:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('80', '3', 'admin', '2017-04-06 22:32:39', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('81', '3', 'admin', '2017-04-07 20:08:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('82', '3', 'admin', '2017-04-08 21:51:39', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('83', '3', 'admin', '2017-04-09 20:01:00', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('84', '3', 'admin', '2017-04-09 21:22:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('85', '3', 'admin', '2017-04-09 21:30:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('86', '3', 'admin', '2017-04-09 21:32:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('87', '3', 'admin', '2017-04-09 21:33:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('88', '3', 'admin', '2017-04-09 21:35:11', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('89', '3', 'admin', '2017-04-16 13:27:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('90', '3', 'admin', '2017-04-16 13:38:49', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('91', '3', 'admin', '2017-04-16 13:53:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('92', '3', 'admin', '2017-04-16 14:50:35', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('93', '3', 'admin', '2017-04-16 14:52:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('94', '3', 'admin', '2017-04-16 14:55:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('95', '3', 'admin', '2017-04-16 14:59:15', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('96', '3', 'admin', '2017-04-16 15:00:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('97', '3', 'admin', '2017-04-16 15:08:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('98', '3', 'admin', '2017-04-16 15:10:45', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('99', '3', 'admin', '2017-04-16 15:41:34', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('100', '3', 'admin', '2017-04-16 15:52:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('101', '3', 'admin', '2017-04-16 16:12:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('102', '3', 'admin', '2017-04-16 19:25:00', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('103', '3', 'admin', '2017-04-16 19:34:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('104', '3', 'admin', '2017-04-16 19:53:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('105', '3', 'admin', '2017-04-16 21:19:01', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('106', '3', 'admin', '2017-04-21 22:31:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('107', '3', 'admin', '2017-04-21 22:34:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('108', '3', 'admin', '2017-04-21 22:38:13', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('109', '3', 'admin', '2017-04-21 23:03:09', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('110', '3', 'admin', '2017-04-21 23:07:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('111', '3', 'admin', '2017-04-22 20:34:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('112', '3', 'admin', '2017-04-22 20:37:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('113', '3', 'admin', '2017-04-22 20:42:00', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('114', '3', 'admin', '2017-04-22 20:45:27', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('115', '3', 'admin', '2017-04-22 20:48:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('116', '3', 'admin', '2017-04-22 20:50:30', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('117', '3', 'admin', '2017-04-22 21:53:06', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('118', '3', 'admin', '2017-04-22 21:57:37', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('119', '3', 'admin', '2017-04-22 22:07:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('120', '3', 'admin', '2017-04-22 22:17:33', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('121', '3', 'admin', '2017-04-22 22:23:28', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('122', '3', 'admin', '2017-04-22 22:25:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('123', '3', 'admin', '2017-04-22 22:27:01', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('124', '3', 'admin', '2017-04-24 19:54:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('125', '3', 'admin', '2017-04-24 20:29:00', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('126', '3', 'admin', '2017-04-25 18:15:35', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('127', '3', 'admin', '2017-04-25 20:29:44', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('128', '3', 'admin', '2017-04-25 20:33:17', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('129', '3', 'admin', '2017-04-25 21:08:28', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('130', '3', 'admin', '2017-04-25 21:16:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('131', '3', 'admin', '2017-04-30 17:40:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('132', '3', 'admin', '2017-04-30 22:25:30', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('133', '3', 'admin', '2017-04-30 22:27:27', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('134', '3', 'admin', '2017-04-30 22:33:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('135', '3', 'admin', '2017-04-30 22:39:16', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('136', '3', 'admin', '2017-04-30 22:42:02', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('137', '3', 'admin', '2017-04-30 22:46:16', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('138', '3', 'admin', '2017-04-30 22:47:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('139', '3', 'admin', '2017-04-30 22:58:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('140', '3', 'admin', '2017-05-01 12:18:06', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('141', '3', 'admin', '2017-05-01 17:19:12', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('142', '3', 'admin', '2017-05-01 17:20:33', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('143', '3', 'admin', '2017-05-01 17:43:34', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('144', '3', 'admin', '2017-05-01 20:02:07', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('145', '3', 'admin', '2017-05-01 20:03:58', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('146', '3', 'admin', '2017-05-01 20:35:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('147', '3', 'admin', '2017-05-01 20:39:37', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('148', '3', 'admin', '2017-05-01 21:56:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('149', '3', 'admin', '2017-05-01 22:39:50', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('150', '3', 'admin', '2017-05-01 22:46:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('151', '3', 'admin', '2017-05-02 18:11:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('152', '3', 'admin', '2017-05-02 18:29:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('153', '3', 'admin', '2017-05-02 19:48:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('154', '3', 'admin', '2017-05-02 20:31:22', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('155', '3', 'admin', '2017-05-02 20:38:02', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('156', '3', 'admin', '2017-05-06 22:46:59', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('157', '3', 'admin', '2017-05-07 14:32:03', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('158', '3', 'admin', '2017-05-13 22:22:44', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('159', '3', 'admin', '2017-05-13 22:30:14', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('160', '3', 'admin', '2017-05-13 22:45:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('161', '3', 'admin', '2017-05-13 22:47:28', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('162', '3', 'admin', '2017-05-14 16:32:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('163', '3', 'admin', '2017-05-14 19:28:27', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('164', '3', 'admin', '2017-05-14 19:56:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('165', '3', 'admin', '2017-05-14 20:01:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('166', '3', 'admin', '2017-05-14 20:13:01', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('167', '3', 'admin', '2017-05-14 20:28:59', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('168', '3', 'admin', '2017-05-14 20:31:44', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('169', '3', 'admin', '2017-05-14 20:37:43', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('170', '3', 'admin', '2017-05-14 20:40:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('171', '3', 'admin', '2017-05-14 21:04:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('172', '3', 'admin', '2017-05-14 21:18:55', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('173', '3', 'admin', '2017-05-14 21:29:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('174', '3', 'admin', '2017-05-14 21:33:25', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('175', '3', 'admin', '2017-05-14 22:24:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('176', '3', 'admin', '2017-05-14 22:32:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('177', '3', 'admin', '2017-05-14 22:35:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('178', '3', 'admin', '2017-05-14 22:36:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('179', '3', 'admin', '2017-05-14 22:50:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('180', '3', 'admin', '2017-05-15 17:10:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('181', '3', 'admin', '2017-05-15 17:26:31', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('182', '3', 'admin', '2017-05-15 17:28:12', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('183', '3', 'admin', '2017-05-15 17:33:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('184', '3', 'admin', '2017-05-15 17:36:47', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('185', '3', 'admin', '2017-05-15 17:38:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('186', '3', 'admin', '2017-05-21 14:46:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('187', '3', 'admin', '2017-05-21 14:55:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('188', '3', 'admin', '2017-05-21 16:59:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('189', '3', 'admin', '2017-05-21 20:20:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('190', '3', 'admin', '2017-05-23 20:34:27', '127.0.0.1');

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
INSERT INTO `ly_user_role` VALUES ('3', '1');
INSERT INTO `ly_user_role` VALUES ('5', '3');
INSERT INTO `ly_user_role` VALUES ('6', '3');
