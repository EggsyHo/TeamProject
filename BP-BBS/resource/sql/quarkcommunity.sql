/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : quarkcommunity

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-07 14:34:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for quark_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `quark_adminuser`;
CREATE TABLE `quark_adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4erqa44qkwwkl539xouso7v4c` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_adminuser
-- ----------------------------
INSERT INTO `quark_adminuser` VALUES ('3', '1', '1148f69de18a13200acb02f593cb77a3', 'lhr');
INSERT INTO `quark_adminuser` VALUES ('50', '1', '0db82a65c8f98f62e9670ba35ab7a128', 'hcz');

-- ----------------------------
-- Table structure for quark_adminuser_role
-- ----------------------------
DROP TABLE IF EXISTS `quark_adminuser_role`;
CREATE TABLE `quark_adminuser_role` (
  `adminuser_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`adminuser_id`,`role_id`),
  KEY `FK26lllx1jn0c1k8f8oj2qt4io1` (`role_id`),
  CONSTRAINT `FK26lllx1jn0c1k8f8oj2qt4io1` FOREIGN KEY (`role_id`) REFERENCES `quark_role` (`id`),
  CONSTRAINT `FKatv5o94k3fooskwr53rvqfven` FOREIGN KEY (`adminuser_id`) REFERENCES `quark_adminuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_adminuser_role
-- ----------------------------
INSERT INTO `quark_adminuser_role` VALUES ('3', '1');

-- ----------------------------
-- Table structure for quark_collect
-- ----------------------------
DROP TABLE IF EXISTS `quark_collect`;
CREATE TABLE `quark_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `init_time` datetime DEFAULT NULL,
  `posts_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5a8rh83fve6ug3utggpy8wdvi` (`posts_id`),
  KEY `FKg4gtyqabrsuwr5y35lxvjy515` (`user_id`),
  CONSTRAINT `FK5a8rh83fve6ug3utggpy8wdvi` FOREIGN KEY (`posts_id`) REFERENCES `quark_posts` (`id`),
  CONSTRAINT `FKg4gtyqabrsuwr5y35lxvjy515` FOREIGN KEY (`user_id`) REFERENCES `quark_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_collect
-- ----------------------------

-- ----------------------------
-- Table structure for quark_label
-- ----------------------------
DROP TABLE IF EXISTS `quark_label`;
CREATE TABLE `quark_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `posts_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6vml4ba2itmaor84892v92b1f` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_label
-- ----------------------------
INSERT INTO `quark_label` VALUES ('1', '??????01???????????????', 'bp', '203');

-- ----------------------------
-- Table structure for quark_notification
-- ----------------------------
DROP TABLE IF EXISTS `quark_notification`;
CREATE TABLE `quark_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_read` bit(1) DEFAULT NULL,
  `fromuser_id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `touser_id` int(11) NOT NULL,
  `init_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKac4wjs0b3992ohkf61jy4ilmj` (`fromuser_id`),
  KEY `FKilg05a7ki3vkv7lfjnn57pdw2` (`posts_id`),
  KEY `FKquscxmtiqggsch7w833ywubux` (`touser_id`),
  CONSTRAINT `FKac4wjs0b3992ohkf61jy4ilmj` FOREIGN KEY (`fromuser_id`) REFERENCES `quark_user` (`id`),
  CONSTRAINT `FKilg05a7ki3vkv7lfjnn57pdw2` FOREIGN KEY (`posts_id`) REFERENCES `quark_posts` (`id`),
  CONSTRAINT `FKquscxmtiqggsch7w833ywubux` FOREIGN KEY (`touser_id`) REFERENCES `quark_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_notification
-- ----------------------------
INSERT INTO `quark_notification` VALUES ('16', '', '2', '209', '71', '2017-09-07 10:39:33');
INSERT INTO `quark_notification` VALUES ('22', '', '71', '4', '2', '2017-09-07 11:22:23');

-- ----------------------------
-- Table structure for quark_permission
-- ----------------------------
DROP TABLE IF EXISTS `quark_permission`;
CREATE TABLE `quark_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `perurl` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parentid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_permission
-- ----------------------------
INSERT INTO `quark_permission` VALUES ('1', '????????????', '/system', '1', '0', '0');
INSERT INTO `quark_permission` VALUES ('2', '???????????????', '/adminsPage', '2', '1', '1');
INSERT INTO `quark_permission` VALUES ('3', '????????????', '/rolesPage', '3', '1', '1');
INSERT INTO `quark_permission` VALUES ('4', '????????????', '/permissionsPage', '4', '1', '1');
INSERT INTO `quark_permission` VALUES ('5', '???????????????', '/admins/add', '21', '2', '2');
INSERT INTO `quark_permission` VALUES ('6', '???????????????', '/admins/delete', '22', '2', '2');
INSERT INTO `quark_permission` VALUES ('7', '????????????', '/roles/add', '23', '2', '3');
INSERT INTO `quark_permission` VALUES ('8', '????????????', '/roles/delete', '24', '2', '3');
INSERT INTO `quark_permission` VALUES ('9', '????????????', '/permissions/add', '25', '2', '4');
INSERT INTO `quark_permission` VALUES ('10', '????????????', '/permissions/delete', '26', '2', '4');
INSERT INTO `quark_permission` VALUES ('11', '????????????', '/admins/saveAdminRole', '27', '2', '2');
INSERT INTO `quark_permission` VALUES ('12', '????????????', '/roles/saveRolePermission', '28', '2', '3');
INSERT INTO `quark_permission` VALUES ('13', '??????/???????????????', '/admins/saveAdminEnable', '29', '2', '2');
INSERT INTO `quark_permission` VALUES ('16', '????????????', '/usersPage', '5', '1', '1');
INSERT INTO `quark_permission` VALUES ('17', '??????/????????????', '/users/saveUserEnable', '31', '2', '16');
INSERT INTO `quark_permission` VALUES ('18', '????????????', '/postsPage', '6', '1', '1');
INSERT INTO `quark_permission` VALUES ('19', '????????????', '/posts/saveTop', '32', '2', '18');
INSERT INTO `quark_permission` VALUES ('20', '????????????', '/posts/saveGood', '33', '2', '18');
INSERT INTO `quark_permission` VALUES ('21', '????????????', '/posts/delete', '34', '2', '18');
INSERT INTO `quark_permission` VALUES ('22', '????????????', '/replysPage', '7', '1', '1');
INSERT INTO `quark_permission` VALUES ('24', '????????????', '/replys/delete', '35', '2', '22');
INSERT INTO `quark_permission` VALUES ('25', '????????????', '/labelsPage', '8', '1', '1');
INSERT INTO `quark_permission` VALUES ('26', '????????????', '/labels/add', '36', '2', '25');
INSERT INTO `quark_permission` VALUES ('27', '????????????', '/labels/delete', '37', '2', '25');
INSERT INTO `quark_permission` VALUES ('28', '????????????', '/labels/update', '37', '2', '25');

-- ----------------------------
-- Table structure for quark_posts
-- ----------------------------
DROP TABLE IF EXISTS `quark_posts`;
CREATE TABLE `quark_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `good` bit(1) NOT NULL,
  `init_time` datetime NOT NULL,
  `label_id` int(11) DEFAULT NULL,
  `reply_count` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `top` bit(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_46eh0lt2x9ftqcv9tjs8meqj8` (`title`),
  KEY `FK41ebsa5jpn18egdtjo6uiaugn` (`user_id`),
  KEY `FKnxd3qh1m3c0o6tc3ojfa8fm6o` (`label_id`),
  CONSTRAINT `FK41ebsa5jpn18egdtjo6uiaugn` FOREIGN KEY (`user_id`) REFERENCES `quark_user` (`id`),
  CONSTRAINT `FKnxd3qh1m3c0o6tc3ojfa8fm6o` FOREIGN KEY (`label_id`) REFERENCES `quark_label` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_posts
-- ----------------------------

-- ----------------------------
-- Table structure for quark_reply
-- ----------------------------
DROP TABLE IF EXISTS `quark_reply`;
CREATE TABLE `quark_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `init_time` datetime DEFAULT NULL,
  `up` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnr6a7xtk9rm31ptn6gchi9113` (`posts_id`),
  KEY `FKnt12hb9oqfm5eamjpg27bkpvv` (`user_id`),
  CONSTRAINT `FKnr6a7xtk9rm31ptn6gchi9113` FOREIGN KEY (`posts_id`) REFERENCES `quark_posts` (`id`),
  CONSTRAINT `FKnt12hb9oqfm5eamjpg27bkpvv` FOREIGN KEY (`user_id`) REFERENCES `quark_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_reply
-- ----------------------------

-- ----------------------------
-- Table structure for quark_role
-- ----------------------------
DROP TABLE IF EXISTS `quark_role`;
CREATE TABLE `quark_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ff572j64wr6y4taed1c27vfo6` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_role
-- ----------------------------
INSERT INTO `quark_role` VALUES ('1', '????????????', '???????????????');
INSERT INTO `quark_role` VALUES ('6', '????????????', '???????????????');

-- ----------------------------
-- Table structure for quark_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `quark_role_permission`;
CREATE TABLE `quark_role_permission` (
  `role_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permissions_id`),
  KEY `FKlsdkf5vtsq5qvepw45r0y89jw` (`permissions_id`),
  CONSTRAINT `FK763ep4ix05naeoliv21sm6m81` FOREIGN KEY (`role_id`) REFERENCES `quark_role` (`id`),
  CONSTRAINT `FKlsdkf5vtsq5qvepw45r0y89jw` FOREIGN KEY (`permissions_id`) REFERENCES `quark_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_role_permission
-- ----------------------------
INSERT INTO `quark_role_permission` VALUES ('1', '1');
INSERT INTO `quark_role_permission` VALUES ('6', '1');
INSERT INTO `quark_role_permission` VALUES ('1', '2');
INSERT INTO `quark_role_permission` VALUES ('1', '3');
INSERT INTO `quark_role_permission` VALUES ('1', '4');
INSERT INTO `quark_role_permission` VALUES ('1', '5');
INSERT INTO `quark_role_permission` VALUES ('1', '6');
INSERT INTO `quark_role_permission` VALUES ('1', '7');
INSERT INTO `quark_role_permission` VALUES ('1', '8');
INSERT INTO `quark_role_permission` VALUES ('1', '9');
INSERT INTO `quark_role_permission` VALUES ('1', '10');
INSERT INTO `quark_role_permission` VALUES ('1', '11');
INSERT INTO `quark_role_permission` VALUES ('1', '12');
INSERT INTO `quark_role_permission` VALUES ('1', '13');
INSERT INTO `quark_role_permission` VALUES ('1', '16');
INSERT INTO `quark_role_permission` VALUES ('6', '16');
INSERT INTO `quark_role_permission` VALUES ('1', '17');
INSERT INTO `quark_role_permission` VALUES ('6', '17');
INSERT INTO `quark_role_permission` VALUES ('1', '18');
INSERT INTO `quark_role_permission` VALUES ('1', '19');
INSERT INTO `quark_role_permission` VALUES ('1', '20');
INSERT INTO `quark_role_permission` VALUES ('1', '21');
INSERT INTO `quark_role_permission` VALUES ('1', '22');
INSERT INTO `quark_role_permission` VALUES ('1', '24');
INSERT INTO `quark_role_permission` VALUES ('1', '25');
INSERT INTO `quark_role_permission` VALUES ('1', '26');
INSERT INTO `quark_role_permission` VALUES ('1', '27');
INSERT INTO `quark_role_permission` VALUES ('1', '28');

-- ----------------------------
-- Table structure for quark_user
-- ----------------------------
DROP TABLE IF EXISTS `quark_user`;
CREATE TABLE `quark_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `enable` int(11) NOT NULL,
  `init_time` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2uqfoo05i1p5qm4ntysj2ivbs` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quark_user
-- ----------------------------
