/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50610
Source Host           : 127.0.0.1:3306
Source Database       : realty2

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2019-11-05 15:30:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_detail_id` bigint(20) NOT NULL COMMENT '产品明细表id',
  `user_id` bigint(20) NOT NULL COMMENT '用户表id',
  `num` int(20) NOT NULL DEFAULT '1' COMMENT '数量',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for company_info
-- ----------------------------
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '公司名称',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `area` float(20,2) DEFAULT NULL COMMENT '占用面积',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `NORMAL_NAME` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业信息表';

-- ----------------------------
-- Records of company_info
-- ----------------------------

-- ----------------------------
-- Table structure for cycle_type
-- ----------------------------
DROP TABLE IF EXISTS `cycle_type`;
CREATE TABLE `cycle_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '周期名称',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='周期表';

-- ----------------------------
-- Records of cycle_type
-- ----------------------------

-- ----------------------------
-- Table structure for dict_holiday_date
-- ----------------------------
DROP TABLE IF EXISTS `dict_holiday_date`;
CREATE TABLE `dict_holiday_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `holiday_name_id` bigint(20) DEFAULT NULL COMMENT '节假日名称表id',
  `date` datetime DEFAULT NULL COMMENT '节假日具体时间',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='节假日时间日期对应表';

-- ----------------------------
-- Records of dict_holiday_date
-- ----------------------------

-- ----------------------------
-- Table structure for dict_holiday_name
-- ----------------------------
DROP TABLE IF EXISTS `dict_holiday_name`;
CREATE TABLE `dict_holiday_name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '节假日名称',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='节假日名称表';

-- ----------------------------
-- Records of dict_holiday_name
-- ----------------------------

-- ----------------------------
-- Table structure for mini_user
-- ----------------------------
DROP TABLE IF EXISTS `mini_user`;
CREATE TABLE `mini_user` (
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户唯一标识（小程序）',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `unionid` varchar(255) DEFAULT NULL COMMENT '同一个微信开放平台帐号，用户的unionid是唯一的',
  `session_key` varchar(100) NOT NULL DEFAULT '' COMMENT '会话密钥',
  `salt` varchar(8) NOT NULL DEFAULT '' COMMENT '随机盐',
  `token` varchar(100) NOT NULL DEFAULT '' COMMENT '加密后的userToken',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `gender` int(255) DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(255) DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(255) DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(255) DEFAULT NULL COMMENT '用户所在国家',
  `language` varchar(255) DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`openid`) USING BTREE,
  UNIQUE KEY `openid_unique` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mini_user
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ship_address_id` bigint(20) DEFAULT NULL COMMENT '收货地址表id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '公司地址表id',
  `prod_detail_id` bigint(20) NOT NULL COMMENT '产品明细表id',
  `order_number` bigint(20) NOT NULL COMMENT '订单编号',
  `appointment_server_time` datetime DEFAULT NULL COMMENT '预约服务时间',
  `num` int(20) NOT NULL COMMENT '下单件数',
  `remark` varchar(255) DEFAULT NULL COMMENT '买家备注',
  `totl_amount` decimal(16,2) NOT NULL COMMENT '订单总额',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券表id',
  `reatily_amount` decimal(16,2) NOT NULL COMMENT '实际付款',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `deal_time` datetime NOT NULL COMMENT '成交时间',
  `server_start_time` datetime DEFAULT NULL COMMENT '服务开始时间',
  `server_finish_time` datetime DEFAULT NULL COMMENT '服务结束时间',
  `allotted_time` datetime NOT NULL COMMENT '售后期限范围',
  `surplus_times` int(20) NOT NULL COMMENT '剩余服务次数',
  `is_pyment` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否付款(0:否；1：是)',
  `is_dispitch` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否调度(0:否；1：是)',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价(0:否；1：是)',
  `order_status` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态(0:未完成;1:已完成；-1:已取消;2：售后)',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_after_sales
-- ----------------------------
DROP TABLE IF EXISTS `order_after_sales`;
CREATE TABLE `order_after_sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单表id',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型(1:退款；2：退货退款；3：其他)',
  `reason` varchar(255) DEFAULT NULL COMMENT '申请理由',
  `operator` varchar(30) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `finish_time` datetime NOT NULL COMMENT '完成时间',
  `after_sales_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '售后状态(0:处理中；1:已处理；-1:未处理)',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单售后表';

-- ----------------------------
-- Records of order_after_sales
-- ----------------------------

-- ----------------------------
-- Table structure for order_disp
-- ----------------------------
DROP TABLE IF EXISTS `order_disp`;
CREATE TABLE `order_disp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispitch_id` bigint(20) NOT NULL COMMENT '调度人员id',
  `server_id` bigint(20) NOT NULL COMMENT '服务员id',
  `order_id` bigint(20) NOT NULL COMMENT '订单表id',
  `how_times` int(20) NOT NULL COMMENT '周期内第几次服务',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单调度表';

-- ----------------------------
-- Records of order_disp
-- ----------------------------

-- ----------------------------
-- Table structure for order_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `order_evaluate`;
CREATE TABLE `order_evaluate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_disp_id` bigint(20) NOT NULL COMMENT '订单调度表id',
  `content` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单评价表';

-- ----------------------------
-- Records of order_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for price_type
-- ----------------------------
DROP TABLE IF EXISTS `price_type`;
CREATE TABLE `price_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_id` bigint(20) DEFAULT NULL COMMENT '产品详情表id',
  `commonly_price` decimal(16,2) NOT NULL COMMENT '默认价格',
  `weekend_price` decimal(16,2) DEFAULT NULL COMMENT '周末价格',
  `holiday_price` decimal(16,2) DEFAULT NULL COMMENT '节假日价格',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='价格类别表';

-- ----------------------------
-- Records of price_type
-- ----------------------------

-- ----------------------------
-- Table structure for product_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE `product_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_type_id` bigint(20) NOT NULL COMMENT '类型表id',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `price` decimal(16,2) DEFAULT NULL COMMENT '价格',
  `prod_unit_id` bigint(20) NOT NULL COMMENT '单位表id',
  `inventory` int(20) DEFAULT '-1' COMMENT '库存数量',
  `sales_num` int(20) DEFAULT '0' COMMENT '销量',
  `default_img` varchar(255) NOT NULL COMMENT '产品默认图',
  `product_img` varchar(255) NOT NULL COMMENT '产品大图',
  `description` varchar(255) DEFAULT '' COMMENT '产品描述文字',
  `details_img` varchar(255) DEFAULT '' COMMENT '产品详情图',
  `is_cycle` smallint(6) DEFAULT '0' COMMENT '是否周期性(0:否;1:是)',
  `cycle_type_id` bigint(20) DEFAULT NULL COMMENT '周期类型表id',
  `opening_time` time DEFAULT NULL COMMENT '服务开始时间',
  `closing_time` time DEFAULT NULL COMMENT '服务结束时间',
  `is_alteration` smallint(6) DEFAULT '0' COMMENT '是否支持退换(0:否；1：是)',
  `is_after_sales` smallint(6) DEFAULT '1' COMMENT '是否支持售后服务(0:否；1：是)',
  `is_square` smallint(6) DEFAULT '0' COMMENT '是否按平方计算(0:否；1:是)',
  `deadline` int(20) DEFAULT NULL COMMENT '售后服务期限',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品明细表';

-- ----------------------------
-- Records of product_detail
-- ----------------------------

-- ----------------------------
-- Table structure for product_discount
-- ----------------------------
DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_id` bigint(20) NOT NULL COMMENT '产品详情表id',
  `num` int(20) DEFAULT NULL COMMENT '产品数量',
  `excess_quantity` int(20) DEFAULT NULL COMMENT '超出数量',
  `discount` int(20) DEFAULT NULL COMMENT '折扣',
  `discount_type` smallint(20) NOT NULL COMMENT '类型(1:总价折扣;2:部分折扣)',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品折扣表';

-- ----------------------------
-- Records of product_discount
-- ----------------------------

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '服务/商品名称',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `type` smallint(6) NOT NULL COMMENT '类别(1:服务、2:商品)',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品类型表';

-- ----------------------------
-- Records of product_type
-- ----------------------------

-- ----------------------------
-- Table structure for product_unit
-- ----------------------------
DROP TABLE IF EXISTS `product_unit`;
CREATE TABLE `product_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '服务/商品单位',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品单位表';

-- ----------------------------
-- Records of product_unit
-- ----------------------------

-- ----------------------------
-- Table structure for property_name
-- ----------------------------
DROP TABLE IF EXISTS `property_name`;
CREATE TABLE `property_name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '属性名',
  `prod_det_id` bigint(20) NOT NULL COMMENT '产品明细表id',
  `type` smallint(6) DEFAULT NULL COMMENT '属性名类型(1:周期;2:次数;3：其他)',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='属性名称表';

-- ----------------------------
-- Records of property_name
-- ----------------------------

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prop_name_id` bigint(20) NOT NULL COMMENT '属性名称表id',
  `property_values` varchar(100) NOT NULL COMMENT '属性值',
  `cycle_type_id` bigint(20) DEFAULT NULL COMMENT '周期类型表id',
  `property_value_type_id` bigint(20) DEFAULT '0' COMMENT '产品特殊加价类型表id',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='属性值表';

-- ----------------------------
-- Records of property_value
-- ----------------------------

-- ----------------------------
-- Table structure for property_value_type
-- ----------------------------
DROP TABLE IF EXISTS `property_value_type`;
CREATE TABLE `property_value_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0' COMMENT '父id',
  `name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品特殊加价类型表';

-- ----------------------------
-- Records of property_value_type
-- ----------------------------

-- ----------------------------
-- Table structure for relation_company_user
-- ----------------------------
DROP TABLE IF EXISTS `relation_company_user`;
CREATE TABLE `relation_company_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司-用户关系表';

-- ----------------------------
-- Records of relation_company_user
-- ----------------------------

-- ----------------------------
-- Table structure for relation_service_company
-- ----------------------------
DROP TABLE IF EXISTS `relation_service_company`;
CREATE TABLE `relation_service_company` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '客服经理id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客服企业对应表';

-- ----------------------------
-- Records of relation_service_company
-- ----------------------------

-- ----------------------------
-- Table structure for sales_specifications
-- ----------------------------
DROP TABLE IF EXISTS `sales_specifications`;
CREATE TABLE `sales_specifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_id` bigint(20) DEFAULT NULL COMMENT '产品详情表id',
  `property_value_id_one` bigint(20) DEFAULT '0' COMMENT '属性值表id1',
  `property_value_id_two` bigint(20) DEFAULT '0' COMMENT '属性值表id2',
  `property_value_id_three` bigint(20) DEFAULT '0' COMMENT '属性值表id3',
  `property_value_id_four` bigint(20) DEFAULT '0' COMMENT '属性值表id4',
  `property_value_id_five` bigint(20) DEFAULT '0' COMMENT '属性值表id5',
  `property_value_id_six` bigint(20) DEFAULT '0' COMMENT '属性值表id6',
  `property_value_id_seven` bigint(20) DEFAULT '0' COMMENT '属性值表id7',
  `property_value_id_eight` bigint(20) DEFAULT '0' COMMENT '属性值表id8',
  `price` decimal(16,2) DEFAULT NULL COMMENT '价格',
  `num` int(20) DEFAULT NULL COMMENT '数量',
  `num_limit` smallint(6) DEFAULT '0' COMMENT '是否库存限制（1：是；0：否）',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='销售规格表';

-- ----------------------------
-- Records of sales_specifications
-- ----------------------------

-- ----------------------------
-- Table structure for shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE `shipping_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户表id',
  `consignee_name` varchar(30) NOT NULL COMMENT '收货人姓名',
  `consignee_address` varchar(255) NOT NULL COMMENT '收货人地址',
  `tel` int(20) NOT NULL COMMENT '联系电话',
  `is_default_address` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否为默认地址(0:否；1：是)',
  `delete` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收货地址表';

-- ----------------------------
-- Records of shipping_address
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户 ID',
  `username` varchar(30) DEFAULT NULL COMMENT '用户名',
  `uri` varchar(255) NOT NULL COMMENT '请求URI',
  `ip` varchar(100) NOT NULL COMMENT 'IP 地址',
  `params` longtext NOT NULL COMMENT '请求参数',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('64', '1', 'admin', '/sso/login', '0:0:0:0:0:0:0:1', 'login:{\"username\":[\"admin\"],\"password\":[\"666666\"],\"code\":[\"\"],\"codeFlag\":[\"false\"],\"_method\":[\"POST\"]}', '登录', '0', '2019-11-05 15:08:48');
INSERT INTO `sys_log` VALUES ('65', '1', 'admin', '/sso/login', '0:0:0:0:0:0:0:1', 'login:{\"username\":[\"admin\"],\"password\":[\"666666\"],\"code\":[\"\"],\"codeFlag\":[\"false\"],\"_method\":[\"POST\"]}', '登录', '0', '2019-11-05 15:09:54');
INSERT INTO `sys_log` VALUES ('66', '1', 'admin', '/sso/login', '0:0:0:0:0:0:0:1', 'login:{\"username\":[\"admin\"],\"password\":[\"666666\"],\"code\":[\"\"],\"codeFlag\":[\"false\"],\"_method\":[\"POST\"]}', '登录', '0', '2019-11-05 15:14:01');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `pid` bigint(20) NOT NULL COMMENT '父 ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '根组织 ID（组织结构的根）',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `code` varchar(100) DEFAULT NULL COMMENT '编号',
  `address` varchar(150) DEFAULT NULL COMMENT '位置',
  `initial` varchar(100) NOT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_组织表';

-- ----------------------------
-- Records of sys_org
-- ----------------------------

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(100) NOT NULL COMMENT '参数名称',
  `initial` varchar(100) NOT NULL COMMENT '首字母',
  `code` varchar(100) NOT NULL COMMENT '编码',
  `content` varchar(100) NOT NULL COMMENT '内容',
  `sys` smallint(6) NOT NULL COMMENT '系统参数 0、否 1、是',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `pid` bigint(20) NOT NULL COMMENT '父 ID',
  `name` varchar(60) NOT NULL COMMENT '名称',
  `initial` varchar(60) NOT NULL COMMENT '首字母',
  `type` smallint(6) NOT NULL COMMENT '类型 0、菜单 1、按钮',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `uri` varchar(100) DEFAULT NULL COMMENT 'URI',
  `path` varchar(100) DEFAULT NULL COMMENT '文件路径',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 -1、禁用 0、正常',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_资源表';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('3', '10', '系统管理', 'xtgl', '0', '', 'javascript:;', '', 'layui-icon-set', '0', '2', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:59');
INSERT INTO `sys_resource` VALUES ('4', '3', '用户管理', 'yhgl', '0', '', '#sys-user', 'sys/user.html', 'layui-icon-username', '0', '3', '0', 'admin', '2018-10-31 23:26:52', '2019-04-01 09:34:25');
INSERT INTO `sys_resource` VALUES ('5', '3', '角色管理', 'jsgl', '0', '', '#sys-role', 'sys/role.html', 'layui-icon-link', '0', '4', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:57');
INSERT INTO `sys_resource` VALUES ('6', '3', '权限管理', 'qxgl', '0', '', '#sys-resource', 'sys/resource.html', 'layui-icon-note', '0', '5', '0', 'admin', '2018-10-31 23:26:52', '2019-04-01 09:34:35');
INSERT INTO `sys_resource` VALUES ('7', '8', '访问日志', 'fwrz', '0', '', '#sys-log', 'sys/log.html', 'layui-icon-survey', '0', '3', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:52');
INSERT INTO `sys_resource` VALUES ('8', '10', '系统监控', 'xtjk', '0', '', 'javascript:;', '', 'layui-icon-chart-screen', '0', '3', '0', 'admin', '2018-10-31 23:26:52', '2019-04-02 08:50:39');
INSERT INTO `sys_resource` VALUES ('9', '8', '服务器监控', 'fwqjk', '0', '', '#sys-server-monitor', 'sys/server-monitor.html', 'layui-icon-chart-screen', '0', '0', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:52');
INSERT INTO `sys_resource` VALUES ('10', '0', '系统', 'xt', '0', '', '', '', 'layui-icon-flag', '0', '5', '0', 'admin', '2019-01-17 23:11:25', '2019-04-02 09:06:48');
INSERT INTO `sys_resource` VALUES ('11', '3', '组织管理', 'jggl', '0', '', '#sys-org', 'sys/org.html', 'layui-icon-flag', '0', '6', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:58');
INSERT INTO `sys_resource` VALUES ('12', '3', '参数设置', 'cssz', '0', '', '#sys-param', 'sys/param.html', 'layui-icon-util', '0', '2', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:57');
INSERT INTO `sys_resource` VALUES ('13', '3', '字典管理', 'zdgl', '0', '', 'javascript:;', '', 'layui-icon-table', '0', '1', '0', 'admin', '2018-10-31 23:26:52', '2019-03-29 16:45:55');
INSERT INTO `sys_resource` VALUES ('20', '0', 'API 文档', 'APIwd', '0', '', '/swagger-ui.html', '', 'layui-icon-flag', '0', '1', '0', 'admin', '2019-01-24 23:58:16', '2019-04-02 09:05:36');
INSERT INTO `sys_resource` VALUES ('21', '10', '公司管理', 'fjgl', '0', '', '#company-company', 'company/company.html', 'layui-icon-rate', '0', '4', '0', 'admin', '2019-10-28 15:53:27', '2019-10-28 15:53:27');
INSERT INTO `sys_resource` VALUES ('22', '21', '44', 'khgl', '0', '', '#cus-customer', 'company/company-info.html', '', '0', '0', '1', 'admin', '2019-10-29 13:50:50', '2019-10-29 13:50:50');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `index_page` varchar(255) DEFAULT NULL COMMENT '首页',
  `initial` varchar(30) DEFAULT '' COMMENT '首字母',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 -1、禁用 0、正常',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '删除 0、否 1、是',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'sys/server-monitor.html', 'gly', '0', '1', '0', '', 'admin', '2018-10-31 23:27:41', '2019-04-01 16:44:24');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色 ID',
  `resource_id` bigint(20) NOT NULL COMMENT '资源 ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_role_resource` (`role_id`) USING BTREE,
  KEY `FK_sys_role_resource_resource` (`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_角色资源关联表';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('78', '1', '10');
INSERT INTO `sys_role_resource` VALUES ('79', '1', '21');
INSERT INTO `sys_role_resource` VALUES ('80', '1', '23');
INSERT INTO `sys_role_resource` VALUES ('81', '1', '8');
INSERT INTO `sys_role_resource` VALUES ('82', '1', '7');
INSERT INTO `sys_role_resource` VALUES ('83', '1', '9');
INSERT INTO `sys_role_resource` VALUES ('84', '1', '3');
INSERT INTO `sys_role_resource` VALUES ('85', '1', '11');
INSERT INTO `sys_role_resource` VALUES ('86', '1', '6');
INSERT INTO `sys_role_resource` VALUES ('87', '1', '5');
INSERT INTO `sys_role_resource` VALUES ('88', '1', '4');
INSERT INTO `sys_role_resource` VALUES ('89', '1', '12');
INSERT INTO `sys_role_resource` VALUES ('90', '1', '13');
INSERT INTO `sys_role_resource` VALUES ('91', '1', '20');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `username` varchar(20) NOT NULL COMMENT '账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(8) NOT NULL COMMENT '随机盐',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实名称',
  `initial` varchar(100) DEFAULT NULL COMMENT '首字母',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `sex` char(1) NOT NULL COMMENT '性别',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `phone_verified` smallint(6) NOT NULL COMMENT '手机号是否验证 0、否 1、是',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `email_verified` smallint(6) NOT NULL COMMENT '邮箱是否验证 0、否 1、是',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 -1、冻结 0、正常',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `usernameUnique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'f80400f647491a7d21733b384dbdc6e5', '689348G0', '悟空', 'wk', '管理员', '', '男', '13712345690', '0', 'abc@abc.cn', '0', '0', '0', 'admin', '2018-09-16 23:21:55', '2019-04-09 14:55:02');

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户 ID',
  `org_id` bigint(20) NOT NULL COMMENT '组织 ID',
  `charge` int(2) DEFAULT '0' COMMENT '负责标志，0：不负责，1：负责',
  `position` varchar(50) DEFAULT '' COMMENT '职位',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_user_org` (`user_id`) USING BTREE,
  KEY `FK_sys_user_org_org` (`org_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_用户组织关联表';

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户 ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色 ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_user_role` (`user_id`) USING BTREE,
  KEY `FK_sys_user_role_role` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统_用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Function structure for queryOrgParentsId
-- ----------------------------
DROP FUNCTION IF EXISTS `queryOrgParentsId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryOrgParentsId`(areaId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(100);
DECLARE sTempChdId VARCHAR(100);

SET sTempChd = CAST(areaId AS CHAR);
SELECT `id` FROM sys_org WHERE id = sTempChd INTO sTempChdId;
SET sTemp = sTempChd;

SELECT `pid` FROM sys_org WHERE id = sTempChd INTO sTempChd;
SELECT `id` FROM sys_org WHERE id = sTempChd INTO sTempChdId;
WHILE sTempChd <> 0 DO
SET sTemp = CONCAT(sTempChdId,',',sTemp);
SELECT `pid` FROM sys_org WHERE id = sTempChd INTO sTempChd;
SELECT `id` FROM sys_org WHERE id = sTempChd INTO sTempChdId;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for queryOrgParentsIdNoSelf
-- ----------------------------
DROP FUNCTION IF EXISTS `queryOrgParentsIdNoSelf`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryOrgParentsIdNoSelf`(areaId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(100);
DECLARE sTempChdId VARCHAR(100);

SET sTempChd = CAST(areaId AS CHAR);
SELECT `id` FROM sys_org WHERE id = sTempChd INTO sTempChdId;
SET sTemp = '';

SELECT `pid` FROM sys_org WHERE id = sTempChd INTO sTempChd;
SELECT `id` FROM sys_org WHERE id = sTempChd INTO sTempChdId;
WHILE sTempChd <> 0 DO
IF sTemp='' then SET sTemp = sTempChdId;
ELSE SET sTemp = CONCAT(sTempChdId,',',sTemp);
END IF;
SELECT `pid` FROM sys_org WHERE id = sTempChd INTO sTempChd;
SELECT `id` FROM sys_org WHERE id = sTempChd INTO sTempChdId;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for queryOrgParentsName
-- ----------------------------
DROP FUNCTION IF EXISTS `queryOrgParentsName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryOrgParentsName`(areaId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(100);
DECLARE sTempChdName VARCHAR(100);

SET sTempChd = CAST(areaId AS CHAR);
SELECT `name` FROM sys_org WHERE id = sTempChd INTO sTempChdName;
SET sTemp = sTempChdName;

SELECT `pid` FROM sys_org WHERE id = sTempChd INTO sTempChd;
SELECT `name` FROM sys_org WHERE id = sTempChd INTO sTempChdName;
WHILE sTempChd <> 0 DO
SET sTemp = CONCAT(sTempChdName,'/',sTemp);
SELECT `pid` FROM sys_org WHERE id = sTempChd INTO sTempChd;
SELECT `name` FROM sys_org WHERE id = sTempChd INTO sTempChdName;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for queryResourceChildrenId
-- ----------------------------
DROP FUNCTION IF EXISTS `queryResourceChildrenId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryResourceChildrenId`(areaId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN 
  DECLARE sTemp VARCHAR (4000);
  DECLARE sTempChd VARCHAR (4000);

SET sTempChd = cast(areaId AS CHAR);
SET sTemp = sTempChd;

SELECT group_concat(id) INTO sTempChd FROM  sys_resource WHERE FIND_IN_SET(pid, sTempChd) > 0;
WHILE sTempChd IS NOT NULL DO 
SET sTemp = CONCAT(sTemp, ',', sTempChd);
SELECT group_concat(id) INTO sTempChd FROM  sys_resource WHERE FIND_IN_SET(pid, sTempChd) > 0;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;
