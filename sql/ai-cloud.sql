/*
 Navicat Premium Data Transfer

 Source Server         : ai-cloud
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1:3306
 Source Schema         : ai-cloud

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 16/01/2023 09:26:10
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
INSERT INTO `qrtz_scheduler_state` VALUES ('Scheduler', 'DESKTOP-65BIL2N1673683045454', 1673683240515, 15000);

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
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1673683050000, -1, 5, 'PAUSED', 'CRON', 1673683048000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1673683050000, -1, 5, 'PAUSED', 'CRON', 1673683049000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1673683060000, -1, 5, 'PAUSED', 'CRON', 1673683050000, 0, NULL, 2, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 526 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (403, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '127.0.0.1', '0', '注册成功', '2023-01-12 16:14:12');
INSERT INTO `sys_logininfor` VALUES (404, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '127.0.0.1', '0', '登录成功', '2023-01-12 16:14:12');
INSERT INTO `sys_logininfor` VALUES (405, '80b70e7d52894157aa357c8cff5a3404', '127.0.0.1', '0', '退出成功', '2023-01-12 16:14:25');
INSERT INTO `sys_logininfor` VALUES (406, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '127.0.0.1', '0', '更新成功', '2023-01-12 16:14:30');
INSERT INTO `sys_logininfor` VALUES (407, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '127.0.0.1', '0', '登录成功', '2023-01-12 16:14:30');
INSERT INTO `sys_logininfor` VALUES (408, '80b70e7d52894157aa357c8cff5a3404', '127.0.0.1', '0', '退出成功', '2023-01-12 16:48:53');
INSERT INTO `sys_logininfor` VALUES (409, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-12 16:50:13');
INSERT INTO `sys_logininfor` VALUES (410, 'ai168', '127.0.0.1', '0', '退出成功', '2023-01-12 16:50:17');
INSERT INTO `sys_logininfor` VALUES (411, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-12 17:12:51');
INSERT INTO `sys_logininfor` VALUES (412, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-12 17:14:18');
INSERT INTO `sys_logininfor` VALUES (413, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-13 14:15:24');
INSERT INTO `sys_logininfor` VALUES (414, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-13 14:15:56');
INSERT INTO `sys_logininfor` VALUES (415, 'ai168', '127.0.0.1', '0', '退出成功', '2023-01-13 14:16:11');
INSERT INTO `sys_logininfor` VALUES (416, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-13 14:16:17');
INSERT INTO `sys_logininfor` VALUES (417, 'ai168', '127.0.0.1', '0', '退出成功', '2023-01-13 14:16:50');
INSERT INTO `sys_logininfor` VALUES (418, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '127.0.0.1', '0', '更新成功', '2023-01-13 14:17:05');
INSERT INTO `sys_logininfor` VALUES (419, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '127.0.0.1', '0', '登录成功', '2023-01-13 14:17:05');
INSERT INTO `sys_logininfor` VALUES (420, '80b70e7d52894157aa357c8cff5a3404', '127.0.0.1', '0', '退出成功', '2023-01-13 14:17:22');
INSERT INTO `sys_logininfor` VALUES (421, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-13 14:27:46');
INSERT INTO `sys_logininfor` VALUES (422, 'ai168', '127.0.0.1', '0', '退出成功', '2023-01-13 14:28:44');
INSERT INTO `sys_logininfor` VALUES (423, 'ai168', '127.0.0.1', '0', '登录成功', '2023-01-13 14:28:48');
INSERT INTO `sys_logininfor` VALUES (424, 'ai168', '10.10.10.26', '1', '登录用户不存在', '2023-01-13 14:33:38');
INSERT INTO `sys_logininfor` VALUES (425, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 14:33:39');
INSERT INTO `sys_logininfor` VALUES (426, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 14:33:39');
INSERT INTO `sys_logininfor` VALUES (427, 'ai168', '10.10.10.26', '1', '登录用户不存在', '2023-01-13 14:33:44');
INSERT INTO `sys_logininfor` VALUES (428, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 14:34:14');
INSERT INTO `sys_logininfor` VALUES (429, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 14:35:12');
INSERT INTO `sys_logininfor` VALUES (430, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 14:36:55');
INSERT INTO `sys_logininfor` VALUES (431, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 14:37:31');
INSERT INTO `sys_logininfor` VALUES (432, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 14:38:07');
INSERT INTO `sys_logininfor` VALUES (433, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 14:40:06');
INSERT INTO `sys_logininfor` VALUES (434, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 14:40:34');
INSERT INTO `sys_logininfor` VALUES (435, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 14:46:10');
INSERT INTO `sys_logininfor` VALUES (436, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 14:46:16');
INSERT INTO `sys_logininfor` VALUES (437, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 14:46:22');
INSERT INTO `sys_logininfor` VALUES (438, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 14:50:09');
INSERT INTO `sys_logininfor` VALUES (439, 'ai168', '10.10.10.37', '0', '退出成功', '2023-01-13 14:50:15');
INSERT INTO `sys_logininfor` VALUES (440, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 14:51:17');
INSERT INTO `sys_logininfor` VALUES (441, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 14:51:24');
INSERT INTO `sys_logininfor` VALUES (442, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-13 14:55:37');
INSERT INTO `sys_logininfor` VALUES (443, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-13 14:55:37');
INSERT INTO `sys_logininfor` VALUES (444, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:08:46');
INSERT INTO `sys_logininfor` VALUES (445, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 16:15:44');
INSERT INTO `sys_logininfor` VALUES (446, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:17:12');
INSERT INTO `sys_logininfor` VALUES (447, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 16:23:59');
INSERT INTO `sys_logininfor` VALUES (448, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 16:25:38');
INSERT INTO `sys_logininfor` VALUES (449, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:28:39');
INSERT INTO `sys_logininfor` VALUES (450, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-13 16:29:00');
INSERT INTO `sys_logininfor` VALUES (451, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-13 16:29:01');
INSERT INTO `sys_logininfor` VALUES (452, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:31:06');
INSERT INTO `sys_logininfor` VALUES (453, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 16:33:37');
INSERT INTO `sys_logininfor` VALUES (454, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:33:46');
INSERT INTO `sys_logininfor` VALUES (455, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:35:36');
INSERT INTO `sys_logininfor` VALUES (456, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 16:36:11');
INSERT INTO `sys_logininfor` VALUES (457, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-13 16:42:05');
INSERT INTO `sys_logininfor` VALUES (458, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-13 16:42:05');
INSERT INTO `sys_logininfor` VALUES (459, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 16:43:37');
INSERT INTO `sys_logininfor` VALUES (460, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 16:44:51');
INSERT INTO `sys_logininfor` VALUES (461, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:45:16');
INSERT INTO `sys_logininfor` VALUES (462, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-13 16:45:32');
INSERT INTO `sys_logininfor` VALUES (463, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-13 16:45:32');
INSERT INTO `sys_logininfor` VALUES (464, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 16:45:51');
INSERT INTO `sys_logininfor` VALUES (465, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 16:47:08');
INSERT INTO `sys_logininfor` VALUES (466, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 16:47:36');
INSERT INTO `sys_logininfor` VALUES (467, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 16:51:25');
INSERT INTO `sys_logininfor` VALUES (468, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:01:15');
INSERT INTO `sys_logininfor` VALUES (469, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:37:45');
INSERT INTO `sys_logininfor` VALUES (470, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:37:55');
INSERT INTO `sys_logininfor` VALUES (471, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:37:59');
INSERT INTO `sys_logininfor` VALUES (472, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:38:02');
INSERT INTO `sys_logininfor` VALUES (473, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:38:33');
INSERT INTO `sys_logininfor` VALUES (474, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:38:36');
INSERT INTO `sys_logininfor` VALUES (475, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-13 17:46:09');
INSERT INTO `sys_logininfor` VALUES (476, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-13 17:46:09');
INSERT INTO `sys_logininfor` VALUES (477, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:46:39');
INSERT INTO `sys_logininfor` VALUES (478, 'ai168', '10.10.10.37', '0', '登录成功', '2023-01-13 17:48:48');
INSERT INTO `sys_logininfor` VALUES (479, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:51:06');
INSERT INTO `sys_logininfor` VALUES (480, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:51:14');
INSERT INTO `sys_logininfor` VALUES (481, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:51:17');
INSERT INTO `sys_logininfor` VALUES (482, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:51:23');
INSERT INTO `sys_logininfor` VALUES (483, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:51:26');
INSERT INTO `sys_logininfor` VALUES (484, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-13 17:51:32');
INSERT INTO `sys_logininfor` VALUES (485, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-13 17:54:43');
INSERT INTO `sys_logininfor` VALUES (486, 'ai168', '10.10.10.26', '1', '密码输入错误1次', '2023-01-13 17:54:49');
INSERT INTO `sys_logininfor` VALUES (487, 'ai168', '10.10.10.26', '1', '密码输入错误2次', '2023-01-13 17:54:53');
INSERT INTO `sys_logininfor` VALUES (488, 'ai168', '10.10.10.26', '1', '密码输入错误3次', '2023-01-13 17:54:58');
INSERT INTO `sys_logininfor` VALUES (489, 'ai168', '10.10.10.26', '1', '密码输入错误4次', '2023-01-13 17:55:02');
INSERT INTO `sys_logininfor` VALUES (490, 'ai168', '10.10.10.26', '1', '密码输入错误5次', '2023-01-13 17:55:06');
INSERT INTO `sys_logininfor` VALUES (491, 'ai168', '10.10.10.26', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-13 17:55:10');
INSERT INTO `sys_logininfor` VALUES (492, 'ai168', '10.10.10.26', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-13 17:55:15');
INSERT INTO `sys_logininfor` VALUES (493, 'ceshi', '127.0.0.1', '0', '登录成功', '2023-01-13 18:32:05');
INSERT INTO `sys_logininfor` VALUES (494, 'ceshi', '127.0.0.1', '0', '登录成功', '2023-01-14 09:39:51');
INSERT INTO `sys_logininfor` VALUES (495, 'ceshi', '127.0.0.1', '0', '退出成功', '2023-01-14 09:50:30');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '0', '登录成功', '2023-01-14 09:50:40');
INSERT INTO `sys_logininfor` VALUES (497, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-14 10:17:09');
INSERT INTO `sys_logininfor` VALUES (498, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-14 10:17:16');
INSERT INTO `sys_logininfor` VALUES (499, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-14 10:17:20');
INSERT INTO `sys_logininfor` VALUES (500, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-14 10:18:28');
INSERT INTO `sys_logininfor` VALUES (501, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-14 10:18:33');
INSERT INTO `sys_logininfor` VALUES (502, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-14 10:20:41');
INSERT INTO `sys_logininfor` VALUES (503, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-14 15:37:36');
INSERT INTO `sys_logininfor` VALUES (504, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-14 15:37:37');
INSERT INTO `sys_logininfor` VALUES (505, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '注册成功', '2023-01-14 15:38:15');
INSERT INTO `sys_logininfor` VALUES (506, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-14 15:38:15');
INSERT INTO `sys_logininfor` VALUES (507, '10f5477e16ac42c9b41a1a24df507344', '10.10.10.26', '0', '退出成功', '2023-01-14 15:38:19');
INSERT INTO `sys_logininfor` VALUES (508, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-14 15:38:24');
INSERT INTO `sys_logininfor` VALUES (509, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-14 15:38:24');
INSERT INTO `sys_logininfor` VALUES (510, 'ai168', '10.10.10.26', '1', '密码输入错误1次', '2023-01-14 15:53:29');
INSERT INTO `sys_logininfor` VALUES (511, 'ai168', '10.10.10.26', '1', '密码输入错误2次', '2023-01-14 15:53:36');
INSERT INTO `sys_logininfor` VALUES (512, 'ai168', '10.10.10.26', '1', '密码输入错误3次', '2023-01-14 15:53:40');
INSERT INTO `sys_logininfor` VALUES (513, 'ai168', '10.10.10.26', '1', '密码输入错误4次', '2023-01-14 15:53:45');
INSERT INTO `sys_logininfor` VALUES (514, 'ai168', '10.10.10.26', '1', '密码输入错误5次', '2023-01-14 15:53:48');
INSERT INTO `sys_logininfor` VALUES (515, 'ai168', '10.10.10.26', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-14 15:53:52');
INSERT INTO `sys_logininfor` VALUES (516, 'ai168', '10.10.10.26', '1', '密码输入错误5次，帐户锁定10分钟', '2023-01-14 15:54:09');
INSERT INTO `sys_logininfor` VALUES (517, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-14 15:54:16');
INSERT INTO `sys_logininfor` VALUES (518, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-14 15:54:16');
INSERT INTO `sys_logininfor` VALUES (519, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '更新成功', '2023-01-14 15:55:59');
INSERT INTO `sys_logininfor` VALUES (520, 'olLW56SPiYjul8ZPnyjGd9_AHwzs', '10.10.10.26', '0', '登录成功', '2023-01-14 15:55:59');
INSERT INTO `sys_logininfor` VALUES (521, '10f5477e16ac42c9b41a1a24df507344', '10.10.10.26', '0', '退出成功', '2023-01-14 15:57:29');
INSERT INTO `sys_logininfor` VALUES (522, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-14 16:34:11');
INSERT INTO `sys_logininfor` VALUES (523, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-14 16:34:42');
INSERT INTO `sys_logininfor` VALUES (524, 'ai168', '10.10.10.26', '0', '登录成功', '2023-01-14 16:55:39');
INSERT INTO `sys_logininfor` VALUES (525, 'ai168', '10.10.10.26', '0', '退出成功', '2023-01-14 16:57:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 679 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (556, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:09:44');
INSERT INTO `sys_oper_log` VALUES (557, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:09:53');
INSERT INTO `sys_oper_log` VALUES (558, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '11d288a647184223bc529629031c35f3', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4b6ba5f2368f4af2adda768645115da5d.png\",\"likes\":0,\"nickName\":\"喜你入三分\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:10:00');
INSERT INTO `sys_oper_log` VALUES (559, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '11d288a647184223bc529629031c35f3', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4b6ba5f2368f4af2adda768645115da5d.png\",\"likes\":0,\"nickName\":\"喜你入三分\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:10:01');
INSERT INTO `sys_oper_log` VALUES (560, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '11d288a647184223bc529629031c35f3', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4b6ba5f2368f4af2adda768645115da5d.png\",\"likes\":0,\"nickName\":\"喜你入三分\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:11:35');
INSERT INTO `sys_oper_log` VALUES (561, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '11d288a647184223bc529629031c35f3', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/4b6ba5f2368f4af2adda768645115da5d.png\",\"likes\":0,\"nickName\":\"喜你入三分\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:13:18');
INSERT INTO `sys_oper_log` VALUES (562, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:14:12');
INSERT INTO `sys_oper_log` VALUES (563, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:14:23');
INSERT INTO `sys_oper_log` VALUES (564, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:14:30');
INSERT INTO `sys_oper_log` VALUES (565, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:14:46');
INSERT INTO `sys_oper_log` VALUES (566, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:50:13');
INSERT INTO `sys_oper_log` VALUES (567, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 16:50:15');
INSERT INTO `sys_oper_log` VALUES (568, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 17:12:51');
INSERT INTO `sys_oper_log` VALUES (569, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 17:12:55');
INSERT INTO `sys_oper_log` VALUES (570, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-12 17:14:19');
INSERT INTO `sys_oper_log` VALUES (571, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:15:25');
INSERT INTO `sys_oper_log` VALUES (572, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:15:27');
INSERT INTO `sys_oper_log` VALUES (573, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:15:56');
INSERT INTO `sys_oper_log` VALUES (574, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:16:07');
INSERT INTO `sys_oper_log` VALUES (575, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:16:17');
INSERT INTO `sys_oper_log` VALUES (576, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:16:18');
INSERT INTO `sys_oper_log` VALUES (577, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:17:05');
INSERT INTO `sys_oper_log` VALUES (578, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:17:07');
INSERT INTO `sys_oper_log` VALUES (579, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:27:46');
INSERT INTO `sys_oper_log` VALUES (580, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:27:48');
INSERT INTO `sys_oper_log` VALUES (581, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:28:39');
INSERT INTO `sys_oper_log` VALUES (582, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:28:43');
INSERT INTO `sys_oper_log` VALUES (583, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:28:49');
INSERT INTO `sys_oper_log` VALUES (584, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:28:50');
INSERT INTO `sys_oper_log` VALUES (585, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:33:39');
INSERT INTO `sys_oper_log` VALUES (586, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:33:47');
INSERT INTO `sys_oper_log` VALUES (587, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:34:14');
INSERT INTO `sys_oper_log` VALUES (588, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:34:16');
INSERT INTO `sys_oper_log` VALUES (589, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:35:12');
INSERT INTO `sys_oper_log` VALUES (590, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:36:54');
INSERT INTO `sys_oper_log` VALUES (591, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:37:31');
INSERT INTO `sys_oper_log` VALUES (592, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:37:47');
INSERT INTO `sys_oper_log` VALUES (593, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:38:05');
INSERT INTO `sys_oper_log` VALUES (594, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:40:06');
INSERT INTO `sys_oper_log` VALUES (595, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:40:34');
INSERT INTO `sys_oper_log` VALUES (596, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:46:17');
INSERT INTO `sys_oper_log` VALUES (597, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:46:18');
INSERT INTO `sys_oper_log` VALUES (598, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:50:09');
INSERT INTO `sys_oper_log` VALUES (599, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:50:11');
INSERT INTO `sys_oper_log` VALUES (600, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:51:18');
INSERT INTO `sys_oper_log` VALUES (601, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:51:22');
INSERT INTO `sys_oper_log` VALUES (602, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:55:38');
INSERT INTO `sys_oper_log` VALUES (603, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 14:55:48');
INSERT INTO `sys_oper_log` VALUES (604, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:08:46');
INSERT INTO `sys_oper_log` VALUES (605, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:11:07');
INSERT INTO `sys_oper_log` VALUES (606, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:12:44');
INSERT INTO `sys_oper_log` VALUES (607, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:17:13');
INSERT INTO `sys_oper_log` VALUES (608, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:17:15');
INSERT INTO `sys_oper_log` VALUES (609, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:23:59');
INSERT INTO `sys_oper_log` VALUES (610, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:24:16');
INSERT INTO `sys_oper_log` VALUES (611, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:28:39');
INSERT INTO `sys_oper_log` VALUES (612, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:29:01');
INSERT INTO `sys_oper_log` VALUES (613, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:29:08');
INSERT INTO `sys_oper_log` VALUES (614, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:31:07');
INSERT INTO `sys_oper_log` VALUES (615, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:31:08');
INSERT INTO `sys_oper_log` VALUES (616, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:32:26');
INSERT INTO `sys_oper_log` VALUES (617, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:33:46');
INSERT INTO `sys_oper_log` VALUES (618, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:33:47');
INSERT INTO `sys_oper_log` VALUES (619, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:35:36');
INSERT INTO `sys_oper_log` VALUES (620, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:35:38');
INSERT INTO `sys_oper_log` VALUES (621, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:35:56');
INSERT INTO `sys_oper_log` VALUES (622, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:42:05');
INSERT INTO `sys_oper_log` VALUES (623, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:42:10');
INSERT INTO `sys_oper_log` VALUES (624, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:43:38');
INSERT INTO `sys_oper_log` VALUES (625, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:43:46');
INSERT INTO `sys_oper_log` VALUES (626, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:44:51');
INSERT INTO `sys_oper_log` VALUES (627, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:44:56');
INSERT INTO `sys_oper_log` VALUES (628, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:45:16');
INSERT INTO `sys_oper_log` VALUES (629, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:45:32');
INSERT INTO `sys_oper_log` VALUES (630, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:45:51');
INSERT INTO `sys_oper_log` VALUES (631, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:47:01');
INSERT INTO `sys_oper_log` VALUES (632, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:47:36');
INSERT INTO `sys_oper_log` VALUES (633, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 16:49:14');
INSERT INTO `sys_oper_log` VALUES (634, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:01:15');
INSERT INTO `sys_oper_log` VALUES (635, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:01:19');
INSERT INTO `sys_oper_log` VALUES (636, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:27:48');
INSERT INTO `sys_oper_log` VALUES (637, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:28:38');
INSERT INTO `sys_oper_log` VALUES (638, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:37:56');
INSERT INTO `sys_oper_log` VALUES (639, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:37:57');
INSERT INTO `sys_oper_log` VALUES (640, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:38:02');
INSERT INTO `sys_oper_log` VALUES (641, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:38:03');
INSERT INTO `sys_oper_log` VALUES (642, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:38:36');
INSERT INTO `sys_oper_log` VALUES (643, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:38:42');
INSERT INTO `sys_oper_log` VALUES (644, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:45:51');
INSERT INTO `sys_oper_log` VALUES (645, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:46:10');
INSERT INTO `sys_oper_log` VALUES (646, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:46:11');
INSERT INTO `sys_oper_log` VALUES (647, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:46:39');
INSERT INTO `sys_oper_log` VALUES (648, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:46:41');
INSERT INTO `sys_oper_log` VALUES (649, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:48:48');
INSERT INTO `sys_oper_log` VALUES (650, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.37', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:48:51');
INSERT INTO `sys_oper_log` VALUES (651, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:51:14');
INSERT INTO `sys_oper_log` VALUES (652, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:51:15');
INSERT INTO `sys_oper_log` VALUES (653, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:51:23');
INSERT INTO `sys_oper_log` VALUES (654, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:51:24');
INSERT INTO `sys_oper_log` VALUES (655, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:51:32');
INSERT INTO `sys_oper_log` VALUES (656, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-13 17:51:34');
INSERT INTO `sys_oper_log` VALUES (657, '账户解锁', 0, 'com.cloud.system.controller.SysLogininforController.unlock()', 'GET', 1, 'ceshi', NULL, '/logininfor/unlock/ai168', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 18:32:47');
INSERT INTO `sys_oper_log` VALUES (658, '在线用户', 8, 'com.cloud.system.controller.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'ceshi', NULL, '/online/fe9796f0de0246998905e5b8a5d93603', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 09:50:29');
INSERT INTO `sys_oper_log` VALUES (659, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 10:17:10');
INSERT INTO `sys_oper_log` VALUES (660, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 10:17:11');
INSERT INTO `sys_oper_log` VALUES (661, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 10:17:20');
INSERT INTO `sys_oper_log` VALUES (662, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 10:17:21');
INSERT INTO `sys_oper_log` VALUES (663, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 10:18:33');
INSERT INTO `sys_oper_log` VALUES (664, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 10:18:35');
INSERT INTO `sys_oper_log` VALUES (665, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:37:37');
INSERT INTO `sys_oper_log` VALUES (666, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '80b70e7d52894157aa357c8cff5a3404', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"莫名的情愫\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:37:39');
INSERT INTO `sys_oper_log` VALUES (667, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:38:16');
INSERT INTO `sys_oper_log` VALUES (668, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:38:17');
INSERT INTO `sys_oper_log` VALUES (669, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:38:24');
INSERT INTO `sys_oper_log` VALUES (670, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:38:25');
INSERT INTO `sys_oper_log` VALUES (671, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:54:16');
INSERT INTO `sys_oper_log` VALUES (672, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:54:19');
INSERT INTO `sys_oper_log` VALUES (673, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:56:00');
INSERT INTO `sys_oper_log` VALUES (674, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, '10f5477e16ac42c9b41a1a24df507344', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png\",\"likes\":0,\"nickName\":\"习惯性想你\",\"phone\":\"15368714206\",\"vipType\":1},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 15:56:01');
INSERT INTO `sys_oper_log` VALUES (675, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 16:34:12');
INSERT INTO `sys_oper_log` VALUES (676, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 16:34:14');
INSERT INTO `sys_oper_log` VALUES (677, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 16:55:39');
INSERT INTO `sys_oper_log` VALUES (678, '查询我的信息', 1, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '10.10.10.26', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"vipEndTime\":\"2032-11-09 19:51:07\",\"vipStartTime\":\"2022-11-01 19:50:43\",\"vipType\":3},\"msg\":\"成功\"}', 0, NULL, '2023-01-14 16:55:40');

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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'aicloud888@163.com', '13888888888', '1', ' https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2023/01/10/5784faab322444c1956faa172c843d04blob', '$2a$10$yrDSHzBiLzrjRp0eRKdDhezljDc/H.MPI3/ziGZAHBRgtSTfDgY36', '0', '0', '127.0.0.1', '2022-10-07 23:28:38', 'admin', '2022-08-28 20:42:08', '', '2023-01-10 16:40:45', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'aicloud', '管理员', '00', 'aicloud888@163.com', '13999999999', '1', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-08-28 20:42:08', 'admin', '2022-08-28 20:42:08', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (2230566428, 105, 'ceshi', '测试员', '00', 'aicloud888@163.com', '15888888888', '1', '', '$2a$10$FUcxcfHSqM2Go6kkzLt5n.VhGoPZr6oDXjEOa4mcV3eT1BbDNi3ha', '0', '0', '', NULL, 'admin', '2022-11-01 18:33:40', 'admin', '2022-11-01 19:08:07', '测试员');

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
  `user_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '用户类型（1普通用户 ，2会员用户）',
  `vip_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '会员类型（1非会员 ，2普通会员 ，3VIP会员 ，4SVIP会员）',
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
INSERT INTO `user` VALUES (1587399165414084608, 'ai168', '少女与日记', '$2a$10$dJBtoUG27R9u9r4AQVOFY.EzN4iiYoFYxZuFtMGBPXKGrVBX0QO5G', 'c0db8b3c91d5bf22646cd1252b768357', '13888888888', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', 1, 19, NULL, '这个世界本就是平衡的，想要得到什么就要付出什么', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, '', '', NULL, NULL, '2', '2', '2022-11-01 19:50:43', '2032-11-09 19:51:07', '1', NULL, NULL, NULL, NULL, 0, 0, '', '2022-11-01 19:00:28', '', '2023-01-05 15:58:20', NULL);
INSERT INTO `user` VALUES (1587400633995104256, 'ai888', '神也会眼红', '$2a$10$mELItdeVeR46QB4TmU50C.oY9LSzwXhwYQJrcf5H34XbNf0Mr.Ika', 'eeca1af23504d95b8bbe1043bfa1ad6a', '13999999999', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '1', NULL, NULL, NULL, NULL, 0, 0, '', '2022-11-01 19:06:19', '', NULL, NULL);
INSERT INTO `user` VALUES (1614164971296526336, '10f5477e16ac42c9b41a1a24df507344', '习惯性想你', NULL, NULL, '15368714206', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '1', 'olLW56SPiYjul8ZPnyjGd9_AHwzs', 'U/12weiTPA7CNHyqDnXiOQ==', NULL, NULL, 0, 0, '', '2023-01-14 15:38:14', '', '2023-01-14 15:38:22', NULL);

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
INSERT INTO `user_account` VALUES (1587399166237339650, 1587399165414084608, 'c0db8b3c91d5bf22646cd1252b768357', 'ccb104e80e364a77952caf1def20a797', '102234fd16214ac59cfa732c39da79bd', 'EZVMAXOL', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 566521.0000, 0.0000, 0, 0, '', '2022-11-01 19:00:28', NULL, NULL);
INSERT INTO `user_account` VALUES (1587400634373763073, 1587400633995104256, 'eeca1af23504d95b8bbe1043bfa1ad6a', 'dac071e4f2604729ac676ed4c782dc8d', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-01 19:06:18', NULL, NULL);
INSERT INTO `user_account` VALUES (1587400634768027649, 1587400633995104256, 'eeca1af23504d95b8bbe1043bfa1ad6a', 'a8fd4690e03b4398a62395eee0afa597', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2022-11-01 19:06:18', NULL, NULL);
INSERT INTO `user_account` VALUES (1614164971721322497, 1614164971296526336, NULL, '2b7a4026dec640b9b22d064be46434a3', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2023-01-14 15:38:14', NULL, NULL);
INSERT INTO `user_account` VALUES (1614164972107198466, 1614164971296526336, NULL, 'cc0696bea5c44d9391a7197b6e84125a', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0, 0, '', '2023-01-14 15:38:14', NULL, NULL);

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
