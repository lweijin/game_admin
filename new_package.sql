/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : new_package

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-17 17:39:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(50) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `up_id` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT '0',
  `url` varchar(50) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `show_left` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', '系统设置', '1', '0', '2', null, '0', '1');
INSERT INTO `title` VALUES ('2', '模块管理', '2', '1', '0', 'command=article', '1', '1');
INSERT INTO `title` VALUES ('3', '权限管理', '2', '1', '2', '', '1', '1');
INSERT INTO `title` VALUES ('4', '模块权限', '3', '3', '0', 'command=level', '1', '1');
INSERT INTO `title` VALUES ('5', '用户权限', '3', '3', '0', 'command=level&act=user', '1', '1');

-- ----------------------------
-- Table structure for title_level
-- ----------------------------
DROP TABLE IF EXISTS `title_level`;
CREATE TABLE `title_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) DEFAULT NULL,
  `level_key` varchar(50) DEFAULT NULL,
  `level_name` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_key` (`level_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title_level
-- ----------------------------
INSERT INTO `title_level` VALUES ('1', '1', 'sys_set', '显示', '2015-01-16 15:44:42');
INSERT INTO `title_level` VALUES ('2', '2', 'article_manager', '显示', '2015-01-16 15:49:24');
INSERT INTO `title_level` VALUES ('3', '3', 'level_manager', '显示', '2015-01-16 15:51:21');
INSERT INTO `title_level` VALUES ('5', '2', 'title_add', '新增', '2015-01-16 15:58:30');
INSERT INTO `title_level` VALUES ('6', '2', 'title_del', '删除', '2015-01-16 15:58:35');
INSERT INTO `title_level` VALUES ('7', '4', 'article_level', '显示', '2015-01-16 16:46:28');
INSERT INTO `title_level` VALUES ('8', '4', 'level_add', '新增', '2015-01-16 18:07:21');
INSERT INTO `title_level` VALUES ('9', '4', 'level_edit', '编辑', '2015-01-16 18:07:24');
INSERT INTO `title_level` VALUES ('10', '4', 'level_del', '删除', '2015-01-16 18:07:26');
INSERT INTO `title_level` VALUES ('11', '5', 'user_level', '显示', '2015-01-16 20:26:28');
INSERT INTO `title_level` VALUES ('12', '5', 'user_level_edit', '编辑', '2015-01-16 20:28:56');
INSERT INTO `title_level` VALUES ('13', '5', 'user_level_add', '新增', '2015-01-16 20:29:06');
INSERT INTO `title_level` VALUES ('14', '5', 'user_level_del', '删除', '2015-01-16 20:29:16');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '827499b8c882121b273d8cefa249056a', '0');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `user_name` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 15:46:44', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 15:52:55', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 15:59:46', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:09:35', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:10:56', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:13:45', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:14:24', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:19:51', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:20:23', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:21:03', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:21:29', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:27:38', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:47:29', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:47:44', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 16:50:35', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 17:20:17', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 18:07:57', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 19:53:19', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 19:59:10', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-16 20:31:29', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-17 10:34:31', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-17 12:37:45', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-17 13:25:51', '登录<br>', '1');
INSERT INTO `user_log` VALUES ('admin', '127.0.0.1', '2015-01-17 13:34:06', '登录<br>', '1');

-- ----------------------------
-- Table structure for user_title_level
-- ----------------------------
DROP TABLE IF EXISTS `user_title_level`;
CREATE TABLE `user_title_level` (
  `user_id` int(255) NOT NULL,
  `user_level` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_title_level
-- ----------------------------
INSERT INTO `user_title_level` VALUES ('1', '1', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '2', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '3', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '5', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '6', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '7', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '8', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '9', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '10', 'admin');
INSERT INTO `user_title_level` VALUES ('1', '11', 'admin');

-- ----------------------------
-- Procedure structure for insert_admin_role
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_admin_role`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_admin_role`(rn varchar(50),rl varchar(200))
BEGIN
	DECLARE CheckExists INT;
	SET CheckExists = 0;
	SELECT COUNT(*) INTO CheckExists FROM tt_admin_role WHERE role_name = `rn`;
	IF (CheckExists = 0) 
	THEN
		INSERT INTO tt_admin_role(role_name,role_level) VALUES(`rn`,`rl`);
		SELECT 1;
	ELSE
		SELECT 0;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for update_admin_role
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_admin_role`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_admin_role`(rn varchar(50),rl varchar(500),id int)
BEGIN
	DECLARE CheckExists INT;
	SET CheckExists = 0;
	SELECT COUNT(*) INTO CheckExists FROM tt_admin_role WHERE role_name = `rn` AND roleid <> `id`;
	IF (CheckExists = 0) 
	THEN
		UPDATE tt_admin_role SET role_name = `rn`,role_level = `rl` WHERE roleid = `id`;
		SELECT 1;
	ELSE
		SELECT 0;
	END IF;
END
;;
DELIMITER ;
