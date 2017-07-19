/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : teamwork

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-07-19 14:04:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '项目名称',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目需求',
  `status` varchar(64) DEFAULT NULL COMMENT '项目状态：1、未开始，2、正在进行，3、已完成，4、已结项，5、已归档',
  `progress` varchar(64) DEFAULT NULL COMMENT '项目进度',
  `project_manager` varchar(64) DEFAULT NULL COMMENT '项目经理',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `expect_finish_date` datetime DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` datetime DEFAULT NULL COMMENT '实际完成时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('10', '板卡定制', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1001', 'T91R', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1002', 'I66', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1003', 'I68', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1004', 'teamwork', null, null, null, null, '丁庆发', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('11', '辅助生产', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('12', '成品定制', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('13', '方案预研', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('14', '成品维护', null, null, null, null, 'admin', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `sort` varchar(64) DEFAULT NULL COMMENT '分类',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('10001', '未开始', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10002', '正在处理', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10003', '已完成', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10004', '已审核', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10005', '已归档', 'task_status', null, null, null, null, null);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `project_name` varchar(64) DEFAULT NULL COMMENT '所属项目',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务标题',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务描述',
  `status` varchar(64) DEFAULT NULL COMMENT '任务状态：1、未分配，2、正在处理，3、已完成，4、已审核，5、已归档',
  `progress` varchar(64) DEFAULT NULL COMMENT '任务进度',
  `assign_to` varchar(64) DEFAULT NULL COMMENT '处理者',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `expect_finish_date` varchar(64) DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` datetime DEFAULT NULL COMMENT '实际完成时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('T17071117455409', 'T91R', '这是一个测试任务', null, '10001', '0', '丁庆发', null, '2017-07-11 17:45:55', null, '2017-07-11 17:45:55', '2017-07-13', null, '0');
INSERT INTO `task` VALUES ('T17071123471501', 'I66', '乌龟王八蛋', null, '10002', '60', '陈钟', null, '2017-07-11 23:47:15', null, '2017-07-11 23:47:15', '2017-07-15', null, '0');
INSERT INTO `task` VALUES ('T17071123473245', 'I68', '两只垃圾桶', null, '10003', '100', '陈钟', null, '2017-07-11 23:47:33', null, '2017-07-11 23:47:33', '2017-07-22', null, '0');
INSERT INTO `task` VALUES ('T17071201110769', 'I66', '这是一个策士任务', null, '10004', '0', '陈钟', null, '2017-07-12 01:11:07', null, '2017-07-12 01:11:07', '2017-07-08', null, '1');
INSERT INTO `task` VALUES ('T17071201302728', 'I66', '去买一瓶酱油', null, '10001', '0', '陈钟', null, '2017-07-12 01:30:27', null, '2017-07-12 01:30:27', '2017-07-23', null, '0');
INSERT INTO `task` VALUES ('T17071208572495', 'I66', '清理卫生吧', null, '10001', '0', '丁庆发', null, '2017-07-12 08:57:25', null, '2017-07-12 08:57:25', '2017-07-14', null, '0');
INSERT INTO `task` VALUES ('T17071213415847', 'T91R', '参加目屿岛拓展活动', null, '10002', '0', '陈钟', null, '2017-07-12 13:41:58', null, '2017-07-12 13:41:58', '2017-07-13', null, '0');
INSERT INTO `task` VALUES ('T17071218595768', 'T91R', '再来一个任务。', null, '10002', '0', '丁庆发', null, '2017-07-12 18:59:58', null, '2017-07-12 18:59:58', '2017-07-13', null, '1');
INSERT INTO `task` VALUES ('T17071412262738', 'T91R', '参加年中大会', null, '10003', '0', '丁庆发', null, '2017-07-14 12:26:28', null, '2017-07-14 12:26:28', '2017-07-28', null, '0');
INSERT INTO `task` VALUES ('T17071711311582', 'T91R', '美格新7寸室内机', '', '10002', '0', '丁庆发', null, '2017-07-17 11:31:15', null, '2017-07-17 11:31:15', '2017-07-21', null, '0');
INSERT INTO `task` VALUES ('T17071711321772', '板卡定制', '降龙美格10寸室内机微居版本。', '', '10002', '0', '陈钟', null, '2017-07-17 11:32:17', null, '2017-07-17 11:32:17', '2017-07-20', null, '0');
INSERT INTO `task` VALUES ('T17071714074058', '板卡定制', '搞什么名堂', '', '10002', '0', '丁庆发', null, '2017-07-17 14:07:41', null, '2017-07-17 14:07:41', '2017-07-23', null, '0');
INSERT INTO `task` VALUES ('T17071714092240', 'T91R', '生如夏花', '', '10002', '0', '陈钟', null, '2017-07-17 14:09:23', null, '2017-07-17 14:09:23', '2017-07-08', null, '1');
INSERT INTO `task` VALUES ('T17071817141458', 'teamwork', '支持发送邮件', '', '10001', '0', '丁庆发', null, '2017-07-18 17:14:14', null, '2017-07-18 17:14:14', '2017-07-21', null, '0');
INSERT INTO `task` VALUES ('T17071817150796', 'teamwork', '账号注册登录以及权限校验', '', '10001', '0', '丁庆发', null, '2017-07-18 17:15:07', null, '2017-07-18 17:15:07', '2017-07-21', null, '0');
INSERT INTO `task` VALUES ('T17071819393760', null, null, null, null, '0', null, null, '2017-07-18 19:39:38', null, '2017-07-18 19:39:38', null, null, '1');
INSERT INTO `task` VALUES ('T17071819421500', '板卡定制', '测试任务', '', '10001', '0', '丁庆发', null, '2017-07-18 19:42:16', null, '2017-07-18 19:42:16', '2017-07-21', null, '1');
INSERT INTO `task` VALUES ('T17071819484633', '板卡定制', '测试任务', '', '10002', '0', '陈钟', null, '2017-07-18 19:48:46', null, '2017-07-18 19:48:46', '2017-07-15', null, '0');
INSERT INTO `task` VALUES ('T17071819551674', '板卡定制', 'TEST', '', '10001', '0', '陈钟', null, '2017-07-18 19:55:17', null, '2017-07-18 19:55:17', '2017-06-30', null, '0');
INSERT INTO `task` VALUES ('T17071820025361', '板卡定制', '测试任务', '', '10001', '0', '丁庆发', null, '2017-07-18 20:02:54', null, '2017-07-18 20:02:54', '2017-07-14', null, '0');
INSERT INTO `task` VALUES ('T17071820043637', '板卡定制', '测试任务', '', '10001', '0', '丁庆发', null, '2017-07-18 20:04:36', null, '2017-07-18 20:04:36', '2017-12-31', null, '0');
INSERT INTO `task` VALUES ('T17071820183260', 'T91R', 'test', '', '10001', '0', '丁庆发', null, '2017-07-18 20:18:33', null, '2017-07-18 20:18:33', '2017-07-01', null, '0');
INSERT INTO `task` VALUES ('T17071820214850', 'T91R', 'test', '', '10001', '0', '陈钟', null, '2017-07-18 20:21:48', null, '2017-07-18 20:21:48', '2017-07-08', null, '0');
INSERT INTO `task` VALUES ('T17071820311733', '板卡定制', 'test', '', '10001', '0', '丁庆发', null, '2017-07-18 20:31:18', null, '2017-07-18 20:31:18', '2017-07-14', null, '0');
INSERT INTO `task` VALUES ('T17071909164436', 'I68', '1234', '', '10001', '0', '丁庆发', null, '2017-07-19 09:16:44', null, '2017-07-19 09:16:44', '2017-07-07', null, '0');
INSERT INTO `task` VALUES ('T17071909413243', 'I66', 'test', '', '10002', '0', '陈钟', null, '2017-07-19 09:41:32', null, '2017-07-19 09:41:32', '2017-07-07', null, '0');
INSERT INTO `task` VALUES ('T17071909424315', 'T91R', 'test', '', '10003', '0', '陈钟', null, '2017-07-19 09:42:43', null, '2017-07-19 09:42:43', '2017-07-15', null, '0');
INSERT INTO `task` VALUES ('T17071909454695', 'I66', '12341', '', '10002', '0', '陈钟', null, '2017-07-19 09:45:46', null, '2017-07-19 09:45:46', '2017-07-14', null, '0');
INSERT INTO `task` VALUES ('T17071909563005', '板卡定制', '1234', '', '10001', '0', '丁庆发', null, '2017-07-19 09:56:30', null, '2017-07-19 09:56:30', '2017-07-21', null, '0');
INSERT INTO `task` VALUES ('T17071909572035', '板卡定制', '1234', '', '10001', '0', '丁庆发', null, '2017-07-19 09:57:21', null, '2017-07-19 09:57:21', '2017-07-21', null, '0');
INSERT INTO `task` VALUES ('T17071910005768', '板卡定制', '1234', '', '10002', '0', '陈钟', null, '2017-07-19 10:00:58', null, '2017-07-19 10:00:58', '2017-07-22', null, '0');
INSERT INTO `task` VALUES ('T17071910115382', 'T91R', '4132', '4123', '10001', '0', '丁庆发', null, '2017-07-19 10:11:54', null, '2017-07-19 10:11:54', '2017-07-22', null, '0');
INSERT INTO `task` VALUES ('T17071911284733', 'T91R', '1234', '', '10001', '0', '陈钟', null, '2017-07-19 11:28:47', null, '2017-07-19 11:28:47', '2017-07-14', null, '0');
INSERT INTO `task` VALUES ('T17071913552440', 'I66', 'tes', '', '10002', '0', '陈钟', null, '2017-07-19 13:55:25', null, '2017-07-19 13:55:25', '2017-07-21', null, '0');
INSERT INTO `task` VALUES ('T17071913560162', '板卡定制', 'test', '1234', '10001', '0', '陈钟', null, '2017-07-19 13:56:02', null, '2017-07-19 13:56:02', '2017-07-21', null, '0');

-- ----------------------------
-- Table structure for task_check_list
-- ----------------------------
DROP TABLE IF EXISTS `task_check_list`;
CREATE TABLE `task_check_list` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '所属任务',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '检查项描述',
  `status` varchar(64) DEFAULT NULL COMMENT '任务状态：0、未完成，1、已完成',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务检查项';

-- ----------------------------
-- Records of task_checklist
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `qrcode` varchar(1000) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `login_name` (`login_name`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('101', null, null, null, null, 'T10316', '丁庆发', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('102', null, null, null, null, 'T11478', '陈钟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('103', null, null, null, null, 'T10667', '李晴', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
