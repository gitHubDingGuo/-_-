/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50173
Source Host           : 139.199.162.74:3306
Source Database       : db_netdisc

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-09-18 08:45:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_file
-- ----------------------------
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE `tb_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件Id',
  `user_id` varchar(16) DEFAULT NULL COMMENT '用户Id',
  `folder_id` int(11) DEFAULT NULL COMMENT '文件夹Id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_type` int(11) DEFAULT NULL COMMENT '文件类型',
  `file_size` double DEFAULT NULL COMMENT '文件大小',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `folder_id` (`folder_id`),
  CONSTRAINT `tb_file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_file_ibfk_2` FOREIGN KEY (`folder_id`) REFERENCES `tb_folder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_file
-- ----------------------------
INSERT INTO `tb_file` VALUES ('1', 'user_123', null, '123.jpg', '1', '256', '2019-08-27 10:23:12', '2019-08-29 10:23:08', '1');
INSERT INTO `tb_file` VALUES ('2', 'user_123', '3', '123.txt', '2', '222', '2019-08-29 11:40:51', '2019-08-30 11:40:56', '-1');
INSERT INTO `tb_file` VALUES ('4', 'user_123', '7', '123456.txt', '2', '33333333', '2019-08-29 11:40:51', null, '1');
INSERT INTO `tb_file` VALUES ('5', 'user_123', '7', 'adedfdb8f26b4c0c8a67d93e9767f982.jpg', '1', '2222222', '2019-08-27 14:21:48', '2019-08-30 14:21:51', '1');
INSERT INTO `tb_file` VALUES ('10', 'user_e03c449b', null, '袁沛_服务端开发工程师_青软推荐 .pdf', '2', '38825122', '2019-08-30 16:54:37', null, '1');
INSERT INTO `tb_file` VALUES ('11', 'user_e03c449b', null, 'abcd.pdf', '2', '38825122', '2019-08-30 19:24:23', null, '1');
INSERT INTO `tb_file` VALUES ('21', 'user_e03c449b', null, 'abcd_1567166741277.pdf', '2', '388251222', '2019-08-30 20:05:43', null, '1');
INSERT INTO `tb_file` VALUES ('22', 'user_123', null, 'ss.txt', '2', '45222222', null, '2019-08-21 09:12:04', '1');
INSERT INTO `tb_file` VALUES ('23', 'user_123', '22', 'sa.txt', '2', '2222222', '2019-08-23 20:36:25', null, '-1');
INSERT INTO `tb_file` VALUES ('24', 'user_e03c449b', null, 'abcd_1567216312329.pdf', '2', '388251222', '2019-08-31 09:51:53', null, '1');
INSERT INTO `tb_file` VALUES ('25', 'user_e03c449b', null, 'abcd_1567216321192.pdf', '2', '388251222', '2019-08-31 09:52:02', null, '1');
INSERT INTO `tb_file` VALUES ('26', 'user_123', '7', 'Ipad3.mp4', '4', '333222', null, null, '1');
INSERT INTO `tb_file` VALUES ('27', 'user_123', '7', 'abcd_1567216312329.pdf', '2', '442222', '2019-08-31 10:46:59', '2019-08-12 10:47:03', '1');
INSERT INTO `tb_file` VALUES ('28', 'user_123', '7', 'WalkAway.mp3', '3', '332222', '2019-07-29 10:47:29', '2019-08-31 10:47:34', '1');
INSERT INTO `tb_file` VALUES ('29', 'user_123', '7', 'abcd.docx', '2', '442222', '2019-08-19 10:55:06', '2019-08-31 10:55:08', '1');
INSERT INTO `tb_file` VALUES ('30', 'user_123', '7', '987654.pptx', '2', '222222', '2019-08-28 11:18:23', '2019-08-28 11:18:28', '1');
INSERT INTO `tb_file` VALUES ('31', 'user_123', '7', 'abcdef.xlsx', '2', '332222', null, null, '1');
INSERT INTO `tb_file` VALUES ('32', 'user_123', '7', 'abc.rar', '5', '3322222', null, null, '1');
INSERT INTO `tb_file` VALUES ('33', 'user_123', '7', 'bdf.zip', '5', '442222', null, null, '1');
INSERT INTO `tb_file` VALUES ('116', 'user_e03c449b', null, 'abcd123456_1567589768761.pdf', '8', '388251', '2019-09-04 17:36:12', null, '1');
INSERT INTO `tb_file` VALUES ('120', 'user_e03c449b', '38', 'abcd.pdf', '8', '388251', '2019-09-04 17:42:40', null, '1');
INSERT INTO `tb_file` VALUES ('121', 'user_e03c449b', '38', 'abcd123456.pdf', '8', '388251', '2019-09-04 17:42:42', null, '1');
INSERT INTO `tb_file` VALUES ('122', 'user_e03c449b', '38', 'abcde.pdf', '8', '388251', '2019-09-04 17:42:44', null, '1');
INSERT INTO `tb_file` VALUES ('123', 'user_e03c449b', null, 'abcd123456_1567590284858.pdf', '8', '388251', '2019-09-04 17:44:47', null, '1');
INSERT INTO `tb_file` VALUES ('124', 'user_e03c449b', null, 'abcde_1567590307034.pdf', '8', '388251', '2019-09-04 17:45:09', null, '1');
INSERT INTO `tb_file` VALUES ('125', 'user_f7ec4265', '45', 'abcd.pdf', '8', '388251', '2019-09-06 11:11:10', null, '1');
INSERT INTO `tb_file` VALUES ('128', 'user_f7ec4265', '66', 'abcde.pdf', '8', '388251', '2019-09-06 12:42:34', null, '0');
INSERT INTO `tb_file` VALUES ('129', 'user_07e1c6c4', null, '02_small.jpg', '1', '2339', '2019-09-06 14:18:44', null, '1');
INSERT INTO `tb_file` VALUES ('130', 'user_07e1c6c4', null, '0-item_pic.jpg_220x220.jpg', '1', '40029', '2019-09-06 14:18:54', null, '1');
INSERT INTO `tb_file` VALUES ('131', 'user_07e1c6c4', '67', 'abcd.pdf', '8', '388251', '2019-09-06 14:19:27', null, '1');
INSERT INTO `tb_file` VALUES ('132', 'user_07e1c6c4', '67', 'abcd_1567750851167.pdf', '8', '388251', '2019-09-06 14:20:53', null, '1');
INSERT INTO `tb_file` VALUES ('133', 'user_07e1c6c4', '67', 'abcde.pdf', '8', '388251', '2019-09-06 14:21:35', null, '1');
INSERT INTO `tb_file` VALUES ('134', 'user_07e1c6c4', '67', 'abcde_1567750911116.pdf', '8', '388251', '2019-09-06 14:21:53', null, '1');
INSERT INTO `tb_file` VALUES ('135', 'user_07e1c6c4', '67', 'abcde_1567751011255.pdf', '8', '388251', '2019-09-06 14:23:31', null, '1');
INSERT INTO `tb_file` VALUES ('136', 'user_07e1c6c4', '68', 'abcd.pdf', '8', '388251', '2019-09-06 14:24:06', null, '1');
INSERT INTO `tb_file` VALUES ('137', 'user_07e1c6c4', '67', 'jsu123.xlsx', '6', '12705', '2019-09-06 14:30:01', null, '1');
INSERT INTO `tb_file` VALUES ('138', 'user_a0eb3028', '69', '01.jpg', '1', '177321', '2019-09-06 14:45:15', null, '0');
INSERT INTO `tb_file` VALUES ('139', 'user_a0eb3028', '69', 'note.txt', '2', '9', '2019-09-06 14:45:33', null, '1');
INSERT INTO `tb_file` VALUES ('140', 'user_a0eb3028', '69', 'vote.pptx', '9', '482134', '2019-09-06 14:49:05', null, '1');
INSERT INTO `tb_file` VALUES ('141', 'user_a0eb3028', '69', 'jsu789.pdf', '8', '388360', '2019-09-06 14:49:45', null, '1');
INSERT INTO `tb_file` VALUES ('142', 'user_a0eb3028', '69', null, null, null, null, null, null);
INSERT INTO `tb_file` VALUES ('143', 'user_a0eb3028', '69', 'WalkAway.mp3', '3', '332222', '2019-09-06 14:49:45', null, '1');
INSERT INTO `tb_file` VALUES ('144', 'user_a0eb3028', '69', null, null, null, null, null, null);
INSERT INTO `tb_file` VALUES ('145', 'user_a0eb3028', '69', 'Ipad3.mp4', '4', '332222', '2019-09-06 14:49:45', null, '1');
INSERT INTO `tb_file` VALUES ('146', 'user_a0eb3028', '70', 'Ipad3.mp4', '4', '332222', '2019-09-06 15:00:37', null, '1');
INSERT INTO `tb_file` VALUES ('147', 'user_a8baf8e9', '73', '02.jpg', '1', '177321', '2019-09-06 15:14:00', null, '1');
INSERT INTO `tb_file` VALUES ('148', 'user_a8baf8e9', '73', 'abc123.xlsx', '6', '12705', '2019-09-06 15:14:15', null, '1');
INSERT INTO `tb_file` VALUES ('149', 'user_a8baf8e9', '74', 'abc789.pdf', '8', '388360', '2019-09-06 15:16:12', null, '1');
INSERT INTO `tb_file` VALUES ('150', 'user_a8baf8e9', '74', 'abc123.xlsx', '6', '12705', '2019-09-06 15:15:58', null, '1');

-- ----------------------------
-- Table structure for tb_folder
-- ----------------------------
DROP TABLE IF EXISTS `tb_folder`;
CREATE TABLE `tb_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件夹Id',
  `user_id` varchar(16) DEFAULT NULL COMMENT '用户Id',
  `folder_name` varchar(255) DEFAULT NULL COMMENT '文件夹名称',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `parent_directory` int(11) DEFAULT NULL COMMENT '父文件夹',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_folder_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_folder
-- ----------------------------
INSERT INTO `tb_folder` VALUES ('3', 'user_123', '学习', '2019-08-29 10:19:25', '2019-08-29 10:19:25', '0', '-1');
INSERT INTO `tb_folder` VALUES ('4', 'user_124', 'hehe', '2019-08-29 10:19:25', '2019-08-29 10:19:25', '0', '0');
INSERT INTO `tb_folder` VALUES ('5', 'user_123', 'wqwwq', '2019-08-30 14:41:39', '2019-08-29 10:19:25', '0', '1');
INSERT INTO `tb_folder` VALUES ('6', 'user_123', 'sdf', '2019-08-08 10:20:22', '2019-08-10 10:20:26', '0', '1');
INSERT INTO `tb_folder` VALUES ('7', 'user_123', 'sfd', '2019-08-16 10:20:42', '2019-08-29 10:19:25', '5', '1');
INSERT INTO `tb_folder` VALUES ('8', 'user_123', 'dsa', null, null, '0', '1');
INSERT INTO `tb_folder` VALUES ('9', 'user_123', '123', '2019-08-29 11:49:27', null, '5', '1');
INSERT INTO `tb_folder` VALUES ('11', 'user_123', '新建文件夹', '2019-08-29 19:53:44', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('12', 'user_123', '仨人', '2019-08-29 20:40:09', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('13', 'user_123', '傅撒', '2019-08-29 20:47:57', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('14', 'user_123', '身上', '2019-08-29 20:49:09', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('15', 'user_123', '分', '2019-08-30 09:09:52', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('16', 'user_123', '打算', '2019-08-30 09:09:52', null, '7', '1');
INSERT INTO `tb_folder` VALUES ('17', 'user_123', 'ss(1)', '2019-08-30 14:33:19', '2019-09-06 11:26:39', '0', '0');
INSERT INTO `tb_folder` VALUES ('18', 'user_123', 'ss(2)', '2019-08-30 14:33:37', '2019-09-06 11:26:39', '0', '0');
INSERT INTO `tb_folder` VALUES ('19', 'user_123', '的撒', '2019-08-30 21:17:57', '2019-09-06 11:28:40', '0', '0');
INSERT INTO `tb_folder` VALUES ('20', 'user_123', '实测', '2019-08-31 09:12:56', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('21', 'user_123', '测试1', '2019-08-24 20:36:58', null, '20', '-1');
INSERT INTO `tb_folder` VALUES ('22', 'user_123', '测试2', '2019-08-31 20:37:22', null, '21', '-1');
INSERT INTO `tb_folder` VALUES ('38', 'user_e03c449b', 'aaaa', '2019-09-04 17:42:37', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('39', 'user_123', '新建文件夹', '2019-09-06 10:16:48', null, '5', '1');
INSERT INTO `tb_folder` VALUES ('40', 'user_123', '新建文件夹(1)', '2019-09-06 10:17:36', null, '5', '1');
INSERT INTO `tb_folder` VALUES ('43', 'user_123', '22', '2019-09-06 10:23:08', '2019-09-06 10:26:51', '16', '0');
INSERT INTO `tb_folder` VALUES ('44', 'user_123', '的撒', '2019-09-06 10:22:06', '2019-09-06 10:26:51', '16', '0');
INSERT INTO `tb_folder` VALUES ('45', 'user_f7ec4265', '123456', '2019-09-06 11:10:54', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('46', 'user_f7ec4265', 'abcdef', '2019-09-06 11:11:40', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('47', 'user_f7ec4265', 'aaaaa', '2019-09-06 11:12:28', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('48', 'user_123', '新建文件夹(2)', '2019-09-06 11:13:28', null, '5', '1');
INSERT INTO `tb_folder` VALUES ('49', 'user_123', 'qwer', '2019-09-06 11:14:08', null, '5', '1');
INSERT INTO `tb_folder` VALUES ('50', 'user_123', '大撒大撒反对', '2019-09-06 11:14:27', null, '7', '1');
INSERT INTO `tb_folder` VALUES ('51', 'user_f7ec4265', 'bbbb', '2019-09-06 11:24:30', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('52', 'user_f7ec4265', 'cccc', '2019-09-06 11:26:18', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('53', 'user_123', '新建文件夹的萨芬萨', '2019-09-06 11:26:57', '2019-09-06 11:28:40', '0', '0');
INSERT INTO `tb_folder` VALUES ('54', 'user_123', '321312', '2019-09-06 11:27:00', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('55', 'user_123', '123', '2019-09-06 11:30:23', '2019-09-06 11:30:42', '0', '0');
INSERT INTO `tb_folder` VALUES ('56', 'user_123', '213', '2019-09-06 11:30:27', '2019-09-06 11:30:42', '0', '0');
INSERT INTO `tb_folder` VALUES ('57', 'user_f7ec4265', '新建文件夹', '2019-09-06 11:35:13', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('58', 'user_123', 'ffffa发嘎洒是否', '2019-09-06 11:36:48', '2019-09-06 11:36:56', '0', '0');
INSERT INTO `tb_folder` VALUES ('59', 'user_123', 'aa', '2019-09-06 11:37:12', '2019-09-06 11:39:30', '0', '-1');
INSERT INTO `tb_folder` VALUES ('60', 'user_123', 'bb', '2019-09-06 11:37:17', '2019-09-06 11:39:30', '0', '-1');
INSERT INTO `tb_folder` VALUES ('61', 'user_f7ec4265', '987', '2019-09-06 11:38:38', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('62', 'user_f7ec4265', '新建文件夹', '2019-09-06 11:43:52', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('63', 'user_f7ec4265', 'ffff', '2019-09-06 11:45:27', null, '0', '0');
INSERT INTO `tb_folder` VALUES ('64', 'user_f7ec4265', 'jsu123', '2019-09-06 11:46:08', null, '45', '0');
INSERT INTO `tb_folder` VALUES ('65', 'user_f7ec4265', 'jsu456', '2019-09-06 11:46:17', null, '45', '0');
INSERT INTO `tb_folder` VALUES ('66', 'user_f7ec4265', '简历', '2019-09-06 12:42:27', null, '45', '1');
INSERT INTO `tb_folder` VALUES ('67', 'user_07e1c6c4', 'ok', '2019-09-06 14:24:29', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('68', 'user_07e1c6c4', '我行', '2019-09-06 14:22:28', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('69', 'user_a0eb3028', '基础', '2019-09-06 14:44:53', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('70', 'user_a0eb3028', '视频', '2019-09-06 15:02:06', null, '69', '1');
INSERT INTO `tb_folder` VALUES ('71', 'user_a0eb3028', '娱乐', '2019-09-06 15:01:51', null, '69', '1');
INSERT INTO `tb_folder` VALUES ('72', 'user_a0eb3028', '资料', '2019-09-06 15:19:15', null, '69', '1');
INSERT INTO `tb_folder` VALUES ('73', 'user_a8baf8e9', '基础', '2019-09-06 15:13:47', null, '0', '1');
INSERT INTO `tb_folder` VALUES ('74', 'user_a8baf8e9', '文档', '2019-09-06 15:15:43', null, '73', '1');

-- ----------------------------
-- Table structure for tb_share
-- ----------------------------
DROP TABLE IF EXISTS `tb_share`;
CREATE TABLE `tb_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享Id',
  `user_id` varchar(16) DEFAULT NULL COMMENT '用户Id',
  `content` text COMMENT '内容',
  `effective_time` int(11) DEFAULT NULL COMMENT '有效时间',
  `share_time` datetime DEFAULT NULL COMMENT '分享时间',
  `share_code` varchar(10) DEFAULT NULL COMMENT '分享验证码',
  `check_code` varchar(100) DEFAULT NULL COMMENT '校验码',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_share_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_share
-- ----------------------------
INSERT INTO `tb_share` VALUES ('6', 'user_123', '123.jpg,的撒,', '-1', '2019-09-02 10:58:17', 'togd', '03e908009130_4edb8701f9');
INSERT INTO `tb_share` VALUES ('7', 'user_123', 'wqwwq,分,', '7', '2019-09-01 10:59:30', null, '661c44ebc6ec_4c8eab9ab7');
INSERT INTO `tb_share` VALUES ('14', 'user_123', 'abcd.pdf,', '1', '2019-09-06 11:50:26', 'r6i1', '2706e6a1ea7b_4765a552f5');
INSERT INTO `tb_share` VALUES ('16', 'user_f7ec4265', '123456,', '7', '2019-09-06 13:46:49', null, 'faff23badf24_4d0499fb98');
INSERT INTO `tb_share` VALUES ('17', 'user_07e1c6c4', 'abcd.pdf,', '7', '2019-09-06 14:27:11', 'ko5q', '9474b28c6842_430fb3d378');
INSERT INTO `tb_share` VALUES ('18', 'user_07e1c6c4', 'jsu123.xlsx,', '7', '2019-09-06 14:30:13', 'nwj2', '27378ed68e40_4e879e4f41');
INSERT INTO `tb_share` VALUES ('19', 'user_a0eb3028', 'jsu789.pdf,', '7', '2019-09-06 14:51:36', 'k6mc', 'c8ebb50f61db_41d6bdadda');
INSERT INTO `tb_share` VALUES ('20', 'user_a8baf8e9', 'abc789.pdf,', '7', '2019-09-06 15:16:37', 's2ia', 'f1b7ca28a319_4b999b7449');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` varchar(16) NOT NULL COMMENT '用户Id',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `picture` varchar(255) DEFAULT NULL COMMENT '头像',
  `total_capacity` int(11) DEFAULT NULL COMMENT '总容量(GB)',
  `has_capacity` int(11) DEFAULT NULL COMMENT '已使用容量(GB)',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `sex` varchar(5) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('user_07e1c6c4', 'jsu1', '5634B31543ABE466F59F5786D4EC350D', '15346978574', '1@qq.com', null, '500', '3506964', '2019-09-06 14:17:55', '1', '0');
INSERT INTO `tb_user` VALUES ('user_087b1460', 'jkl369', '3F489082AB041A391C04ADC19FC7750D', '15274436936', '3219492506@qq.com', null, '500', null, null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_123', 'jsu123', '5634B31543ABE466F59F5786D4EC350D', '15274411111', '123456@qq.com', null, '500', '55', null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_124', 'jkk123', null, '', '', null, '500', '111', null, '1', '2');
INSERT INTO `tb_user` VALUES ('user_2a678a4c', 'jkl123456', '3F489082AB041A391C04ADC19FC7750D', '15274439865', '3219492509@qq.com', null, '500', null, null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_46ec6f48', 'jsu1234', '253AC1C328F9D9A616CBD936646E58DD', null, '1739434@qq.com', null, '500', '113', null, '1', '2');
INSERT INTO `tb_user` VALUES ('user_4d513a46', 'jkl987', '3F489082AB041A391C04ADC19FC7750D', '15274439666', '3219492505@qq.com', null, '500', null, null, '1', '2');
INSERT INTO `tb_user` VALUES ('user_6ea0045e', 'jkl147', '3F489082AB041A391C04ADC19FC7750D', '15274414714', '147@qq.com', null, '500', '124', null, '1', '2');
INSERT INTO `tb_user` VALUES ('user_934b05ac', 'jkl789', '3F489082AB041A391C04ADC19FC7750D', '15274439866', '3219492504@qq.com', null, '500', '22', null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_99ba073e', 'zero', '4A235317DAC49ED5F0F985A45CC15D90', '17374383221', '937637598@qq.com', null, null, null, null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_9eda1dc7', 'jkl23456', '3F489082AB041A391C04ADC19FC7750D', '17666376687', '3219492508@qq.com', null, '500', '0', '2019-09-06 11:36:44', '1', '0');
INSERT INTO `tb_user` VALUES ('user_a0eb3028', 'jsu1234567', '4A235317DAC49ED5F0F985A45CC15D90', '15274454191', '1739434148@qq.com', null, '500', '870503', '2019-09-06 14:44:06', '1', '0');
INSERT INTO `tb_user` VALUES ('user_a8baf8e9', 'jsu1573', '4A235317DAC49ED5F0F985A45CC15D90', '15343057724', '1739434147@qq.com', null, '500', '578386', '2019-09-06 15:13:08', '1', '0');
INSERT INTO `tb_user` VALUES ('user_e03c449b', 'jkl123', '3F489082AB041A391C04ADC19FC7750D', '15274422222', '12345@qq.com', null, '500', '33', null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_e0a42bad', 'jkl12345', '3F489082AB041A391C04ADC19FC7750D', '17666376688', '3219492507@qq.com', null, '500', '44', null, '1', '0');
INSERT INTO `tb_user` VALUES ('user_f7ec4265', 'jsu123456', '4A235317DAC49ED5F0F985A45CC15D90', '15274454190', '1739434@qq.com', null, '500', '1052695', null, '1', '0');
