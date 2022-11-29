/*
 Navicat Premium Data Transfer

 Source Server         : ai-cloud
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : cloud-mysql:3306
 Source Schema         : ai-cloud

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/11/2022 10:58:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (21, 'user_vip', '会员', NULL, NULL, 'UserVip', 'crud', 'com.cloud.system', 'system', 'vip', '会员', 'ai-cloud', '0', '/', NULL, 'admin', '2022-11-11 10:36:53', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (22, 'user_vip_equity', '会员权益', NULL, NULL, 'UserVipEquity', 'crud', 'com.cloud.system', 'system', 'equity', '会员权益', 'ai-cloud', '0', '/', NULL, 'admin', '2022-11-11 10:36:55', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (23, 'user_set', '用户设置', NULL, NULL, 'UserSet', 'crud', 'com.cloud.system', 'system', 'set', '用户设置', 'ai-cloud', '0', '/', NULL, 'admin', '2022-11-11 11:04:45', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (24, 'user_auth', '用户第三方授权表', NULL, NULL, 'UserAuth', 'crud', 'com.cloud.system', 'system', 'auth', '用户第三方授权', 'ai-cloud', '0', '/', NULL, 'admin', '2022-11-11 16:25:47', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 486 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (428, '21', 'id', 'id', 'char(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (429, '21', 'name', '会员名称', 'varchar(20)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (430, '21', 'introduce', '会员介绍', 'varchar(200)', 'String', 'introduce', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (431, '21', 'coverimg', '会员封面图', 'varchar(200)', 'String', 'coverimg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (432, '21', 'icon', '会员图标', 'varchar(200)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (433, '21', 'month_price', '会员月费价格', 'decimal(10,2)', 'BigDecimal', 'monthPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (434, '21', 'year_price', '会员年费价格', 'decimal(10,2)', 'BigDecimal', 'yearPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (435, '21', 'weight', '权重值', 'int(11)', 'Long', 'weight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (436, '21', 'status_flag', '状态：1：启用，0：停用', 'int(11)', 'Long', 'statusFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (437, '21', 'delete_flag', '1:删除，0：未删除', 'int(11)', 'Long', 'deleteFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (438, '21', 'create_by', '创建人', 'char(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (439, '21', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-11-11 10:36:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (440, '21', 'update_by', '修改人', 'char(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (441, '21', 'update_time', '修改时间', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (442, '22', 'id', 'id', 'char(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (443, '22', 'vip_id', '会员主表id', 'char(32)', 'String', 'vipId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (444, '22', 'name', '会员权益名称', 'varchar(20)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (445, '22', 'introduce', '会员权益介绍', 'varchar(200)', 'String', 'introduce', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (446, '22', 'icon', '会员权益图标', 'varchar(200)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (447, '22', 'weight', '会员权益权重值', 'int(11)', 'Long', 'weight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (448, '22', 'link', '会员权益跳转链接', 'varchar(100)', 'String', 'link', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (449, '22', 'status_flag', '状态：1：启用，0：停用', 'int(11)', 'Long', 'statusFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-11 10:36:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (450, '22', 'delete_flag', '1:删除，0：未删除', 'int(11)', 'Long', 'deleteFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-11 10:36:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (451, '22', 'create_by', '创建人', 'char(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-11-11 10:36:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (452, '22', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-11-11 10:36:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (453, '22', 'update_by', '修改人', 'char(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-11-11 10:36:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (454, '22', 'update_time', '修改时间', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-11-11 10:36:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (455, '23', 'id', NULL, 'char(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-11 11:04:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (456, '23', 'user_id', '用户id', 'char(32)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-11 11:04:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (457, '23', 'headimg', '用户头像', 'varchar(200)', 'String', 'headimg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-11 11:04:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (458, '23', 'nick_name', '用户昵称', 'varchar(20)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (459, '23', 'uuid', '设备唯一标识', 'char(32)', 'String', 'uuid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (460, '23', 'message_shake', '消息推送是否开启震动；1：开启，0：未开启', 'int(11)', 'Long', 'messageShake', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (461, '23', 'message_alarm', '消息推送是否开启铃声；1：开启，0：未开启', 'int(11)', 'Long', 'messageAlarm', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (462, '23', 'like_remind', '点赞提醒是否开启；1：开启，0：未开启', 'int(11)', 'Long', 'likeRemind', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (463, '23', 'attention_remind', '关注提醒是否开启；1：开启，0：未开启', 'int(11)', 'Long', 'attentionRemind', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (464, '23', 'notification', '系统通知提醒是否开启；1：开启，0：未开启', 'int(11)', 'Long', 'notification', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (465, '23', 'comment_remind', '评论提醒是否开启；1：开启，0：未开启', 'int(11)', 'Long', 'commentRemind', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (466, '23', 'status_flag', '状态：1：启用，0：停用', 'int(11)', 'Long', 'statusFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (467, '23', 'delete_flag', '1:删除，0：未删除', 'int(11)', 'Long', 'deleteFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (468, '23', 'create_by', '创建人', 'char(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-11-11 11:04:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (469, '23', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-11-11 11:04:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (470, '23', 'update_by', '修改人', 'char(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-11-11 11:04:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (471, '23', 'update_time', '修改时间', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-11-11 11:04:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (472, '24', 'id', '授权ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (473, '24', 'user_id', '系统用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (474, '24', 'uuid', '第三方平台用户唯一ID', 'varchar(500)', 'String', 'uuid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (475, '24', 'login_name', '登录账号', 'varchar(30)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (476, '24', 'user_name', '用户昵称', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (477, '24', 'avatar', '头像地址', 'varchar(500)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (478, '24', 'email', '用户邮箱', 'varchar(255)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-11 16:25:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (479, '24', 'source', '用户来源', 'varchar(255)', 'String', 'source', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-11 16:25:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (480, '24', 'status_flag', '状态：0：启用，2：停用', 'int(11)', 'Long', 'statusFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-11 16:25:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (481, '24', 'delete_flag', '删除：0：未删除，2：已删除', 'int(11)', 'Long', 'deleteFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-11-11 16:25:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (482, '24', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-11-11 16:25:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (483, '24', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-11-11 16:25:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (484, '24', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-11-11 16:25:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (485, '24', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-11-11 16:25:48', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.cloud.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E636C6F75642E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E636C6F75642E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000182E47944E878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.cloud.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E636C6F75642E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E636C6F75642E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000182E47944E878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.cloud.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E636C6F75642E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E636C6F75642E636F6D6D6F6E2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000182E47944E878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('Scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('Scheduler', 'DESKTOP-65BIL2N1669624399547', 1669633503072, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1669624410000, -1, 5, 'PAUSED', 'CRON', 1669624402000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1669624410000, -1, 5, 'PAUSED', 'CRON', 1669624403000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1669624420000, -1, 5, 'PAUSED', 'CRON', 1669624404000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-08-28 20:42:09', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-08-28 20:42:09', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-08-28 20:42:09', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-08-28 20:42:09', 'admin', '2022-09-30 17:47:07', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'ai-cloud科技', 0, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'aicloud', '15888888888', 'aicloud888@163.com', '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-08-28 20:42:09', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-08-28 20:42:09', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-08-28 20:42:09', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-08-28 20:42:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 16:09:40');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 16:09:54');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 16:10:11');
INSERT INTO `sys_logininfor` VALUES (4, 'ai168', '127.0.0.1', '1', '密码输入错误1次', '2022-11-05 16:10:32');
INSERT INTO `sys_logininfor` VALUES (5, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 16:10:41');
INSERT INTO `sys_logininfor` VALUES (6, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-05 16:10:41');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 16:14:59');
INSERT INTO `sys_logininfor` VALUES (8, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 16:27:12');
INSERT INTO `sys_logininfor` VALUES (9, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 16:29:58');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 16:30:03');
INSERT INTO `sys_logininfor` VALUES (11, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 17:23:17');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-05 17:24:02');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 17:24:07');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 17:29:19');
INSERT INTO `sys_logininfor` VALUES (15, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 17:30:35');
INSERT INTO `sys_logininfor` VALUES (16, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-05 18:01:50');
INSERT INTO `sys_logininfor` VALUES (17, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 18:01:54');
INSERT INTO `sys_logininfor` VALUES (18, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 23:48:12');
INSERT INTO `sys_logininfor` VALUES (19, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-05 23:48:16');
INSERT INTO `sys_logininfor` VALUES (20, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-05 23:59:41');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 14:23:03');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:46:17');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 15:46:24');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:46:24');
INSERT INTO `sys_logininfor` VALUES (25, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-07 15:46:36');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 15:46:51');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:46:51');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 15:48:29');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:48:30');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 15:49:30');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:49:30');
INSERT INTO `sys_logininfor` VALUES (32, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-07 15:50:38');
INSERT INTO `sys_logininfor` VALUES (33, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-07 15:50:42');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 15:51:44');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:51:44');
INSERT INTO `sys_logininfor` VALUES (36, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-07 15:51:54');
INSERT INTO `sys_logininfor` VALUES (37, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-07 15:51:58');
INSERT INTO `sys_logininfor` VALUES (38, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-07 15:53:12');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 15:56:37');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-07 15:56:37');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 16:01:22');
INSERT INTO `sys_logininfor` VALUES (42, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-07 16:01:49');
INSERT INTO `sys_logininfor` VALUES (43, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 18:41:17');
INSERT INTO `sys_logininfor` VALUES (44, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-09 18:53:21');
INSERT INTO `sys_logininfor` VALUES (45, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 18:53:25');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:03:26');
INSERT INTO `sys_logininfor` VALUES (47, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 19:35:27');
INSERT INTO `sys_logininfor` VALUES (48, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-09 19:41:04');
INSERT INTO `sys_logininfor` VALUES (49, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 19:41:12');
INSERT INTO `sys_logininfor` VALUES (50, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 19:42:50');
INSERT INTO `sys_logininfor` VALUES (51, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-09 19:44:38');
INSERT INTO `sys_logininfor` VALUES (52, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 19:44:44');
INSERT INTO `sys_logininfor` VALUES (53, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-09 20:35:37');
INSERT INTO `sys_logininfor` VALUES (54, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 20:35:42');
INSERT INTO `sys_logininfor` VALUES (55, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-09 23:01:05');
INSERT INTO `sys_logininfor` VALUES (56, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-10 00:28:17');
INSERT INTO `sys_logininfor` VALUES (57, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-10 00:28:22');
INSERT INTO `sys_logininfor` VALUES (58, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-10 00:28:29');
INSERT INTO `sys_logininfor` VALUES (59, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-10 00:30:06');
INSERT INTO `sys_logininfor` VALUES (60, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-10 00:30:27');
INSERT INTO `sys_logininfor` VALUES (61, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-10 00:30:32');
INSERT INTO `sys_logininfor` VALUES (62, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-10 00:30:35');
INSERT INTO `sys_logininfor` VALUES (63, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-10 00:30:39');
INSERT INTO `sys_logininfor` VALUES (64, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-10 00:30:42');
INSERT INTO `sys_logininfor` VALUES (65, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-10 00:30:46');
INSERT INTO `sys_logininfor` VALUES (66, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-10 00:32:43');
INSERT INTO `sys_logininfor` VALUES (67, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-10 00:32:47');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-10 13:49:21');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 10:16:07');
INSERT INTO `sys_logininfor` VALUES (70, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-11 16:02:25');
INSERT INTO `sys_logininfor` VALUES (71, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-11 16:24:27');
INSERT INTO `sys_logininfor` VALUES (72, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-11 16:24:32');
INSERT INTO `sys_logininfor` VALUES (73, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-11 16:25:05');
INSERT INTO `sys_logininfor` VALUES (74, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-11 16:25:09');
INSERT INTO `sys_logininfor` VALUES (75, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-11 16:25:12');
INSERT INTO `sys_logininfor` VALUES (76, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 11:14:37');
INSERT INTO `sys_logininfor` VALUES (77, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 11:24:18');
INSERT INTO `sys_logininfor` VALUES (78, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 11:24:23');
INSERT INTO `sys_logininfor` VALUES (79, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 16:28:34');
INSERT INTO `sys_logininfor` VALUES (80, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 16:29:36');
INSERT INTO `sys_logininfor` VALUES (81, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 16:29:46');
INSERT INTO `sys_logininfor` VALUES (82, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 17:42:06');
INSERT INTO `sys_logininfor` VALUES (83, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 17:42:09');
INSERT INTO `sys_logininfor` VALUES (84, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 18:01:53');
INSERT INTO `sys_logininfor` VALUES (85, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 18:42:49');
INSERT INTO `sys_logininfor` VALUES (86, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 18:42:54');
INSERT INTO `sys_logininfor` VALUES (87, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 18:43:00');
INSERT INTO `sys_logininfor` VALUES (88, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 18:43:04');
INSERT INTO `sys_logininfor` VALUES (89, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 18:43:07');
INSERT INTO `sys_logininfor` VALUES (90, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 18:43:11');
INSERT INTO `sys_logininfor` VALUES (91, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 18:43:14');
INSERT INTO `sys_logininfor` VALUES (92, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 18:43:18');
INSERT INTO `sys_logininfor` VALUES (93, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 19:11:06');
INSERT INTO `sys_logininfor` VALUES (94, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 19:11:17');
INSERT INTO `sys_logininfor` VALUES (95, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 19:18:51');
INSERT INTO `sys_logininfor` VALUES (96, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 19:24:10');
INSERT INTO `sys_logininfor` VALUES (97, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 19:24:55');
INSERT INTO `sys_logininfor` VALUES (98, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 19:24:59');
INSERT INTO `sys_logininfor` VALUES (99, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 19:35:51');
INSERT INTO `sys_logininfor` VALUES (100, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 19:35:57');
INSERT INTO `sys_logininfor` VALUES (101, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 19:57:17');
INSERT INTO `sys_logininfor` VALUES (102, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 19:57:22');
INSERT INTO `sys_logininfor` VALUES (103, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 19:57:44');
INSERT INTO `sys_logininfor` VALUES (104, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 19:57:51');
INSERT INTO `sys_logininfor` VALUES (105, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 20:02:01');
INSERT INTO `sys_logininfor` VALUES (106, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 20:02:06');
INSERT INTO `sys_logininfor` VALUES (107, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 20:21:07');
INSERT INTO `sys_logininfor` VALUES (108, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 20:21:11');
INSERT INTO `sys_logininfor` VALUES (109, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 20:27:09');
INSERT INTO `sys_logininfor` VALUES (110, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 20:27:14');
INSERT INTO `sys_logininfor` VALUES (111, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 20:27:56');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 20:28:09');
INSERT INTO `sys_logininfor` VALUES (113, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-15 21:03:06');
INSERT INTO `sys_logininfor` VALUES (114, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-15 21:05:44');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 21:08:06');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '192.168.2.2', '0', '登录成功', '2022-11-16 00:02:26');
INSERT INTO `sys_logininfor` VALUES (117, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 11:09:06');
INSERT INTO `sys_logininfor` VALUES (118, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-16 11:13:49');
INSERT INTO `sys_logininfor` VALUES (119, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 11:17:25');
INSERT INTO `sys_logininfor` VALUES (120, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-16 11:18:14');
INSERT INTO `sys_logininfor` VALUES (121, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 11:18:20');
INSERT INTO `sys_logininfor` VALUES (122, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:04:36');
INSERT INTO `sys_logininfor` VALUES (123, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:08:38');
INSERT INTO `sys_logininfor` VALUES (124, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-16 14:09:10');
INSERT INTO `sys_logininfor` VALUES (125, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:09:14');
INSERT INTO `sys_logininfor` VALUES (126, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:12:43');
INSERT INTO `sys_logininfor` VALUES (127, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-16 14:16:39');
INSERT INTO `sys_logininfor` VALUES (128, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:16:43');
INSERT INTO `sys_logininfor` VALUES (129, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-16 14:22:23');
INSERT INTO `sys_logininfor` VALUES (130, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:22:40');
INSERT INTO `sys_logininfor` VALUES (131, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:26:21');
INSERT INTO `sys_logininfor` VALUES (132, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:27:37');
INSERT INTO `sys_logininfor` VALUES (133, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-16 14:51:11');
INSERT INTO `sys_logininfor` VALUES (134, 'ai168', '10.10.10.19', '0', '登录成功', '2022-11-16 14:52:08');
INSERT INTO `sys_logininfor` VALUES (135, 'ai168', '10.10.10.19', '0', '退出成功', '2022-11-16 14:52:42');
INSERT INTO `sys_logininfor` VALUES (136, 'ai168', '10.10.10.19', '0', '登录成功', '2022-11-16 14:52:54');
INSERT INTO `sys_logininfor` VALUES (137, 'ai168', '10.10.10.120', '0', '登录成功', '2022-11-16 14:54:50');
INSERT INTO `sys_logininfor` VALUES (138, 'ai168', '10.10.10.19', '0', '退出成功', '2022-11-16 14:56:40');
INSERT INTO `sys_logininfor` VALUES (139, 'ai168', '10.10.10.19', '0', '登录成功', '2022-11-16 14:56:49');
INSERT INTO `sys_logininfor` VALUES (140, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 15:18:59');
INSERT INTO `sys_logininfor` VALUES (141, 'ai168', '10.10.10.19', '0', '退出成功', '2022-11-16 15:19:31');
INSERT INTO `sys_logininfor` VALUES (142, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 15:29:20');
INSERT INTO `sys_logininfor` VALUES (143, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 16:39:08');
INSERT INTO `sys_logininfor` VALUES (144, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 16:39:12');
INSERT INTO `sys_logininfor` VALUES (145, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 16:47:15');
INSERT INTO `sys_logininfor` VALUES (146, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 16:47:19');
INSERT INTO `sys_logininfor` VALUES (147, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 16:52:54');
INSERT INTO `sys_logininfor` VALUES (148, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 16:52:59');
INSERT INTO `sys_logininfor` VALUES (149, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 16:53:01');
INSERT INTO `sys_logininfor` VALUES (150, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 16:53:05');
INSERT INTO `sys_logininfor` VALUES (151, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 16:53:10');
INSERT INTO `sys_logininfor` VALUES (152, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 16:53:14');
INSERT INTO `sys_logininfor` VALUES (153, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 16:53:16');
INSERT INTO `sys_logininfor` VALUES (154, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 16:53:21');
INSERT INTO `sys_logininfor` VALUES (155, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 17:10:32');
INSERT INTO `sys_logininfor` VALUES (156, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 18:57:44');
INSERT INTO `sys_logininfor` VALUES (157, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 18:57:49');
INSERT INTO `sys_logininfor` VALUES (158, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-16 19:02:48');
INSERT INTO `sys_logininfor` VALUES (159, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-16 19:02:54');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-18 14:51:47');
INSERT INTO `sys_logininfor` VALUES (161, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 15:56:52');
INSERT INTO `sys_logininfor` VALUES (162, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-18 15:57:03');
INSERT INTO `sys_logininfor` VALUES (163, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 15:57:07');
INSERT INTO `sys_logininfor` VALUES (164, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:40:59');
INSERT INTO `sys_logininfor` VALUES (165, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:43:04');
INSERT INTO `sys_logininfor` VALUES (166, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-18 17:44:42');
INSERT INTO `sys_logininfor` VALUES (167, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:45:15');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-18 17:47:09');
INSERT INTO `sys_logininfor` VALUES (169, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:48:10');
INSERT INTO `sys_logininfor` VALUES (170, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-18 17:48:31');
INSERT INTO `sys_logininfor` VALUES (171, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-18 17:48:44');
INSERT INTO `sys_logininfor` VALUES (172, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:48:49');
INSERT INTO `sys_logininfor` VALUES (173, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-18 17:49:14');
INSERT INTO `sys_logininfor` VALUES (174, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:49:19');
INSERT INTO `sys_logininfor` VALUES (175, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-18 17:49:39');
INSERT INTO `sys_logininfor` VALUES (176, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-18 17:59:34');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-19 16:49:26');
INSERT INTO `sys_logininfor` VALUES (178, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-19 16:51:02');
INSERT INTO `sys_logininfor` VALUES (179, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-19 16:52:34');
INSERT INTO `sys_logininfor` VALUES (180, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-19 16:52:37');
INSERT INTO `sys_logininfor` VALUES (181, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-19 19:10:57');
INSERT INTO `sys_logininfor` VALUES (182, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-19 19:11:07');
INSERT INTO `sys_logininfor` VALUES (183, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-19 19:11:11');
INSERT INTO `sys_logininfor` VALUES (184, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-21 09:33:16');
INSERT INTO `sys_logininfor` VALUES (185, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-21 09:33:36');
INSERT INTO `sys_logininfor` VALUES (186, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-21 09:34:45');
INSERT INTO `sys_logininfor` VALUES (187, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-21 09:42:41');
INSERT INTO `sys_logininfor` VALUES (188, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-21 09:42:57');
INSERT INTO `sys_logininfor` VALUES (189, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-21 10:07:47');
INSERT INTO `sys_logininfor` VALUES (190, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-21 10:07:49');
INSERT INTO `sys_logininfor` VALUES (191, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-21 10:07:52');
INSERT INTO `sys_logininfor` VALUES (192, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-21 10:07:56');
INSERT INTO `sys_logininfor` VALUES (193, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-21 10:08:28');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 15:14:33');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-21 15:19:09');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 15:19:16');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 16:51:28');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-21 16:54:27');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 16:55:40');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-21 17:12:36');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 17:12:49');
INSERT INTO `sys_logininfor` VALUES (202, 'ai168', '10.10.10.120', '0', '登录成功', '2022-11-21 17:31:09');
INSERT INTO `sys_logininfor` VALUES (203, 'ai168', '10.10.10.120', '0', '退出成功', '2022-11-21 17:37:13');
INSERT INTO `sys_logininfor` VALUES (204, 'ai168', '10.10.10.120', '0', '登录成功', '2022-11-21 17:37:17');
INSERT INTO `sys_logininfor` VALUES (205, 'ai168', '10.10.10.120', '0', '登录成功', '2022-11-21 17:38:01');
INSERT INTO `sys_logininfor` VALUES (206, 'ai168', '10.10.10.120', '0', '登录成功', '2022-11-21 17:38:40');
INSERT INTO `sys_logininfor` VALUES (207, 'ai168', '10.10.10.120', '0', '登录成功', '2022-11-21 17:41:45');
INSERT INTO `sys_logininfor` VALUES (208, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-21 19:17:11');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-21 19:18:13');
INSERT INTO `sys_logininfor` VALUES (210, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 10:30:26');
INSERT INTO `sys_logininfor` VALUES (211, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 10:31:08');
INSERT INTO `sys_logininfor` VALUES (212, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 10:31:12');
INSERT INTO `sys_logininfor` VALUES (213, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 10:39:06');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 10:42:13');
INSERT INTO `sys_logininfor` VALUES (215, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 15:49:17');
INSERT INTO `sys_logininfor` VALUES (216, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 15:56:31');
INSERT INTO `sys_logininfor` VALUES (217, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 15:59:28');
INSERT INTO `sys_logininfor` VALUES (218, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 20:31:06');
INSERT INTO `sys_logininfor` VALUES (219, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 20:31:13');
INSERT INTO `sys_logininfor` VALUES (220, 'ai168', '10.10.10.20', '0', '登录成功', '2022-11-22 20:54:02');
INSERT INTO `sys_logininfor` VALUES (221, 'ai168', '10.10.10.20', '0', '退出成功', '2022-11-22 20:54:05');
INSERT INTO `sys_logininfor` VALUES (222, 'ai168', '10.10.10.20', '0', '登录成功', '2022-11-22 20:54:09');
INSERT INTO `sys_logininfor` VALUES (223, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 20:56:33');
INSERT INTO `sys_logininfor` VALUES (224, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 20:56:40');
INSERT INTO `sys_logininfor` VALUES (225, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 20:56:46');
INSERT INTO `sys_logininfor` VALUES (226, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 20:56:50');
INSERT INTO `sys_logininfor` VALUES (227, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 20:57:04');
INSERT INTO `sys_logininfor` VALUES (228, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 20:57:07');
INSERT INTO `sys_logininfor` VALUES (229, 'ai168', '10.10.10.115', '0', '登录成功', '2022-11-22 20:57:11');
INSERT INTO `sys_logininfor` VALUES (230, 'ai168', '10.10.10.115', '0', '退出成功', '2022-11-22 20:57:15');
INSERT INTO `sys_logininfor` VALUES (231, '', '10.10.10.115', '0', '注册成功', '2022-11-22 21:47:38');
INSERT INTO `sys_logininfor` VALUES (232, '', '10.10.10.115', '0', '注册成功', '2022-11-22 21:53:25');
INSERT INTO `sys_logininfor` VALUES (233, '', '10.10.10.115', '0', '注册成功', '2022-11-22 22:24:39');
INSERT INTO `sys_logininfor` VALUES (234, '', '10.10.10.115', '0', '注册成功', '2022-11-22 22:42:17');
INSERT INTO `sys_logininfor` VALUES (235, '15368714206', '10.10.10.115', '0', '登录成功', '2022-11-22 22:42:17');
INSERT INTO `sys_logininfor` VALUES (236, '7d31153f56a04490a7d2bf2145f87727', '10.10.10.115', '0', '退出成功', '2022-11-22 22:42:28');
INSERT INTO `sys_logininfor` VALUES (237, '', '10.10.10.115', '0', '更新成功', '2022-11-22 23:01:25');
INSERT INTO `sys_logininfor` VALUES (238, '15368714206', '10.10.10.115', '0', '登录成功', '2022-11-22 23:01:28');
INSERT INTO `sys_logininfor` VALUES (239, '', '10.10.10.115', '0', '更新成功', '2022-11-22 23:01:40');
INSERT INTO `sys_logininfor` VALUES (240, '15368714206', '10.10.10.115', '0', '登录成功', '2022-11-22 23:01:40');
INSERT INTO `sys_logininfor` VALUES (241, '', '127.0.0.1', '0', '更新成功', '2022-11-22 23:34:26');
INSERT INTO `sys_logininfor` VALUES (242, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-22 23:34:26');
INSERT INTO `sys_logininfor` VALUES (243, '', '127.0.0.1', '0', '更新成功', '2022-11-22 23:35:59');
INSERT INTO `sys_logininfor` VALUES (244, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-22 23:35:59');
INSERT INTO `sys_logininfor` VALUES (245, '7d31153f56a04490a7d2bf2145f87727', '127.0.0.1', '0', '退出成功', '2022-11-22 23:36:03');
INSERT INTO `sys_logininfor` VALUES (246, '', '127.0.0.1', '0', '更新成功', '2022-11-22 23:36:09');
INSERT INTO `sys_logininfor` VALUES (247, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-22 23:36:09');
INSERT INTO `sys_logininfor` VALUES (248, '7d31153f56a04490a7d2bf2145f87727', '127.0.0.1', '0', '退出成功', '2022-11-22 23:36:16');
INSERT INTO `sys_logininfor` VALUES (249, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-22 23:36:34');
INSERT INTO `sys_logininfor` VALUES (250, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-22 23:37:27');
INSERT INTO `sys_logininfor` VALUES (251, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-22 23:37:31');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 23:43:15');
INSERT INTO `sys_logininfor` VALUES (253, '', '127.0.0.1', '0', '更新成功', '2022-11-22 23:43:32');
INSERT INTO `sys_logininfor` VALUES (254, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-22 23:43:33');
INSERT INTO `sys_logininfor` VALUES (255, '7d31153f56a04490a7d2bf2145f87727', '127.0.0.1', '0', '退出成功', '2022-11-23 00:01:14');
INSERT INTO `sys_logininfor` VALUES (256, '', '127.0.0.1', '0', '更新成功', '2022-11-23 00:01:25');
INSERT INTO `sys_logininfor` VALUES (257, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-23 00:01:25');
INSERT INTO `sys_logininfor` VALUES (258, '7d31153f56a04490a7d2bf2145f87727', '127.0.0.1', '0', '退出成功', '2022-11-23 00:01:50');
INSERT INTO `sys_logininfor` VALUES (259, '', '127.0.0.1', '0', '注册成功', '2022-11-23 00:02:13');
INSERT INTO `sys_logininfor` VALUES (260, '15368714206', '127.0.0.1', '1', '登录用户不存在', '2022-11-23 00:02:14');
INSERT INTO `sys_logininfor` VALUES (261, '', '127.0.0.1', '0', '更新成功', '2022-11-23 00:02:34');
INSERT INTO `sys_logininfor` VALUES (262, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-23 00:02:34');
INSERT INTO `sys_logininfor` VALUES (263, '8372e92d67a7437faf4c5942da4187f5', '127.0.0.1', '0', '退出成功', '2022-11-23 00:02:37');
INSERT INTO `sys_logininfor` VALUES (264, '', '127.0.0.1', '0', '更新成功', '2022-11-23 00:02:41');
INSERT INTO `sys_logininfor` VALUES (265, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-23 00:02:41');
INSERT INTO `sys_logininfor` VALUES (266, '8372e92d67a7437faf4c5942da4187f5', '127.0.0.1', '0', '退出成功', '2022-11-23 00:02:44');
INSERT INTO `sys_logininfor` VALUES (267, 'ai168', '127.0.0.1', '0', '登录成功', '2022-11-23 00:03:10');
INSERT INTO `sys_logininfor` VALUES (268, 'ai168', '127.0.0.1', '0', '退出成功', '2022-11-23 00:03:12');
INSERT INTO `sys_logininfor` VALUES (269, '', '127.0.0.1', '0', '注册成功', '2022-11-23 00:03:16');
INSERT INTO `sys_logininfor` VALUES (270, '15368714206', '127.0.0.1', '1', '登录用户不存在', '2022-11-23 00:03:17');
INSERT INTO `sys_logininfor` VALUES (271, '', '127.0.0.1', '0', '更新成功', '2022-11-23 00:03:34');
INSERT INTO `sys_logininfor` VALUES (272, '15368714206', '127.0.0.1', '0', '登录成功', '2022-11-23 00:03:34');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-28 16:48:34');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-08-28 20:42:08', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-08-28 20:42:08', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-08-28 20:42:08', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-08-28 20:42:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-08-28 20:42:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-08-28 20:42:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-08-28 20:42:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-08-28 20:42:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-08-28 20:42:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-08-28 20:42:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-08-28 20:42:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-08-28 20:42:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-08-28 20:42:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-08-28 20:42:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel监控', 2, 8, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-08-28 20:42:08', 'aicloud', '2022-10-08 14:24:42', '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos监控', 2, 7, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-08-28 20:42:08', 'aicloud', '2022-10-08 14:24:35', '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin监控', 2, 6, 'admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'admin', 'admin', '2022-06-17 15:47:48', 'aicloud', '2022-10-08 14:24:02', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-08-28 20:42:08', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-08-28 20:42:08', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'M', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-08-28 20:42:08', 'admin', '2022-10-17 14:19:55', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (117, '服务监控', 2, 3, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-10-07 23:15:50', 'admin', '2022-10-08 01:09:22', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (118, '缓存监控', 2, 4, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-10-07 23:15:50', 'admin', '2022-10-17 16:22:34', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (119, '缓存列表', 2, 5, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-10-07 23:15:50', 'admin', '2022-10-17 16:22:46', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-08-28 20:42:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-08-28 20:42:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-08-28 20:42:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 465 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (52, '登录日志', 4, 'com.cloud.system.controller.SysLogininforController.clean()', 'DELETE', 1, 'admin', NULL, '/logininfor/clean', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 16:07:51');
INSERT INTO `sys_oper_log` VALUES (53, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'admin', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"超级管理员\",\"phone\":\"13888888888\",\"sex\":\"1\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 16:09:41');
INSERT INTO `sys_oper_log` VALUES (54, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'admin', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"超级管理员\",\"phone\":\"13888888888\",\"sex\":\"1\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 16:09:50');
INSERT INTO `sys_oper_log` VALUES (55, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'admin', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"超级管理员\",\"phone\":\"13888888888\",\"sex\":\"1\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 16:14:59');
INSERT INTO `sys_oper_log` VALUES (56, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 16:27:12');
INSERT INTO `sys_oper_log` VALUES (57, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 16:27:14');
INSERT INTO `sys_oper_log` VALUES (58, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 16:29:58');
INSERT INTO `sys_oper_log` VALUES (59, '在线用户', 8, 'com.cloud.system.controller.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/online/9cefac1968fd441a911516d898b534bf', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 16:30:10');
INSERT INTO `sys_oper_log` VALUES (60, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:23:17');
INSERT INTO `sys_oper_log` VALUES (61, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:30:36');
INSERT INTO `sys_oper_log` VALUES (62, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:30:46');
INSERT INTO `sys_oper_log` VALUES (63, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:30:56');
INSERT INTO `sys_oper_log` VALUES (64, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:31:03');
INSERT INTO `sys_oper_log` VALUES (65, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:31:30');
INSERT INTO `sys_oper_log` VALUES (66, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 17:35:08');
INSERT INTO `sys_oper_log` VALUES (67, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 18:01:55');
INSERT INTO `sys_oper_log` VALUES (68, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 22:00:39');
INSERT INTO `sys_oper_log` VALUES (69, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 23:48:12');
INSERT INTO `sys_oper_log` VALUES (70, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 23:48:14');
INSERT INTO `sys_oper_log` VALUES (71, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-05 23:59:42');
INSERT INTO `sys_oper_log` VALUES (72, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-06 00:06:43');
INSERT INTO `sys_oper_log` VALUES (73, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-06 00:06:45');
INSERT INTO `sys_oper_log` VALUES (74, '代码生成', 7, 'com.cloud.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_case_archives\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 14:26:24');
INSERT INTO `sys_oper_log` VALUES (75, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-07 15:14:29');
INSERT INTO `sys_oper_log` VALUES (76, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:46:37');
INSERT INTO `sys_oper_log` VALUES (77, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:46:38');
INSERT INTO `sys_oper_log` VALUES (78, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:50:42');
INSERT INTO `sys_oper_log` VALUES (79, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:50:44');
INSERT INTO `sys_oper_log` VALUES (80, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:51:52');
INSERT INTO `sys_oper_log` VALUES (81, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:51:58');
INSERT INTO `sys_oper_log` VALUES (82, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:51:59');
INSERT INTO `sys_oper_log` VALUES (83, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:53:12');
INSERT INTO `sys_oper_log` VALUES (84, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 15:53:15');
INSERT INTO `sys_oper_log` VALUES (85, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 16:01:49');
INSERT INTO `sys_oper_log` VALUES (86, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-07 16:01:51');
INSERT INTO `sys_oper_log` VALUES (87, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 18:41:18');
INSERT INTO `sys_oper_log` VALUES (88, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 18:41:20');
INSERT INTO `sys_oper_log` VALUES (89, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 18:41:26');
INSERT INTO `sys_oper_log` VALUES (90, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 18:53:26');
INSERT INTO `sys_oper_log` VALUES (91, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 18:53:27');
INSERT INTO `sys_oper_log` VALUES (92, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:35:27');
INSERT INTO `sys_oper_log` VALUES (93, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:35:28');
INSERT INTO `sys_oper_log` VALUES (94, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:35:30');
INSERT INTO `sys_oper_log` VALUES (95, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/3e8474ea2fb547de8100ba5c26953c06PU%J~DFG175Y`AYF{I3)RH1.png\\r\\nhttps://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/477cc42b3fa94b62aab0f392c43c9724b.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:38:17');
INSERT INTO `sys_oper_log` VALUES (96, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:14');
INSERT INTO `sys_oper_log` VALUES (97, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:18');
INSERT INTO `sys_oper_log` VALUES (98, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:21');
INSERT INTO `sys_oper_log` VALUES (99, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:24');
INSERT INTO `sys_oper_log` VALUES (100, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:37');
INSERT INTO `sys_oper_log` VALUES (101, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:51');
INSERT INTO `sys_oper_log` VALUES (102, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:56');
INSERT INTO `sys_oper_log` VALUES (103, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:58');
INSERT INTO `sys_oper_log` VALUES (104, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:40:59');
INSERT INTO `sys_oper_log` VALUES (105, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:41:00');
INSERT INTO `sys_oper_log` VALUES (106, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:41:01');
INSERT INTO `sys_oper_log` VALUES (107, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:41:03');
INSERT INTO `sys_oper_log` VALUES (108, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:41:12');
INSERT INTO `sys_oper_log` VALUES (109, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:41:13');
INSERT INTO `sys_oper_log` VALUES (110, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:41:15');
INSERT INTO `sys_oper_log` VALUES (111, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:42:50');
INSERT INTO `sys_oper_log` VALUES (112, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:42:55');
INSERT INTO `sys_oper_log` VALUES (113, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:42:57');
INSERT INTO `sys_oper_log` VALUES (114, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:44:20');
INSERT INTO `sys_oper_log` VALUES (115, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:44:35');
INSERT INTO `sys_oper_log` VALUES (116, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:44:36');
INSERT INTO `sys_oper_log` VALUES (117, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:44:44');
INSERT INTO `sys_oper_log` VALUES (118, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:44:49');
INSERT INTO `sys_oper_log` VALUES (119, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:44:50');
INSERT INTO `sys_oper_log` VALUES (120, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:46:35');
INSERT INTO `sys_oper_log` VALUES (121, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:50:06');
INSERT INTO `sys_oper_log` VALUES (122, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:50:20');
INSERT INTO `sys_oper_log` VALUES (123, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:50:31');
INSERT INTO `sys_oper_log` VALUES (124, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:51:24');
INSERT INTO `sys_oper_log` VALUES (125, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:51:28');
INSERT INTO `sys_oper_log` VALUES (126, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:52:52');
INSERT INTO `sys_oper_log` VALUES (127, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:53:05');
INSERT INTO `sys_oper_log` VALUES (128, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:53:09');
INSERT INTO `sys_oper_log` VALUES (129, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:53:10');
INSERT INTO `sys_oper_log` VALUES (130, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:53:25');
INSERT INTO `sys_oper_log` VALUES (131, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:53:36');
INSERT INTO `sys_oper_log` VALUES (132, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:53:37');
INSERT INTO `sys_oper_log` VALUES (133, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:54:23');
INSERT INTO `sys_oper_log` VALUES (134, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:55:41');
INSERT INTO `sys_oper_log` VALUES (135, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:55:59');
INSERT INTO `sys_oper_log` VALUES (136, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 19:57:23');
INSERT INTO `sys_oper_log` VALUES (137, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 20:13:08');
INSERT INTO `sys_oper_log` VALUES (138, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 20:35:43');
INSERT INTO `sys_oper_log` VALUES (139, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 20:36:09');
INSERT INTO `sys_oper_log` VALUES (140, '查询钱包余额', 1, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '127.0.0.1', '', '', '{\"code\":200,\"data\":\"0.0000\",\"msg\":\"成功\"}', 0, NULL, '2022-11-09 20:36:30');
INSERT INTO `sys_oper_log` VALUES (141, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 23:01:06');
INSERT INTO `sys_oper_log` VALUES (142, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 23:01:08');
INSERT INTO `sys_oper_log` VALUES (143, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 23:01:09');
INSERT INTO `sys_oper_log` VALUES (144, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-09 23:01:12');
INSERT INTO `sys_oper_log` VALUES (145, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:28:12');
INSERT INTO `sys_oper_log` VALUES (146, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:28:22');
INSERT INTO `sys_oper_log` VALUES (147, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:28:24');
INSERT INTO `sys_oper_log` VALUES (148, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:06');
INSERT INTO `sys_oper_log` VALUES (149, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:26');
INSERT INTO `sys_oper_log` VALUES (150, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:32');
INSERT INTO `sys_oper_log` VALUES (151, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:33');
INSERT INTO `sys_oper_log` VALUES (152, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:39');
INSERT INTO `sys_oper_log` VALUES (153, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:40');
INSERT INTO `sys_oper_log` VALUES (154, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:46');
INSERT INTO `sys_oper_log` VALUES (155, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:30:48');
INSERT INTO `sys_oper_log` VALUES (156, '查询用户信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-10 00:32:47');
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 4, 'com.cloud.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/18', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-10 13:50:04');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 7, 'com.cloud.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_case_archives,sys_case_archives_stage\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-10 13:50:13');
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-10 13:50:18');
INSERT INTO `sys_oper_log` VALUES (160, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 09:42:45');
INSERT INTO `sys_oper_log` VALUES (161, '查询二维码所需信息', 1, 'com.cloud.user.controller.UserCenterApi.qrcode()', 'POST', 1, 'ai168', NULL, '/user/qrcode', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"id\":\"1587399165414084608\",\"nickName\":\"相忆采芙蓉\"},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 09:42:51');
INSERT INTO `sys_oper_log` VALUES (162, '查询钱包余额', 1, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '127.0.0.1', '', '', '{\"code\":200,\"data\":\"0.0000\",\"msg\":\"成功\"}', 0, NULL, '2022-11-11 09:43:55');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 4, 'com.cloud.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/19,20', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-11 10:16:23');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 7, 'com.cloud.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"user_vip,user_vip_equity\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-11 10:36:56');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-11 10:37:07');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 7, 'com.cloud.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"user_set\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-11 11:04:47');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-11 11:05:05');
INSERT INTO `sys_oper_log` VALUES (168, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":1,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:03');
INSERT INTO `sys_oper_log` VALUES (169, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":1,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:05');
INSERT INTO `sys_oper_log` VALUES (170, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:17');
INSERT INTO `sys_oper_log` VALUES (171, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:18');
INSERT INTO `sys_oper_log` VALUES (172, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', NULL, 1, '关注提醒是否开启不能为空!', '2022-11-11 14:40:46');
INSERT INTO `sys_oper_log` VALUES (173, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', NULL, 1, '关注提醒是否开启不能为空!', '2022-11-11 14:40:47');
INSERT INTO `sys_oper_log` VALUES (174, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:55');
INSERT INTO `sys_oper_log` VALUES (175, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:56');
INSERT INTO `sys_oper_log` VALUES (176, '保存设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setInfoSave()', 'POST', 1, 'ai168', NULL, '/user/setInfo/save', '127.0.0.1', '', '{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:40:56');
INSERT INTO `sys_oper_log` VALUES (177, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:07');
INSERT INTO `sys_oper_log` VALUES (178, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:09');
INSERT INTO `sys_oper_log` VALUES (179, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:10');
INSERT INTO `sys_oper_log` VALUES (180, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:10');
INSERT INTO `sys_oper_log` VALUES (181, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:11');
INSERT INTO `sys_oper_log` VALUES (182, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:11');
INSERT INTO `sys_oper_log` VALUES (183, '设置信息', 1, 'com.cloud.user.controller.UserCenterApi.setinfo()', 'POST', 1, 'ai168', NULL, '/user/setInfo', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attentionRemind\":0,\"commentRemind\":1,\"likeRemind\":1,\"messageAlarm\":1,\"messageShake\":1,\"notification\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:41:12');
INSERT INTO `sys_oper_log` VALUES (184, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":100.36,\"type\":1}', NULL, 1, '未绑定支付宝!', '2022-11-11 14:41:25');
INSERT INTO `sys_oper_log` VALUES (185, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":100.36,\"type\":1}', NULL, 1, '未绑定支付宝!', '2022-11-11 14:41:27');
INSERT INTO `sys_oper_log` VALUES (186, '保存绑定支付宝信息', 1, 'com.cloud.user.controller.UserCenterApi.walletBindAlipaySave()', 'POST', 1, 'ai168', NULL, '/user/wallet/bindAlipay/save', '127.0.0.1', '', '{\"alipayAccount\":\"13888888888\",\"alipayName\":\"小可爱\",\"uuid\":\"e1e4c24876514fc999d043ae0f496752\"}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:42:28');
INSERT INTO `sys_oper_log` VALUES (187, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":100.36,\"type\":1}', NULL, 1, '支付密码未设置!', '2022-11-11 14:42:48');
INSERT INTO `sys_oper_log` VALUES (188, '是否设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletIsSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/isSetPassword', '127.0.0.1', '', '', '{\"code\":200,\"data\":false,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:42:55');
INSERT INTO `sys_oper_log` VALUES (189, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:05');
INSERT INTO `sys_oper_log` VALUES (190, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:13');
INSERT INTO `sys_oper_log` VALUES (191, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:14');
INSERT INTO `sys_oper_log` VALUES (192, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:15');
INSERT INTO `sys_oper_log` VALUES (193, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:15');
INSERT INTO `sys_oper_log` VALUES (194, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:16');
INSERT INTO `sys_oper_log` VALUES (195, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', NULL, 1, '旧密码错误!', '2022-11-11 14:43:20');
INSERT INTO `sys_oper_log` VALUES (196, '设置支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletSetPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/setPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:26');
INSERT INTO `sys_oper_log` VALUES (197, '验证支付密码', 1, 'com.cloud.user.controller.UserCenterApi.walletVerifyPassword()', 'POST', 1, 'ai168', NULL, '/user/wallet/verifyPassword', '127.0.0.1', '', '{}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:34');
INSERT INTO `sys_oper_log` VALUES (198, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:49');
INSERT INTO `sys_oper_log` VALUES (199, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:50');
INSERT INTO `sys_oper_log` VALUES (200, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:51');
INSERT INTO `sys_oper_log` VALUES (201, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:52');
INSERT INTO `sys_oper_log` VALUES (202, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:53');
INSERT INTO `sys_oper_log` VALUES (203, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:54');
INSERT INTO `sys_oper_log` VALUES (204, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:55');
INSERT INTO `sys_oper_log` VALUES (205, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:55');
INSERT INTO `sys_oper_log` VALUES (206, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:56');
INSERT INTO `sys_oper_log` VALUES (207, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:57');
INSERT INTO `sys_oper_log` VALUES (208, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:57');
INSERT INTO `sys_oper_log` VALUES (209, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:58');
INSERT INTO `sys_oper_log` VALUES (210, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:59');
INSERT INTO `sys_oper_log` VALUES (211, '用户申请提现', 1, 'com.cloud.user.controller.UserCenterApi.walletWithdraw()', 'POST', 1, 'ai168', NULL, '/user/wallet/withdraw', '127.0.0.1', '', '{\"amount\":10000.36,\"type\":1}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:43:59');
INSERT INTO `sys_oper_log` VALUES (212, '保存绑定银行卡信息', 1, 'com.cloud.user.controller.UserCenterApi.walletBindBankSave()', 'POST', 1, 'ai168', NULL, '/user/wallet/bindBank/save', '127.0.0.1', '', '{\"bankAccount\":\"小宝贝\",\"bankCard\":\"6888888888888888888\",\"bankName\":\"中国银行\",\"uuid\":\"e1e4c24876514fc999d043ae0f496752\"}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:44:21');
INSERT INTO `sys_oper_log` VALUES (213, '保存绑定银行卡信息', 1, 'com.cloud.user.controller.UserCenterApi.walletBindBankSave()', 'POST', 1, 'ai168', NULL, '/user/wallet/bindBank/save', '127.0.0.1', '', '{\"bankAccount\":\"小宝贝\",\"bankCard\":\"6888888888888888888\",\"bankName\":\"中国银行\",\"uuid\":\"e1e4c24876514fc999d043ae0f496752\"}', '{\"code\":200,\"data\":true,\"msg\":\"成功\"}', 0, NULL, '2022-11-11 14:44:24');
INSERT INTO `sys_oper_log` VALUES (214, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:02:25');
INSERT INTO `sys_oper_log` VALUES (215, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:02:27');
INSERT INTO `sys_oper_log` VALUES (216, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:02:30');
INSERT INTO `sys_oper_log` VALUES (217, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:02:34');
INSERT INTO `sys_oper_log` VALUES (218, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:02:47');
INSERT INTO `sys_oper_log` VALUES (219, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:22:27');
INSERT INTO `sys_oper_log` VALUES (220, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:22:30');
INSERT INTO `sys_oper_log` VALUES (221, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:22:32');
INSERT INTO `sys_oper_log` VALUES (222, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:22:40');
INSERT INTO `sys_oper_log` VALUES (223, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:24:32');
INSERT INTO `sys_oper_log` VALUES (224, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:24:33');
INSERT INTO `sys_oper_log` VALUES (225, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:25:09');
INSERT INTO `sys_oper_log` VALUES (226, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-11 16:25:10');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 7, 'com.cloud.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"user_auth\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-11 16:25:48');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-11 16:25:54');
INSERT INTO `sys_oper_log` VALUES (229, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 11:14:39');
INSERT INTO `sys_oper_log` VALUES (230, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 11:14:40');
INSERT INTO `sys_oper_log` VALUES (231, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 11:17:07');
INSERT INTO `sys_oper_log` VALUES (232, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 11:24:05');
INSERT INTO `sys_oper_log` VALUES (233, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 11:24:23');
INSERT INTO `sys_oper_log` VALUES (234, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 11:24:26');
INSERT INTO `sys_oper_log` VALUES (235, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 14:28:40');
INSERT INTO `sys_oper_log` VALUES (236, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 14:29:01');
INSERT INTO `sys_oper_log` VALUES (237, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 14:29:03');
INSERT INTO `sys_oper_log` VALUES (238, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 14:29:06');
INSERT INTO `sys_oper_log` VALUES (239, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 14:38:17');
INSERT INTO `sys_oper_log` VALUES (240, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 14:38:20');
INSERT INTO `sys_oper_log` VALUES (241, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 16:28:33');
INSERT INTO `sys_oper_log` VALUES (242, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 16:29:36');
INSERT INTO `sys_oper_log` VALUES (243, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 16:29:42');
INSERT INTO `sys_oper_log` VALUES (244, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 17:42:06');
INSERT INTO `sys_oper_log` VALUES (245, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 17:42:08');
INSERT INTO `sys_oper_log` VALUES (246, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:01:53');
INSERT INTO `sys_oper_log` VALUES (247, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:01:56');
INSERT INTO `sys_oper_log` VALUES (248, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:42:54');
INSERT INTO `sys_oper_log` VALUES (249, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:42:56');
INSERT INTO `sys_oper_log` VALUES (250, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:43:04');
INSERT INTO `sys_oper_log` VALUES (251, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:43:06');
INSERT INTO `sys_oper_log` VALUES (252, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:43:11');
INSERT INTO `sys_oper_log` VALUES (253, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:43:13');
INSERT INTO `sys_oper_log` VALUES (254, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:43:18');
INSERT INTO `sys_oper_log` VALUES (255, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 18:43:38');
INSERT INTO `sys_oper_log` VALUES (256, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:11:17');
INSERT INTO `sys_oper_log` VALUES (257, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:12:24');
INSERT INTO `sys_oper_log` VALUES (258, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:12:49');
INSERT INTO `sys_oper_log` VALUES (259, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:18:46');
INSERT INTO `sys_oper_log` VALUES (260, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:24:11');
INSERT INTO `sys_oper_log` VALUES (261, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:24:13');
INSERT INTO `sys_oper_log` VALUES (262, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:24:59');
INSERT INTO `sys_oper_log` VALUES (263, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:32:52');
INSERT INTO `sys_oper_log` VALUES (264, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:34:00');
INSERT INTO `sys_oper_log` VALUES (265, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:34:01');
INSERT INTO `sys_oper_log` VALUES (266, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:34:03');
INSERT INTO `sys_oper_log` VALUES (267, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:34:05');
INSERT INTO `sys_oper_log` VALUES (268, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:34:07');
INSERT INTO `sys_oper_log` VALUES (269, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:34:08');
INSERT INTO `sys_oper_log` VALUES (270, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:35:57');
INSERT INTO `sys_oper_log` VALUES (271, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:39:52');
INSERT INTO `sys_oper_log` VALUES (272, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:42:00');
INSERT INTO `sys_oper_log` VALUES (273, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:43:34');
INSERT INTO `sys_oper_log` VALUES (274, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:45:41');
INSERT INTO `sys_oper_log` VALUES (275, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:53:08');
INSERT INTO `sys_oper_log` VALUES (276, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:53:36');
INSERT INTO `sys_oper_log` VALUES (277, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:54:09');
INSERT INTO `sys_oper_log` VALUES (278, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:57:04');
INSERT INTO `sys_oper_log` VALUES (279, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:57:22');
INSERT INTO `sys_oper_log` VALUES (280, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:57:34');
INSERT INTO `sys_oper_log` VALUES (281, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:57:41');
INSERT INTO `sys_oper_log` VALUES (282, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:57:51');
INSERT INTO `sys_oper_log` VALUES (283, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 19:57:55');
INSERT INTO `sys_oper_log` VALUES (284, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:02:07');
INSERT INTO `sys_oper_log` VALUES (285, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:10:48');
INSERT INTO `sys_oper_log` VALUES (286, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:10:59');
INSERT INTO `sys_oper_log` VALUES (287, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:11:24');
INSERT INTO `sys_oper_log` VALUES (288, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:11:45');
INSERT INTO `sys_oper_log` VALUES (289, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:12:56');
INSERT INTO `sys_oper_log` VALUES (290, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:13:11');
INSERT INTO `sys_oper_log` VALUES (291, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:13:35');
INSERT INTO `sys_oper_log` VALUES (292, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:15:59');
INSERT INTO `sys_oper_log` VALUES (293, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:17:35');
INSERT INTO `sys_oper_log` VALUES (294, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:18:04');
INSERT INTO `sys_oper_log` VALUES (295, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:20:30');
INSERT INTO `sys_oper_log` VALUES (296, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:21:02');
INSERT INTO `sys_oper_log` VALUES (297, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:21:11');
INSERT INTO `sys_oper_log` VALUES (298, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:21:13');
INSERT INTO `sys_oper_log` VALUES (299, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:22:37');
INSERT INTO `sys_oper_log` VALUES (300, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:24:13');
INSERT INTO `sys_oper_log` VALUES (301, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:27:04');
INSERT INTO `sys_oper_log` VALUES (302, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:27:06');
INSERT INTO `sys_oper_log` VALUES (303, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:27:14');
INSERT INTO `sys_oper_log` VALUES (304, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:27:16');
INSERT INTO `sys_oper_log` VALUES (305, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:27:54');
INSERT INTO `sys_oper_log` VALUES (306, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'admin', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"超级管理员\",\"phone\":\"13888888888\",\"sex\":\"1\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:28:09');
INSERT INTO `sys_oper_log` VALUES (307, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'admin', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"超级管理员\",\"phone\":\"13888888888\",\"sex\":\"1\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 20:28:10');
INSERT INTO `sys_oper_log` VALUES (308, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 21:03:07');
INSERT INTO `sys_oper_log` VALUES (309, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-15 21:03:09');
INSERT INTO `sys_oper_log` VALUES (310, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:09:07');
INSERT INTO `sys_oper_log` VALUES (311, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:09:09');
INSERT INTO `sys_oper_log` VALUES (312, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:17:25');
INSERT INTO `sys_oper_log` VALUES (313, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:17:27');
INSERT INTO `sys_oper_log` VALUES (314, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:18:03');
INSERT INTO `sys_oper_log` VALUES (315, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:18:09');
INSERT INTO `sys_oper_log` VALUES (316, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:18:20');
INSERT INTO `sys_oper_log` VALUES (317, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:52:30');
INSERT INTO `sys_oper_log` VALUES (318, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 11:52:31');
INSERT INTO `sys_oper_log` VALUES (319, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:01:08');
INSERT INTO `sys_oper_log` VALUES (320, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:04:36');
INSERT INTO `sys_oper_log` VALUES (321, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:04:40');
INSERT INTO `sys_oper_log` VALUES (322, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:06:50');
INSERT INTO `sys_oper_log` VALUES (323, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:06:58');
INSERT INTO `sys_oper_log` VALUES (324, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:08:38');
INSERT INTO `sys_oper_log` VALUES (325, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:09:08');
INSERT INTO `sys_oper_log` VALUES (326, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:09:15');
INSERT INTO `sys_oper_log` VALUES (327, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:09:21');
INSERT INTO `sys_oper_log` VALUES (328, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:12:43');
INSERT INTO `sys_oper_log` VALUES (329, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:12:45');
INSERT INTO `sys_oper_log` VALUES (330, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:16:43');
INSERT INTO `sys_oper_log` VALUES (331, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:16:45');
INSERT INTO `sys_oper_log` VALUES (332, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:22:17');
INSERT INTO `sys_oper_log` VALUES (333, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:22:40');
INSERT INTO `sys_oper_log` VALUES (334, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:25:09');
INSERT INTO `sys_oper_log` VALUES (335, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:26:21');
INSERT INTO `sys_oper_log` VALUES (336, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:26:23');
INSERT INTO `sys_oper_log` VALUES (337, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:27:38');
INSERT INTO `sys_oper_log` VALUES (338, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:27:41');
INSERT INTO `sys_oper_log` VALUES (339, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:51:11');
INSERT INTO `sys_oper_log` VALUES (340, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:51:13');
INSERT INTO `sys_oper_log` VALUES (341, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.19', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:52:08');
INSERT INTO `sys_oper_log` VALUES (342, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.19', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:52:11');
INSERT INTO `sys_oper_log` VALUES (343, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.19', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:52:54');
INSERT INTO `sys_oper_log` VALUES (344, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.19', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:52:58');
INSERT INTO `sys_oper_log` VALUES (345, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:54:50');
INSERT INTO `sys_oper_log` VALUES (346, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:54:52');
INSERT INTO `sys_oper_log` VALUES (347, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:56:09');
INSERT INTO `sys_oper_log` VALUES (348, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.19', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:56:49');
INSERT INTO `sys_oper_log` VALUES (349, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.19', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 14:56:51');
INSERT INTO `sys_oper_log` VALUES (350, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 15:18:59');
INSERT INTO `sys_oper_log` VALUES (351, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 15:29:08');
INSERT INTO `sys_oper_log` VALUES (352, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 15:29:20');
INSERT INTO `sys_oper_log` VALUES (353, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 15:29:23');
INSERT INTO `sys_oper_log` VALUES (354, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:39:12');
INSERT INTO `sys_oper_log` VALUES (355, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:39:14');
INSERT INTO `sys_oper_log` VALUES (356, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:47:20');
INSERT INTO `sys_oper_log` VALUES (357, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:47:26');
INSERT INTO `sys_oper_log` VALUES (358, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:51:05');
INSERT INTO `sys_oper_log` VALUES (359, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:52:59');
INSERT INTO `sys_oper_log` VALUES (360, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:53:00');
INSERT INTO `sys_oper_log` VALUES (361, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:53:05');
INSERT INTO `sys_oper_log` VALUES (362, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:53:09');
INSERT INTO `sys_oper_log` VALUES (363, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:53:14');
INSERT INTO `sys_oper_log` VALUES (364, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:53:15');
INSERT INTO `sys_oper_log` VALUES (365, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 16:53:21');
INSERT INTO `sys_oper_log` VALUES (366, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 18:57:49');
INSERT INTO `sys_oper_log` VALUES (367, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 19:02:54');
INSERT INTO `sys_oper_log` VALUES (368, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-16 19:02:56');
INSERT INTO `sys_oper_log` VALUES (369, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 15:56:53');
INSERT INTO `sys_oper_log` VALUES (370, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 15:56:55');
INSERT INTO `sys_oper_log` VALUES (371, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 15:57:07');
INSERT INTO `sys_oper_log` VALUES (372, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 15:57:09');
INSERT INTO `sys_oper_log` VALUES (373, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:41:00');
INSERT INTO `sys_oper_log` VALUES (374, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:41:01');
INSERT INTO `sys_oper_log` VALUES (375, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:42:28');
INSERT INTO `sys_oper_log` VALUES (376, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:43:04');
INSERT INTO `sys_oper_log` VALUES (377, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:44:36');
INSERT INTO `sys_oper_log` VALUES (378, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:45:15');
INSERT INTO `sys_oper_log` VALUES (379, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:47:35');
INSERT INTO `sys_oper_log` VALUES (380, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:48:11');
INSERT INTO `sys_oper_log` VALUES (381, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:48:49');
INSERT INTO `sys_oper_log` VALUES (382, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:49:19');
INSERT INTO `sys_oper_log` VALUES (383, '在线用户', 8, 'com.cloud.system.controller.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/online/b6fa3489b07141d785c458f490848af5', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-18 17:49:30');
INSERT INTO `sys_oper_log` VALUES (384, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:59:34');
INSERT INTO `sys_oper_log` VALUES (385, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-18 17:59:35');
INSERT INTO `sys_oper_log` VALUES (386, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-19 16:51:03');
INSERT INTO `sys_oper_log` VALUES (387, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-19 16:51:04');
INSERT INTO `sys_oper_log` VALUES (388, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-19 16:52:38');
INSERT INTO `sys_oper_log` VALUES (389, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-19 16:52:39');
INSERT INTO `sys_oper_log` VALUES (390, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-19 19:11:07');
INSERT INTO `sys_oper_log` VALUES (391, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-19 19:11:09');
INSERT INTO `sys_oper_log` VALUES (392, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:33:17');
INSERT INTO `sys_oper_log` VALUES (393, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:33:19');
INSERT INTO `sys_oper_log` VALUES (394, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:33:36');
INSERT INTO `sys_oper_log` VALUES (395, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:34:46');
INSERT INTO `sys_oper_log` VALUES (396, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:34:48');
INSERT INTO `sys_oper_log` VALUES (397, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:42:57');
INSERT INTO `sys_oper_log` VALUES (398, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 09:42:59');
INSERT INTO `sys_oper_log` VALUES (399, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLTransientConnectionException: HikariPool-1 - Connection is not available, request timed out after 30058ms.\r\n### The error may exist in file [C:\\Users\\aigaojianyun\\Desktop\\ai-cloud-parent\\ai-cloud-web\\ai-cloud-user\\target\\classes\\mapper\\user\\UserMapper.xml]\r\n### The error may involve com.cloud.user.mapper.UserMapper.selectByUserInfo\r\n### The error occurred while executing a query\r\n### Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLTransientConnectionException: HikariPool-1 - Connection is not available, request timed out after 30058ms.', '2022-11-21 10:08:26');
INSERT INTO `sys_oper_log` VALUES (400, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 10:08:48');
INSERT INTO `sys_oper_log` VALUES (401, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-21 17:02:52');
INSERT INTO `sys_oper_log` VALUES (402, '代码生成', 9, 'com.cloud.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-21 17:11:35');
INSERT INTO `sys_oper_log` VALUES (403, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:31:10');
INSERT INTO `sys_oper_log` VALUES (404, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:31:22');
INSERT INTO `sys_oper_log` VALUES (405, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:37:18');
INSERT INTO `sys_oper_log` VALUES (406, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:37:19');
INSERT INTO `sys_oper_log` VALUES (407, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:38:01');
INSERT INTO `sys_oper_log` VALUES (408, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:38:09');
INSERT INTO `sys_oper_log` VALUES (409, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:38:40');
INSERT INTO `sys_oper_log` VALUES (410, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:38:42');
INSERT INTO `sys_oper_log` VALUES (411, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:41:46');
INSERT INTO `sys_oper_log` VALUES (412, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.120', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 17:41:47');
INSERT INTO `sys_oper_log` VALUES (413, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 19:17:11');
INSERT INTO `sys_oper_log` VALUES (414, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-21 19:17:12');
INSERT INTO `sys_oper_log` VALUES (415, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 10:30:28');
INSERT INTO `sys_oper_log` VALUES (416, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 10:30:29');
INSERT INTO `sys_oper_log` VALUES (417, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 10:31:12');
INSERT INTO `sys_oper_log` VALUES (418, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 10:31:14');
INSERT INTO `sys_oper_log` VALUES (419, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 10:39:06');
INSERT INTO `sys_oper_log` VALUES (420, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 11:17:25');
INSERT INTO `sys_oper_log` VALUES (421, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 15:49:18');
INSERT INTO `sys_oper_log` VALUES (422, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 15:49:19');
INSERT INTO `sys_oper_log` VALUES (423, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 15:56:31');
INSERT INTO `sys_oper_log` VALUES (424, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 15:56:41');
INSERT INTO `sys_oper_log` VALUES (425, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:31:06');
INSERT INTO `sys_oper_log` VALUES (426, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:31:08');
INSERT INTO `sys_oper_log` VALUES (427, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.20', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:54:02');
INSERT INTO `sys_oper_log` VALUES (428, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.20', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:54:03');
INSERT INTO `sys_oper_log` VALUES (429, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.20', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:54:10');
INSERT INTO `sys_oper_log` VALUES (430, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.20', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:54:11');
INSERT INTO `sys_oper_log` VALUES (431, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:56:33');
INSERT INTO `sys_oper_log` VALUES (432, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:56:35');
INSERT INTO `sys_oper_log` VALUES (433, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:56:46');
INSERT INTO `sys_oper_log` VALUES (434, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:56:47');
INSERT INTO `sys_oper_log` VALUES (435, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:57:04');
INSERT INTO `sys_oper_log` VALUES (436, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:57:06');
INSERT INTO `sys_oper_log` VALUES (437, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:57:12');
INSERT INTO `sys_oper_log` VALUES (438, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 20:57:13');
INSERT INTO `sys_oper_log` VALUES (439, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 22:42:18');
INSERT INTO `sys_oper_log` VALUES (440, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 22:42:20');
INSERT INTO `sys_oper_log` VALUES (441, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:01:42');
INSERT INTO `sys_oper_log` VALUES (442, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '10.10.10.115', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:01:43');
INSERT INTO `sys_oper_log` VALUES (443, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:34:28');
INSERT INTO `sys_oper_log` VALUES (444, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:34:29');
INSERT INTO `sys_oper_log` VALUES (445, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:35:59');
INSERT INTO `sys_oper_log` VALUES (446, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:36:01');
INSERT INTO `sys_oper_log` VALUES (447, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:36:09');
INSERT INTO `sys_oper_log` VALUES (448, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:36:11');
INSERT INTO `sys_oper_log` VALUES (449, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:36:34');
INSERT INTO `sys_oper_log` VALUES (450, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:37:23');
INSERT INTO `sys_oper_log` VALUES (451, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:37:31');
INSERT INTO `sys_oper_log` VALUES (452, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:37:32');
INSERT INTO `sys_oper_log` VALUES (453, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:43:33');
INSERT INTO `sys_oper_log` VALUES (454, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-22 23:43:34');
INSERT INTO `sys_oper_log` VALUES (455, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:01:25');
INSERT INTO `sys_oper_log` VALUES (456, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7d31153f56a04490a7d2bf2145f87727', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"奶油味的风\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:01:30');
INSERT INTO `sys_oper_log` VALUES (457, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '8372e92d67a7437faf4c5942da4187f5', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"千年等一回\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:02:34');
INSERT INTO `sys_oper_log` VALUES (458, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '8372e92d67a7437faf4c5942da4187f5', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"千年等一回\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:02:36');
INSERT INTO `sys_oper_log` VALUES (459, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '8372e92d67a7437faf4c5942da4187f5', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"千年等一回\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:02:41');
INSERT INTO `sys_oper_log` VALUES (460, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '8372e92d67a7437faf4c5942da4187f5', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png\",\"likes\":0,\"nickName\":\"千年等一回\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:02:43');
INSERT INTO `sys_oper_log` VALUES (461, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:03:10');
INSERT INTO `sys_oper_log` VALUES (462, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"21\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"相忆采芙蓉\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:03:11');
INSERT INTO `sys_oper_log` VALUES (463, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7ea8668e8ca8439891777662e1d54638', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"粉色烟雾弹\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:03:35');
INSERT INTO `sys_oper_log` VALUES (464, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '7ea8668e8ca8439891777662e1d54638', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"粉色烟雾弹\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2022-11-23 00:03:36');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-08-28 20:42:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-08-28 20:42:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-08-28 20:42:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-08-28 20:42:08', 'admin', '2022-10-08 11:54:11', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 118);
INSERT INTO `sys_role_menu` VALUES (2, 119);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2230566429 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'aicloud888@163.com', '13888888888', '1', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', '$2a$10$yrDSHzBiLzrjRp0eRKdDhezljDc/H.MPI3/ziGZAHBRgtSTfDgY36', '0', '0', '127.0.0.1', '2022-10-07 23:28:38', 'admin', '2022-08-28 20:42:08', '', '2022-10-17 11:26:55', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'aicloud', '管理员', '00', 'aicloud888@163.com', '13999999999', '1', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-08-28 20:42:08', 'admin', '2022-08-28 20:42:08', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (2230566428, 105, 'ceshi', '测试员', '00', 'aicloud888@163.com', '15888888888', '1', '', '$2a$10$gyd.bpjIhpEvlF.46shsGebzN1AHIcesWMcLzNapz5T86Yobgv5Iy', '0', '0', '', NULL, 'admin', '2022-11-01 18:33:40', 'admin', '2022-11-01 19:08:07', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (2230566428, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (2230566428, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(32) NOT NULL COMMENT '用户id',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户密码',
  `uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户绑定手机号',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别 (0男 1女 2未知)',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出生年月',
  `sign` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签名',
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家',
  `capital` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `counties` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '县区',
  `bind_qq_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQ绑定的id',
  `bind_wechat_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定微信id',
  `bind_sina_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定微博id',
  `bind_alipay_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定支付宝id',
  `activate` int(11) NULL DEFAULT 1 COMMENT '是否激活; 用户注册后未登录过，即为此用户未激活 1：未激活 2：已激活',
  `activate_time` datetime NULL DEFAULT NULL COMMENT '激活时间',
  `fans` int(11) NULL DEFAULT 0 COMMENT '粉丝数',
  `attention` int(11) NULL DEFAULT 0 COMMENT '用户关注数',
  `opus` int(11) NULL DEFAULT 0 COMMENT '用户作品数量',
  `likes` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `kbs` decimal(13, 4) NULL DEFAULT 0.0000 COMMENT '获取的总KB值',
  `invitation_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邀请码',
  `invitation_qrcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邀请者二维码',
  `invitation_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邀请者id',
  `invitation_url_and` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推广安卓URL',
  `invitation_url_ios` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推广IOSURL',
  `invitation_url_weixin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推广微信小程序URL',
  `invitation_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '推广链',
  `user_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '用户类型（1普通用户 ，2系统管理员）',
  `vip_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '会员类型（1普通会员 ，2VIP会员 ，3SVIP会员）',
  `vip_start_time` datetime NULL DEFAULT NULL COMMENT '会员开始时间',
  `vip_end_time` datetime NULL DEFAULT NULL COMMENT '会员结束时间',
  `realname_auth` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否实名认证（1未验证，2已验证）',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信登录openid',
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信登录会话KEY',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0启用，2停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0未删除，2已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '超级管理员', '$2a$10$ptAbK3l.G1xTAEf.5KqSq.M4hBHfwYS8RZ2jk/E4HOy7bCqABAyri', '04eb6607deb84f1085d344c49db2679f', '13888888888', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-08 08:08:08', 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '1', NULL, NULL, '1', NULL, NULL, NULL, NULL, 0, 0, 'system', '2021-08-08 08:08:08', '', '2022-09-23 14:33:17', NULL);
INSERT INTO `user` VALUES (2, 'aicloud', '管理员', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0dd883697e2c4dd7b598a4168748fd22', '13999999999', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-08 08:08:08', 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '1', NULL, NULL, '1', NULL, NULL, NULL, NULL, 0, 0, 'admin', '2021-08-08 08:08:08', '', '2022-10-20 11:24:22', NULL);
INSERT INTO `user` VALUES (2230566428, 'ceshi', '测试员', '$2a$10$gyd.bpjIhpEvlF.46shsGebzN1AHIcesWMcLzNapz5T86Yobgv5Iy', '1d3201e078b6431bbf4fb8932b7f7037', '15888888888', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-11-01 18:33:37', 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '1', NULL, NULL, '1', NULL, NULL, NULL, NULL, 0, 0, 'admin', '2022-11-01 18:33:37', '', '2022-11-01 19:08:04', NULL);
INSERT INTO `user` VALUES (1587399165414084608, 'ai168', '相忆采芙蓉', '$2a$10$dJBtoUG27R9u9r4AQVOFY.EzN4iiYoFYxZuFtMGBPXKGrVBX0QO5G', 'c0db8b3c91d5bf22646cd1252b768357', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', 1, 21, NULL, '这个世界本就是平衡的，想要得到什么就要付出什么', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '3', '2022-11-01 19:50:43', '2032-11-09 19:51:07', '1', NULL, NULL, NULL, NULL, 0, 0, '', '2022-11-01 19:00:28', '', NULL, NULL);
INSERT INTO `user` VALUES (1587400633995104256, 'ai888', '神也会眼红', '$2a$10$mELItdeVeR46QB4TmU50C.oY9LSzwXhwYQJrcf5H34XbNf0Mr.Ika', 'eeca1af23504d95b8bbe1043bfa1ad6a', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '1', NULL, NULL, NULL, NULL, 0, 0, '', '2022-11-01 19:06:19', '', NULL, NULL);
INSERT INTO `user` VALUES (1595085517828001792, '7ea8668e8ca8439891777662e1d54638', '粉色烟雾弹', NULL, NULL, '15368714206', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '1', 'olLW56SPiYjul8ZPnyjGd9_AHwzs', 'D2rT7v4kg2p1Mhi07n0RqQ==', NULL, NULL, 0, 0, '', '2022-11-23 00:03:18', '', '2022-11-23 00:03:36', NULL);

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` bigint(32) NOT NULL COMMENT '账户id',
  `user_id` bigint(32) NULL DEFAULT NULL COMMENT '用户id',
  `uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账户号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户支付密码',
  `salt` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付密码加密盐',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户类型；1：余额账户 2：kb账户',
  `user_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户类型；1：个人  2：商家',
  `grade` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户等级；1：普通账户 2：金卡账户 3：铂金账户',
  `deal_commission_ratio` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易手续费比例(账户等级不同，交易手续费比例不同)',
  `withdrawal_commission_ratio` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提现手续费比例(账户等级不同，交易手续费比例不同)',
  `daily_trading_limit` decimal(32, 4) NULL DEFAULT NULL COMMENT '日交易限额',
  `month_trading_limit` decimal(32, 4) NULL DEFAULT NULL COMMENT '月交易限额',
  `daily_withdrawal_limit` decimal(32, 4) NULL DEFAULT NULL COMMENT '日提现限额',
  `month_withdrawal_limit` decimal(32, 4) NULL DEFAULT NULL COMMENT '月提现限额',
  `available_balance` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '账户可用余额',
  `frozen_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '账户冻结金额',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number` ASC) USING BTREE,
  INDEX `user_id`(`number` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户账户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (1587399165784354818, 1587399165414084608, 'c0db8b3c91d5bf22646cd1252b768357', 'cb8946830a454421b758f96f1781cff4', '102234fd16214ac59cfa732c39da79bd', 'EZVMAXOL', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99859994.9600, 0.0000, 0, 0, '', '2022-11-01 19:00:28', NULL, NULL);
INSERT INTO `user_account` VALUES (1587399166237339650, 1587399165414084608, 'c0db8b3c91d5bf22646cd1252b768357', 'ccb104e80e364a77952caf1def20a797', '102234fd16214ac59cfa732c39da79bd', 'EZVMAXOL', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-01 19:00:28', NULL, NULL);
INSERT INTO `user_account` VALUES (1587400634373763073, 1587400633995104256, 'eeca1af23504d95b8bbe1043bfa1ad6a', 'dac071e4f2604729ac676ed4c782dc8d', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-01 19:06:18', NULL, NULL);
INSERT INTO `user_account` VALUES (1587400634768027649, 1587400633995104256, 'eeca1af23504d95b8bbe1043bfa1ad6a', 'a8fd4690e03b4398a62395eee0afa597', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-01 19:06:18', NULL, NULL);
INSERT INTO `user_account` VALUES (1595085518172327938, 1595085517828001792, NULL, 'e4f962f0f6b1405fac13613736fc1e18', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-23 00:03:17', NULL, NULL);
INSERT INTO `user_account` VALUES (1595085518570786817, 1595085517828001792, NULL, 'c5ba00692e9643ae98d84eca8a946099', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-23 00:03:18', NULL, NULL);

-- ----------------------------
-- Table structure for user_account_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_account_detail`;
CREATE TABLE `user_account_detail`  (
  `id` bigint(32) NOT NULL COMMENT '交易记录id',
  `account_id` bigint(32) NULL DEFAULT NULL COMMENT '账户id',
  `account_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户号',
  `account_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户类型；1：余额账户  2：kb账户',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录类型；1：收入 2：支出',
  `debit_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款方类型',
  `debit_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款方账户号',
  `debit_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款方手机号',
  `credit_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款方类型',
  `credit_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款方账户号',
  `credit_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款方手机号',
  `order_price` decimal(32, 4) NULL DEFAULT NULL COMMENT '交易金额',
  `before_available_balance` decimal(32, 4) NULL DEFAULT NULL COMMENT '交易前账户可用余额',
  `after_available_balance` decimal(32, 4) NULL DEFAULT NULL COMMENT '交易后账户可用余额',
  `deal_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易名称',
  `order_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `deal_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `merchant_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方交易流水号',
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图像',
  `service_charge` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手续费',
  `deal_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易类型；1：充值 2：提现 3：消费 4：转账 5：红包 6： 退款 7：其他',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户账户明细记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account_detail
-- ----------------------------
INSERT INTO `user_account_detail` VALUES (1590958453492514817, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 100000000.0000, 99989999.6400, '余额提现', NULL, 'b20221111661299', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:49', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958458697646081, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99989999.6400, 99979999.2800, '余额提现', NULL, 'b20221111516129', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:50', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958462657069057, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99979999.2800, 99969998.9200, '余额提现', NULL, 'b20221111888540', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:51', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958466272559105, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99969998.9200, 99959998.5600, '余额提现', NULL, 'b20221111111548', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:52', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958469363761153, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99959998.5600, 99949998.2000, '余额提现', NULL, 'b20221111314895', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:52', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958473696477186, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99949998.2000, 99939997.8400, '余额提现', NULL, 'b20221111156017', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:53', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958476347277314, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99939997.8400, 99929997.4800, '余额提现', NULL, 'b20221111432314', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:54', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958479253929985, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99929997.4800, 99919997.1200, '余额提现', NULL, 'b20221111752392', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:55', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958482101862401, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99919997.1200, 99909996.7600, '余额提现', NULL, 'b20221111728160', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:55', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958485058846721, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99909996.7600, 99899996.4000, '余额提现', NULL, 'b20221111464923', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:56', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958488007442433, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99899996.4000, 99889996.0400, '余额提现', NULL, 'b20221111442380', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:57', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958491178336258, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99889996.0400, 99879995.6800, '余额提现', NULL, 'b20221111662272', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:58', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958493833330690, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99879995.6800, 99869995.3200, '余额提现', NULL, 'b20221111359479', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:58', NULL, NULL);
INSERT INTO `user_account_detail` VALUES (1590958496882589698, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', NULL, 10000.3600, 99869995.3200, 99859994.9600, '余额提现', NULL, 'b20221111258366', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, '2', NULL, 0, 0, 'ai168', '2022-11-11 14:43:59', NULL, NULL);

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `uuid` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '第三方平台用户唯一ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户来源',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户第三方授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint(32) NOT NULL COMMENT 'id',
  `user_id` bigint(32) NULL DEFAULT NULL COMMENT '用户id',
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `belong_bank` int(11) NULL DEFAULT NULL COMMENT '所属银行；1：支付宝 2：银行卡',
  `bank_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡卡号',
  `bank_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡开户行名称 如:工商银行',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡开户账户',
  `alipay_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `alipay_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝认证姓名',
  `bind_time` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户绑定银行卡或支付宝' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bind
-- ----------------------------
INSERT INTO `user_bind` VALUES (1590958113493843969, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', 1, NULL, NULL, NULL, '13888888888', '小可爱', '2022-11-11 14:42:27', 0, 0, 'ai168', '2022-11-11 14:42:27', NULL, NULL);
INSERT INTO `user_bind` VALUES (1590958588704292865, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', 2, '6888888888888888888', '中国银行', '小宝贝', NULL, NULL, '2022-11-11 14:44:21', 0, 0, 'ai168', '2022-11-11 14:44:21', 'ai168', '2022-11-11 14:44:24');

-- ----------------------------
-- Table structure for user_mock_data
-- ----------------------------
DROP TABLE IF EXISTS `user_mock_data`;
CREATE TABLE `user_mock_data`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型：1：昵称 2：头像',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称或者头像值',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户随机信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_mock_data
-- ----------------------------
INSERT INTO `user_mock_data` VALUES ('1', 1, '相忆采芙蓉', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('10', 1, '不该被珍惜', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('11', 1, '少女蒸汽机', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('12', 1, '风衣与怀抱', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('13', 1, '粉色烟雾弹', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('14', 1, '晚期强迫症', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('15', 1, '感情中介所', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('16', 1, '少女与日记', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('17', 1, '玩网的少女', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('18', 1, '温柔养野狗', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('19', 1, '妓鸟恋旧林', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('2', 1, '祈祷的心灵', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('20', 1, '一身温柔气', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('21', 1, '望断千万里', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('22', 1, '我有对鹿角', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('23', 1, '莫名的情愫', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('24', 1, '流浪爱猫人', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('25', 1, '奶油味的风', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('26', 1, '第三方情话', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('27', 1, '习惯性想你', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('28', 1, '陪我淋的雨', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('29', 1, '谋爱亦谋生', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('3', 1, '喜你入三分', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('30', 1, '一口氧气', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('31', 1, '初心喂给狗', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('32', 1, '野生萝莉', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('33', 1, '战前黎明', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('34', 1, '我有对鹿角', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('35', 1, '千年等一回', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('36', 1, '梦的六次方', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('4', 1, '渴望被拥抱', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('5', 1, '五杀小仙女', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('6', 1, '晚风缠心事', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('7', 1, '最佳女配角', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('8', 1, '情丝千万丈', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('9', 1, '神也会眼红', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('91', 2, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('92', 2, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('93', 2, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4f9ed9ba9cf9468387f6471eee1de29fc.png', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user_mock_data` VALUES ('94', 2, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4b6ba5f2368f4af2adda768645115da5d.png', 0, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `body` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品介绍',
  `total_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '订单金额（分为单位）',
  `real_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '交易金额',
  `kb_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT 'kb账号金额',
  `yuanli_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '源力金额',
  `biz_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户绑定用户ID',
  `biz_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户名称',
  `biz_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户账号',
  `biz_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户绑定电话',
  `buyer_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '买家用户ID',
  `app_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用ID',
  `service_order_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `buyer_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家姓名',
  `buyer_nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家昵称',
  `buyer_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家账号',
  `buyer_phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家电话',
  `buyer_headimg` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家头像',
  `order_status` int(11) NOT NULL DEFAULT 1 COMMENT '支付状态 1.待支付 2.已支付 3.支付失败 4.已取消',
  `order_type` int(11) NULL DEFAULT NULL COMMENT '订单类型：业务应用定义',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0启用，2停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0未删除，2已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '交易订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_order
-- ----------------------------

-- ----------------------------
-- Table structure for user_set
-- ----------------------------
DROP TABLE IF EXISTS `user_set`;
CREATE TABLE `user_set`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `head_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `uuid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `message_shake` int(11) NULL DEFAULT NULL COMMENT '消息推送是否开启震动；1：开启，0：未开启',
  `message_alarm` int(11) NULL DEFAULT NULL COMMENT '消息推送是否开启铃声；1：开启，0：未开启',
  `like_remind` int(11) NULL DEFAULT NULL COMMENT '点赞提醒是否开启；1：开启，0：未开启',
  `attention_remind` int(11) NULL DEFAULT NULL COMMENT '关注提醒是否开启；1：开启，0：未开启',
  `notification` int(11) NULL DEFAULT NULL COMMENT '系统通知提醒是否开启；1：开启，0：未开启',
  `comment_remind` int(11) NULL DEFAULT NULL COMMENT '评论提醒是否开启；1：开启，0：未开启',
  `status_flag` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_set
-- ----------------------------
INSERT INTO `user_set` VALUES ('1590957505332346882', '1587399165414084608', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', '相忆采芙蓉', 'c0db8b3c91d5bf22646cd1252b768357', 1, 1, 1, 0, 1, 1, 1, 0, 'ai168', '2022-11-11 14:40:02', 'ai168', '2022-11-11 14:40:05');

-- ----------------------------
-- Table structure for user_share
-- ----------------------------
DROP TABLE IF EXISTS `user_share`;
CREATE TABLE `user_share`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `like` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享链接',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享名称',
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享图片',
  `share_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享者ID',
  `nick_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享用户名称',
  `headimg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享用户头像',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享用户手机号',
  `channel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享渠道 1：微信好友 2：微信朋友圈 3：新浪微博 4：QQ空间 5：qq群 6：qq好友',
  `status_flag` int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户分享记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_share
-- ----------------------------

-- ----------------------------
-- Table structure for user_share_click_log
-- ----------------------------
DROP TABLE IF EXISTS `user_share_click_log`;
CREATE TABLE `user_share_click_log`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `user_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户点击ID',
  `channel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户来源渠道 1：微信好友 2：微信朋友圈 3：新浪微博 4：QQ空间 5：qq群 6：qq好友',
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方开放ID',
  `nick_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方用户昵称',
  `headimg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方用户头像',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定手机号',
  `sex` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分享图片',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户点击分享记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_share_click_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_vip
-- ----------------------------
DROP TABLE IF EXISTS `user_vip`;
CREATE TABLE `user_vip`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员名称',
  `introduce` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员介绍',
  `cover_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员封面图',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员图标',
  `month_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员月费价格',
  `year_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员年费价格',
  `weight` int(11) NULL DEFAULT NULL COMMENT '权重值',
  `status_flag` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vip
-- ----------------------------
INSERT INTO `user_vip` VALUES ('1', '超级会员', 'tset', 'test', 'test', 113.00, 1356.00, 1, 1, 0, '1', '2019-11-06 09:52:58', NULL, NULL);

-- ----------------------------
-- Table structure for user_vip_equity
-- ----------------------------
DROP TABLE IF EXISTS `user_vip_equity`;
CREATE TABLE `user_vip_equity`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `vip_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员主表id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员权益名称',
  `introduce` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员权益介绍',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员权益图标',
  `weight` int(11) NULL DEFAULT NULL COMMENT '会员权益权重值',
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员权益跳转链接',
  `status_flag` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vip_id`(`vip_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员权益' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vip_equity
-- ----------------------------
INSERT INTO `user_vip_equity` VALUES ('1', '1', '权益1', '1', '1', 1, '1', 1, 0, '1', '2019-11-06 09:53:12', NULL, NULL);
INSERT INTO `user_vip_equity` VALUES ('2', '1', '权益2', '2', '2', 2, '1', 1, 0, '1', '2019-11-06 09:53:27', NULL, NULL);

-- ----------------------------
-- Table structure for user_vip_open_log
-- ----------------------------
DROP TABLE IF EXISTS `user_vip_open_log`;
CREATE TABLE `user_vip_open_log`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vip_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开通会员id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `boss_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商家',
  `boss_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商家信息',
  `pay_way` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式；1：微信支付 2：支付宝支付 3：余额支付',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `head_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `device_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备记录id',
  `uuid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `bind_phone` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户绑定手机号',
  `pay_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付类型；1：月支付 2：年支付',
  `number` int(11) NULL DEFAULT NULL COMMENT '开通时长（月）',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `pay_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `merchant_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户流水号(第三方流水号）',
  `deal_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号 即支付成功的业务流水号',
  `third_orderno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `pay_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态；1：待付款 2：已付款 3： 付款失败 4.已取消 5：已退款  9.支付结果返回中',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `status_flag` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员开通记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vip_open_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_withdraw_apply
-- ----------------------------
DROP TABLE IF EXISTS `user_withdraw_apply`;
CREATE TABLE `user_withdraw_apply`  (
  `id` bigint(32) NOT NULL COMMENT '提现记录id',
  `user_id` bigint(32) NULL DEFAULT NULL COMMENT '用户id',
  `uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标示',
  `belong_bank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提现方式；1：支付宝 2：银行卡',
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户行姓名',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户行账号',
  `bank_card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '卡号',
  `alipay_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝账户',
  `alipay_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝姓名',
  `amount` decimal(10, 3) NULL DEFAULT NULL COMMENT '提现金额',
  `deal_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `merchant_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户流水号',
  `service_charge` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提现手续费',
  `settlement_amount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算账金额',
  `status` int(11) NULL DEFAULT 1 COMMENT '提现状态；1：待审核 2：审核通过 3：审核拒绝',
  `remit_status` int(11) NULL DEFAULT 1 COMMENT '打款状态 1：待确认 2：已打款 3：拒绝打款',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `accept_apply_time` datetime NULL DEFAULT NULL COMMENT '审核通过时间',
  `accept_apply_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核通过扣款流水号（冗余）',
  `remit_time` datetime NULL DEFAULT NULL COMMENT '确认打款时间',
  `remit_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认打款交易流水号(冗余)',
  `other_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外部汇款凭证号',
  `refuse_apply_time` datetime NULL DEFAULT NULL COMMENT '审核/打款 拒绝时间',
  `refuse_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打款拒绝退款流水号',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `delete_flag` int(11) NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户提现申请记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_withdraw_apply
-- ----------------------------
INSERT INTO `user_withdraw_apply` VALUES (1590958453882585089, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111661299', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:49', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958459083522050, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111516129', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:50', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958463038750721, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111888540', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:51', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958466658435073, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111111548', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:52', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958469749637121, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111314895', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:52', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958474086547458, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111156017', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:53', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958476733153282, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111432314', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:54', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958479644000257, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111752392', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:55', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958482500321281, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111728160', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:55', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958485448916994, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111464923', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:56', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958488456232962, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111442380', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:57', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958491564212225, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111662272', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:58', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958494227595265, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111359479', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:58', NULL, NULL);
INSERT INTO `user_withdraw_apply` VALUES (1590958497272659969, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 10000.360, 'b20221111258366', NULL, NULL, NULL, 1, 1, '2022-11-11 14:43:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2022-11-11 14:43:59', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
