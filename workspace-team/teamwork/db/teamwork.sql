/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : teamwork

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-07-26 11:28:30
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
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务描述',
  `status` varchar(64) DEFAULT NULL COMMENT '任务状态：1、未分配，2、正在处理，3、已完成，4、已审核，5、已归档',
  `progress` varchar(64) DEFAULT NULL COMMENT '任务进度',
  `assign_to` varchar(64) DEFAULT NULL COMMENT '处理者',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `expect_finish_date` varchar(64) DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` datetime DEFAULT NULL COMMENT '实际完成时间',
  `finish_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '完成说明',
  `finish_link` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务标题',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('T17071817141458', 'teamwork', '支持发送邮件', '12341234', '10003', '0', '丁庆发', '', '2017-07-18 17:14:14', null, '2017-07-25 16:01:02', '2017-07-21', null, null, null, '1');
INSERT INTO `task` VALUES ('T17071817150796', 'teamwork', '账号注册登录以及权限校验', 'fsfffffffff啊手动阀手动阀', '10002', '25%', '丁庆发', null, '2017-07-18 17:15:07', null, '2017-07-26 11:27:20', '2017-07-21', null, null, null, '0');
INSERT INTO `task` VALUES ('T17071909424315', 'T91R', 'test', '', '10003', '0', '陈钟', null, '2017-07-19 09:42:43', null, '2017-07-24 17:36:42', '2017-07-15', null, null, null, '1');
INSERT INTO `task` VALUES ('T17071914373941', 'I68', '检查项测试任务', '123412341', '10003', '0', '丁庆发', null, '2017-07-19 14:37:40', null, '2017-07-25 08:57:39', '2017-07-14', null, null, null, '1');
INSERT INTO `task` VALUES ('T17071917375748', 'T91R', '检查项测试', '', '10001', '0', '陈钟', null, '2017-07-19 17:37:57', null, '2017-07-19 17:37:57', '2017-07-22', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072111340965', 'teamwork', '任务状态增加数量显示；', '', '10002', '5%', '丁庆发', null, '2017-07-21 11:34:10', null, '2017-07-26 11:21:04', '2017-07-22', null, null, null, '0');
INSERT INTO `task` VALUES ('T17072119425981', 'I68', '两只垃圾桶，一只乌龟。一只小鸟。', '什么鸟', '10002', '0', '陈钟', null, '2017-07-21 19:43:00', null, '2017-07-21 19:49:45', '2017-07-22', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072119590044', 'I66', '测试任务 1234132', '', '10001', '0', '丁庆发', null, '2017-07-21 19:59:00', null, '2017-07-21 19:59:07', '2017-07-14', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072200154722', 'T91R', '测试任务', '', '10003', '0', '陈钟', null, '2017-07-22 00:15:47', null, '2017-07-22 00:15:47', '2017-07-30', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072323154929', 'teamwork', '检查项测试任务', '', '10001', '0', '陈钟', null, '2017-07-23 23:15:50', null, '2017-07-23 23:16:36', '2017-07-14', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072400483980', '板卡定制', '检查项测试任务', '', '10002', '0', '丁庆发', null, '2017-07-24 00:48:39', null, '2017-07-24 17:35:24', '2017-07-14', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072416440079', '板卡定制', '123134', '', '10002', '0', '陈钟', null, '2017-07-24 16:44:01', null, '2017-07-24 23:38:52', '2017-07-15', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072417032911', 'T91R', '12341', '', '10002', '0', '李晴', null, '2017-07-24 17:03:30', null, '2017-07-25 00:03:42', '2017-07-08', null, null, null, '1');
INSERT INTO `task` VALUES ('T17072610461800', 'T91R', '瓦力瓦力', '', '10001', '0', '陈钟', null, '2017-07-26 10:46:18', null, '2017-07-26 10:46:18', '2017-07-14', null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='任务检查项';

-- ----------------------------
-- Records of task_check_list
-- ----------------------------
INSERT INTO `task_check_list` VALUES ('62', 'T17071817150796', '1234123', '1', null, '2017-07-26 11:27:20', null, '2017-07-26 11:27:20', '0');
INSERT INTO `task_check_list` VALUES ('63', 'T17071817150796', '41234', '0', null, '2017-07-26 11:27:20', null, '2017-07-26 11:27:20', '0');
INSERT INTO `task_check_list` VALUES ('64', 'T17071817150796', '1234123', '0', null, '2017-07-26 11:27:20', null, '2017-07-26 11:27:20', '0');
INSERT INTO `task_check_list` VALUES ('65', 'T17071817150796', '789789', '0', null, '2017-07-26 11:27:20', null, '2017-07-26 11:27:20', '0');

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
