/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : bootdo

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-04 14:01:20
create database bootdo;
use bootdo;

*/
use bootdo;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog_content`
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `slug` varchar(255) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `modified` bigint(20) DEFAULT NULL COMMENT '最近修改人id',
  `content` text COMMENT '内容',
  `type` varchar(16) DEFAULT NULL COMMENT '类型',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `categories` varchar(200) DEFAULT NULL COMMENT '分类',
  `hits` int(5) DEFAULT NULL,
  `comments_num` int(5) DEFAULT '0' COMMENT '评论数量',
  `allow_comment` int(1) DEFAULT '0' COMMENT '开启评论',
  `allow_ping` int(1) DEFAULT '0' COMMENT '允许ping',
  `allow_feed` int(1) DEFAULT '0' COMMENT '允许反馈',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `gtm_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gtm_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- ----------------------------
-- Table structure for `oa_notify`
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';


-- ----------------------------
-- Table structure for `oa_notify_record`
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint(20) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`is_read`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';


-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';
-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1','0','企业高管','1','0');
INSERT INTO `sys_dept` VALUES ('2','0','办公室(党委办公室)','2','0');
INSERT INTO `sys_dept` VALUES ('3','0','计划财务部','3','0');
INSERT INTO `sys_dept` VALUES ('4','0','人力资源部(党委组织部)','4','0');
INSERT INTO `sys_dept` VALUES ('5','0','科研管理部','5','0');
INSERT INTO `sys_dept` VALUES ('6','0','机具专委会秘书处办公室','6','0');
INSERT INTO `sys_dept` VALUES ('7','0','安全保卫部','7','0');
INSERT INTO `sys_dept` VALUES ('8','0','纪监审办公室','8','0');
INSERT INTO `sys_dept` VALUES ('9','0','党委宣传部','9','0');
INSERT INTO `sys_dept` VALUES ('10','0','科研保障部','10','0');
INSERT INTO `sys_dept` VALUES ('11','0','公众防伪研发室','11','0');
INSERT INTO `sys_dept` VALUES ('12','0','工艺设备研发室','12','0');
INSERT INTO `sys_dept` VALUES ('13','0','数字防伪研发室','13','0');
INSERT INTO `sys_dept` VALUES ('14','0','机具检测中心','14','0');
INSERT INTO `sys_dept` VALUES ('15','0','银行机具研发室','15','0');
INSERT INTO `sys_dept` VALUES ('16','0','产品设计雕刻中心','16','0');
INSERT INTO `sys_dept` VALUES ('17','0','集成技术研发室','17','0');
INSERT INTO `sys_dept` VALUES ('18','0','分析检测中心','18','0');
INSERT INTO `sys_dept` VALUES ('19','0','科技信息中心','19','0');
INSERT INTO `sys_dept` VALUES ('20','0','知识产权及标准研发室','20','0');
INSERT INTO `sys_dept` VALUES ('21','0','机读防伪研发室','21','0');
INSERT INTO `sys_dept` VALUES ('22','0','退休人员','22','0');


-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, null, null, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('121', '编码', 'code', 'hobby', '爱好', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('122', '绘画', 'painting', 'hobby', '爱好', null, null, null, null, null, null, '', '');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('110', '0', '/files/d64a62e3-6821-48f1-bac6-a1b9945f4afb.jpg', '2017-10-14 16:20:17');
INSERT INTO `sys_file` VALUES ('111', '0', '/files/aa2c3dc6-495f-48cc-8e12-446eceb2535e.jpg', '2017-10-14 16:20:21');
INSERT INTO `sys_file` VALUES ('114', '0', '/files/84c29777-11bc-44b9-818d-859f2d04d417.jpg', '2017-10-20 09:27:18');
INSERT INTO `sys_file` VALUES ('118', '0', '/files/a973499e-3ec7-4d43-8a52-b6f6517c77e3.jpg', '2017-10-20 11:53:52');
INSERT INTO `sys_file` VALUES ('132', '0', '/files/e6f13526-e31c-4ebe-a3cf-5fd88dd10be6.jpg', '2017-12-18 20:19:51');
INSERT INTO `sys_file` VALUES ('134', '0', '/files/cd016e72-77f7-4425-afe2-b79dfbdc3ae9.jpeg', '2017-12-18 22:44:07');
INSERT INTO `sys_file` VALUES ('138', '0', '/files/9ec12ee7-65b5-4cc5-9900-d2ec6185b336.jpg', '2017-12-19 19:55:27');
INSERT INTO `sys_file` VALUES ('139', '0', '/files/f6aab9d4-00a1-4bc8-a695-40fc472d4ea9.jpg', '2018-01-02 19:53:24');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', '2017-08-09 22:49:47', null);
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', '2017-08-14 10:59:32', null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', '2017-08-14 10:59:56', null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', '2017-08-14 11:00:26', null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null);
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', '2017-08-14 22:11:53', null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null);
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null);
INSERT INTO `sys_menu` VALUES ('49', '0', '博客管理', '', '', '0', 'fa fa-rss', '6', null, null);
INSERT INTO `sys_menu` VALUES ('50', '49', '文章列表', 'blog/bContent', 'blog:bContent:bContent', '1', 'fa fa-file-image-o', '1', null, null);
INSERT INTO `sys_menu` VALUES ('51', '50', '新增', '', 'blog:bContent:add', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null);
INSERT INTO `sys_menu` VALUES ('58', '50', '编辑', '', 'blog:bContent:edit', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('59', '50', '删除', '', 'blog:bContent:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('60', '50', '批量删除', '', 'blog:bContent:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('68', '49', '发布文章', '/blog/bContent/add', 'blog:bContent:add', '1', 'fa fa-edit', '0', null, null);
INSERT INTO `sys_menu` VALUES ('71', '1', '文件管理', '/common/sysFile', 'common:sysFile:sysFile', '1', 'fa fa-folder-open', '2', null, null);
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null);
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/system/sysDept', 'system:sysDept:sysDept', '1', 'fa fa-users', '3', null, null);
INSERT INTO `sys_menu` VALUES ('74', '73', '增加', '/system/sysDept/add', 'system:sysDept:add', '2', null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'system/sysDept/remove', 'system:sysDept:remove', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/system/sysDept/edit', 'system:sysDept:edit', '2', null, '3', null, null);
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null);
INSERT INTO `sys_menu` VALUES ('78', '1', '数据字典', '/common/dict', 'common:dict:dict', '1', 'fa fa-book', '1', null, null);
INSERT INTO `sys_menu` VALUES ('79', '78', '增加', '/common/dict/add', 'common:dict:add', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('80', '78', '编辑', '/common/dict/edit', 'common:dict:edit', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('81', '78', '删除', '/common/dict/remove', 'common:dict:remove', '2', '', '3', null, null);
INSERT INTO `sys_menu` VALUES ('83', '78', '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', '2', '', '4', null, null);
INSERT INTO `sys_menu` VALUES ('84', '0', '办公管理', '', '', '0', 'fa fa-laptop', '5', null, null);
INSERT INTO `sys_menu` VALUES ('85', '84', '通知公告', 'oa/notify', 'oa:notify:notify', '1', 'fa fa-pencil-square', null, null, null);
INSERT INTO `sys_menu` VALUES ('86', '85', '新增', 'oa/notify/add', 'oa:notify:add', '2', 'fa fa-plus', '1', null, null);
INSERT INTO `sys_menu` VALUES ('87', '85', '编辑', 'oa/notify/edit', 'oa:notify:edit', '2', 'fa fa-pencil-square-o', '2', null, null);
INSERT INTO `sys_menu` VALUES ('88', '85', '删除', 'oa/notify/remove', 'oa:notify:remove', '2', 'fa fa-minus', null, null, null);
INSERT INTO `sys_menu` VALUES ('89', '85', '批量删除', 'oa/notify/batchRemove', 'oa:notify:batchRemove', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('90', '84', '我的通知', 'oa/notify/selfNotify', '', '1', 'fa fa-envelope-square', null, null, null);
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null);
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null);
INSERT INTO `sys_menu` VALUES ('93', '0', '工作流程', '', '', '0', 'fa fa-print', '6', null, null);
INSERT INTO `sys_menu` VALUES ('94', '93', '模型管理', 'activiti/model', '', '1', 'fa fa-sort-amount-asc', null, null, null);
INSERT INTO `sys_menu` VALUES ('95', '94', '全部权限', '', 'activiti:model', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('96', '93', '流程管理', 'activiti/process', '', '1', 'fa fa-flag', null, null, null);
INSERT INTO `sys_menu` VALUES ('97', '0', '图表管理', '', '', '0', 'fa fa-bar-chart', '7', null, null);
INSERT INTO `sys_menu` VALUES ('98', '97', '百度chart', '/chart/graph_echarts.html', '', '1', 'fa fa-area-chart', null, null, null);
INSERT INTO `sys_menu` VALUES ('99', '96', '所有权限', '', 'act:process', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('101', '93', '待办任务', 'activiti/task/todo', '', '1', '', null, null, null);

delete from sys_menu where menu_id>100;
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (102,0,'人员管理','/employee','employee',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (103,102,'人员状态管理','/employee/employstatus','employee:employstatus:employstatus',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (104,103,'新增','/employee/employstatus/add','employee:employstatus:add',2,'fa fa-plus');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (105,103,'删除','/employee/employstatus/remove','employee:employstatus:remove',2,'fa fa-minus');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (106,103,'修改','/employee/employstatus/edit','employee:employstatus:edit',2,'fa fa-pencil-square-o');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (107,103,'批量删除','/employee/employstatus/batchRemove','employee:employstatus:batchRemove',2,'fa fa-asterisk');


insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (108,102,'人员类别管理','/employee/employtype','employee:employtype:employtype',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (109,108,'新增','/employee/employtype/add','employee:employtype:add',2,'fa fa-plus');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (110,108,'删除','/employee/employtype/remove','employee:employtype:remove',2,'fa fa-minus');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (111,108,'修改','/employee/employtype/edit','employee:employtype:edit',2,'fa fa-pencil-square-o');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (112,108,'批量删除','/employee/employtype/batchRemove','employee:employtype:batchRemove',2,'fa fa-asterisk');

insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (113,102,'人员档案管理','/employee/employee','employee:employee:employee',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (114,113,'新增','/employee/employee/add','employee:employee:add',2,'fa fa-plus');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (115,113,'删除','/employee/employee/remove','employee:employee:remove',2,'fa fa-minus');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (116,113,'修改','/employee/employee/edit','employee:employee:edit',2,'fa fa-pencil-square-o');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (117,113,'批量删除','/employee/employee/batchRemove','employee:employee:batchRemove',2,'fa fa-asterisk');

insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (118,0,'医保报销','','',0,'fa fa-address-book-o');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (119,118,'医保人员报销录入','/medicalexpense/medicalexpense1/add','medicalexpense:medicalexpense1:add',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (120,118,'医保人员报销查询','/medicalexpense/medicalexpense1','medicalexpense:medicalexpense1:medicalexpense1',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (121,120,'医保人员报销删除','/medicalexpense/medicalexpense1/remove','medicalexpense:medicalexpense1:remove',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (122,120,'医保人员报销修改','/medicalexpense/medicalexpense1/edit','medicalexpense:medicalexpense1:edit',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (123,120,'医保人员报销审核','/medicalexpense/medicalexpense1/audit','medicalexpense:medicalexpense1:audit',2,'');

insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (124,0,'家属报销','','',0,'fa fa-address-book-o');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (125,124,'家属报销录入','/medicalexpense/medicalexpense2/add','medicalexpense:medicalexpense2:add',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (126,124,'家属报销查询','/medicalexpense/medicalexpense2','medicalexpense:medicalexpense2:medicalexpense2',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (127,126,'家属报销删除','/medicalexpense/medicalexpense2/remove','medicalexpense:medicalexpense2:remove',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (128,126,'家属报销修改','/medicalexpense/medicalexpense2/edit','medicalexpense:medicalexpense2:edit',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (129,126,'家属报销审核','/medicalexpense/medicalexpense2/audit','medicalexpense:medicalexpense2:audit',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (135,124,'家属档案','/relation/relation','relation:relation:relation',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (136,135,'家属档案删除','/relation/relation/remove','relation:relation:remove',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (137,135,'家属档案修改','/relation/relation/edit','relation:relation:edit',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (138,135,'家属档案增加','/relation/relation/add','relation:relation:add',2,'');

insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (130,118,'医保人员报销导入','/medicalexpense/testexpense','medicalexpense:testexpense:testexpense',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (131,130,'医保人员报销导入文件','/medicalexpense/testexpense/import','medicalexpense:testexpense:import',1,'');

insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (132,0,'计算和发放','','',0,'fa fa-address-book-o');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (133,132,'计算','/medicalexpense/claimexpense','medicalexpense:claimexpense:claimexpense',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (134,133,'计算','/medicalexpense/claimexpense/claim','medicalexpense:claimexpense:claim',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (139,132,'发放','/medicalexpense/closeexpense','medicalexpense:closeexpense:closeexpense',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (140,132,'结账','/medicalexpense/monthend','medicalexpense:monthend:monthend',1,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (141,140,'结账','/medicalexpense/monthend/close','medicalexpense:monthend:close',2,'');
insert into sys_menu (menu_id,parent_id,name,url,perms,type,icon) values (142,140,'反结账','/medicalexpense/monthend/open','medicalexpense:monthend:open',2,'');
-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'admin', '拥有最高权限', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('2', '管理员', 'manager', '', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2988 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

INSERT INTO `sys_role_menu` VALUES ('2911', '1', '98');
INSERT INTO `sys_role_menu` VALUES ('2912', '1', '100');
INSERT INTO `sys_role_menu` VALUES ('2913', '1', '99');
INSERT INTO `sys_role_menu` VALUES ('2914', '1', '95');
INSERT INTO `sys_role_menu` VALUES ('2915', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('2916', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('2917', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('2918', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('2919', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('2920', '1', '90');
INSERT INTO `sys_role_menu` VALUES ('2921', '1', '89');
INSERT INTO `sys_role_menu` VALUES ('2922', '1', '88');
INSERT INTO `sys_role_menu` VALUES ('2923', '1', '87');
INSERT INTO `sys_role_menu` VALUES ('2924', '1', '86');
INSERT INTO `sys_role_menu` VALUES ('2925', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('2926', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('2927', '1', '68');
INSERT INTO `sys_role_menu` VALUES ('2928', '1', '60');
INSERT INTO `sys_role_menu` VALUES ('2929', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('2930', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('2931', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('2932', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('2933', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('2934', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('2935', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('2936', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('2937', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('2938', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('2939', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('2940', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('2941', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('2942', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('2943', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('2944', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('2945', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('2946', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('2947', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('2948', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('2949', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('2950', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('2951', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('2952', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('2953', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('2954', '1', '97');
INSERT INTO `sys_role_menu` VALUES ('2955', '1', '96');
INSERT INTO `sys_role_menu` VALUES ('2956', '1', '94');
INSERT INTO `sys_role_menu` VALUES ('2957', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('2958', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('2959', '1', '85');
INSERT INTO `sys_role_menu` VALUES ('2960', '1', '84');
INSERT INTO `sys_role_menu` VALUES ('2961', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('2962', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('2963', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('2964', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('2965', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('2966', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('2967', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('2968', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('2969', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('2970', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2971', '1', '101');
INSERT INTO `sys_role_menu` VALUES ('2972', '1', '93');
INSERT INTO `sys_role_menu` VALUES ('2973', '1', '-1');


-- ----------------------------
-- Table structure for `sys_task`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'welcomJob');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', '6', 'admin@example.com', '17699999999', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '96', '2017-12-14 00:00:00', '138', 'ccc', '121;', '北京市', '北京市市辖区', '东城区');

-- ----------------------------
-- Table structure for `sys_user_plus`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_plus
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');


drop table IF EXISTS `employstatus`;
CREATE TABLE `employstatus` (
`id` int(11) NOT NULL AUTO_INCREMENT  COMMENT '用工状态ID',
`statusname` varchar(50) COLLATE utf8_unicode_ci NOT NULL  COMMENT '用工状态名称',
ismedinsur bool null  COMMENT '是否医保',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用工状态';
delete from employstatus where id>0;
insert into employstatus values (1,'在职',1);
insert into employstatus values (2,'退休',1);
insert into employstatus values (3,'离休',0);
insert into employstatus values (4,'家属',0);
drop table IF EXISTS `employtype`;
CREATE TABLE `employtype` (
`id` int(11) NOT NULL AUTO_INCREMENT  COMMENT '人员类别ID',
`statusname` varchar(50) COLLATE utf8_unicode_ci NOT NULL  COMMENT '人员类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='人员类别';
insert into employtype values (1,'一般员工');
insert into employtype values (2,'企业专家');
insert into employtype values (3,'行业专家');
insert into employtype values (4,'领导');
insert into employtype values (5,'其他');
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `code` varchar(100) DEFAULT NULL COMMENT '人员编号',  
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编码',
  `employstatus_id`  bigint(20) DEFAULT NULL COMMENT '用工状态编码',
  `employtype_id`  bigint(20) DEFAULT NULL COMMENT '人员类别编码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `vnoid`  varchar(100) DEFAULT NULL COMMENT '身份证号',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出生日期',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:停止，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间', 
  `parentid` bigint(20) NULL COMMENT '父母ID', 
  `secparentid` bigint(20) NULL COMMENT '父母ID',
  `rate` bigint(20) NULL COMMENT '报销比例',
  `isrelation` bool NULL COMMENT '是否家属',
  `ismedinsur` bool null  COMMENT '是否医保',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='员工档案';
delete from employee where id>0;
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (1,'黄小义','62100003',1,1,4,'110102196205242339',1,1,1,'1962-05-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (2,'郭占旺','54801230',1,1,4,'120103196702245432',1,1,1,'1967-02-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (3,'刘卫东','62100060',1,1,4,'110108196612262239',1,1,1,'1966-12-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (4,'李彦生','60402639',1,1,4,'110104196306261697',1,1,1,'1963-06-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (5,'张健','62100089',1,1,4,'32082319750619061X',1,1,1,'1975-06-19');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (6,'程智梁','55000001',1,1,4,'110104196304171655',1,1,1,'1963-04-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (7,'黄和平','62100044',2,1,1,'110108196806096398',1,1,1,'1968-06-09');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (8,'齐京伟','62100013',2,1,1,'110104196410241610',1,1,1,'1964-10-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (9,'曲平','62100163',2,1,1,'110105196211011157',1,1,1,'1962-11-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (10,'关若鹏','62100015',2,1,1,'110104196406231612',1,1,1,'1964-06-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (11,'曹蓓勤','62100211',2,1,1,'320121196611290027',1,1,2,'1966-11-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (12,'杨静','54100322',2,1,1,'110105196907287565',1,1,2,'1969-07-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (13,'刘俊','62100016',2,1,1,'210503198004032133',1,1,1,'1980-04-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (14,'白静雅','62100037',2,1,1,'110108198402153420',1,1,2,'1984-02-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (15,'李博','62100020',2,1,1,'110108198310253424',1,1,2,'1983-10-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (16,'李熙然','62100290',2,1,1,'150424198811140085',1,1,2,'1988-11-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (17,'侯永刚','62100321',2,1,1,'110104198007043031',1,1,1,'1980-07-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (18,'葛见刚','62100322',2,1,1,'110104197103272518',1,1,1,'1971-03-27');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (19,'李璐玲','62100025',3,1,1,'210104197811190525',1,1,2,'1978-11-19');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (20,'董磊','62100026',3,1,1,'130602198107070617',1,1,1,'1981-07-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (21,'李静','62100222',3,1,1,'110104198211041666',1,1,2,'1982-11-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (22,'马桥','62100293',3,1,1,'420122198709055518',1,1,1,'1987-09-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (23,'李培','54100105',3,1,1,'110101197804150522',1,1,2,'1978-04-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (24,'苏柏涛','62100333',3,1,1,'110108199606123615',1,1,1,'1996-06-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (25,'李万里','62100032',4,1,1,'620321197212200318',1,1,1,'1972-12-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (26,'邓越','62100029',4,1,1,'510821198208040020',1,1,2,'1982-08-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (27,'张和宝','62100332',4,1,1,'11010119651215501X',1,1,1,'1965-12-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (28,'刘超群','62100225',4,1,1,'371325198611260026',1,1,2,'1986-11-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (29,'吴希鸣','61304126',4,1,1,'320121198812280107',1,1,2,'1988-12-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (30,'魏智韬','62100043',5,1,1,'132324198004280017',1,1,1,'1980-04-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (31,'付连秋','62100095',5,1,1,'220822198010150723',1,1,2,'1980-10-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (32,'王红玲','62100207',5,1,1,'230827197409014183',1,1,2,'1974-09-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (33,'顾慧','62100119',5,1,1,'510123197911040380',1,1,2,'1979-11-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (34,'洪成淼','62100228',5,1,1,'210311197905011211',1,1,1,'1979-05-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (35,'郑家军','62100218',5,1,1,'420982198207093215',1,1,1,'1982-07-09');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (36,'张玲','62100036',5,1,1,'110108198011131822',1,1,2,'1980-11-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (37,'李一婧','62100180',5,1,1,'110104198005021621',1,1,2,'1980-05-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (38,'车畅','62100204',5,1,1,'110108198605074247',1,1,2,'1986-05-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (39,'杨超','62100199',5,1,1,'110104198303041639',1,1,1,'1983-03-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (40,'司威','62100340',5,1,1,'110104198811171237',1,1,1,'1988-11-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (41,'徐阁昭','62100221',6,1,1,'220602198609040997',1,1,1,'1986-09-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (42,'张炜','62100210',6,1,1,'110102198103121914',1,1,1,'1981-03-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (43,'冯阳春','52310230',6,1,1,'610324198212311810',1,1,1,'1982-12-31');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (44,'高晓红','62100184',7,1,1,'150203197404070326',1,1,2,'1974-04-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (45,'高松','62100035',7,1,1,'110108196809043013',1,1,1,'1968-09-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (46,'王志强','62100109',7,1,1,'152629198310055098',1,1,1,'1983-10-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (47,'杨燕亭','62100169',7,1,1,'110104196212081257',1,1,1,'1962-12-08');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (48,'武志强','62100053',7,1,1,'110104196209052519',1,1,1,'1962-09-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (49,'谭自全','62100183',8,1,1,'110108196508215758',1,1,1,'1965-08-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (50,'孙亮','62100158',8,1,1,'420802197604030347',1,1,2,'1976-04-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (51,'徐红','62100024',8,1,1,'230121198005250022',1,1,2,'1980-05-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (52,'邱萍','62100056',9,1,1,'513001197404160248',1,1,2,'1974-04-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (53,'武林','62100130',9,1,1,'11010519700515213X',1,1,1,'1970-05-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (54,'张媛媛','62100153',9,1,1,'110108198012154225',1,1,2,'1980-12-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (55,'彭盛','62100203',9,1,1,'360104198703291916',1,1,1,'1987-03-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (56,'薛皓昳','62100223',9,1,1,'110107198511180042',1,1,2,'1985-11-18');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (57,'邓德斌','62100040',10,1,1,'41010219700920455X',1,1,1,'1970-09-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (58,'张虹','62100045',10,1,1,'110104196806262549',1,1,2,'1968-06-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (59,'王子轩','62100047',10,1,1,'130102198103132473',1,1,1,'1981-03-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (60,'徐晓德','62100172',10,1,1,'110103196210040332',1,1,1,'1962-10-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (61,'顾卫红','52040002',10,1,1,'130602196610050964',1,1,2,'1966-10-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (62,'吴宪武','62100176',10,1,1,'110104196402241610',1,1,1,'1964-02-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (63,'王建平','62100177',10,1,1,'110102196206280038',1,1,1,'1962-06-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (64,'云竹','62100132',10,1,1,'110102198404020105',1,1,2,'1984-04-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (65,'国大伟','62100083',10,1,1,'220322197809175858',1,1,1,'1978-09-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (66,'石建春','62100175',10,1,1,'110104196208201279',1,1,1,'1962-08-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (67,'陈德山','62100171',10,1,1,'110104196202111635',1,1,1,'1962-02-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (68,'陈航','62100050',10,1,1,'130602197501090937',1,1,1,'1975-01-09');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (69,'张华民','62100341',10,1,1,'110106197307023014',1,1,1,'1973-07-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (70,'陈韦','62100066',11,1,1,'370628197601237914',1,1,1,'1976-01-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (71,'徐斌','62100067',11,1,1,'372822197508010015',1,1,1,'1975-08-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (72,'胡自力','62100076',11,1,1,'110104196203052032',1,1,1,'1962-03-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (73,'陈庚','62100212',11,1,1,'371326198212230010',1,1,1,'1982-12-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (74,'刘萃','62100226',11,1,1,'37083219831003034X',1,1,2,'1983-10-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (75,'王斌','62100194',11,1,1,'110228198405230023',1,1,2,'1984-05-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (76,'欧阳苏阳','62100230',11,1,1,'11010219841020236X',1,1,2,'1984-10-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (77,'管文','62100284',11,1,1,'421102198605275255',1,1,1,'1986-05-27');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (78,'叶蕾','62100297',11,1,1,'612724198601110012',1,1,1,'1986-01-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (79,'董亚鲁','62100323',11,1,1,'370828199007173233',1,1,1,'1990-07-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (80,'林旷野','62100329',11,1,1,'13042319910308243X',1,1,1,'1991-03-08');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (81,'古克','62100344',11,1,1,'110229199412234234',1,1,1,'1994-12-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (82,'屈明生','62100081',12,1,3,'610103196503311632',1,1,1,'1965-03-31');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (83,'吴硕夫','62100079',12,1,2,'110102196112132333',1,1,1,'1961-12-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (84,'韩绪艳','62100082',12,1,1,'61010319690811205X',1,1,1,'1969-08-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (85,'李方见','62100080',12,1,1,'330106197206200430',1,1,1,'1972-06-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (86,'王川','62100038',12,1,1,'110104196309161640',1,1,2,'1963-09-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (87,'朱彤波','62100192',12,1,1,'640102197401071512',1,1,1,'1974-01-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (88,'伯玉霞','62100084',12,1,1,'110104197910101627',1,1,2,'1979-10-10');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (89,'董学良','62100087',12,1,1,'130404198203031214',1,1,1,'1982-03-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (90,'王雪','62100208',12,1,1,'11010519810221953X',1,1,1,'1981-02-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (91,'孙进强','54801368',12,1,1,'132335197810010059',1,1,1,'1978-10-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (92,'陈戌冬','62100088',12,1,1,'320121198011070054',1,1,1,'1980-11-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (93,'马健','62100193',12,1,1,'21042319830601001X',1,1,1,'1983-06-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (94,'万海燕','54100163',12,1,1,'130928198109123225',1,1,2,'1981-09-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (95,'潘品李','62100289',12,1,1,'320382198601255554',1,1,1,'1986-01-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (96,'郭丽莎','62100299',12,1,1,'140181198906124722',1,1,2,'1989-06-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (97,'王庭楷','62100345',12,1,1,'110103199607131818',1,1,1,'1996-07-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (98,'周维','62100346',12,1,1,'420117199603127935',1,1,1,'1996-03-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (99,'李彦平','62100085',13,1,1,'110104197601071663',1,1,2,'1976-01-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (100,'辛科','62100214',13,1,1,'150203197805312410',1,1,1,'1978-05-31');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (101,'姜君','62100283',13,1,1,'510821198508050036',1,1,1,'1985-08-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (102,'杨帆','62100215',13,1,1,'130404198205051219',1,1,1,'1982-05-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (103,'李雪鹏','62100328',13,1,1,'13043519880613003X',1,1,1,'1988-06-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (104,'徐俊哲','62100336',13,1,1,'110221199410168316',1,1,1,'1994-10-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (105,'于添淇','62100349',13,1,1,'220181199311290056',1,1,1,'1993-11-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (106,'李瑶','62100301',14,1,1,'440104198901245048',1,1,2,'1989-01-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (107,'韩英魁','62100100',14,1,1,'140203197607080039',1,1,1,'1976-07-08');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (108,'胡尚伟','62100145',14,1,1,'430103197411171012',1,1,1,'1974-11-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (109,'申孝丹','62100096',14,1,1,'110103198007311255',1,1,1,'1980-07-31');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (110,'陈蕊','62100318',14,1,1,'11010419780704162X',1,1,2,'1978-07-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (111,'孙昌军','62100337',14,1,1,'37112119951012279X',1,1,1,'1995-10-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (112,'卢继兵','62100093',15,1,1,'110104197708012735',1,1,1,'1977-08-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (113,'眭俊华','54002742',15,1,1,'321119197109065178',1,1,1,'1971-09-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (114,'张渠','62100094',15,1,1,'510821197710200013',1,1,1,'1977-10-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (115,'宁焕成','62100086',15,1,1,'372423197801115814',1,1,1,'1978-01-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (116,'冯治国','62100101',15,1,1,'370282197806051511',1,1,1,'1978-06-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (117,'刘李泉','62100099',15,1,1,'340303198011240430',1,1,1,'1980-11-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (118,'田翀','62100098',15,1,1,'110102198008281936',1,1,1,'1980-08-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (119,'张晓明','62100102',15,1,1,'220203197808073310',1,1,1,'1978-08-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (120,'冯礼','62100195',15,1,1,'511623198606222674',1,1,1,'1986-06-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (121,'刘慧娜','62100217',15,1,1,'152701198405250928',1,1,2,'1984-05-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (122,'朱强','62100300',15,1,1,'360104198907231915',1,1,1,'1989-07-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (123,'赵静','62100326',15,1,1,'340604199308111020',1,1,2,'1993-08-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (124,'李梓硕','62100327',15,1,1,'110106199204210094',1,1,1,'1992-04-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (125,'彭帅','62100335',15,1,1,'110111199309281412',1,1,1,'1993-09-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (126,'刘艳星','62100343',15,1,1,'110224199203253816',1,1,1,'1992-03-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (127,'黄鸿宇','62100347',15,1,1,'432503199610050056',1,1,1,'1996-10-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (128,'姚宗勇','62100220',15,1,1,'420621197902261010',1,1,1,'1979-02-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (129,'孔维云','62100113',16,1,1,'110108196201293735',1,1,1,'1962-01-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (130,'马荣','62100112',16,1,1,'110101196212012105',1,1,2,'1962-12-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (131,'张继卿','62100133',16,1,1,'11010419620213081X',1,1,1,'1962-02-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (132,'李志农','62100115',16,1,1,'110104196201210412',1,1,1,'1962-01-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (133,'刘益民','62100114',16,1,1,'110104196202211214',1,1,1,'1962-02-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (134,'胡毓水','62100121',16,1,1,'510821197710310028',1,1,2,'1977-10-31');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (135,'赵川','62100124',16,1,1,'110104197002241616',1,1,1,'1970-02-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (136,'于欣','62100118',16,1,5,'110102197912123317',1,1,1,'1979-12-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (137,'郑可新','62100120',16,1,1,'110108197902146038',1,1,1,'1979-02-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (138,'陈月涛','62100019',16,1,1,'610424198005130510',1,1,1,'1980-05-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (139,'郭民','62100131',16,1,1,'110106196902260095',1,1,1,'1969-02-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (140,'孙健','62100123',16,1,1,'11010619810403421X',1,1,1,'1981-04-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (141,'霍珊珊','62100122',16,1,1,'130102198201012440',1,1,2,'1982-01-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (142,'王坤','62100125',16,1,1,'110104198112272020',1,1,2,'1981-12-27');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (143,'尹海蓉','62100126',16,1,1,'142430198303190024',1,1,2,'1983-03-19');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (144,'倪罡','62100219',16,1,1,'420601197905171517',1,1,1,'1979-05-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (145,'王婕','62100227',16,1,1,'51012319850828032X',1,1,2,'1985-08-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (146,'刘尧','62100128',16,1,1,'371402198309262638',1,1,1,'1983-09-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (147,'牛凯','62100287',16,1,1,'370305198403230424',1,1,2,'1984-03-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (148,'白金','62100129',16,1,1,'110102198505212333',1,1,1,'1985-05-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (149,'郝洁','62100209',16,1,1,'110104198311221621',1,1,2,'1983-11-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (150,'王鹤蓉','62100295',16,1,1,'220283198705260320',1,1,2,'1987-05-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (151,'李沐梓','62100324',16,1,1,'231102199003140627',1,1,2,'1990-03-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (152,'闫超然','62100325',16,1,1,'110226198812220145',1,1,2,'1988-12-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (153,'杜欣汶','62100330',16,1,1,'622801199301110210',1,1,1,'1993-01-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (154,'陈晨','62100339',16,1,1,'430723199401220025',1,1,2,'1994-01-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (155,'赵发迪','62100338',16,1,1,'371327199412092012',1,1,1,'1994-12-09');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (156,'鲁鸣远','62100342',16,1,1,'110227198112040916',1,1,1,'1981-12-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (157,'唐士立','62100063',17,1,1,'230603197504253711',1,1,1,'1975-04-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (158,'杨志洪','62100064',17,1,1,'620104196903240560',1,1,2,'1969-03-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (159,'李新宇','62100106',13,1,1,'372424198005050512',1,1,1,'1980-05-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (160,'吕建英','62100108',17,1,1,'132123197501050018',1,1,1,'1975-01-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (161,'麻宝成','62100107',17,1,1,'62010219781005535X',1,1,1,'1978-10-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (162,'武建国','62100170',17,1,1,'110104196202201614',1,1,1,'1962-02-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (163,'曹瑜','62100105',17,1,1,'110108198111165413',1,1,1,'1981-11-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (164,'高瑞','62100196',17,1,1,'110108198209294918',1,1,1,'1982-09-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (165,'王子酉','62100181',17,1,1,'110101198509165021',1,1,2,'1985-09-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (166,'刘芳媛','62100331',17,1,1,'130302199208072943',1,1,2,'1992-08-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (167,'韩征难','62100137',18,1,1,'210105197006274052',1,1,1,'1970-06-27');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (168,'史力','62100138',18,1,1,'110105196810286128',1,1,2,'1968-10-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (169,'杨素华','62100142',18,1,1,'340824197311222677',1,1,1,'1973-11-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (170,'韩丽琴','62100213',18,1,1,'622801198311220646',1,1,2,'1983-11-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (171,'丁洁','62100075',18,1,1,'510821197401010021',1,1,2,'1974-01-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (172,'王莹','62100140',18,1,1,'640102197709110928',1,1,2,'1977-09-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (173,'周颖','62100143',18,1,1,'120111198112110043',1,1,2,'1981-12-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (174,'丁广辉','62100144',18,1,1,'411123198210260219',1,1,1,'1982-10-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (175,'张淑平','54100627',18,1,1,'230421198005203126',1,1,2,'1980-05-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (176,'张连英','62100174',18,1,1,'110104196409101610',1,1,1,'1964-09-10');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (177,'项洋','62100229',18,1,1,'130603198403070327',1,1,2,'1984-03-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (178,'孙晓宇','62100298',18,1,1,'110223198505071072',1,1,1,'1985-05-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (179,'杨俊岭','62100201',18,1,1,'120222198311213410',1,1,1,'1983-11-21');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (180,'李丹','62100310',18,1,1,'110224199105254428',1,1,2,'1991-05-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (181,'包敏萌','62100148',19,1,1,'330203197201190022',1,1,2,'1972-01-19');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (182,'周佩玉','62100157',19,1,1,'110103196701270925',1,1,2,'1967-01-27');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (183,'贺天','62100154',19,1,1,'110102197910030416',1,1,1,'1979-10-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (184,'辛颖','62100150',19,1,1,'110104197812171621',1,1,2,'1978-12-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (185,'黄卉','54900256',19,1,1,'360104198108121920',1,1,2,'1981-08-12');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (186,'林华铭','62100197',19,1,1,'11010419830304301X',1,1,1,'1983-03-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (187,'刘石磊','62100159',19,1,1,'110104198406202511',1,1,1,'1984-06-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (188,'冯伟喆','62100188',19,1,1,'110105198305255450',1,1,1,'1983-05-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (189,'安华','62100319',19,1,1,'110104197609171618',1,1,1,'1976-09-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (190,'朱春旭','62100160',19,1,1,'412701198304011550',1,1,1,'1983-04-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (191,'罗启威','62100334',19,1,1,'360425199604100232',1,1,1,'1996-04-10');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (192,'张逸飞','62100348',19,1,1,'110227199609143325',1,1,2,'1996-09-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (193,'杨秀菊','62100151',20,1,1,'13112119790902002X',1,1,2,'1979-09-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (194,'刘璐','62100058',20,1,1,'11010419841006086X',1,1,2,'1984-10-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (195,'王丹妮','62100281',20,1,1,'110108197911063445',1,1,2,'1979-11-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (196,'李冠宇','62100051',20,1,1,'110104198002011612',1,1,1,'1980-02-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (197,'吴曦','62100291',20,1,1,'110102198807060021',1,1,2,'1988-07-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (198,'刘东','62100065',21,1,1,'140429197605066414',1,1,1,'1976-05-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (199,'汤浩','62100141',21,1,1,'110104197808091610',1,1,1,'1978-08-09');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (200,'赵红梅','62100068',21,1,1,'370631197611152525',1,1,2,'1976-11-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (201,'李欢','62100069',21,1,1,'510104198005144060',1,1,2,'1980-05-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (202,'魏先印','62100073',21,1,1,'372523198111025854',1,1,1,'1981-11-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (203,'纪磊','62100285',21,1,1,'360302198301240575',1,1,1,'1983-01-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (204,'张鲁晶','62100202',21,1,1,'110104198602061656',1,1,1,'1986-02-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (205,'李春芝','62100286',21,1,1,'110111198504282029',1,1,2,'1985-04-28');

delete from employee where id>300;
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (301,'刘国栋','62100238',22,3,4,'110104193109061617',1,1,1,'1931-09-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (302,'张进业','62100280',22,3,4,'110104192501041616',1,1,1,'1925-01-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (303,'杨文秀','62100262',22,2,1,'110107193203050024',1,1,2,'1932-03-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (304,'贾永忠','62100274',22,2,1,'110104193504231612',1,1,1,'1935-04-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (305,'刘昌太','62100260',22,2,1,'11010419370111161X',1,1,1,'1937-01-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (306,'张丽娟','62100254',22,2,1,'110104193802061623',1,1,2,'1938-02-06');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (307,'秦宝珍','62100234',22,2,1,'110105193808292111',1,1,1,'1938-08-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (308,'胡大年','62100252',22,2,1,'110104193812241636',1,1,1,'1938-12-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (309,'张从云','62100232',22,2,1,'110104194002131616',1,1,1,'1940-02-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (310,'涂灼','62100246',22,2,1,'110105194012086157',1,1,1,'1940-12-08');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (311,'赵殿卿','62100269',22,2,1,'110105194102022130',1,1,1,'1941-02-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (312,'孔金玲','62100237',22,2,1,'110102194112110821',1,1,2,'1941-12-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (313,'马长生','62100258',22,2,1,'110104194101032031',1,1,1,'1941-01-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (314,'安森森','62100248',22,2,3,'110104194211031611',1,1,1,'1942-11-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (315,'顾庆明','62100233',22,2,1,'110104194102161687',1,1,2,'1941-02-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (316,'杨月娥','62100245',22,2,1,'110102194212101148',1,1,2,'1942-12-10');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (317,'范春艳','62100270',22,2,1,'110105194302012121',1,1,2,'1943-02-01');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (318,'张亚新','62100253',22,2,1,'110108194407164948',1,1,2,'1944-07-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (319,'张继生','62100235',22,2,1,'110104194402111614',1,1,1,'1944-02-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (320,'胡敏秋','62100276',22,2,3,'110104194506221623',1,1,2,'1945-06-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (321,'张昆峻','62100259',22,2,1,'11010219460102043x',1,1,1,'1946-01-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (322,'候文秀','62100265',22,2,1,'110104194609113051',1,1,1,'1946-09-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (323,'李志','62100277',22,2,1,'110105195007246114',1,1,1,'1950-07-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (324,'王玉玲','62100263',22,2,1,'110104195004221687',1,1,2,'1950-04-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (325,'孙陆放','62100255',22,2,1,'110104195002252017',1,1,1,'1950-02-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (326,'陈永发','62100256',22,2,3,'110104195003041617',1,1,1,'1950-03-04');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (327,'韩纪宗','62100264',22,2,1,'110104195006271610',1,1,1,'1950-06-27');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (328,'李卜民','62100139',22,2,1,'110104195506132553',1,1,1,'1955-06-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (329,'崔文致','62100240',22,2,1,'110104195608221637',1,1,1,'1956-08-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (330,'任贺亭','62100247',22,2,1,'110104195108181659',1,1,1,'1951-08-18');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (331,'林章栋','62100249',22,2,1,'110104195604231635',1,1,1,'1956-04-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (332,'牛捷','62100275',22,2,1,'110103195209250928',1,1,2,'1952-09-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (333,'魏明章','62100267',22,2,1,'110104195107281631',1,1,1,'1951-07-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (334,'王文涛','62100251',22,2,1,'110102195409182353',1,1,1,'1954-09-18');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (335,'谭怀英','62100241',22,2,1,'110104195104131646',1,1,2,'1951-04-13');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (336,'李虹霞','62100266',22,2,1,'110104195107143060',1,1,2,'1951-07-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (337,'翟振强','62100242',22,2,1,'110104194609201676',1,1,1,'1946-09-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (338,'刘秀英','62100271',22,2,1,'110108195203193469',1,1,2,'1952-03-19');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (339,'贾纪云','62100231',22,2,1,'110102195206162344',1,1,2,'1952-06-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (340,'杨国荣','62100272',22,2,1,'11010219530823234x',1,1,2,'1953-08-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (341,'邸艳红','62100167',22,2,1,'110102195609222348',1,1,2,'1956-09-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (342,'冯振基','54100001',22,2,3,'110104195201171615',1,1,1,'1952-01-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (343,'张猛','62100014',22,2,1,'110104195304141638',1,1,1,'1953-04-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (344,'胡峻璋','54203551',22,2,1,'310107195807291642',1,1,2,'1958-07-29');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (345,'李乐平','62100078',22,2,1,'110104195309302074',1,1,1,'1953-09-30');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (346,'李欣','62100059',22,2,1,'110104195810141665',1,1,2,'1958-10-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (347,'丁景华','62100136',22,2,1,'11010419531114209X',1,1,1,'1953-11-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (348,'王仁祥','62100149',22,2,1,'110104195402022018',1,1,1,'1954-02-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (349,'翟福甡','62100111',22,2,1,'110107195407220012',1,1,1,'1954-07-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (350,'戴育声','62100173',22,2,1,'110104195407303011',1,1,1,'1954-07-30');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (351,'王文兰','62100103',22,2,1,'11010219590928302x',1,1,2,'1959-09-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (352,'赵越','62100091',22,2,1,'110108196001164920',1,1,2,'1960-01-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (353,'朱社珍','62100023',22,2,1,'610104196010257363',1,1,2,'1960-10-25');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (354,'武晓文','62100017',22,2,1,'210105196012053120',1,1,2,'1960-12-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (355,'毕明','62100077',22,2,1,'110102195512281237',1,1,1,'1955-12-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (356,'郭晓东','62100162',22,2,1,'110104195608261612',1,1,1,'1956-08-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (357,'张华','62100034',22,2,1,'110104196111171624',1,1,2,'1961-11-17');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (358,'刘云霞','62100046',22,2,1,'110104196201070421',1,1,2,'1962-01-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (359,'程燕','62100116',22,2,1,'110104196202161683',1,1,2,'1962-02-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (360,'徐红','62100012',22,2,1,'110104196203230847',1,1,2,'1962-03-23');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (361,'石磊','62100055',22,2,1,'110106196205083927',1,1,2,'1962-05-08');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (362,'李兰','62100022',22,2,1,'110104196210091646',1,1,2,'1962-10-09');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (363,'王真','62100092',22,2,1,'130602195710280914',1,1,1,'1957-10-28');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (364,'张莉','62100061',22,2,1,'230103196211034265',1,1,2,'1962-11-03');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (365,'李雅玲','62100039',22,2,1,'110104196212141248',1,1,2,'1962-12-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (366,'贾杰英','62100168',22,2,1,'110104196212261688',1,1,2,'1962-12-26');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (367,'鲁素英','62100018',22,2,1,'110106196301084225',1,1,2,'1963-01-08');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (368,'温娟','62100135',22,2,1,'110104196302022568',1,1,2,'1963-02-02');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (369,'王毅','62100279',22,2,1,'110104196409141639',1,1,1,'1964-09-14');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (370,'张京录','62100250',22,2,1,'11010219620624001X',1,1,1,'1962-06-24');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (371,'薛梅','62100028',22,2,1,'510821196308160063',1,1,2,'1963-08-16');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (372,'范立家','62100164',22,2,1,'110102195810052432',1,1,1,'1958-10-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (373,'赵春燕','62100042',22,2,1,'110101196403111528',1,1,2,'1964-03-11');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (374,'王凤霞','62100147',22,2,1,'130603196405150946',1,1,2,'1964-05-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (375,'李彩卿','62100062',22,2,1,'11010419641007164X',1,1,2,'1964-10-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (376,'周树荣','62100104',22,2,1,'12010219650205052X',1,1,2,'1965-02-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (377,'孙萍','62100134',22,2,1,'110105196510205488',1,1,2,'1965-10-20');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (378,'邬立勇','62100090',22,2,1,'110102196010222311',1,1,1,'1960-10-22');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (379,'刘荣','62100178',22,2,1,'110104196504071624',1,1,2,'1965-04-07');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (380,'冯丽荣','62100052',22,2,1,'110104196605311623',1,1,2,'1966-05-31');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (381,'刘力','62100166',22,2,1,'130102196606152426',1,1,2,'1966-06-15');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (382,'房光华','90000001',22,2,1,'110104195512051637',1,1,1,'1955-12-05');
insert into employee (id,`name`,`code`,dept_id,employstatus_id,employtype_id,vnoid,`status`,ismedinsur,sex,birth) values (383,'岳宗义','90000002',22,2,1,'110108195912175431',1,1,1,'1959-12-17');

delete from employee where id>383;
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('麻希贤','110108200901202733',70,161,null,4,5,'80000001',1,'2009-01-20',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('鲁爱颖','110112201106253522',70,156,null,4,5,'80000002',2,'2011-06-25',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('魏柳孜','110104201102091669',50,202,null,4,5,'80000003',2,'2011-02-09',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('马子牧','110104200810070848',70,23,null,4,5,'80000004',2,'2008-10-07',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('陈怡嘉','110104200909021210',50,138,null,4,5,'80000005',1,'2009-09-02',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('许紫凌','110106201203100328',70,36,null,4,5,'80000006',2,'2012-03-10',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('董武杉','110104201308151620',70,89,null,4,5,'80000007',2,'2013-08-15',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('范楚晴','110104201010251688',70,142,null,4,5,'80000008',2,'2010-10-25',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('胡予潇','360102201204022828',70,185,null,4,5,'80000009',2,'2012-04-02',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('王浩辰','110106200807290914',70,90,null,4,5,'80000010',1,'2008-07-29',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('杨舒淼','110102200701033025',50,39,null,4,5,'80000011',2,'2007-01-03',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('杨煜涵','110106201004036917',70,169,null,4,5,'80000012',1,'2010-04-03',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('李芊君','110104201304193022',70,121,null,4,5,'80000013',2,'2013-04-19',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('李济来','11010120111219155x',70,141,null,4,5,'80000014',1,'2011-12-19',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('朱皓腾','110111201712215538',70,122,null,4,5,'80000015',1,'2017-12-21',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('徐楚璇','110106201204240365',50,41,null,4,5,'80000016',2,'2012-04-24',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('尤润琪','110102201103043068',70,173,null,4,5,'80000017',2,'2011-03-04',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('宁昭华','110106200910220324',70,115,null,4,5,'80000018',2,'2009-10-22',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('孙艺桐','110108201408213441',70,178,null,4,5,'80000019',2,'2014-08-21',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('卢安妮','11010420070815122X',70,112,null,4,5,'80000020',2,'2007-08-15',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘馨宁','110106201006186919',70,198,null,4,5,'80000021',1,'2010-06-18',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘羽媗','110102200806010022',50,13,null,4,5,'80000022',2,'2008-06-01',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘泊宁','110104201108101653',70,117,null,4,5,'80000023',1,'2011-08-10',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘佩喆','110102201603213334',50,28,null,4,5,'80000024',1,'2016-03-21',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯铄','110111201510272024',70,205,null,4,5,'80000025',2,'2015-10-27',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯元荻','110102201609093046',70,188,null,4,5,'80000026',2,'2016-09-09',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯佳惠','110104200904281646',50,116,null,4,5,'80000027',2,'2009-04-28',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯于芳','110104201410011683',50,120,null,4,5,'80000028',2,'2014-10-01',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('丁一格','110108201204126311',70,174,null,4,5,'80000029',1,'2012-04-12',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘宇宸','110104201609303077',50,13,null,4,5,'80000030',1,'2016-09-30',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('马培元','110102201612014417',70,23,null,4,5,'80000031',1,'2016-12-01',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘楚伊','110102201902053326',50,28,null,4,5,'80000032',2,'2019-02-05',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('许子陌','110108201904030022',70,36,null,4,5,'80000033',2,'2019-04-03',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('杨舒贺','110102201111163035',50,39,null,4,5,'80000034',1,'2011-11-16',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('徐黛雯','110106210610270324',50,41,null,4,5,'80000035',2,'2106-10-27',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('董武彤','110104201308151647',70,89,null,4,5,'80000036',2,'2013-08-15',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('王皓悦','110106201310030724',70,90,null,4,5,'80000037',2,'2013-10-03',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('卢安好','11010620161221756X',70,112,null,4,5,'80000038',2,'2016-12-21',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('宁昭祺','11010220210701332X',70,115,null,4,5,'80000039',2,'2021-07-01',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯佳泽','110108201608110455',50,116,null,4,5,'80000040',1,'2016-08-11',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘泊妍','110102201811263328',70,117,null,4,5,'80000041',2,'2018-11-26',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯于晏','110105202004278324',50,120,null,4,5,'80000042',2,'2020-04-27',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('李芊沐','11010220180805156X',70,121,null,4,5,'80000043',2,'2018-08-05',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('朱可璇','110111202010165542',70,122,null,4,5,'80000044',2,'2020-10-16',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('陈嘉禾','110104201702271217',50,138,null,4,5,'80000045',1,'2017-02-27',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('李静仪','110101201904121023',70,141,null,4,5,'80000046',2,'2019-04-12',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('范楚乔','110104201604151668',70,142,null,4,5,'80000047',2,'2016-04-15',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('鲁艾林','110112201708153537',70,156,null,4,5,'80000048',1,'2017-08-15',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('麻希德','110108201702072715',70,161,null,4,5,'80000049',1,'2017-02-07',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('杨潜润','110106201610187117',70,169,null,4,5,'80000050',1,'2016-10-18',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('尤秭祺','110102201606113021',70,173,null,4,5,'80000051',2,'2016-06-11',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('丁一诺','110102201610211126',70,174,null,4,5,'80000052',2,'2016-10-21',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('孙艺馨','11011220190104392X',70,178,null,4,5,'80000053',2,'2019-01-04',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('胡予清','110104201701252524',70,185,null,4,5,'80000054',2,'2017-01-25',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯元萁','110102201905113021',70,188,null,4,5,'80000055',2,'2019-05-11',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘馨芮','110108201609191437',70,198,null,4,5,'80000056',1,'2016-09-19',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('魏柳妤','110108201708233647',50,202,null,4,5,'80000057',2,'2017-08-23',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('冯铎','110111202003012011',70,205,null,4,5,'80000058',1,'2020-03-01',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘一白','110108201506016871',100,14,146,4,5,'80000059',1,'2015-06-01',1);
insert into employee (name,vnoid,rate,parentid,secparentid,employstatus_id,employtype_id,code,sex,birth,status) values('刘仲白','11010820200204681X',100,14,146,4,5,'80000060',1,'2020-02-04',1);

drop table IF EXISTS `medicalexpense`;
CREATE TABLE `medicalexpense`(
`id` varchar(50) not null comment '交易流水号',
`employeeid` int not null comment '员工id',
`employeename` varchar(50) null comment '员工id',
`employstatusid` int null comment '人员用工状态',
`employstatus` varchar(50) null comment '人员用工状态名称',
`employtypeid` int null comment '人员类别',
`employeevidno` varchar(50) null comment '公民身份号码',
`relationid` int null comment '家属id',
`relationvidno` varchar(50) null comment '家属身份证号',
`medicaltype` varchar(50) null comment '医疗类别',
`trededate` datetime null comment '交易日期or费用发生日期',
`paydate` datetime null comment '支付日期',
`amount1` double null comment '费用总金额',
`amount2` double null comment '医保内费用',
`amount3` double null comment '医保外费用（含拒付）',
`amount4` double null comment '统筹支付金额',
`amount5` double null comment '统筹自付金额',
`amount6` double null comment '大额支付金额',
`amount7` double null comment '大额自付金额',
`amount8` double null comment '拒付金额',
`amount9` double null comment '支付对象',
`amount10` double null comment '自付二金额',
`amount11` double null comment '起付标准',
`amount12` double null comment '超封顶的医保内费用',
`amount13` double null comment '门诊大额补充保险支付金额',
`amount14` double null comment '住院统筹补充保险支付金额',
`amount15` double null comment '住院大额补充保险支付金额',
`amount16` double null comment '门诊大额军残补助金额',
`amount17` double null comment '住院统筹军残补助金额',
`amount18` double null comment '住院大额军残补助金额',
`amount19` double null comment '补充保险支付金额',
`amount20` double null comment '军残补助支付金额',
`amount21` double null comment '单位补充医疗保险(原公疗)金额',
`amount22` double null comment '自付一金额',
`amount23` double null comment '医保外金额',
`admitdate` datetime null comment '入院日期',
`dischargedate` datetime null comment '出院日期',
`vno`int null comment '单据数量',
`ddate` datetime null comment '导入日期',
`dmaker` varchar(50) null comment '导入人',
`vdate` datetime null comment '审核日期',
`vmaker` varchar(50) null comment '审核人',
`cmemo` varchar(100) null comment '备注',
`amount99` double null comment '其他费用',
`amount100` double null comment '自费费用',
`amount101` double null comment '报销金额',
`amount102` double null comment '二次报销金额',
`txtfilename` varchar(50) null comment '导入txt文件名',
`rate` double null comment '承担比例 50 100',
`type` varchar(50) null comment '类型:yblr医保录入,fyblr非医保录入,ybdr医保导入',
`isback` bool null comment '是否返回',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci comment '二次报销金额';

drop table IF EXISTS `testexpense`;
CREATE TABLE `testexpense`(
`id` varchar(50) not null comment '交易流水号',
`name` varchar(50) null comment '交易流水号',
`amount1` double null comment '费用总金额',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci comment '导入报销金额';

drop table IF EXISTS `regulation`;
CREATE TABLE `regulation`(
  `id` bigint(20) NOT NULL AUTO_INCREMENT, 
  `employstatus_id`  bigint(20) NULL COMMENT '用工状态编码',
  `employtype_id`  bigint(20)NULL COMMENT '人员类别编码',
  `zf1`  double NULL COMMENT '自付1报销比例', 
  `zf2`  double NULL COMMENT '自付2报销比例',
  `zf3`  double NULL COMMENT '自费报销比例',  
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='报销标准0';
insert into regulation values (1,3,4,100,100,100);
insert into regulation values (2,2,3,100,100,100);
insert into regulation values (3,2,1,100,100,-1);
insert into regulation values (4,2,5,100,100,100);
insert into regulation values (5,2,2,100,100,100);
insert into regulation values (6,1,3,100,100,100);
insert into regulation values (7,1,1,100,100,-2);
insert into regulation values (8,1,5,100,100,100);
insert into regulation values (9,1,2,100,100,100);
insert into regulation values (10,4,4,-1,-1,0);
insert into regulation values (11,1,4,100,100,100);
drop table IF EXISTS `regulation1`;
CREATE TABLE `regulation1`(
  `id` bigint(20) NOT NULL AUTO_INCREMENT, 
  `lage`  bigint(20) NULL COMMENT '年龄下限',
  `uage`  bigint(20)NULL COMMENT '年龄上限',
  `amt1`  double NULL COMMENT '全年全额报销部分', 
  `rate1`  double NULL COMMENT '全年全额报销部分报销比例',
  `amt2`  double NULL COMMENT '超出部分上限',  
  `rate2`  double NULL COMMENT '超出部分报销比例',
  `amt3`  double NULL COMMENT '超出部分上限',  
  `rate3`  double NULL COMMENT '超出部分报销比例',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='报销标准1';
insert into regulation1 values (1,0,30,1000,100,2000,50,6000,80);
insert into regulation1 values (2,31,40,1250,100,2500,50,6250,80);
insert into regulation1 values (3,41,50,1500,100,3000,50,6500,80);
insert into regulation1 values (4,51,60,1750,100,3500,50,6750,80);
insert into regulation1 values (5,61,1000,1750,100,3500,50,6750,80);
drop table IF EXISTS `regulation2`;
CREATE TABLE `regulation2`(
  `id` bigint(20) NOT NULL AUTO_INCREMENT, 
  `lage`  bigint(20) NULL COMMENT '年龄下限',
  `uage`  bigint(20)NULL COMMENT '年龄上限',
  `amt1`  double NULL COMMENT '全年全额报销部分', 
  `rate1`  double NULL COMMENT '全年全额报销部分报销比例',
  `amt2`  double NULL COMMENT '超出部分上限',  
  `rate2`  double NULL COMMENT '超出部分报销比例',
  `amt3`  double NULL COMMENT '超出部分上限',  
  `rate3`  double NULL COMMENT '超出部分报销比例',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='报销标准2';
insert into regulation2 values (1,0,30,1000,100,2000,50,6000,80);
insert into regulation2 values (2,31,40,1250,100,2500,50,6250,80);
insert into regulation2 values (3,41,50,1500,100,3000,50,6500,80);
insert into regulation2 values (4,51,60,1750,100,3500,50,6750,80);
insert into regulation2 values (5,61,1000,1750,100,3500,50,6750,80);

drop table IF EXISTS `claimexpense`;
CREATE TABLE `claimexpense`(
`id` varchar(50) not null comment '交易流水号',
`employeeid` int not null comment '员工id',
`employeename` varchar(50) null comment '员工id',
`employstatusid` int null comment '人员用工状态',
`employtypeid` int null comment '人员类别',
`employeevidno` varchar(50) null comment '公民身份号码',
`paydate` datetime null comment '支付日期',
`amount3` double NULL COMMENT '医保外费用（含拒付)',
`claimamount3` double NULL COMMENT '医保外费用（含拒付)',
`amount10` double NULL COMMENT '自付二金额',
`claimamount10` double NULL COMMENT '自付二金额',
`amount22` double NULL COMMENT '自付一金额',
`claimamount22` double NULL COMMENT '自付一金额',
`employstatus` varchar(50) null comment '公民身份号码',
`employtype` varchar(50) null comment '公民身份号码',
`year` int null comment '年',
`month` int null comment '月',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci comment '计算报销金额';

drop table IF EXISTS `closeexpense`;
CREATE TABLE `closeexpense`(
`id` varchar(50) not null comment '交易流水号',
`employeeid` int not null comment '员工id',
`employstatusid` int null comment '人员用工状态',
`employtypeid` int null comment '人员类别',
`closeemployeeid`  int not null comment '收款员工id',
`year` int null comment '年',
`month` int null comment '月',
`claimamount22` double NULL COMMENT '自付一金额',
`claimamount10` double NULL COMMENT '自付二金额',
`claimamount3` double NULL COMMENT '医保外费用（含拒付)',
`closeamount` double null comment '实付金额',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci comment '计算发放金额';

drop table IF EXISTS `monthend`;
CREATE TABLE `monthend`(
`id` bigint(20) NOT NULL AUTO_INCREMENT, 
`year`  int null comment '开始日期',
`month`  int null comment '开始日期',
`ldate`  datetime null comment '开始日期',
`udate`  datetime null comment '结束日期',
`bclose`  bool null comment '结束日期',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci comment '结账月';
insert into monthend values (1,2021,1,'2021-01-01','2021-01-31',0);
insert into monthend values (2,2021,2,'2021-02-01','2021-02-28',0);
insert into monthend values (3,2021,3,'2021-03-01','2021-03-31',0);
insert into monthend values (4,2021,4,'2021-04-01','2021-04-30',0);
insert into monthend values (5,2021,5,'2021-05-01','2021-05-31',0);
insert into monthend values (6,2021,6,'2021-06-01','2021-06-30',0);
insert into monthend values (7,2021,7,'2021-07-01','2021-07-31',0);
insert into monthend values (8,2021,8,'2021-08-01','2021-08-31',0);
insert into monthend values (9,2021,9,'2021-09-01','2021-09-30',0);
insert into monthend values (10,2021,10,'2021-10-01','2021-10-31',0);
insert into monthend values (11,2021,11,'2021-11-01','2021-11-30',0);
insert into monthend values (12,2021,12,'2021-12-01','2021-12-31',0);
insert into monthend values (13,2022,1,'2022-01-01','2022-01-31',0);
insert into monthend values (14,2022,2,'2022-02-01','2022-02-28',0);
insert into monthend values (15,2022,3,'2022-03-01','2022-03-31',0);
insert into monthend values (16,2022,4,'2022-04-01','2022-04-30',0);
insert into monthend values (17,2022,5,'2022-05-01','2022-05-31',0);
insert into monthend values (18,2022,6,'2022-06-01','2022-06-30',0);
insert into monthend values (19,2022,7,'2022-07-01','2022-07-31',0);
insert into monthend values (20,2022,8,'2022-08-01','2022-08-31',0);
insert into monthend values (21,2022,9,'2022-09-01','2022-09-30',0);
insert into monthend values (22,2022,10,'2022-10-01','2022-10-31',0);
insert into monthend values (23,2022,11,'2022-11-01','2022-11-30',0);
insert into monthend values (24,2022,12,'2022-12-01','2022-12-31',0);
