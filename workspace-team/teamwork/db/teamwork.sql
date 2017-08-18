/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : teamwork

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-08-19 01:05:17
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
INSERT INTO `project` VALUES ('100', 'T91R', 'first project', null, null, null, 'dqf', '2017-07-27 19:45:16', null, null, null, null, null);
INSERT INTO `project` VALUES ('1002', 'I66', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1003', 'I68', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1004', 'teamwork', null, null, null, null, '丁庆发', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('11', '辅助生产', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('12', '成品定制', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('13', '方案预研', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('14', '成品维护', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('15', '板卡定制', null, null, null, null, 'admin', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `en_name` varchar(64) DEFAULT NULL COMMENT '英文名称',
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
INSERT INTO `sys_dict` VALUES ('10001', '初稿', 'new', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10002', '正在处理', 'doing', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10003', '完成', 'done', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10004', '已审核', 'checked', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10005', '已归档', 'archived', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10006', '暂停', 'pause', 'task_status', null, null, null, null, null);

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
  `assign_to` varchar(256) DEFAULT NULL COMMENT '处理者',
  `follower` varchar(256) DEFAULT NULL COMMENT '关注人',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `expect_finish_date` varchar(64) DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` varchar(64) DEFAULT NULL COMMENT '实际完成时间',
  `finish_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '完成说明',
  `finish_link` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务标题',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('T17071817150796', 'teamwork', '账号注册登录以及权限校验', 'fsfffffffff啊手动阀手动阀', '10006', '100%', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn', 'dingqingfa@star-net.cn;liqing@star-net.cn;fangxuerong@star-net.cn', null, '2017-07-18 17:15:07', null, '2017-08-15 19:24:15', '2017-07-21', '', '', '', '0');
INSERT INTO `task` VALUES ('T17072111340965', 'teamwork', '魔镜第二阶段，新样机，带网线', '需要实现以下功能：<br />1. 重新设计UI；<br />2. 编写桌面空间widget；<br />3. 实现基本功能，呼叫中心、监视、记录；<br />', '10002', '75%', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;fangxuerong@star-net.cn', '', null, '2017-07-21 11:34:10', null, '2017-08-19 01:04:16', '2017-08-31', '2017-07-29', '处理说明', 'http://www.baidu.com/abcd', '0');
INSERT INTO `task` VALUES ('T17072610461800', 'T91R', '瓦力瓦力', '', '10003', '0%', 'dingqingfa@star-net.cn;linshengteng@star-net.cn', 'chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-07-26 10:46:18', null, '2017-08-17 11:34:04', '2017-07-14', '2017-07-31', '小菜一碟', 'http://192.168.12.111111', '0');
INSERT INTO `task` VALUES ('T17073000453713', 'teamwork', '文件上传与管理功能', '添加需求描述', '10003', '0%', 'chenzhong.sy@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-07-30 00:45:38', null, '2017-08-15 17:34:30', '2017-07-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17080215071754', 'T91R', '搜索功能', '', '10002', '100%', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-02 15:07:18', null, '2017-08-15 17:29:01', '2017-08-10', null, null, null, '0');
INSERT INTO `task` VALUES ('T17080318152860', '板卡定制', '又一个邮件发送测试', 'how do you do.', '10001', '0%', '丁庆发', 'dingqingfa@star-net.cn', null, '2017-08-03 18:15:28', null, '2017-08-04 10:56:36', '2017-08-11', null, null, null, '1');
INSERT INTO `task` VALUES ('T17080401011453', '板卡定制', '1234132412', '', '10001', '0%', '丁庆发', 'dingqingfa@star-net.cn', null, '2017-08-04 01:01:14', null, '2017-08-04 01:01:14', '2017-08-10', null, null, null, '1');
INSERT INTO `task` VALUES ('T17080410271187', '板卡定制', '邮箱测试新任务', '就是实现发送任务简述发送。', '10001', '0%', '丁庆发', 'dingqingfa@star-net.cn', null, '2017-08-04 10:27:11', null, '2017-08-04 10:27:11', '2017-08-17', null, null, null, '1');
INSERT INTO `task` VALUES ('T17080410341638', 'teamwork', '发送邮件测试任务', '发送邮件测试任务。。。。', '10003', '0%', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-04 10:34:17', null, '2017-08-15 17:34:57', '2017-08-10', '2017-08-04', '', '', '0');
INSERT INTO `task` VALUES ('T17080410424594', 'T91R', '新的邮件任务发送测试', '爱情两个字多烦忧。', '10002', '0%', 'dingqingfa@star-net.cn;liqing@star-net.cn', 'chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-04 10:42:46', null, '2017-08-16 09:08:53', '2017-08-18', null, null, null, '0');
INSERT INTO `task` VALUES ('T17080411022388', 'I66', '有一个新的发送邮件测试任务', 'how are you.', '10006', '0%', 'chenzhong.sy@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-04 11:02:23', null, '2017-08-15 18:59:23', '2017-08-11', null, null, null, '0');
INSERT INTO `task` VALUES ('T17081110415211', 'I68', '测试任务吧', '', '10001', '0%', '丁庆发', 'dingqingfa@star-net.cn', null, '2017-08-11 10:41:53', null, '2017-08-11 10:41:53', '2017-08-25', null, null, null, '1');
INSERT INTO `task` VALUES ('T17081110510556', '板卡定制', '测试一下flash读写', '略', '10001', '0%', '丁庆发', 'dingqingfa@star-net.cn', null, '2017-08-11 10:51:05', null, '2017-08-11 10:51:05', '2017-08-17', null, null, null, '1');
INSERT INTO `task` VALUES ('T17081111014068', 'T91R', '嘻哈嘻哈', '没有什么', '10001', '0%', '丁庆发', 'dingqingfa@star-net.cn', null, '2017-08-11 11:01:41', null, '2017-08-11 11:01:41', '2017-08-18', null, null, null, '1');
INSERT INTO `task` VALUES ('T17081614174204', 'teamwork', '使用redis缓存', '提高系统响应速度；<br />管理用户登录信息；', '10002', '0%', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;linshengteng@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-16 14:17:42', null, '2017-08-16 15:11:19', '2017-08-19', null, null, null, '0');
INSERT INTO `task` VALUES ('T17081614410417', 'teamwork', '增加redis机制', '提高系统反应速度；<br />管理用户登录状态；', '10001', '0%', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-16 14:41:04', null, '2017-08-16 14:41:04', '2017-08-18', null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=150307188906 DEFAULT CHARSET=utf8 COMMENT='任务检查项';

-- ----------------------------
-- Records of task_check_list
-- ----------------------------
INSERT INTO `task_check_list` VALUES ('150302715946', 'T17072111340965', 'HELLO I miss you！', '0', null, '2017-08-18 11:32:40', null, '2017-08-19 01:02:13', null);
INSERT INTO `task_check_list` VALUES ('150302734343', 'T17072111340965', '好样的', '1', null, '2017-08-18 11:35:43', null, '2017-08-19 01:02:16', null);
INSERT INTO `task_check_list` VALUES ('150303539524', 'T17072111340965', '重新设计UI', '1', null, '2017-08-18 13:49:56', null, '2017-08-19 01:02:15', null);
INSERT INTO `task_check_list` VALUES ('150307143520', 'T17072111340965', '搞笑不搞笑', '1', null, '2017-08-18 23:50:36', null, '2017-08-19 01:02:15', null);
INSERT INTO `task_check_list` VALUES ('150307143908', 'T17072111340965', 'ABC abc', '0', null, '2017-08-18 23:50:40', null, '2017-08-19 01:02:14', null);
INSERT INTO `task_check_list` VALUES ('150307144409', 'T17072111340965', '是我是我。', '1', null, '2017-08-18 23:50:44', null, '2017-08-19 01:02:15', null);
INSERT INTO `task_check_list` VALUES ('150307145037', 'T17072111340965', '来我加完吧。', '1', null, '2017-08-18 23:50:51', null, '2017-08-19 00:11:27', null);
INSERT INTO `task_check_list` VALUES ('150307145466', 'T17072111340965', '对啊对啊', '1', null, '2017-08-18 23:50:54', null, '2017-08-19 00:11:27', null);

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
INSERT INTO `user` VALUES ('101', null, null, null, '115513875', 'T10316', '丁庆发', 'dingqingfa@star-net.cn', null, null, null, '/images/ding.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('102', null, null, null, '123456', 'T11478', '陈钟', 'chenzhong.sy@star-net.cn', null, null, null, '/images/chen.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('103', null, null, null, null, 'T10667', '李晴', 'liqing@star-net.cn', null, null, null, '/images/justgun.gif', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('104', null, null, null, null, 'T11441', '林圣腾', 'linshengteng@star-net.cn', null, null, null, '/images/lin.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('105', null, null, null, null, 'T4025', '方雪嵘', 'fangxuerong@star-net.cn', null, null, null, '/images/fang.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('106', null, null, null, null, 'T12665', '黄文文', 'huangwenwen@star-net.cn', null, null, null, '/images/fang.png', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category` varchar(32) DEFAULT NULL COMMENT '类型',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '所属',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150307188906 DEFAULT CHARSET=utf8 COMMENT='评论';
