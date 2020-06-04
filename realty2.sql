/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : realty2

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 05/11/2019 11:32:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_detail_id` bigint(20) NOT NULL COMMENT '产品明细表id',
  `user_id` bigint(20) NOT NULL COMMENT '用户表id',
  `num` int(20) NOT NULL DEFAULT 1 COMMENT '数量',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_info
-- ----------------------------
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `area` float(20, 2) NULL DEFAULT NULL COMMENT '占用面积',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `NORMAL_NAME`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cycle_type
-- ----------------------------
DROP TABLE IF EXISTS `cycle_type`;
CREATE TABLE `cycle_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期名称',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '周期表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dict_holiday_date
-- ----------------------------
DROP TABLE IF EXISTS `dict_holiday_date`;
CREATE TABLE `dict_holiday_date`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `holiday_name_id` bigint(20) NULL DEFAULT NULL COMMENT '节假日名称表id',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '节假日具体时间',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节假日时间日期对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dict_holiday_name
-- ----------------------------
DROP TABLE IF EXISTS `dict_holiday_name`;
CREATE TABLE `dict_holiday_name`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节假日名称',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节假日名称表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mini_user
-- ----------------------------
DROP TABLE IF EXISTS `mini_user`;
CREATE TABLE `mini_user`  (
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户唯一标识（小程序）',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同一个微信开放平台帐号，用户的unionid是唯一的',
  `session_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会话密钥',
  `salt` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '随机盐',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加密后的userToken',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `gender` int(255) NULL DEFAULT 0 COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在国家',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`openid`) USING BTREE,
  UNIQUE INDEX `openid_unique`(`openid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ship_address_id` bigint(20) NULL DEFAULT NULL COMMENT '收货地址表id',
  `company_address_id` bigint(20) NULL DEFAULT NULL COMMENT '公司地址表id',
  `prod_detail_id` bigint(20) NOT NULL COMMENT '产品明细表id',
  `order_number` bigint(20) NOT NULL COMMENT '订单编号',
  `appointment_server_time` datetime(0) NULL DEFAULT NULL COMMENT '预约服务时间',
  `num` int(20) NOT NULL COMMENT '下单件数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家备注',
  `totl_amount` decimal(16, 2) NOT NULL COMMENT '订单总额',
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券表id',
  `reatily_amount` decimal(16, 2) NOT NULL COMMENT '实际付款',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `deal_time` datetime(0) NOT NULL COMMENT '成交时间',
  `server_start_time` datetime(0) NULL DEFAULT NULL COMMENT '服务开始时间',
  `server_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '服务结束时间',
  `allotted_time` datetime(0) NOT NULL COMMENT '售后期限范围',
  `surplus_times` int(20) NOT NULL COMMENT '剩余服务次数',
  `is_pyment` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否付款(0:否；1：是)',
  `is_dispitch` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否调度(0:否；1：是)',
  `is_evaluate` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否评价(0:否；1：是)',
  `order_status` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单状态(0:未完成;1:已完成；-1:已取消;2：售后)',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_after_sales
-- ----------------------------
DROP TABLE IF EXISTS `order_after_sales`;
CREATE TABLE `order_after_sales`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单表id',
  `type` smallint(6) NOT NULL DEFAULT 1 COMMENT '售后类型(1:退款；2：退货退款；3：其他)',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请理由',
  `operator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `finish_time` datetime(0) NOT NULL COMMENT '完成时间',
  `after_sales_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '售后状态(0:处理中；1:已处理；-1:未处理)',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单售后表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_disp
-- ----------------------------
DROP TABLE IF EXISTS `order_disp`;
CREATE TABLE `order_disp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispitch_id` bigint(20) NOT NULL COMMENT '调度人员id',
  `server_id` bigint(20) NOT NULL COMMENT '服务员id',
  `order_id` bigint(20) NOT NULL COMMENT '订单表id',
  `how_times` int(20) NOT NULL COMMENT '周期内第几次服务',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `order_evaluate`;
CREATE TABLE `order_evaluate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_disp_id` bigint(20) NOT NULL COMMENT '订单调度表id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for price_type
-- ----------------------------
DROP TABLE IF EXISTS `price_type`;
CREATE TABLE `price_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '产品详情表id',
  `commonly_price` decimal(16, 2) NOT NULL COMMENT '默认价格',
  `weekend_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '周末价格',
  `holiday_price` decimal(16, 2) NULL DEFAULT NULL COMMENT '节假日价格',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '价格类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE `product_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_type_id` bigint(20) NOT NULL COMMENT '类型表id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `price` decimal(16, 2) NULL DEFAULT NULL COMMENT '价格',
  `prod_unit_id` bigint(20) NOT NULL COMMENT '单位表id',
  `inventory` int(20) NULL DEFAULT -1 COMMENT '库存数量',
  `sales_num` int(20) NULL DEFAULT 0 COMMENT '销量',
  `default_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品默认图',
  `product_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品大图',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品描述文字',
  `details_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品详情图',
  `is_cycle` smallint(6) NULL DEFAULT 0 COMMENT '是否周期性(0:否;1:是)',
  `cycle_type_id` bigint(20) NULL DEFAULT NULL COMMENT '周期类型表id',
  `opening_time` time(0) NULL DEFAULT NULL COMMENT '服务开始时间',
  `closing_time` time(0) NULL DEFAULT NULL COMMENT '服务结束时间',
  `is_alteration` smallint(6) NULL DEFAULT 0 COMMENT '是否支持退换(0:否；1：是)',
  `is_after_sales` smallint(6) NULL DEFAULT 1 COMMENT '是否支持售后服务(0:否；1：是)',
  `is_square` smallint(6) NULL DEFAULT 0 COMMENT '是否按平方计算(0:否；1:是)',
  `deadline` int(20) NULL DEFAULT NULL COMMENT '售后服务期限',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_discount
-- ----------------------------
DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_id` bigint(20) NOT NULL COMMENT '产品详情表id',
  `num` int(20) NULL DEFAULT NULL COMMENT '产品数量',
  `excess_quantity` int(20) NULL DEFAULT NULL COMMENT '超出数量',
  `discount` int(20) NULL DEFAULT NULL COMMENT '折扣',
  `discount_type` smallint(20) NOT NULL COMMENT '类型(1:总价折扣;2:部分折扣)',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品折扣表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务/商品名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `type` smallint(6) NOT NULL COMMENT '类别(1:服务、2:商品)',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_unit
-- ----------------------------
DROP TABLE IF EXISTS `product_unit`;
CREATE TABLE `product_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务/商品单位',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品单位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for property_name
-- ----------------------------
DROP TABLE IF EXISTS `property_name`;
CREATE TABLE `property_name`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `prod_det_id` bigint(20) NOT NULL COMMENT '产品明细表id',
  `type` smallint(6) NULL DEFAULT NULL COMMENT '属性名类型(1:周期;2:次数;3：其他)',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性名称表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prop_name_id` bigint(20) NOT NULL COMMENT '属性名称表id',
  `property_values` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `cycle_type_id` bigint(20) NULL DEFAULT NULL COMMENT '周期类型表id',
  `property_value_type_id` bigint(20) NULL DEFAULT 0 COMMENT '产品特殊加价类型表id',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for property_value_type
-- ----------------------------
DROP TABLE IF EXISTS `property_value_type`;
CREATE TABLE `property_value_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品特殊加价类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for relation_company_user
-- ----------------------------
DROP TABLE IF EXISTS `relation_company_user`;
CREATE TABLE `relation_company_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '公司Id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司-用户关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for relation_service_company
-- ----------------------------
DROP TABLE IF EXISTS `relation_service_company`;
CREATE TABLE `relation_service_company`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '客服经理id',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服企业对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sales_specifications
-- ----------------------------
DROP TABLE IF EXISTS `sales_specifications`;
CREATE TABLE `sales_specifications`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '产品详情表id',
  `property_value_id_one` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id1',
  `property_value_id_two` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id2',
  `property_value_id_three` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id3',
  `property_value_id_four` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id4',
  `property_value_id_five` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id5',
  `property_value_id_six` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id6',
  `property_value_id_seven` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id7',
  `property_value_id_eight` bigint(20) NULL DEFAULT 0 COMMENT '属性值表id8',
  `price` decimal(16, 2) NULL DEFAULT NULL COMMENT '价格',
  `num` int(20) NULL DEFAULT NULL COMMENT '数量',
  `num_limit` smallint(6) NULL DEFAULT 0 COMMENT '是否库存限制（1：是；0：否）',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售规格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE `shipping_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户表id',
  `consignee_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人地址',
  `tel` int(20) NOT NULL COMMENT '联系电话',
  `is_default_address` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否为默认地址(0:否；1：是)',
  `delete` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 (0:否 1:是)',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态(-1:禁用；0:正常)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户 ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求URI',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP 地址',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求参数',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `pid` bigint(20) NOT NULL COMMENT '父 ID',
  `rid` bigint(20) NULL DEFAULT NULL COMMENT '根组织 ID（组织结构的根）',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `initial` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首字母',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_组织表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名称',
  `initial` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首字母',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `sys` smallint(6) NOT NULL COMMENT '系统参数 0、否 1、是',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `pid` bigint(20) NOT NULL COMMENT '父 ID',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `initial` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首字母',
  `type` smallint(6) NOT NULL COMMENT '类型 0、菜单 1、按钮',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `uri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URI',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态 -1、禁用 0、正常',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `index_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页',
  `initial` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '首字母',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态 -1、禁用 0、正常',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '删除 0、否 1、是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色 ID',
  `resource_id` bigint(20) NOT NULL COMMENT '资源 ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_role_resource`(`role_id`) USING BTREE,
  INDEX `FK_sys_role_resource_resource`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 474 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_角色资源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '随机盐',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实名称',
  `initial` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `phone_verified` smallint(6) NOT NULL COMMENT '手机号是否验证 0、否 1、是',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` smallint(6) NOT NULL COMMENT '邮箱是否验证 0、否 1、是',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态 -1、冻结 0、正常',
  `deleted` smallint(6) NOT NULL COMMENT '删除 0、否 1、是',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `usernameUnique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户 ID',
  `org_id` bigint(20) NOT NULL COMMENT '组织 ID',
  `charge` int(2) NULL DEFAULT 0 COMMENT '负责标志，0：不负责，1：负责',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '职位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_org`(`user_id`) USING BTREE,
  INDEX `FK_sys_user_org_org`(`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_用户组织关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户 ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色 ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_role`(`user_id`) USING BTREE,
  INDEX `FK_sys_user_role_role`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统_用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Function structure for queryOrgParentsId
-- ----------------------------
DROP FUNCTION IF EXISTS `queryOrgParentsId`;
delimiter ;;
CREATE FUNCTION `queryOrgParentsId`(areaId INT)
 RETURNS varchar(4000) CHARSET utf8
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
delimiter ;

-- ----------------------------
-- Function structure for queryOrgParentsIdNoSelf
-- ----------------------------
DROP FUNCTION IF EXISTS `queryOrgParentsIdNoSelf`;
delimiter ;;
CREATE FUNCTION `queryOrgParentsIdNoSelf`(areaId INT)
 RETURNS varchar(4000) CHARSET utf8
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
delimiter ;

-- ----------------------------
-- Function structure for queryOrgParentsName
-- ----------------------------
DROP FUNCTION IF EXISTS `queryOrgParentsName`;
delimiter ;;
CREATE FUNCTION `queryOrgParentsName`(areaId INT)
 RETURNS varchar(4000) CHARSET utf8
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
delimiter ;

-- ----------------------------
-- Function structure for queryResourceChildrenId
-- ----------------------------
DROP FUNCTION IF EXISTS `queryResourceChildrenId`;
delimiter ;;
CREATE FUNCTION `queryResourceChildrenId`(areaId INT)
 RETURNS varchar(4000) CHARSET utf8
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
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
