/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : teamwork

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-08-29 17:52:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `brief` varchar(640) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '摘要',
  `detail` text COMMENT '文章内容',  
  `category` varchar(32) DEFAULT NULL COMMENT '分类',
  `access` varchar(32) DEFAULT NULL COMMENT '访问权限',
  `status` varchar(32) DEFAULT NULL COMMENT '状态：草稿、发布',
  `view_time` int(8) DEFAULT NULL COMMENT '阅读次数',
  `thumb_up_time` int(8) DEFAULT NULL COMMENT '点赞次数',
  `author_name` varchar(64) DEFAULT NULL COMMENT '创建者名称',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(64) NOT NULL COMMENT '主键',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('150327840738', 'task', 'T17072111340965', '456789', 'chenzhong.sy@star-net.cn', '2017-08-21 09:20:08', 'chenzhong.sy@star-net.cn', '2017-08-21 09:20:08', '1');
INSERT INTO `comment` VALUES ('150328346498', 'task', 'T17081614174204', '9999', 'chenzhong.sy@star-net.cn', '2017-08-21 10:44:25', 'chenzhong.sy@star-net.cn', '2017-08-21 10:44:25', '1');
INSERT INTO `comment` VALUES ('150328354240', 'task', 'T17081614174204', '12456', 'chenzhong.sy@star-net.cn', '2017-08-21 10:45:42', 'chenzhong.sy@star-net.cn', '2017-08-21 10:45:42', '1');
INSERT INTO `comment` VALUES ('150328382070', 'task', 'T17081614174204', '333333', 'chenzhong.sy@star-net.cn', '2017-08-21 10:50:21', 'chenzhong.sy@star-net.cn', '2017-08-21 10:50:21', '1');
INSERT INTO `comment` VALUES ('150328445045', 'task', 'T17081614174204', '123456', 'chenzhong.sy@star-net.cn', '2017-08-21 11:00:50', 'chenzhong.sy@star-net.cn', '2017-08-21 11:00:50', '1');
INSERT INTO `comment` VALUES ('150328469519', 'task', 'T17072111340965', '可怜', 'chenzhong.sy@star-net.cn', '2017-08-21 11:04:55', 'chenzhong.sy@star-net.cn', '2017-08-21 11:04:55', '1');
INSERT INTO `comment` VALUES ('150328472200', 'task', 'T17080215071754', '可怜', 'chenzhong.sy@star-net.cn', '2017-08-21 11:05:22', 'chenzhong.sy@star-net.cn', '2017-08-22 13:48:07', '1');
INSERT INTO `comment` VALUES ('150328478190', 'task', 'T17080215071754', '002396', 'chenzhong.sy@star-net.cn', '2017-08-21 11:06:21', 'chenzhong.sy@star-net.cn', '2017-08-21 16:55:55', '1');
INSERT INTO `comment` VALUES ('150328480313', 'task', 'T17080215071754', '10086', 'chenzhong.sy@star-net.cn', '2017-08-21 11:06:43', 'chenzhong.sy@star-net.cn', '2017-08-21 16:55:55', '1');
INSERT INTO `comment` VALUES ('150328589869', 'task', 'T17080215071754', 'ABCD', 'chenzhong.sy@star-net.cn', '2017-08-21 11:24:59', 'chenzhong.sy@star-net.cn', '2017-08-21 16:55:54', '1');
INSERT INTO `comment` VALUES ('150328618928', 'task', 'T17072111340965', '我来了', 'dingqingfa@star-net.cn', '2017-08-21 11:29:49', 'dingqingfa@star-net.cn', '2017-08-21 11:29:49', '1');
INSERT INTO `comment` VALUES ('150328621766', 'task', 'T17081614174204', '搞啥子<br />', 'dingqingfa@star-net.cn', '2017-08-21 11:30:17', 'dingqingfa@star-net.cn', '2017-08-21 11:30:17', '1');
INSERT INTO `comment` VALUES ('150328622447', 'task', 'T17081614174204', '搞啥子', 'dingqingfa@star-net.cn', '2017-08-21 11:30:25', 'dingqingfa@star-net.cn', '2017-08-21 11:30:25', '1');
INSERT INTO `comment` VALUES ('150328623004', 'task', 'T17081614174204', '搞啥子<br />', 'dingqingfa@star-net.cn', '2017-08-21 11:30:30', 'dingqingfa@star-net.cn', '2017-08-21 11:30:30', '1');
INSERT INTO `comment` VALUES ('150328639687', 'task', 'T17072111340965', '还要多久；\n我才能在你身边；', 'dingqingfa@star-net.cn', '2017-08-21 11:33:16', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:30', '1');
INSERT INTO `comment` VALUES ('150328643210', 'task', 'T17072111340965', '好不容易；\n又能再多爱一天；\n说了拜拜。', 'dingqingfa@star-net.cn', '2017-08-21 11:33:53', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:29', '1');
INSERT INTO `comment` VALUES ('150328646714', 'task', 'T17072111340965', '我怎么看不见。<br />没想到；<br />我还流着泪。', 'dingqingfa@star-net.cn', '2017-08-21 11:34:27', 'chenzhong.sy@star-net.cn', '2017-08-22 17:53:06', '1');
INSERT INTO `comment` VALUES ('150329484087', 'task', 'T17082113454481', 'c:if 标签多条件判断；<br /><c:if test=\"${fn:contains(task.assignTo, user.email) and status.count <= 3}\"><br />	<img class=\"img-circle photo-small\" src=\"${user.photo}\"><br /></c:if>', 'chenzhong.sy@star-net.cn', '2017-08-21 13:54:01', 'chenzhong.sy@star-net.cn', '2017-08-21 13:54:01', '1');
INSERT INTO `comment` VALUES ('150329489305', 'task', 'T17082113454481', 'c:if 标签多条件判断：<br />\"<c:if test=\"${fn:contains(task.assignTo, user.email) and status.count <= 3}\"><br />													<img class=\"img-circle photo-small\" src=\"${user.photo}\"><br />												</c:if>\"', 'dingqingfa@star-net.cn', '2017-08-21 13:54:54', 'dingqingfa@star-net.cn', '2017-08-21 13:54:54', '1');
INSERT INTO `comment` VALUES ('150329512069', 'task', 'T17082113454481', '新增留言时先清空输入框内容。', 'dingqingfa@star-net.cn', '2017-08-21 13:58:41', 'dingqingfa@star-net.cn', '2017-08-21 13:58:41', '0');
INSERT INTO `comment` VALUES ('150330014669', 'task', 'T17082115212269', 'AMQP，即Advanced Message Queuing Protocol,一个提供统一消息服务的应用层标准高级消息队列协议,是应用层协议的一个开放标准,为面向消息的中间件设计。', 'chenzhong.sy@star-net.cn', '2017-08-21 15:22:27', 'chenzhong.sy@star-net.cn', '2017-08-21 15:22:27', '1');
INSERT INTO `comment` VALUES ('150330017243', 'task', 'T17082115212269', 'AMQP，即Advanced Message Queuing Protocol,一个提供统一消息服务的应用层标准高级消息队列协议,是应用层协议的一个开放标准,为面向消息的中间件设计。', 'dingqingfa@star-net.cn', '2017-08-21 15:22:53', 'dingqingfa@star-net.cn', '2017-08-21 15:22:53', '0');
INSERT INTO `comment` VALUES ('150330058162', 'task', 'T17082115212269', 'RabbitMQ是一个由erlang开发的AMQP（Advanced Message Queue ）的开源实现。AMQP 的出现其实也是应了广大人民群众的需求，虽然在同步消息通讯的世界里有很多公开标准（如 COBAR的 IIOP ，或者是 SOAP 等），但是在异步消息处理中却不是这样，只有大企业有一些商业实现（如微软的 MSMQ ，IBM 的 Websphere MQ 等），因此，在 2006 年的 6 月，Cisco 、Redhat、iMatix 等联合制定了 AMQP 的公开标准。', 'dingqingfa@star-net.cn', '2017-08-21 15:29:42', 'dingqingfa@star-net.cn', '2017-08-21 15:29:42', '1');
INSERT INTO `comment` VALUES ('150330059653', 'task', 'T17082115212269', 'RabbitMQ是一个由erlang开发的AMQP（Advanced Message Queue ）的开源实现。<br />AMQP 的出现其实也是应了广大人民群众的需求，虽然在同步消息通讯的世界里有很多公开标准（如 COBAR的 IIOP ，或者是 SOAP 等），但是在异步消息处理中却不是这样，只有大企业有一些商业实现（如微软的 MSMQ ，IBM 的 Websphere MQ 等），因此，在 2006 年的 6 月，Cisco 、Redhat、iMatix 等联合制定了 AMQP 的公开标准。', 'dingqingfa@star-net.cn', '2017-08-21 15:29:57', 'dingqingfa@star-net.cn', '2017-08-21 15:29:57', '0');
INSERT INTO `comment` VALUES ('150330063722', 'task', 'T17082115212269', 'http://blog.csdn.net/anzhsoft/article/details/19563091', 'dingqingfa@star-net.cn', '2017-08-21 15:30:37', 'dingqingfa@star-net.cn', '2017-08-21 15:30:37', '0');
INSERT INTO `comment` VALUES ('150338880877', 'task', 'T17082216000748', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 16:00:08', 'chenzhong.sy@star-net.cn', '2017-08-22 16:00:08', '0');
INSERT INTO `comment` VALUES ('150338973749', 'task', 'T17082216153745', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 16:15:37', 'chenzhong.sy@star-net.cn', '2017-08-22 16:15:37', '0');
INSERT INTO `comment` VALUES ('150339003366', 'task', 'T17082216202844', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 16:20:34', 'chenzhong.sy@star-net.cn', '2017-08-22 16:20:34', '0');
INSERT INTO `comment` VALUES ('150339257109', 'task', 'T17082217025165', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 17:02:52', 'chenzhong.sy@star-net.cn', '2017-08-22 17:02:52', '0');
INSERT INTO `comment` VALUES ('150339729672', 'task', 'T17072111340965', '说点什么', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:37', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:37', '0');
INSERT INTO `comment` VALUES ('150340085366', 'task', 'T17082219204886', '创建了这个任务。 --auto create', 'dingqingfa@star-net.cn', '2017-08-22 19:20:53', 'dingqingfa@star-net.cn', '2017-08-22 19:20:53', '0');
INSERT INTO `comment` VALUES ('150340121635', 'task', 'T17082219265146', '创建了这个任务。 --auto create', 'dingqingfa@star-net.cn', '2017-08-22 19:26:57', 'dingqingfa@star-net.cn', '2017-08-22 19:26:57', '0');
INSERT INTO `comment` VALUES ('150340156387', 'task', 'T17082219323841', '创建了这个任务。 --automatic generation--', 'dingqingfa@star-net.cn', '2017-08-22 19:32:43', 'dingqingfa@star-net.cn', '2017-08-22 19:32:43', '0');
INSERT INTO `comment` VALUES ('150345423725', 'task', 'T17082310103761', '创建了这个任务。 --automatic generation--', 'dingqingfa@star-net.cn', '2017-08-23 10:10:38', 'dingqingfa@star-net.cn', '2017-08-23 10:10:38', '0');

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
INSERT INTO `project` VALUES ('P17082219354920', 'X66L', '楼宇设备新产品，DS2600处理器，linux平台。\r\n和X66_3.0 共用主板。', '0', '0%', 'liqing@star-net.cn', 'dingqingfa@star-net.cn', '2017-08-22 19:35:50', 'dingqingfa@star-net.cn', '2017-08-22 19:35:50', '2017-08-22 19:35:50', null, '0');

-- ----------------------------
-- Table structure for subtask
-- ----------------------------
DROP TABLE IF EXISTS `subtask`;
CREATE TABLE `subtask` (
  `id` bigint(64) NOT NULL COMMENT '主键',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子任务';

-- ----------------------------
-- Records of subtask
-- ----------------------------
INSERT INTO `subtask` VALUES ('150303539524', 'T17072111340965', '重新设计UI', '1', null, '2017-08-18 13:49:56', null, '2017-08-22 18:19:32', null);
INSERT INTO `subtask` VALUES ('150329438031', 'T17082113454481', '任务面板头部最多显示3个处理人；', '1', null, '2017-08-21 13:46:20', null, '2017-08-21 13:47:11', null);
INSERT INTO `subtask` VALUES ('150336782165', 'T17080410424594', '测试', '1', null, '2017-08-22 10:10:21', null, '2017-08-22 10:10:23', null);
INSERT INTO `subtask` VALUES ('150339717184', 'T17072111340965', '编写桌面widget', '0', null, '2017-08-22 18:19:31', null, '2017-08-22 18:19:31', null);
INSERT INTO `subtask` VALUES ('150339719694', 'T17072111340965', '实现监视、呼叫物业、布撤防、通话记录功能。', '0', null, '2017-08-22 18:19:56', null, '2017-08-22 18:19:56', null);

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
  `priority` varchar(32) DEFAULT NULL COMMENT '优先级',
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
INSERT INTO `task` VALUES ('T17071817150796', 'teamwork', '账号注册登录以及权限校验', 'fsfffffffff啊手动阀手动阀', '10003', '100%', '0', 'dingqingfa@star-net.cn', 'chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn;hongguifang@star-net.cn;chenronghui@star-net.cn;dingqingfa@star-net.cn', null, '2017-07-18 17:15:07', null, '2017-08-22 19:12:18', '2017-07-21', '', '', '', '0');
INSERT INTO `task` VALUES ('T17072111340965', 'teamwork', '魔镜第二阶段，新样机，带网线', '需要实现以下功能：<br />1. 重新设计UI；<br />2. 编写桌面空间widget；<br />3. 实现基本功能，呼叫中心、监视、记录；<br />', '10002', '33%', '1', 'hongguifang@star-net.cn', 'chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn;hongguifang@star-net.cn;chenronghui@star-net.cn;dingqingfa@star-net.cn', null, '2017-07-21 11:34:10', null, '2017-08-28 00:07:05', '2017-09-15', '2017-07-29', '处理说明', 'http://www.baidu.com/abcd', '0');
INSERT INTO `task` VALUES ('T17073000453713', 'teamwork', '文件上传与管理功能', '', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-07-30 00:45:38', null, '2017-08-22 19:34:17', '2017-07-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17080215071754', 'teamwork', '搜索功能', '搜索内容', '10002', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn;hongguifang@star-net.cn;chenronghui@star-net.cn', null, '2017-08-02 15:07:18', null, '2017-08-28 00:07:04', '2017-08-10', null, null, null, '0');
INSERT INTO `task` VALUES ('T17081614174204', 'teamwork', '使用redis缓存', '提高系统响应速度；<br />管理用户登录信息；', '10002', '83%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-16 14:17:42', null, '2017-08-22 19:07:43', '2017-08-19', null, null, null, '1');
INSERT INTO `task` VALUES ('T17082109121894', '成品定制', '小咚批量生产问题跟踪', '新一批小咚代工生产过程中出现一定数量设备无法正常配对的问题。', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-21 09:12:18', null, '2017-08-22 19:34:17', '2017-08-25', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082113454481', 'teamwork', '任务管理功能完善', '详见', '10003', '100%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-21 13:45:44', null, '2017-08-21 13:59:28', '2017-08-25', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082115212269', '成品定制', 'T91对接花样年云平台', '1.使用AMQP协议。', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-21 15:21:23', null, '2017-08-22 19:34:16', '2017-09-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082219204886', 'teamwork', '知识文章功能模块', '支持文章增删改；<br />支持按类别查看；', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-22 19:20:48', null, '2017-08-22 19:34:15', '2017-08-25', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082219265146', '成品定制', '花样年T91对接云平台', '支持sip对讲；<br />实现amqp协议；<br />实现远程控制；', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-22 19:26:52', null, '2017-08-22 19:34:14', '2017-09-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082219323841', 'teamwork', '测试任务1', '什么事；<br />阿萨德发<br />a文文；', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-22 19:32:38', null, '2017-08-22 19:34:03', '2017-08-31', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082310103761', 'teamwork', '这是一个测试任务3', '', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-23 10:10:38', null, '2017-08-23 10:10:38', '2017-08-31', null, null, null, '0');

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
INSERT INTO `user` VALUES ('102', null, null, null, 'T11478', 'T11478', '陈钟', 'chenzhong.sy@star-net.cn', null, null, null, '/images/photo/giraffe.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('103', null, null, null, 'T10667', 'T10667', '李晴', 'liqing@star-net.cn', null, null, null, '/images/photo/lion.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('104', null, null, null, 'T11441', 'T11441', '林圣腾', 'linshengteng@star-net.cn', null, null, null, '/images/photo/rhino.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('105', null, null, null, 'T4025', 'T4025', '方雪嵘', 'fangxuerong@star-net.cn', null, null, null, '/images/photo/zebra.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('106', null, null, null, 'T12665', 'T12665', '黄文文', 'huangwenwen@star-net.cn', null, null, null, '/images/photo/dragon.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('107', null, null, null, 'T12693', 'T12693', '洪桂芳', 'hongguifang@star-net.cn', null, null, null, '/images/photo/elephant.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('108', null, null, null, 'T13482', 'T13482', '陈荣辉', 'chenronghui@star-net.cn', null, null, null, '/images/photo/pig.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('109', null, null, null, '115513875', 'T10316', '丁庆发', 'dingqingfa@star-net.cn', null, null, null, '/images/photo/hippo.png', null, null, null, null, null, null, null, null, null, null);
