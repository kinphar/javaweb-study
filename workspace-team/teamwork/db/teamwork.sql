-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.33-log


--
-- Create schema teamwork
--

CREATE DATABASE IF NOT EXISTS teamwork;
USE teamwork;

--
-- Definition of table `user`
--

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Definition of table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `project_id` varchar(64) DEFAULT NULL COMMENT '所属项目',
  `description` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '任务描述',
  `status` varchar(64) DEFAULT NULL COMMENT '任务状态：1、未分配，2、正在处理，3、已完成，4、已审核，5、已归档',
  `assign_to` varchar(64) DEFAULT NULL COMMENT '处理者',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',  
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',  
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `updage_date` datetime DEFAULT NULL COMMENT '更新时间',
  `except_finish_date` datetime DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` datetime DEFAULT NULL COMMENT '实际完成时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='任务';




