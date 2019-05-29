/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-3306
Source Server Version : 50722
Source Host           : 127.0.0.1:3306
Source Database       : sys_test

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-03-05 09:44:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
CREATE TABLE `sys_auth` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(8) DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '树ID',
  `text` varchar(100) NOT NULL COMMENT '菜单名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `url` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target_type` varchar(32) DEFAULT NULL COMMENT '页面打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) DEFAULT '1' COMMENT '是否显示\n1：显示\n0：隐藏',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `op_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` bit(1) DEFAULT b'0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
INSERT INTO `sys_auth` VALUES ('1', null, '', '系统设置', '9', '', '', 'fa fa-cog', '1', '', '测试', '2018-01-24 12:03:44', '2018-09-06 10:49:29', '\0');
INSERT INTO `sys_auth` VALUES ('2', '1', '1,', '字典管理', '1', '/#/dict', 'iframe-tab', 'fa fa-navicon', '1', 'sys:dict:view', null, '2018-01-24 14:14:09', '2018-01-24 14:14:11', '\0');
INSERT INTO `sys_auth` VALUES ('3', '2', '1,2,', '修改', '1', null, null, null, '0', 'sys:dict:edit', null, '2018-01-24 14:16:02', '2018-01-24 14:16:04', '\0');
INSERT INTO `sys_auth` VALUES ('4', '1', '1,', '菜单管理', '2', '/#/menu', 'iframe-tab', 'fa fa-navicon', '1', 'sys:menu:view', null, '2018-01-24 15:12:11', '2018-01-24 15:12:14', '\0');
INSERT INTO `sys_auth` VALUES ('5', '4', '1,4,', '修改', '1', null, null, null, '0', 'sys:menu:edit', null, '2018-01-24 15:13:05', '2018-01-24 15:13:08', '\0');
INSERT INTO `sys_auth` VALUES ('6', '1', '1,', '角色管理', '3', '/#/role', 'iframe-tab', 'fa fa-navicon', '1', 'sys:role:view', '角色管理', '2018-01-24 15:50:52', '2018-01-24 15:50:52', '\0');
INSERT INTO `sys_auth` VALUES ('7', '6', '1,6,', '编辑', '1', null, 'iframe-tab', null, '0', 'sys:role:edit', '编辑角色', '2018-01-24 15:51:22', '2018-01-24 15:51:22', '\0');
INSERT INTO `sys_auth` VALUES ('8', '1', '1,', '用户管理', '4', '/#/user', 'iframe-tab', 'fa fa-navicon', '1', 'sys:user:list', '用户管理', '2018-01-24 16:27:10', '2018-01-24 16:27:50', '\0');
INSERT INTO `sys_auth` VALUES ('9', '8', '1,8,', '查看', '1', null, 'iframe-tab', null, '0', 'sys:user:view', null, '2018-01-24 16:28:14', '2018-01-24 16:28:14', '\0');
INSERT INTO `sys_auth` VALUES ('10', '8', '1,8,', '编辑', '2', null, 'iframe-tab', null, '0', 'sys:user:edit', null, '2018-01-24 16:28:38', '2018-01-24 16:28:38', '\0');
INSERT INTO `sys_auth` VALUES ('11', '8', '1,8,', '授权', '3', null, 'iframe-tab', null, '0', 'sys:user:auth', null, '2018-01-24 16:29:07', '2018-01-24 16:30:07', '\0');
INSERT INTO `sys_auth` VALUES ('12', null, null, '定时任务管理', '2', '', 'iframe-tab', 'fa fa-cog', '1', '', '定时任务管理', '2018-01-25 13:38:27', '2018-01-25 13:38:27', '');
INSERT INTO `sys_auth` VALUES ('13', '12', '12,', '定时任务', '1', '/#/timer', 'iframe-tab', 'fa fa-navicon', '1', '', null, '2018-01-25 13:39:40', '2018-01-25 13:39:40', '');
INSERT INTO `sys_auth` VALUES ('14', '1', '1,', '代码生成器', '1', '/#/generator', 'iframe-tab', 'fa fa-navicon', '1', 'generator:generator:view', '后台代码生成器', '2018-07-04 11:58:22', '2018-07-04 11:58:22', '\0');
INSERT INTO `sys_auth` VALUES ('15', '14', '1,14,', '代码生成', '1', null, 'iframe-tab', null, '0', 'generator:generator:code', '代码生成操作', '2018-07-04 13:12:13', '2018-07-04 13:12:13', '\0');
INSERT INTO `sys_auth` VALUES ('16', '1', '1,', 'ueditor示例', '1', '/#/demo', 'iframe-tab', 'fa fa-navicon', '1', '', 'ueditor示例', '2018-07-04 13:18:55', '2018-07-06 15:11:23', '\0');
INSERT INTO `sys_auth` VALUES ('99', null, null, ' 客户主数据', '1', null, 'iframe-tab', 'fa fa-cog', '1', null, null, '2018-10-12 06:58:24', '2018-10-12 06:58:24', '\0');
INSERT INTO `sys_auth` VALUES ('100', '99', '', ' 客户主数据', '1', '/#/customer', 'iframe-tab', 'fa fa-navicon', '1', 'customer:view', '', '2018-10-12 06:59:44', '2018-10-12 07:00:31', '\0');
INSERT INTO `sys_auth` VALUES ('101', null, '', ' 物流单管理', '4', '', 'iframe-tab', 'fa fa-cog', '1', '', '', '2018-10-12 07:50:31', '2018-11-06 00:41:24', '\0');
INSERT INTO `sys_auth` VALUES ('102', '101', '', ' 待发货', '1', '/#/logistics', 'iframe-tab', 'fa fa-navicon', '1', '', '', '2018-10-12 07:52:08', '2018-10-12 08:09:31', '\0');
INSERT INTO `sys_auth` VALUES ('103', null, '', '活动管理', '2', '', 'iframe-tab', 'fa fa-cog', '1', '', '', '2018-10-12 08:02:13', '2018-10-12 08:05:13', '\0');
INSERT INTO `sys_auth` VALUES ('104', '103', '', '活动管理', '1', '/#/activity', 'iframe-tab', 'fa fa-navicon', '1', 'activity:view', '', '2018-10-12 08:04:35', '2018-10-12 08:06:19', '\0');
INSERT INTO `sys_auth` VALUES ('105', '101', '', '待签收', '2', '/#/logisticsHas', 'iframe-tab', 'fa fa-navicon', '1', null, null, '2018-10-20 08:38:01', '2018-10-20 08:38:01', '\0');
INSERT INTO `sys_auth` VALUES ('106', '101', '', '历史物流单', '3', '/#/logisticsHistory', 'iframe-tab', 'fa fa-navicon', '1', null, null, '2018-10-20 08:38:50', '2018-10-20 08:38:50', '\0');
INSERT INTO `sys_auth` VALUES ('107', null, null, '订单管理', '3', null, 'iframe-tab', 'fa fa-cog', '1', null, null, '2018-11-06 00:40:50', '2018-11-06 00:40:50', '\0');
INSERT INTO `sys_auth` VALUES ('108', '107', '', '订单管理', '1', '/#/orderManagement', 'iframe-tab', 'fa fa-navicon', '1', null, null, '2018-11-06 00:43:25', '2018-11-06 00:43:25', '\0');
INSERT INTO `sys_auth` VALUES ('110', '100', '100,', '\"新增\"按钮权限', '1', '', 'iframe-tab', '', '0', 'customer:add', '客户主数据新增按钮权限', '2018-11-12 07:20:45', '2018-11-13 00:49:32', '\0');
INSERT INTO `sys_auth` VALUES ('111', '100', '100,', '\"编辑\"按钮权限', '1', '', 'iframe-tab', '', '0', 'customer:edit', '', '2018-11-13 00:48:03', '2018-11-13 00:49:53', '\0');
INSERT INTO `sys_auth` VALUES ('112', '100', '100,', '\"查看\"按钮权限', '1', '', 'iframe-tab', '', '0', 'customer:show', '', '2018-11-13 00:48:51', '2018-11-13 00:50:17', '\0');
INSERT INTO `sys_auth` VALUES ('113', '104', '104,', '\"新增”按钮权限', '1', null, 'iframe-tab', null, '0', 'activity:add', null, '2018-11-13 00:54:38', '2018-11-13 00:54:38', '\0');
INSERT INTO `sys_auth` VALUES ('114', '104', '104,', '\"编辑”按钮权限', '1', null, 'iframe-tab', null, '0', 'activity:edit', null, '2018-11-13 00:56:28', '2018-11-13 00:56:28', '\0');
INSERT INTO `sys_auth` VALUES ('115', '104', '104,', '“查看详情”按钮权限', '1', null, 'iframe-tab', null, '0', 'activity:show', null, '2018-11-13 00:57:34', '2018-11-13 00:57:34', '\0');
INSERT INTO `sys_auth` VALUES ('116', '104', '104,', '“活动链接及二维码”按钮权限', '1', null, 'iframe-tab', null, '0', 'activity:generateQcode', null, '2018-11-13 00:58:44', '2018-11-13 00:58:44', '\0');
INSERT INTO `sys_auth` VALUES ('117', '104', '104,', '“复制活动”按钮权限', '1', null, 'iframe-tab', null, '0', 'activity:copy', null, '2018-11-13 01:04:41', '2018-11-13 01:04:41', '\0');
INSERT INTO `sys_auth` VALUES ('118', '102', '102,', '“发货”按钮权限', '1', null, 'iframe-tab', null, '0', 'logistics:show', null, '2018-11-13 01:10:13', '2018-11-13 01:10:13', '\0');
INSERT INTO `sys_auth` VALUES ('119', '102', '102,', '“客户订单明细”按钮权限', '1', null, 'iframe-tab', null, '0', 'logistics:history', null, '2018-11-13 01:13:24', '2018-11-13 01:13:24', '\0');
INSERT INTO `sys_auth` VALUES ('120', '102', '102,', '“导出物流单”按钮权限', '1', null, 'iframe-tab', null, '0', 'logistics:createExcel', null, '2018-11-13 01:14:32', '2018-11-13 01:14:32', '\0');
INSERT INTO `sys_auth` VALUES ('121', '105', '105,', '“签收”按钮权限', '1', null, 'iframe-tab', null, '0', 'logisticsHas:show', null, '2018-11-13 01:18:26', '2018-11-13 01:18:26', '\0');
INSERT INTO `sys_auth` VALUES ('122', '105', '105,', '“客户订单明细”按钮权限', '1', null, 'iframe-tab', null, '0', 'logisticsHas:history', null, '2018-11-13 01:19:52', '2018-11-13 01:19:52', '\0');
INSERT INTO `sys_auth` VALUES ('123', '105', '105,', '“导出物流单”按钮权限', '1', null, 'iframe-tab', null, '0', 'logisticsHas:createExcel', null, '2018-11-13 01:20:49', '2018-11-13 01:20:49', '\0');
INSERT INTO `sys_auth` VALUES ('124', '106', '106,', '“查看详情”按钮权限', '1', null, 'iframe-tab', null, '0', 'logisticsHistory:show', null, '2018-11-13 01:23:30', '2018-11-13 01:23:30', '\0');
INSERT INTO `sys_auth` VALUES ('125', '106', '106,', '“客户订单明细”按钮权限', '1', null, 'iframe-tab', null, '0', 'logisticsHistory:history', null, '2018-11-13 01:24:44', '2018-11-13 01:24:44', '\0');
INSERT INTO `sys_auth` VALUES ('126', '106', '106,', '“导出物流单”按钮权限', '1', null, 'iframe-tab', null, '0', 'logisticsHistory:createExcel', null, '2018-11-13 01:25:44', '2018-11-13 01:25:44', '\0');
INSERT INTO `sys_auth` VALUES ('127', '108', '108,', '“订单详情”按钮权限', '1', null, 'iframe-tab', null, '0', 'orderManagement:show', null, '2018-11-13 01:29:17', '2018-11-13 01:29:17', '\0');
INSERT INTO `sys_auth` VALUES ('128', '108', '108,', '“批量生成物流单”按钮权限', '1', null, 'iframe-tab', null, '0', 'orderManagement:history', null, '2018-11-13 01:31:11', '2018-11-13 01:31:11', '\0');
INSERT INTO `sys_auth` VALUES ('129', '103', '103,', '测试', '2', '/#/teamPrd', 'iframe-tab', null, '1', null, null, '2018-11-26 05:49:44', '2018-11-26 05:49:44', '');
INSERT INTO `sys_auth` VALUES ('130', null, '', '团购订单管理', '5', '', 'iframe-tab', 'fa fa-cog', '1', '', '', '2018-11-27 08:07:48', '2018-11-27 08:08:16', '\0');
INSERT INTO `sys_auth` VALUES ('131', '130', '130,', '团购订单管理', '1', '/#/groupBuyOrder', 'iframe-tab', 'fa fa-navicon', '1', '', '', '2018-11-27 08:09:43', '2018-12-10 02:56:09', '\0');
INSERT INTO `sys_auth` VALUES ('132', null, null, '月亮天使主数据', '8', '', 'iframe-tab', 'fa fa-cog', '1', null, null, '2018-11-30 01:13:48', '2018-11-30 01:13:48', '\0');
INSERT INTO `sys_auth` VALUES ('133', '132', '', '月亮天使管理', '1', '/#/angelManager', 'iframe-tab', 'fa fa-navicon', '1', '', '', '2018-11-30 01:14:21', '2018-11-30 01:14:42', '\0');
INSERT INTO `sys_auth` VALUES ('134', null, '', '团购活动配置', '6', '/#/groupPurchase', 'iframe-tab', 'fa fa-cog', '1', '', '', '2018-12-03 03:50:05', '2018-12-14 07:11:30', '\0');
INSERT INTO `sys_auth` VALUES ('135', '133', '133,', '月亮天使审核', '1', '/', 'iframe-tab', 'fa fa-navicon', '1', null, null, '2018-12-03 05:18:02', '2018-12-03 05:18:02', '');
INSERT INTO `sys_auth` VALUES ('136', '132', '', '月亮天使审核', '2', '/#/angelList', 'iframe-tab', 'fa fa-navicon', '1', '', '', '2018-12-03 05:19:49', '2018-12-03 05:24:15', '\0');
INSERT INTO `sys_auth` VALUES ('137', '131', '130,131,', '\"标记发货\"按钮权限', '1', '', 'iframe-tab', '', '0', 'groupBuyOrder:markShip', '\"标记发货\"按钮权限', '2018-12-05 02:26:24', '2018-12-05 02:27:57', '\0');
INSERT INTO `sys_auth` VALUES ('138', '131', '130,131,', '\"导出订单明细\"按钮权限', '2', null, 'iframe-tab', null, '0', ' groupBuyOrder:createExcel', '\"导出订单明细\"按钮权限', '2018-12-05 02:27:36', '2018-12-05 02:27:36', '\0');
INSERT INTO `sys_auth` VALUES ('139', null, null, '团购商品管理', '7', null, 'iframe-tab', 'fa fa-cog', '1', null, null, '2018-12-06 08:08:11', '2018-12-06 08:08:11', '\0');
INSERT INTO `sys_auth` VALUES ('140', '139', '', '团购商品管理', '1', '/#/teamPrd', 'iframe-tab', '', '1', '', '', '2018-12-06 08:08:36', '2018-12-06 08:08:55', '\0');
INSERT INTO `sys_auth` VALUES ('141', '130', '130,', '下载Excel', '1', '/#/downLoadExcel', 'iframe-tab', 'fa fa-cog', '1', '', '', '2018-12-19 08:43:24', '2018-12-19 08:44:02', '\0');

-- ----------------------------
-- Table structure for sys_dict_entry
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_entry`;
CREATE TABLE `sys_dict_entry` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dicttype_id` varchar(50) NOT NULL COMMENT '业务字典子选项',
  `dict_id` varchar(100) NOT NULL COMMENT '字典id',
  `dict_name` varchar(400) DEFAULT NULL COMMENT '字典名称',
  `status` int(2) DEFAULT NULL COMMENT '状态（1使用中/0已废弃）',
  `sort` int(4) DEFAULT NULL COMMENT '排序编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `op_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='业务字段表';

-- ----------------------------
-- Records of sys_dict_entry
-- ----------------------------
INSERT INTO `sys_dict_entry` VALUES ('1', 'SYS_DICT_SEX', 'male', '男', '1', '1', '2018-01-24 14:40:45', '2018-01-24 14:40:45', '0');
INSERT INTO `sys_dict_entry` VALUES ('2', 'SYS_DICT_SEX', 'female', '女', '1', '2', '2018-01-24 14:40:57', '2018-01-24 14:40:57', '0');
INSERT INTO `sys_dict_entry` VALUES ('3', 'SYS_DICT_SEX', 'unknown', '未知', '1', '3', '2018-01-24 14:41:28', '2018-01-24 14:41:28', '0');
INSERT INTO `sys_dict_entry` VALUES ('76', 'ACTIVITY_ENTERPRISE_NATURE', '1', '政府/事业单位', '1', '1', '2018-10-18 03:30:54', '2018-10-18 03:30:54', '0');
INSERT INTO `sys_dict_entry` VALUES ('77', 'ACTIVITY_ENTERPRISE_NATURE', '2', '国有企业', '1', '2', '2018-10-18 11:31:02', '2018-10-18 03:31:20', '0');
INSERT INTO `sys_dict_entry` VALUES ('78', 'ACTIVITY_ENTERPRISE_NATURE', '3', '民营企业', '1', '3', '2018-10-18 03:31:15', '2018-10-18 03:31:15', '0');
INSERT INTO `sys_dict_entry` VALUES ('79', 'ACTIVITY_ENTERPRISE_NATURE', '4', '外资企业', '1', '4', '2018-10-18 03:31:30', '2018-10-18 03:31:30', '0');
INSERT INTO `sys_dict_entry` VALUES ('80', 'ACTIVITY_ENTERPRISE_NATURE', '5', '个体商户', '1', '5', '2018-10-18 03:31:39', '2018-10-18 03:31:39', '0');
INSERT INTO `sys_dict_entry` VALUES ('81', 'SYS_DICT_IF', '1', '是', '1', '1', '2018-10-18 06:16:50', '2018-10-18 06:16:50', '0');
INSERT INTO `sys_dict_entry` VALUES ('82', 'SYS_DICT_IF', '0', '否', '1', '1', '2018-10-18 06:16:57', '2018-10-18 06:16:57', '0');
INSERT INTO `sys_dict_entry` VALUES ('83', 'ACTIVITY_PRODUCT_TYPE', '0', '单产品', '1', '1', '2018-10-19 03:29:49', '2018-10-19 03:29:49', '0');
INSERT INTO `sys_dict_entry` VALUES ('84', 'ACTIVITY_PRODUCT_TYPE', '1', '组合产品', '1', '2', '2018-10-19 03:29:57', '2018-10-19 03:29:57', '0');
INSERT INTO `sys_dict_entry` VALUES ('85', 'ACTIVITY_STATUS', '1', '未开始', '1', '1', '2018-10-19 08:33:45', '2018-10-19 08:33:45', '0');
INSERT INTO `sys_dict_entry` VALUES ('86', 'ACTIVITY_STATUS', '2', '进行中', '1', '2', '2018-10-19 16:34:05', '2018-10-25 04:00:49', '0');
INSERT INTO `sys_dict_entry` VALUES ('87', 'ACTIVITY_STATUS', '3', '待发货', '1', '3', '2018-10-19 16:34:21', '2018-10-25 04:01:11', '1');
INSERT INTO `sys_dict_entry` VALUES ('88', 'ACTIVITY_STATUS', '4', '待签收', '1', '4', '2018-10-19 16:34:34', '2018-10-25 04:01:47', '1');
INSERT INTO `sys_dict_entry` VALUES ('89', 'ACTIVITY_STATUS', '5', '已签收', '1', '5', '2018-10-19 16:34:43', '2018-10-25 04:01:59', '1');
INSERT INTO `sys_dict_entry` VALUES ('90', 'ACTIVITY_STATUS', '6', '已结束', '1', '6', '2018-10-25 12:02:15', '2018-10-25 04:02:37', '0');
INSERT INTO `sys_dict_entry` VALUES ('91', 'GROUP_BUY_ORDER_STATUS', '0', '待付款', '1', '1', '2018-11-28 16:39:58', '2018-12-17 05:18:09', '0');
INSERT INTO `sys_dict_entry` VALUES ('92', 'GROUP_BUY_ORDER_STATUS', '1', '待成团', '1', '2', '2018-11-28 00:40:13', '2018-11-28 00:40:13', '0');
INSERT INTO `sys_dict_entry` VALUES ('93', 'GROUP_BUY_ORDER_STATUS', '2', '待发货', '1', '3', '2018-11-28 00:40:37', '2018-11-28 00:40:37', '0');
INSERT INTO `sys_dict_entry` VALUES ('94', 'GROUP_BUY_ORDER_STATUS', '3', '待签收', '1', '4', '2018-11-29 08:41:01', '2018-11-30 07:10:06', '0');
INSERT INTO `sys_dict_entry` VALUES ('95', 'GROUP_BUY_ORDER_STATUS', '4', '已完成', '1', '5', '2018-11-28 00:41:22', '2018-11-28 00:41:22', '0');
INSERT INTO `sys_dict_entry` VALUES ('96', 'GROUP_BUY_ORDER_STATUS', '5', '已取消', '1', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('97', 'CGB_ANGEL_STATUS', '0', '待审核', '1', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('98', 'CGB_ANGEL_STATUS', '1', '审核不通过', '1', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('99', 'CGB_ANGEL_STATUS', '2', '正常合作', '1', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('100', 'CGB_ANGEL_STATUS', '3', '终止合作', '1', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('101', 'CGB_APPROVE_PAGE_STATUS', '0', '待审核', '1', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('102', 'CGB_APPROVE_PAGE_STATUS', '1', '审核不通过', '2', '6', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('103', 'ACTIVITY_CATEGORY', '1', '七色至尊', '1', '1', '2018-12-05 06:55:17', '2018-12-05 06:55:17', '0');
INSERT INTO `sys_dict_entry` VALUES ('104', 'ACTIVITY_CATEGORY', '2', '机洗至尊', '1', '2', '2018-12-05 06:55:26', '2018-12-05 06:55:26', '0');
INSERT INTO `sys_dict_entry` VALUES ('105', 'ACTIVITY_CATEGORY', '3', '洗衣液', '1', '3', '2018-12-05 06:55:36', '2018-12-05 06:55:36', '0');
INSERT INTO `sys_dict_entry` VALUES ('106', 'ACTIVITY_CATEGORY', '4', '个人护理', '1', '4', '2018-12-05 06:55:46', '2018-12-05 06:55:46', '0');
INSERT INTO `sys_dict_entry` VALUES ('107', 'ACTIVITY_CATEGORY', '5', '衣物护理', '1', '1', '2018-12-05 06:55:55', '2018-12-05 06:55:55', '0');
INSERT INTO `sys_dict_entry` VALUES ('108', 'ACTIVITY_CATEGORY', '6', '家居清洁', '1', '6', '2018-12-05 06:56:05', '2018-12-05 06:56:05', '0');
INSERT INTO `sys_dict_entry` VALUES ('109', 'CGB_ITEM_UNIT', '0', '瓶', '1', '1', '2018-12-07 07:59:19', '2018-12-09 15:10:46', '0');
INSERT INTO `sys_dict_entry` VALUES ('110', 'CGB_ITEM_UNIT', '1', '箱', '1', '2', '2018-12-07 23:59:30', '2018-12-09 15:10:20', '0');
INSERT INTO `sys_dict_entry` VALUES ('111', 'CGB_ITEM_UNIT', '2', '套', '1', '3', '2018-12-07 15:59:39', '2018-12-09 15:10:29', '0');
INSERT INTO `sys_dict_entry` VALUES ('112', 'CGB_ITEM_UNIT', '3', '袋', '1', '4', '2018-12-07 07:59:50', '2018-12-09 15:10:34', '0');
INSERT INTO `sys_dict_entry` VALUES ('113', 'CGB_ACTIVITY_STATUS', '1', '未开始', '1', '1', '2018-12-10 05:50:37', '2018-12-10 05:50:37', '0');
INSERT INTO `sys_dict_entry` VALUES ('114', 'CGB_ACTIVITY_STATUS', '2', '活动中', '1', '2', '2018-12-10 05:50:51', '2018-12-10 05:50:51', '0');
INSERT INTO `sys_dict_entry` VALUES ('115', 'CGB_ACTIVITY_STATUS', '3', '预热中', '1', '3', '2018-12-10 05:51:06', '2018-12-10 05:51:06', '0');
INSERT INTO `sys_dict_entry` VALUES ('116', 'CGB_ACTIVITY_STATUS', '4', '已关闭', '1', '4', '2018-12-10 05:51:16', '2018-12-10 05:51:16', '0');
INSERT INTO `sys_dict_entry` VALUES ('117', 'CGB_ACTIVITY_STATUS', '5', '已结束', '1', '5', '2018-12-10 05:51:29', '2018-12-10 05:51:29', '0');
INSERT INTO `sys_dict_entry` VALUES ('118', 'CGB_ANGEL_LIST_STATUS', '2', '正常合作', '1', '1', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('119', 'CGB_ANGEL_LIST_STATUS', '3', '终止合作', '1', '2', '2018-11-28 00:41:43', '2018-11-28 00:41:43', '0');
INSERT INTO `sys_dict_entry` VALUES ('120', 'CGB_ACTIVITY_CATEGORY', '1', '七色至尊', '1', '2', '2018-12-05 06:55:17', '2018-12-05 06:55:17', '0');
INSERT INTO `sys_dict_entry` VALUES ('121', 'CGB_ACTIVITY_CATEGORY', '2', '机洗至尊', '1', '3', '2018-12-05 06:55:26', '2018-12-05 06:55:26', '0');
INSERT INTO `sys_dict_entry` VALUES ('122', 'CGB_ACTIVITY_CATEGORY', '3', '洗衣液', '1', '4', '2018-12-05 06:55:36', '2018-12-05 06:55:36', '0');
INSERT INTO `sys_dict_entry` VALUES ('123', 'CGB_ACTIVITY_CATEGORY', '4', '个人护理', '1', '5', '2018-12-05 06:55:46', '2018-12-05 06:55:46', '0');
INSERT INTO `sys_dict_entry` VALUES ('124', 'CGB_ACTIVITY_CATEGORY', '5', '衣物护理', '1', '6', '2018-12-05 06:55:55', '2018-12-05 06:55:55', '0');
INSERT INTO `sys_dict_entry` VALUES ('125', 'CGB_ACTIVITY_CATEGORY', '6', '家居清洁', '1', '7', '2018-12-05 06:56:05', '2018-12-05 06:56:05', '0');
INSERT INTO `sys_dict_entry` VALUES ('126', 'CGB_ACTIVITY_CATEGORY', '0', '全部', '1', '1', '2018-12-05 06:56:05', '2018-12-05 06:56:05', '0');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dicttype_id` varchar(100) NOT NULL COMMENT '业务字典编码',
  `dicttype_name` varchar(100) DEFAULT NULL COMMENT '业务字典名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `op_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='业务字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', 'SYS_DICT_SEX', '性别', '2018-01-24 22:25:56', '2019-01-23 08:09:25', '0');
INSERT INTO `sys_dict_type` VALUES ('27', 'ACTIVITY_ENTERPRISE_NATURE', '企业性质', '2018-10-18 03:30:24', '2018-10-18 03:30:24', '0');
INSERT INTO `sys_dict_type` VALUES ('28', 'SYS_DICT_IF', '是否', '2018-10-18 06:16:42', '2018-10-18 06:16:42', '0');
INSERT INTO `sys_dict_type` VALUES ('29', 'ACTIVITY_PRODUCT_TYPE', '活动管理-产品类型', '2018-10-19 03:28:28', '2018-10-19 03:28:28', '0');
INSERT INTO `sys_dict_type` VALUES ('30', 'ACTIVITY_STATUS', '活动状态', '2018-10-19 08:31:48', '2018-10-19 08:31:48', '0');
INSERT INTO `sys_dict_type` VALUES ('31', 'GROUP_BUY_ORDER_STATUS', '社区团购订单状态', '2018-11-28 00:39:25', '2018-11-28 00:39:25', '0');
INSERT INTO `sys_dict_type` VALUES ('32', 'CGB_ANGEL_STATUS', '天使状态', '2018-12-03 15:53:10', '2018-12-03 15:53:12', '0');
INSERT INTO `sys_dict_type` VALUES ('33', 'CGB_APPROVE_PAGE_STATUS', '天使审核界面状态', '2018-12-03 15:53:10', '2018-12-03 15:53:12', '0');
INSERT INTO `sys_dict_type` VALUES ('34', 'ACTIVITY_CATEGORY', '所属类目', '2018-12-05 06:54:50', '2018-12-05 06:54:50', '0');
INSERT INTO `sys_dict_type` VALUES ('35', 'CGB_ITEM_UNIT', '商品单位', '2018-12-06 07:58:54', '2018-12-06 07:58:54', '0');
INSERT INTO `sys_dict_type` VALUES ('36', 'CGB_ACTIVITY_STATUS', '活动状态', '2018-12-10 05:50:21', '2018-12-10 05:50:21', '0');
INSERT INTO `sys_dict_type` VALUES ('37', 'CGB_ANGEL_LIST_STATUS', '天使列表状态', '2018-12-06 07:58:54', '2018-12-06 07:58:54', '0');
INSERT INTO `sys_dict_type` VALUES ('38', 'CGB_ACTIVITY_CATEGORY', '所属类目', '2018-12-05 06:54:50', '2018-12-05 06:54:50', '0');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_name` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `user_id` int(65) DEFAULT NULL COMMENT '管理员id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `del_falg` varchar(32) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='登录记录表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_type` varchar(56) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志类型',
  `log_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志名称',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名称',
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '方法名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `succeed` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否成功',
  `message` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(36) NOT NULL COMMENT '角色代码',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `op_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_ADMIN', '超级管理员', '1', '超级管理员', '2018-01-24 11:31:01', '2019-01-29 01:46:53', '0');
INSERT INTO `sys_role` VALUES ('2', 'role_test', '测试体验者', '1', '无系统设置权限', '2018-08-01 13:09:44', '2018-11-13 03:58:00', '0');
INSERT INTO `sys_role` VALUES ('3', 'ROLE_firs', '一期的测试角色', '1', '一期的测试使用啦啦啦~', '2018-11-02 00:37:00', '2018-11-02 00:37:00', '0');
INSERT INTO `sys_role` VALUES ('4', 'tang_role', '测试角色', '1', '测试角色', '2018-11-13 05:16:06', '2018-11-13 05:37:30', '0');
INSERT INTO `sys_role` VALUES ('5', 'ROLE_ quanxian', '权限问题测试', '1', '测试权限问题啦啦啦', '2018-11-13 07:32:55', '2018-11-13 07:32:55', '0');
INSERT INTO `sys_role` VALUES ('6', 'ROLE_group-buying', '社区团购管理员', '1', '陈小花。', '2018-12-10 02:50:26', '2018-12-10 02:50:26', '0');

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_id` int(8) NOT NULL COMMENT '角色ID',
  `auth_id` int(8) NOT NULL COMMENT '菜单ID',
  `is_del` bit(1) DEFAULT b'0',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('1', '1', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '2', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '3', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '4', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '5', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '6', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '7', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '8', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '9', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '10', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '11', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '14', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '15', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '16', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '99', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '100', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '101', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '102', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '103', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '104', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '105', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '106', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '107', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '108', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '110', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '111', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '112', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '113', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '114', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '115', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '116', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '117', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '118', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '119', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '120', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '121', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '122', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '123', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '124', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '125', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '126', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '127', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '128', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '130', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '131', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '132', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '133', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '134', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '136', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '137', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '138', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '139', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '140', '\0');
INSERT INTO `sys_role_auth` VALUES ('1', '141', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '99', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '100', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '101', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '102', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '103', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '104', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '105', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '106', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '107', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '108', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '110', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '111', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '112', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '113', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '114', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '115', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '116', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '117', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '118', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '119', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '120', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '121', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '122', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '123', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '124', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '125', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '126', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '127', '\0');
INSERT INTO `sys_role_auth` VALUES ('2', '128', '\0');
INSERT INTO `sys_role_auth` VALUES ('3', '99', '\0');
INSERT INTO `sys_role_auth` VALUES ('3', '100', '\0');
INSERT INTO `sys_role_auth` VALUES ('3', '103', '\0');
INSERT INTO `sys_role_auth` VALUES ('3', '104', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '1', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '2', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '3', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '4', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '5', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '6', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '7', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '8', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '9', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '11', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '103', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '104', '\0');
INSERT INTO `sys_role_auth` VALUES ('4', '113', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '99', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '100', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '101', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '102', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '103', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '104', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '105', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '106', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '107', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '108', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '110', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '112', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '113', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '115', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '116', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '117', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '118', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '121', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '124', '\0');
INSERT INTO `sys_role_auth` VALUES ('5', '127', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '1', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '2', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '3', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '4', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '5', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '6', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '7', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '8', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '9', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '10', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '11', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '14', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '15', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '16', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '130', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '131', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '132', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '133', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '134', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '136', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '137', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '138', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '139', '\0');
INSERT INTO `sys_role_auth` VALUES ('6', '140', '\0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(36) NOT NULL COMMENT '姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(36) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(36) DEFAULT NULL COMMENT '手机',
  `enabled` bit(1) DEFAULT b'1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `op_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` bit(1) DEFAULT b'0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$08$UIbl948v1vaFLzwr3Hea7uJECTdYsEA8gkxWxNgBLBVXbIG1ODyLO', '超级管理员', '514471352@qq.com', null, null, '', '超级管理员', '2018-01-24 10:19:49', '2018-01-24 10:19:51', '\0');
INSERT INTO `sys_user` VALUES ('2', 'huangpeishan', '524c8ab9741987f5d233532fe5b2b4ffd609f740e0da3dfba37116f9ae4a51c3e4ae4d777dcc5bdf', '黄佩珊', '', null, '18665712882', '', '', '2018-07-17 11:24:54', '2018-08-01 15:09:20', '');
INSERT INTO `sys_user` VALUES ('7', '80438036', '$2a$08$zuYcS1BV35spaIJhdYmvKe/DnDdBM3xphQ7GaUUzWUVTuLAVM/i3e', '李国庆', '', null, '18665052861', '', '', '2018-08-01 15:14:47', '2018-08-10 11:25:52', '\0');
INSERT INTO `sys_user` VALUES ('24', '80512165', '$2a$08$NPt1LKPZKyHZ7zBOtD4MPO.03AXd9OaGFEGMvO1lBrn0H.BrUuU7G', '李拉拉', '', null, '13500000000', '', '', '2018-08-01 16:38:31', '2018-08-01 16:38:31', '\0');
INSERT INTO `sys_user` VALUES ('25', '80488098', '$2a$08$NUtH1gfy7dzU4RjgbUua0OKqND7U.IAUWkQUixgDSvLs4q52QcV8G', 'aaaa', '', null, '15800000000', '', '', '2018-08-01 16:42:57', '2018-10-23 06:43:30', '\0');
INSERT INTO `sys_user` VALUES ('26', '110', '$2a$08$.azd6KySeRnfHku8/i.daucKat0DikoaN617oXUm9E1/a/5uuw8cq', '1', '', null, '1', '', '', '2018-08-15 15:18:55', '2018-08-15 15:18:55', '\0');
INSERT INTO `sys_user` VALUES ('27', 'leiboping', '$2a$08$bzzdrfHfMi8aNuLrCCsqIunqNhFKgMKmY1lh6VKnv2UVd4faak2HS', '雷柏平', '', null, '13794445890', '', '', '2018-10-19 07:59:39', '2018-10-19 07:59:39', '\0');
INSERT INTO `sys_user` VALUES ('32', 'qinfeng', '$2a$08$XC9Mf97BbzNbmq.7FJ/WAuKoyS9Sf.oUXLGlAqOZKpx4cGf82FEyK', 'qinfeng', '', null, '13800001111', '', '', '2018-11-13 00:46:44', '2018-11-13 00:46:44', '\0');
INSERT INTO `sys_user` VALUES ('33', 'tang', '$2a$08$n9ytLvSGfkhtHJhHxXUL0eRKZXgR3YYtNgfkavUPfb7IDIUPtIggm', 'tang', '', null, '15915772851', '', '', '2018-11-13 05:15:20', '2018-11-13 05:15:20', '\0');
INSERT INTO `sys_user` VALUES ('34', '80530937', '$2a$08$PeF3ux/irl.nOIF2KErStOrNyrH3gKwmT9Y.o3yBnNjDMzcJi5iR.', '兵兵', '', null, '18826243309', '', '', '2018-11-13 07:45:49', '2018-11-13 07:45:49', '\0');
INSERT INTO `sys_user` VALUES ('35', '80536953', '$2a$08$Dwozg3h7iGZMh6LN9nriVO1V4HhQm/ZcPUUiazkRVMhyFKUtiKi7W', '陈彤彤', '', null, '18502749566', '', '', '2018-11-16 02:56:34', '2018-11-16 02:56:34', '\0');
INSERT INTO `sys_user` VALUES ('36', '80542325', '$2a$08$.GzSL1WXN9X1hwbrgQExz.vNWplQ8twt.Rb.R6y48gYOPOxbl.bEG', '陈小花', '', null, '15000000001', '', '', '2018-12-10 02:48:38', '2018-12-10 02:48:38', '\0');
INSERT INTO `sys_user` VALUES ('37', '80544114', '$2a$08$3Y.0ZVed9MJotJms4ZCzbeSk4JhTNXGy.lRTLZlKfu/yJ5iS4E52y', '商向楠', '', null, '17839219902', '', '', '2019-01-29 00:51:18', '2019-01-29 00:51:18', '\0');
INSERT INTO `sys_user` VALUES ('38', '80177902', '$2a$08$HLbQJfcnyUZk.HR2I.0lU.66SbxLuCg5UpBX8FPiWl6CV6jkenP.S', '张妍惠', '', null, '13672416353', '', '', '2019-02-21 06:54:48', '2019-02-21 06:54:48', '');
INSERT INTO `sys_user` VALUES ('39', '80533130', '$2a$08$8JuB3muy4v98mG6KJZjAzeVnJdYC/Z0ZJ0k903G/d8L.EYzwHqBYK', '崔雪怡', '', null, '13560240936', '', '', '2019-02-21 06:55:31', '2019-02-21 06:55:31', '');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(8) NOT NULL COMMENT '用户ID',
  `role_id` int(8) NOT NULL COMMENT '角色ID',
  `is_del` bit(1) DEFAULT b'0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '\0');
INSERT INTO `sys_user_role` VALUES ('7', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('22', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('23', '1', '\0');
INSERT INTO `sys_user_role` VALUES ('23', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('24', '1', '\0');
INSERT INTO `sys_user_role` VALUES ('24', '3', '\0');
INSERT INTO `sys_user_role` VALUES ('25', '1', '\0');
INSERT INTO `sys_user_role` VALUES ('25', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('25', '6', '\0');
INSERT INTO `sys_user_role` VALUES ('26', '1', '\0');
INSERT INTO `sys_user_role` VALUES ('26', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('32', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('33', '4', '\0');
INSERT INTO `sys_user_role` VALUES ('34', '5', '\0');
INSERT INTO `sys_user_role` VALUES ('35', '2', '\0');
INSERT INTO `sys_user_role` VALUES ('36', '6', '\0');
INSERT INTO `sys_user_role` VALUES ('37', '6', '\0');
