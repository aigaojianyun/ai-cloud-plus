/*
 Navicat Premium Data Transfer

 Source Server         : cloud-mysql
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 127.0.0.1:3306
 Source Schema         : ai-cloud

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 21/03/2023 15:42:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ai_bank
-- ----------------------------
DROP TABLE IF EXISTS `ai_bank`;
CREATE TABLE `ai_bank`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '银行名称',
  `bank_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'icon',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `bank_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '银行信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ai_bank
-- ----------------------------
INSERT INTO `ai_bank` VALUES (1, '中国工商', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/bank/yinhang-gongshang.png', 0, '', NULL, 'ceshi', '2023-03-21 14:35:59', NULL);
INSERT INTO `ai_bank` VALUES (2, '中国农业', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/bank/yinhang-nonghang.png', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_bank` VALUES (3, '中国银行', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/bank/yinhang-zhongguoyinhang.png', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_bank` VALUES (4, '中国建设', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/bank/yinhang-jianshe.png', 0, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for ai_continent
-- ----------------------------
DROP TABLE IF EXISTS `ai_continent`;
CREATE TABLE `ai_continent`  (
  `id` bigint NOT NULL COMMENT '自增id',
  `cn_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中文名',
  `en_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '区域七大洲表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ai_continent
-- ----------------------------
INSERT INTO `ai_continent` VALUES (1, '亚洲', 'Asia');
INSERT INTO `ai_continent` VALUES (2, '欧洲', 'Europe');
INSERT INTO `ai_continent` VALUES (3, '非洲', 'Africa');
INSERT INTO `ai_continent` VALUES (4, '大洋洲', 'Oceania');
INSERT INTO `ai_continent` VALUES (5, '南极洲', 'Antarctica');
INSERT INTO `ai_continent` VALUES (6, '北美洲', 'North America');
INSERT INTO `ai_continent` VALUES (7, '南美洲', 'South America');

-- ----------------------------
-- Table structure for ai_country
-- ----------------------------
DROP TABLE IF EXISTS `ai_country`;
CREATE TABLE `ai_country`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `continent_id` bigint NULL DEFAULT NULL COMMENT '七大洲对应的id',
  `cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名称',
  `country_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'icon',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区号',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '语言',
  `local_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当地货币缩写',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `cn_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '区域信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ai_country
-- ----------------------------
INSERT INTO `ai_country` VALUES (1, NULL, '中国大陆', 'China', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/China.png', '86', 'zh_CN', 'CNY', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (2, NULL, '中国台湾', 'Taiwan (台灣)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Taiwan.png', '886', 'zh_TW', 'TWD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (3, NULL, '中国澳门', 'Macau (澳門)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Macau.png', '853', 'zh_MO', 'MOP', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (4, NULL, '中国香港', 'Hong Kong (香港)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/HongKong.png', '852', 'zh_HK', 'HKD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (5, NULL, '丹麦', 'Denmark (Danmark)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Denmark.png', '45', 'da_DK', 'DKK', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (6, NULL, '以色列', 'Israel (ישראל‎)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Israel.png', '972', 'he_IL', 'AMD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (7, NULL, '伊朗', 'Iran', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Iran.png', '98', 'fa_IR', 'IRR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (8, NULL, '俄罗斯', 'Russia (Россия)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Russia.png', '7', 'ru_RU', 'RUB', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (9, NULL, '加拿大', 'Canada', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Canada.png', '1', 'fr_CA', 'CAD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (10, NULL, '南非', 'South Africa', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/SouthAfrica.png', '27', 'en_ZA', 'ZAR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (11, NULL, '卡塔尔', 'Qatar (قطر‎)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Qatar.png', '974', 'ar_QA', 'QAR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (12, NULL, '印度', 'India (भारत)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/India.png', '91', 'en_IN', 'INR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (13, NULL, '印度尼西亚', 'Indonesia', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Indonesia.png', '62', 'id_ID', 'IDR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (14, NULL, '哥伦比亚', 'Colombia', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Colombia.png', '57', 'es_CO', 'COP', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (15, NULL, '土耳其', 'Turkey (Türkiye)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Turkey.png', '90', 'en_US', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (16, NULL, '埃及', 'Egypt', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Egypt.png', '2', 'ar_EG', 'EGP', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (17, NULL, '墨西哥', 'Mexico (México)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Mexico.png', '52', 'es_MX', 'MXN', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (18, NULL, '奥地利', 'Austria (Österreich)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Austria.png', '43', 'de_AT', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (19, NULL, '孟加拉国', 'Bangladesh', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Bangladesh.png', '88', 'bn_BD', 'BDT', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (20, NULL, '尼日利亚', 'Nigeria', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Nigeria.png', '234', 'ha_Latn_NG', 'NGN', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (21, NULL, '巴西', 'Brazil (Brasil)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Brazil.png', '55', 'pt_BR', 'BRL', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (22, NULL, '希腊', 'Greece', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Greece.png', '3', 'el_GR', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (23, NULL, '德国', 'Germany (Deutschland)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Germany.png', '49', 'de_DE', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (24, NULL, '意大利', 'Italy (Italia)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Italy.png', '39', 'it_IT', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (25, NULL, '挪威', 'Norway (Norge)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Norway.png', '47', 'nb_NO', 'NOK', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (26, NULL, '新加坡', 'Singapore', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Singapore.png', '65', 'en_US', 'SGD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (27, NULL, '新西兰', 'NewZealand', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/NewZealand.png', '64', 'en_NZ', 'NZD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (28, NULL, '日本', 'Japan (日本)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Japan.png', '81', 'ja_JP', 'USD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (29, NULL, '智利', 'Chile', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Chile.png', '56', 'es_CL', 'CLP', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (30, NULL, '比利时', 'Belgium (België)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Belgium.png', '32', 'be_BY', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (31, NULL, '沙特阿拉伯', 'Saudi Arabia (المملكة العربية السعودية‎)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/SaudiArabia.png', '966', 'ar_SA', 'SAR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (32, NULL, '法国', 'France', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/France.png', '33', 'fr_FR', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (33, NULL, '波兰', 'Poland (Polska)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Poland.png', '48', 'pl_PL', 'PLN', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (34, NULL, '泰国', 'Thailand (ไทย)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Thailand.png', '66', 'en_US', 'USD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (35, NULL, '澳大利亚', 'Australia', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Australia.png', '61', 'en_AU', 'AUD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (36, NULL, '爱尔兰', 'Ireland', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Ireland.png', '353', 'en_IE', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (37, NULL, '瑞典', 'Sweden (Sverige)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Sweden.png', '46', 'sv_SE', 'SEK', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (38, NULL, '瑞士', 'Switzerland (Schweiz)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Switzerland.png', '41', 'de_CH', 'CHF', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (39, NULL, '白俄罗斯', 'Belarus', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Belarus.png', '375', 'be_BY', 'BYR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (40, NULL, '罗马尼亚', 'Romania', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Romania.png', '4', 'ro_RO', 'RON', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (41, NULL, '美国', 'America', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/America.png', '1', 'en_US', 'USD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (42, NULL, '芬兰', 'Finland (Suomi)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Finland.png', '358', 'fi_FI', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (43, NULL, '英国', 'United Kingdom', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/UnitedKingdom.png', '44', 'en_US', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (44, NULL, '荷兰', 'Netherlands (Nederland)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Netherlands.png', '31', 'nl_NL', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (45, NULL, '菲律宾', 'ThePhilippines', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/ThePhilippines.png', '63', 'en_PH', 'PHP', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (46, NULL, '葡萄牙', 'Portugal', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Portugal.png', '351', 'pt_PT', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (47, NULL, '西班牙', 'Spain (España)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Spain.png', '34', 'es_ES', 'EUR', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (48, NULL, '越南', 'Vietnam (Việt Nam)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Vietnam.png', '84', 'en_US', 'USD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (49, NULL, '阿拉伯', 'United Arab Emirates (الإمارات العربية المتحدة‎)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/UnitedArabEmirates.png', '971', 'ar_AE', 'AED', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (50, NULL, '阿根廷', 'Argentina', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Argentina.png', '54', 'es_AR', 'ARS', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (51, NULL, '韩国', 'South Korea (대한민국)', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/SouthKorea.png', '82', 'ko_KR', 'USD', 0, '', NULL, '', NULL, NULL);
INSERT INTO `ai_country` VALUES (52, NULL, '马来西亚', 'Malaysia', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/country/Malaysia.png', '60', 'en_US', 'EUR', 0, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for ai_country_v2
-- ----------------------------
DROP TABLE IF EXISTS `ai_country_v2`;
CREATE TABLE `ai_country_v2`  (
  `id` bigint NOT NULL COMMENT 'id',
  `continent_id` bigint NULL DEFAULT NULL COMMENT '七大洲对应的id',
  `full_cn_name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '中文全称名称，非缩写',
  `cn_name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '中文常用标准名称',
  `country_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'icon',
  `full_en_name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '英文名称全称',
  `en_name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '英文常用标准名称，主要用于显示',
  `lower_name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '英文标准名称的小写，主要用于搜索与比较',
  `country_code` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '英文代码,国家名称缩写',
  `language` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '语言',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区号',
  `local_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当地货币缩写',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT '备注，国家的一些说明',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '区域信息表v2' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ai_country_v2
-- ----------------------------
INSERT INTO `ai_country_v2` VALUES (1, 1, '新加坡共和国', '新加坡', NULL, 'Republic of Singapore', 'Singapore', 'republic of singapore', 'SGP', 'MS', NULL, NULL, 0, '新加坡，全称为新加坡共和国（英语： Republic of Singapore），旧称新嘉坡、星洲或星岛，别称为狮城，是东南亚的一个岛国，政治体制实行议会制共和制。新加坡北隔柔佛海峡与马来西亚为邻，南隔新加坡海峡与印度尼西亚相望，毗邻马六甲海峡南口，国土除新加坡岛之外，还包括周围数岛', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (2, 1, '大韩民国', '韩国', NULL, 'Republic of Korea', 'Korea', 'republic of korea', 'KOR', 'KO', NULL, NULL, 0, '韩国（谚文：한국），全称大韩民国，别称南韩或南朝鲜。位于东亚朝鲜半岛南部，总面积约10万平方公里（占朝鲜半岛总面积的45%），主体民族为朝鲜族（韩族），通用韩语（朝鲜语），总人口约5041.85万（2014年）。首都为首尔（旧称：汉城；谚文：서울）。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (3, 1, '阿拉伯叙利亚共和国', '叙利亚', NULL, 'The Syrian Arab Republic', 'Syrian', 'the syrian arab republic', 'SYR', 'HY', NULL, NULL, 0, '阿拉伯叙利亚共和国（英语：The Syrian Arab Republic），通称为叙利亚，位于亚洲西部，地中海东岸，北与土耳其接壤，东同伊拉克交界，南与约旦毗连，西南与黎巴嫩和巴勒斯坦（或以色列）为邻，西与塞浦路斯隔地中海相望，包括戈兰高地，全国总面积为185180平方公里。沿海和北部地区属亚热带地中海气候，南部地区属热带沙漠气候。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (4, 1, '乌兹别克斯坦共和国', '乌兹别克斯坦', NULL, 'The Republic of Uzbekistan', 'Uzbekstan', 'the republic of uzbekistan', 'UZB', 'UZ', NULL, NULL, 0, '乌兹别克斯坦共和国（乌兹别克语：Oʻzbekiston Respublikasi，英语：The Republic of Uzbekistan），简称乌兹别克斯坦，是一个位于中亚的内陆国家，1991年从前苏联独立。是世上两个双重内陆国之一（另一个为列支敦士登）', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (5, 1, '巴林王国', '巴林', NULL, 'The Kingdom of Bahrain', 'Bahrian', 'the kingdom of bahrain', 'BHR', 'AR', NULL, NULL, 0, '巴林王国（The Kingdom of Bahrain），简称巴林。巴林，西亚国家，位于亚洲西部，为波斯湾西南部的岛国，邻近卡塔尔和沙特阿拉伯之间，属热带沙漠气候，石油为国家经济的支柱。阿拉伯人约占60%，75~80%的居民住在城市里。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (6, 1, '日本国', '日本', NULL, 'Japan', 'Japan', 'japan', 'JPN', 'JA', NULL, NULL, 0, '日本（Japan），全称日本国，位于亚洲东部、太平洋西北部。国名意为“日出之国”，领土由北海道、本州、四国、九州四大岛及7200多个小岛组成，总面积37.8万平方千米。主体民族为和族，通用日语，总人口约1.26亿。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (7, 1, '约旦哈希姆王国', '约旦', NULL, 'The Hashemite Kingdom of Jordan', 'Jordan', 'the hashemite kingdom of jordan', 'JOR', 'HY', NULL, NULL, 0, '约旦是一个比较小的阿拉伯国家，但相对周边国家来说约旦政治经济和文化生活等方面稳定。约旦人民生活较为富裕，在伊斯兰国家中相对开放。约旦比较缺乏淡水资源，石油资源不丰富。旅游业是约旦支柱产业之一，佩特拉古城，死海和瓦迪拉姆沙漠等景点成为世界各国游客探险旅行和休闲度假的首选目的地。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (8, 1, '越南社会主义共和国', '越南', NULL, 'Socialist Republic of Vietnam', 'Vietnam', 'socialist republic of vietnam', 'VNM', 'VI', NULL, NULL, 0, '越南，全称为越南社会主义共和国（英语：Socialist Republic of Vietnam，越南语：Cộng hòa Xã hội Chủ nghĩa Việt Nam），是亚洲的一个社会主义国家。位于东南亚中南半岛东部，北与中国广西、云南接壤，西与老挝、柬埔寨交界，国土狭长，面积约33万平方公里，紧邻南海，海岸线长3260多公里，是以京族为主体的多民族国家。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (9, 1, '吉尔吉斯共和国', '吉尔吉斯斯坦', NULL, 'The Kyrgyz Republic', 'Kirghizia', 'the kyrgyz republic', 'KGZ', NULL, NULL, NULL, 0, '吉尔吉斯斯坦位于欧亚大陆的腹心地带，不仅是连接欧亚大陆和中东的要冲，还是大国势力东进西出、南下北上的必经之地。面积为19.85万平方公里，是位于中亚东北部的内陆国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (10, 1, '泰王国', '泰国', NULL, 'Kingdom of Thailand', 'Thailand', 'kingdom of thailand', 'THA', 'TH', NULL, NULL, 0, '泰王国（泰语：ราชอาณาจักรไทย），通称泰国（泰语：ประเทศไทย），是一个位于东南亚的君主立宪制国家。泰国位于中南半岛中部，其西部与北部和缅甸、安达曼海接壤，东北边是老挝，东南是柬埔寨，南边狭长的半岛与马来西亚相连。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (11, 1, '斯里兰卡民主社会主义共和国', '斯里兰卡', NULL, 'The Democratic Socialist Republic of Sri Lanka', 'Sri Lanka', 'the democratic socialist republic of sri lanka', 'LKA', 'SI', NULL, NULL, 0, '斯里兰卡，全称斯里兰卡民主社会主义共和国（The Democratic Socialist Republic of Sri Lanka）[1]  ，旧称锡兰，是个热带岛国，位于印度洋海上，英联邦成员国之一。中国古代曾经称其为狮子国、师子国、僧伽罗。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (12, 1, '阿拉伯联合酋长国', '阿联酋', NULL, 'The United Arab Emirates', 'United Arab Emirates', 'the united arab emirates', 'ARE', 'AR', NULL, NULL, 0, '阿拉伯联合酋长国（阿拉伯文：امارات عربية متحدة‎，英文：The United Arab Emirates），简称为阿联酋，位于阿拉伯半岛东部，北濒波斯湾，西北与卡塔尔为邻，西和南与沙特阿拉伯交界，东和东北与阿曼毗连海岸线长734公里，总面积83600平方公里，首都阿布扎比。[1] \n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (13, 1, '老挝人民民主共和国', '老挝', NULL, 'Lao People\'s Democratic Republic', 'Laos', 'lao people\'s democratic republic', 'LAO', 'HMN', NULL, NULL, 0, '老挝历史上曾是真腊王国的一部分。13至18世纪是南掌，之后受暹罗和越南入侵，后来又受法国入侵，1893年沦为法国殖民地。1945年独立，1975年废除君主制成立共和国。老挝是东南亚国家联盟成员国，也是最不发达国家之一，于1997年7月加入东盟。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (14, 1, '阿富汗斯坦伊斯兰共和国', '阿富汗', NULL, 'the Islamic Republic of Afghanistan', 'Afghanistan', 'the islamic republic of afghanistan', 'AFG', 'FA', NULL, NULL, 0, '阿富汗位于西亚、南亚和中亚交汇处，北接土库曼斯坦、乌兹别克斯坦和塔吉克斯坦，东北突出的狭长地带与中国接壤，东和东南与巴基斯坦毗邻，西与伊朗交界。[2] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (15, 1, '中华人民共和国澳门特别行政区', '中国澳门', NULL, 'Macau Macao', 'Macau', 'macau macao', 'MAC', 'ZH-TW', NULL, NULL, 0, '澳门是一个国际自由港，是世界人口密度最高的地区之一，也是世界四大赌城之一。其著名的轻工业、旅游业、酒店业和娱乐场使澳门长盛不衰，成为全球最发达、富裕的地区之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (16, 1, '塔吉克斯坦共和国', '塔吉克斯坦', NULL, 'The Republic of Tajikistan', 'Tajikistan', 'the republic of tajikistan', 'TJK', 'TG', NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (17, 1, '朝鲜民主主义人民共和国', '朝鲜', NULL, 'Democratic People\'s Republic of Korea', 'Korea,DPR', 'democratic people\'s republic of korea', 'PRK', 'KO', NULL, NULL, 0, '鲜民主主义人民共和国于第二次世界大战后的1948年9月9日成立，领土面积122762平方公里，人口2405万（2008年）。朝鲜族为单一民族，通用朝鲜语。朝鲜民主主义人民共和国1958年宣布完成了城市、农村生产关系的社会主义改造，建立了社会主义经济制度。1970年宣布实现了社会主义工业化。1975年5月，成为“七十七国集团”正式成员国，同年8月正式加入不结盟运动。1991年9月17日同韩国一起加入了联合国。2000年7月，加入东盟地区论坛（ARF）。与163个国家（含欧盟）建立了外交关系。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (18, 1, '巴勒斯坦国', '巴勒斯坦', NULL, 'The State of Palestine', 'Palestine', 'the state of palestine', 'PAL', 'AR', NULL, NULL, 0, '巴勒斯坦国（阿拉伯语：فلسطين‎‎，英语：Palestine）是中东的一个国家，由加沙和约旦河西岸两部分组成。加沙地区面积365平方公里，约旦河西岸地区面积5800平方公里。巴勒斯坦实际控制的土地面积为2500平方公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (19, 1, '中华人民共和国香港特别行政区', '中国香港', NULL, 'Hong Kong', 'Hong Kong', 'hong kong', 'HKG', 'ZH-TW', NULL, NULL, 0, '香港是全球高度繁荣的国际大都会之一，全境由香港岛、九龙半岛、新界等3大区域组成，管辖陆地总面积1104.32平方公里，截至2014年末，总人口约726.4万人，人口密度居全世界第三。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (20, 1, '伊拉克共和国', '伊拉克', NULL, 'Republic Of Iraq', 'Iraq', 'republic of iraq', 'IRQ', NULL, NULL, NULL, 0, '伊拉克共和国位于亚洲西南部，阿拉伯半岛东北部，与它接壤的国家众多，南方是沙特阿拉伯、科威特，北方是土耳其，西北是叙利亚，伊朗和约旦各位于其东西两侧。阿拉伯族占全国总人口的73%，库尔德族占21%。该国穆斯林占人口的95%，其中什叶派穆斯林占54%、逊尼派穆斯林占41%。官方语言为阿拉伯语，北部库尔德地区的官方语言是库尔德语，东部地区有些居民讲波斯语。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (21, 1, '黎巴嫩共和国', '黎巴嫩', NULL, 'The Republic of Lebanon', 'Lebanon', 'the republic of lebanon', 'LBN', 'AR', NULL, NULL, 0, '黎巴嫩共和国（阿拉伯语：لبنان；英文：Republic of Lebanon）位于亚洲西南部，地中海东部沿岸。黎巴嫩习惯上归入中东国家。该国东部和北部与叙利亚接壤，南部与以色列（或者巴勒斯坦，边界未划定）为邻，首都贝鲁特。黎巴嫩属热带地中海气候，沿海夏季炎热潮湿，冬季温暖。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (22, 1, '科威特国', '科威特', NULL, 'The State of Kuwait', 'Kuwait', 'the state of kuwait', 'KWT', 'AR', NULL, NULL, 0, '科威特的石油和天然气资源丰富。科威特的已探明石油储量940亿桶，约为世界总储量的10% 。石油、天然气工业为国民经济的支柱，其产值占国内生产总值的45%。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (23, 1, '文莱达鲁萨兰国', '文莱', NULL, 'Brunei Darussalam', 'Brunei', 'brunei darussalam', 'BRN', 'MS', NULL, NULL, 0, '文莱位于亚洲东南部，加里曼丹岛西北部，北濒中国南海，东南西三面与马来西亚的沙捞越州接壤，并被沙捞越州的林梦分隔为不相连的东西两部分。海岸线长约162公里，有33个岛屿，总面积为5765平方公里。属热带雨林气候', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (24, 1, '马尔代夫共和国', '马尔代夫', NULL, 'The Republic of Maldives', 'Maldives', 'the republic of maldives', 'MDV', NULL, NULL, NULL, 0, '马尔代夫全称：马尔代夫共和国（原名马尔代夫群岛，1968年11月改为现名[1]  ）位于南亚，是印度洋上的一个岛国，也是世界上最大的珊瑚岛国。由1200余个小珊瑚岛屿组成，其中202个岛屿有人居住，从空中鸟瞰就像一串珍珠撒在印度洋上。面积300平方公里（不计算领海），是亚洲最小的国家', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (25, 1, '印度尼西亚共和国', '印度尼西亚', NULL, 'The Republic of Indonesia', 'Indonesia', 'the republic of indonesia', 'IDN', 'ID', NULL, NULL, 0, '印度尼西亚共和国（印尼语：Republik Indonesia，英语：The Republic of Indonesia），简称印度尼西亚或印尼，是东南亚国家，首都为雅加达。印尼与巴布亚新几内亚、东帝汶和马来西亚等国家相接。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (26, 1, '以色列国', '以色列', NULL, 'The State of Israel', 'Israel', 'the state of israel', 'ISR', 'IW', NULL, NULL, 0, '以色列对于科学和科技的发展贡献相当大。自从建国以来，以色列一直致力于科学和工程学的技术研发，以色列的科学家在遗传学、计算机科学、光学、工程学、以及其他技术产业上的贡献都相当杰出。以色列的研发产业中最知名的是其军事科技产业，在农业、物理学和医学上的研发也十分知名。\n\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (27, 1, '蒙古国', '蒙古', NULL, 'Mongolia', 'Mongolia', 'mongolia', 'MNG', 'MN', NULL, NULL, 0, '蒙古，历史上曾被匈奴、鲜卑、柔然、突厥等游牧民族统治。1206年，成吉思汗建立了蒙古帝国；1271年，忽必烈建立元朝；17世纪末，被纳入清朝统治范围。1921年，取得事实独立。1924年，成立受前苏联控制的蒙古人民共和国。1992年2月改国名为“蒙古国”[2]  。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (28, 1, '阿曼苏丹国', '阿曼', NULL, 'Sultanate of Oman', 'Oman', 'sultanate of oman', 'OMN', 'AR', NULL, NULL, 0, '阿曼苏丹国（The Sultanate of Oman），简称为阿曼，位于亚洲西部的阿拉伯半岛东南部，它扼守着世界上最重要的石油输出通道——波斯湾和阿曼湾之间的霍尔木兹海峡。阿曼是阿拉伯半岛最古老的国家之一，公元前2000年已经广泛进行海上和陆路贸易活动，并成为阿拉伯半岛的造船中心。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (29, 1, '印度共和国', '印度', NULL, 'The Republic of India', 'India', 'the republic of india', 'IND', 'HI', NULL, NULL, 0, '印度是世界四大文明古国之一。公元前2500年至1500年之间创造了印度河文明。公元前1500年左右，原居住在中亚的雅利安人中的一支进入南亚次大陆，征服当地土著，建立了一些奴隶制小国，确立了种姓制度，婆罗门教兴起。公元前4世纪崛起的孔雀王朝统一印度，中世纪小国林立，印度教兴起。1600年英国侵入，建立东印度公司。1757年沦为英殖民地。1947年8月15日，印巴分治，印度独立。1950年1月26日，印度共和国成立，为英联邦成员国', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (30, 1, '缅甸联邦共和国', '缅甸', NULL, 'Republic Of The Union Of Myanmar', 'Myanmar', 'republic of the union of myanmar', 'MMR', 'MY', NULL, NULL, 0, '缅甸联邦共和国简称为缅甸，是东南亚国家联盟成员国之一。西南临安达曼海，西北与印度和孟加拉国为邻，东北靠中国，东南接泰国与老挝。首都为内比都。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (31, 1, '马来西亚联邦', '马来西亚', NULL, 'Malaysia', 'Malaysia', 'malaysia', 'MYS', 'MS', NULL, NULL, 0, '马来西亚，全称马来西亚联邦（Malaysia，前身马来亚），简称大马。马来西亚被南中国海分为两个部分：位于马来半岛的西马来西亚，北接泰国，南部隔着柔佛海峡，以新柔长堤和第二通道连接新加坡；东马来西亚，位于婆罗洲（加里曼丹岛）的北部，南接印度尼西亚，文莱国夹在沙巴州和砂拉越州之间。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (32, 1, '东帝汶民主共和国', '东帝汶', NULL, 'Democratic Republic of East Timor', 'East Timor', 'democratic republic of east timor', 'TMP', NULL, NULL, NULL, 0, '东帝汶全称东帝汶民主共和国（英语：Democratic Republic of Timor-Leste）是位于努沙登加拉群岛东端的岛国，包括帝汶岛东部和西部北海岸的欧库西地区以及附近的阿陶罗岛和东端的雅库岛。西与印尼西帝汶相接，南隔帝汶海与澳大利亚相望', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (33, 1, '也门共和国', '也门', NULL, 'The Republic of Yemen', 'Yemen', 'the republic of yemen', 'YEM', 'AR', NULL, NULL, 0, '也门有3000多年文字记载的历史，是阿拉伯世界古代文明摇篮之一。也门是世界上经济最不发达的国家之一，粮食不能自给，约1/2依靠进口。在夏季有着沙漠中常见的沙尘暴，而因过度放牧，沙漠化日渐严重。该国的棉花质量良好，每年有大量出口，咖啡种植面积也很大，占重要地位。近年，政府致力于减少预算赤字和政府开支，努力控制通货膨胀，稳定物价。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (34, 1, '不丹王国', '不丹', NULL, 'Kingdom of Bhutan', 'Bhutan', 'kingdom of bhutan', 'BTN', NULL, NULL, NULL, 0, '不丹自8世纪即为吐蕃一个部落，9世纪，不丹为独立部落。1772年，英国侵犯不丹。1865年11月，英国同不丹签订了《辛楚拉条约》，强迫不丹割让包括噶伦堡在内的第斯泰河以东约2000平方公里的地区。1907年建立不丹王国，乌颜·旺楚克成为世袭国王。1910年1月，英国和不丹又签订了《普那卡条约》，规定不丹对外关系接受英国的“指导”，1949年8月，印度和不丹签订《永久和平与友好条约》，规定不丹对外关系接受印度的“指导”。1971年成为联合国成员国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (35, 1, '柬埔寨王国', '柬埔寨', NULL, 'Kingdom of Cambodia', 'Cambodia', 'kingdom of cambodia', 'KHM', 'KM', NULL, NULL, 0, '柬埔寨全名柬埔寨王国（Kingdom of Cambodia）[1]  ，通称柬埔寨，旧称高棉，位于中南半岛，西部及西北部与泰国接壤，东北部与老挝交界，东部及东南部与越南毗邻，南部则面向暹罗湾。柬埔寨领土为碟状盆地，三面被丘陵与山脉环绕，中部为广阔而富庶的平原，占全国面积四分之三以上。境内有湄公河和东南亚最大的淡水湖－洞里萨湖（又称金边湖），首都金边。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (36, 1, '巴基斯坦伊斯兰共和国', '巴基斯坦', NULL, 'the Islamic Republic of Pakistan', 'Pakistan', 'the islamic republic of pakistan', 'PAK', 'UR', NULL, NULL, 0, '巴基斯坦位于南亚次大陆西北部，南濒阿拉伯海，东接印度，东北邻中国，西北与阿富汗交界，西邻伊朗。海岸线长980公里。南部属热带气候，其余属亚热带气候。首都伊斯兰堡，前首都卡拉奇是最大城市。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (37, 1, '孟加拉人民共和国', '孟加拉国', NULL, 'People\'s Republic of Bangladesh', 'Bangladesh', 'people\'s republic of bangladesh', 'BGD', 'BN', NULL, NULL, 0, '孟加拉族是南亚次大陆古老民族之一。孟加拉地区的最早居民是亚澳人。1757年，孟加拉国沦为英属印度的一个省，1947年印巴分治后，归属巴基斯坦，被称为东巴基斯坦。1971年，脱离巴基斯坦而独立。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (38, 1, '沙特阿拉伯王国', '沙特阿拉伯', NULL, 'Kingdom of Saudi Arabia', 'Saudi Arabia', 'kingdom of saudi arabia', 'SAU', 'AR', NULL, NULL, 0, '沙特是名副其实的“石油王国”，石油储量和产量均居世界首位，使其成为世界上最富裕的国家之一。[1]  沙特是世界上最大的淡化海水生产国，其海水淡化量占世界总量的21%左右。沙特实行自由经济政策。麦加是伊斯兰教创建人穆罕默德的诞生地，是伊斯兰教徒朝觐圣地。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (39, 1, '土库曼斯坦', '土库曼斯坦', NULL, 'Turkmenistan', 'Turkmenistan', 'turkmenistan', 'TKM', NULL, NULL, NULL, 0, '土库曼斯坦（英语：Turkmenistan）是一个中亚国家，曾是前苏联加盟共和国之一，苏联时期的名称为土库曼苏维埃社会主义共和国，1991年独立。该国位于伊朗以北，东南面和阿富汗接壤、东北面与乌兹别克斯坦为邻、西北面是哈萨克斯坦，西邻里海，是一个内陆国家。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (40, 1, '卡塔尔国', '卡塔尔', NULL, 'The State of Qatar', 'Qatar', 'the state of qatar', 'QAT', 'AR', NULL, NULL, 0, '卡塔尔拥有相当丰富的石油和天然气资源，天然气的总储量为全世界第三名。20世纪40年代，石油储量的发现，完全改变了整个国家的经济。拥有很高的生活水准，有许多提供给国民的社会福利，例如免费的医疗服务。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (41, 1, '尼泊尔联邦民主共和国', '尼泊尔', NULL, 'Federal Democratic Republic of Nepal', 'Nepal', 'federal democratic republic of nepal', 'NPL', 'NE', NULL, NULL, 0, '尼泊尔联邦民主共和国（Federal Democratic Republic of Nepal），简称尼泊尔，为南亚山区内陆国家，是世界三大宗教之一佛教的发源地，位于喜马拉雅山脉南麓，北与中华人民共和国西藏自治区相接，东与印度共和国锡金邦为邻，西部和南部与印度共和国西孟加拉邦、比哈尔邦、北方邦和北阿坎德邦接壤。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (42, 1, '哈萨克斯坦共和国', '哈萨克斯坦', NULL, 'The Republic of Kazakhstan', 'Kazakhstan', 'the republic of kazakhstan', 'KAZ', 'KK', NULL, NULL, 0, '哈萨克斯坦原为苏联加盟共和国之一，在1991年12月16日宣布独立。与俄罗斯、中国、吉尔吉斯斯坦、乌兹别克斯坦、土库曼斯坦等国接壤，并与伊朗、阿塞拜疆隔里海相望，国土面积排名世界第九位。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (43, 1, '菲律宾共和国', '菲律宾', NULL, 'Republic of the Philippines', 'Philippines', 'republic of the philippines', 'PHL', 'TL', NULL, NULL, 0, '菲律宾人的祖先是亚洲大陆的移民。在14世纪前后，建立了海上强国苏禄王国。1565年，西班牙侵占菲律宾，统治菲300多年。1898年美国占领菲律宾。1942年，日本占领菲律宾。二战后，菲重新沦为美国殖民地。1946年，菲律宾独立', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (44, 1, '中国台湾', '中国台湾', NULL, 'Taiwan', 'Taiwan', 'taiwan', 'TWN', 'ZH-TW', NULL, NULL, 0, '台湾（Taiwan）位于中国大陆东南沿海的大陆架上，东临太平洋，[1]  东北邻琉球群岛，[2]  南界巴士海峡与菲律宾群岛相对，[3]  西隔台湾海峡与福建省相望，[4-5]  总面积约3.6万平方千米，包括台湾岛及兰屿、绿岛、钓鱼岛等21个附属岛屿和澎湖列岛64个岛屿。台湾岛面积35882.6258平方千米，[6]  是中国第一大岛，[7]  7成为山地与丘陵，平原主要集中于西部沿海，地形海拔变化大。由于地处热带及亚热带气候之交界，自然景观与生态资源丰富多元。人口约2350万，逾7成集中于西部5大都会区，[8]  其中以首要都市台北为中心的台北都会区最大。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (45, 1, '中华人民共和国', '中国', NULL, 'People\'s Republic of China', 'China', 'people\'s republic of china', 'CHN', 'ZH-CN', NULL, NULL, 0, '中国是四大文明古国之一，[18-19]  有着悠久的历史文化，是世界国土面积第三大的国家，[20-21]  世界第一大人口国，与英、法、美、俄并为联合国安理会五大常任理事国。中国是世界第二大经济体，[22-23]  世界第一贸易大国，[24]  世界第一大外汇储备国，[25]  世界第一大钢铁生产国和世界第一大农业国，[26-27]  世界第一大粮食总产量国以及世界上经济成长最快的国家之一。[28-29]  第二大吸引外资国，[30]  还是世界许多国际组织的重要成员，[31]  被认为是潜在超级大国之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (46, 1, '伊朗伊斯兰共和国', '伊朗', NULL, 'The Islamic Republic of Iran', 'Iran', 'the islamic republic of iran', 'IRN', 'FA', NULL, NULL, 0, '伊朗是亚洲主要经济体之一，经济实力较强。伊朗经济以石油开采业为主，为世界石油天然气大国，地处世界石油天然气最丰富的中东地区，石油出口是经济命脉，石油生产能力和石油出口量分别位于世界第四位和第二位，是石油输出国组织成员。伊朗的石油化工、钢铁、汽车制造业发达，还有电子工业、核工业、计算机软硬件业。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (47, 1, '土耳其共和国', '土耳其', NULL, 'The Republic of Turkey', 'Turkey', 'the republic of turkey', 'TUR', 'TR', NULL, NULL, 0, '土耳其共和国（土耳其文：Türkiye Cumhuriyeti，英语：The Republic of Turkey）是一个横跨欧亚两洲的国家，北临黑海，南临地中海，东南与叙利亚、伊拉克接壤，西临爱琴海，并与希腊以及保加利亚接壤，东部与格鲁吉亚、亚美尼亚、阿塞拜疆和伊朗接壤。土耳其地理位置和地缘政治战略意义极为重要，是连接欧亚的十字路口。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (48, 2, '格鲁吉亚', '格鲁吉亚', NULL, 'Georgia', 'Georgia', 'georgia', 'GEO', 'KA', NULL, NULL, 0, '格鲁吉亚（英语：Georgia，格鲁吉亚语：საქართველო，罗马化：Sakartvelo）位于亚洲西南部高加索地区的黑海沿岸，北邻俄罗斯，南部与土耳其、亚美尼亚、阿塞拜疆接壤。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (49, 2, '亚美尼亚共和国', '亚美尼亚', NULL, 'The Republic of Armenia', 'Armenia', 'the republic of armenia', 'ARM', 'HY', NULL, NULL, 0, '亚美尼亚共和国（英语：Republic of Armenia），简称亚美尼亚。是一个位于欧亚交界高加索地区的国家，也是在苏联解体之后独立的众多共和国之一，首都为埃里温。亚美尼亚族占93.3%，其他有俄罗斯人、乌克兰人、库尔德人、亚述人、希腊人等。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (50, 2, '阿塞拜疆共和国', '阿塞拜疆', NULL, 'The Republic of Azerbaijan', 'Azerbaijan', 'the republic of azerbaijan', 'AZE', 'AZ', NULL, NULL, 0, '阿塞拜疆共和国（阿塞拜疆语：Azərbaycan Respublikası）简称阿塞拜疆（英语发音：/ˌæzərbaɪˈdʒɑːn/ AZ-ər-by-JAHN; 阿塞拜疆语：Azərbaycan），国名意为“火的国家”，是东欧和西亚的“十字路口”。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (51, 2, '白俄罗斯共和国', '白俄罗斯', NULL, 'The Republic of Belarus', ' Belarus', 'the republic of belarus', 'BLR', 'BE', NULL, NULL, 0, '白俄罗斯全称白俄罗斯共和国（白俄罗斯语：Рэспубліка Беларусь，英语：The Republic of Belarus）是位于东欧平原的内陆国家，东北部与俄罗斯联邦为邻，南与乌克兰接壤，西同波兰相连，西北部与立陶宛和拉脱维亚毗邻。首都明斯克。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (52, 2, '俄罗斯联邦', '俄罗斯联邦', NULL, 'Russian Federation', 'Russia', 'russian federation', 'RUS', 'RU', NULL, NULL, 0, '俄罗斯联邦（俄语：Российская Федерация，英语：The Russian Federation），通称俄罗斯（俄国为俄罗斯帝国的简称），是由22个自治共和国、46个州、9个边疆区、4个自治区、1个自治州、3个联邦直辖市组成的联邦共和立宪制国家。[1]  国旗为白、蓝、红三色旗。国徽主体为双头鹰图案。俄罗斯位于欧亚大陆北部，地跨欧亚两大洲，国土面积为1707.54万平方公里，是世界上面积最大的国家。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (53, 2, '乌克兰', '乌克兰', NULL, 'Ukraine', 'Ukraine', 'ukraine', 'UKR', 'UK', NULL, NULL, 0, '乌克兰（乌克兰文：УКРАЇНА）位于欧洲东部，是欧洲除俄罗斯外领土面积最大的国家。乌克兰是原苏联15个加盟共和国之一，是次于俄罗斯第二大加盟共和国。1991年苏联解体后，乌克兰独立。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (54, 2, '匈牙利', '匈牙利', NULL, 'Hungary', 'Hungary', 'hungary', 'HUN', 'HU', NULL, NULL, 0, '匈牙利（匈牙利文：Magyarország）是一个位于欧洲中部的内陆国家，与奥地利、斯洛伐克、乌克兰、罗马尼亚、塞尔维亚、克罗地亚和斯洛文尼亚接壤，截止2014年1月，全国总人口987.9万人，首都为布达佩斯。官方语言为匈牙利语，这是欧洲最广泛使用的非印欧语系语言。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (55, 2, '冰岛共和国', '冰岛', NULL, 'The Republic of Iceland', 'Iceland', 'the republic of iceland', 'ISL', 'IS', NULL, NULL, 0, '冰岛共和国（冰岛语：Ísland），简称冰岛，是北大西洋中的一个岛国，位于大西洋和北冰洋的交汇处，北欧五国之一，国土面积为10.3万平方千米，人口约为32万，是欧洲人口密度最小的国家。首都是雷克雅未克，也是冰岛的最大城市，首都附近的西南地区人口占全国的三分之二。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (56, 2, '马耳他共和国', '马耳他', NULL, 'Republic of Malta', 'Malta', 'republic of malta', 'MLT', 'MT', NULL, NULL, 0, '马耳他[1]  是位于地中海中部的岛国，有“地中海心脏”之称，是欧洲最著名的休闲度假地；他是欧亚非海运交通的枢纽。由于重要战略位置，马耳他在历史上曾为多个民族占领。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (57, 2, '摩纳哥公国', '摩纳哥', NULL, 'The Principality of Monaco', 'Monaco', 'the principality of monaco', 'MCO', 'FR', NULL, NULL, 0, '摩纳哥公国（法语：Principauté de Monaco，英语：The Principality of Monaco）是位于欧洲的一个城邦国家，是欧洲两个公国之一（另一个是列支敦士登），也是世界第二小的国家（面积最小的是梵蒂冈），总面积为1.98平方公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (58, 2, '挪威王国', '挪威', NULL, 'The Kingdom of Norway', 'Norway', 'the kingdom of norway', 'NOR', 'NO', NULL, NULL, 0, '挪威（挪威语：Norge 或Noreg），全称为挪威王国（挪威语：Kongeriket Norge或 Kongeriket Noreg）。 意为“通往北方之路”，北欧五国之一，位于斯堪的纳维亚半岛西部。挪威领土南北狭长，海岸线漫长曲折，沿海岛屿很多，被称为“万岛之国”，领土与瑞典、芬兰、俄罗斯接壤，领土还包括斯瓦尔巴群岛和扬马延岛。首都为奥斯陆。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (59, 2, '罗马尼亚', '罗马尼亚', NULL, 'Romania', 'Romania', 'romania', 'ROM', 'RO', NULL, NULL, 0, '罗马尼亚（罗马尼亚语：Lomânia）位于东南欧巴尔干半岛东北部。北和东北分别与乌克兰和摩尔多瓦为邻，南接保加利亚，西南和西北分别与塞尔维亚和匈牙利接壤，东南临黑海。面积238391平方公里，人口1994万（2014年12月）。首都布加勒斯特。[', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (60, 2, '圣马力诺共和国', '圣马力诺', NULL, 'The Republic of San Marino', 'San Marino', 'the republic of san marino', 'SMR', 'IT', NULL, NULL, 0, '圣马力诺共和国（意大利语：Repubblica di San Marino）是世界上袖珍国家之一，位于欧洲南部，意大利半岛东部，整个国家被意大利包围，是一个国中国。地形以中部的蒂塔诺山（海拔738米）为主体，丘陵由此向西南延展，东北部为平原，有圣马力诺河、马拉诺河等流经。属亚热带地中海式气候，总面积61.2平方公里，是欧洲第三小国', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (61, 2, '瑞典王国', '瑞典', NULL, 'The Kingdom of Sweden', 'Sweden', 'the kingdom of sweden', 'SWE', 'SV', NULL, NULL, 0, '瑞典（瑞典语：Sverige），全称瑞典王国(瑞典语：Konungariket Sverige)，是一个位于斯堪的纳维亚半岛的国家，北欧五国之一，首都为斯德哥尔摩。它西邻挪威，东北与芬兰接壤，西南濒临斯卡格拉克海峡和卡特加特海峡，东边为波罗的海与波的尼亚湾。瑞典与丹麦、德国、波兰、俄罗斯、立陶宛、拉脱维亚和爱沙尼亚隔海相望，海岸线长7624千米，总面积约45万平方公里，是北欧最大的国家。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (62, 2, '瑞士联邦', '瑞士', NULL, 'Swiss Confederation', 'Switzerland', 'swiss confederation', 'CHE', 'FR', NULL, NULL, 0, '瑞士，全称瑞士联邦（德语：Schweizerische Eidgenossenschaft 法语：Confédération suisse 意大利语：Confederazione Svizzera 罗曼什语：Confederaziun svizra），为中欧国家之一，划分为26个州。瑞士北邻德国，西邻法国，南邻意大利，东邻奥地利和列支敦士登。全境以高原和山地为主，有“欧洲屋脊”之称。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (63, 2, '爱沙尼亚共和国', '爱沙尼亚', NULL, 'Republic of Estonia', 'Estonia', 'republic of estonia', 'EST', 'ET', NULL, NULL, 0, '爱沙尼亚共和国是东欧波罗的海三国之一，波罗的海东岸，芬兰湾南岸，西南濒里加湾，南面和东面分别同拉脱维亚和俄罗斯接壤。1991年，继立陶宛独立后，宣布独立，首都为塔林。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (64, 2, '拉脱维亚共和国', '拉脱维亚', NULL, 'Republic of Latvia', 'Latvia', 'republic of latvia', 'LVA', 'LV', NULL, NULL, 0, '拉脱维亚共和国（拉脱维亚语：Latvijas Republika）。国名源自民族语，意为“铠甲”、“金属制的服装”，是一个位于欧洲东北部的议会共和制国家。西邻波罗的海，与在其北方的爱沙尼亚及在其南方的立陶宛共同称为波罗的海三国。东与俄罗斯、白俄罗斯二国相邻，全国总面积64589平方公里', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (65, 2, '立陶宛共和国', '立陶宛', NULL, 'The Republic of Lithuania', 'Lithuania', 'the republic of lithuania', 'LTU', 'LT', NULL, NULL, 0, '立陶宛全称：立陶宛共和国（立陶宛语：Lietuvos Respublika，英语：Republic of Lithuania）。位于波罗的海东岸，北界拉脱维亚，东南邻白俄罗斯，西南是俄罗斯的加里宁格勒州和波兰，首都维尔纽斯。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (66, 2, '摩尔多瓦共和国', '摩尔多瓦', NULL, 'The Republic of Moldova', 'Moldavia', 'the republic of moldova', 'MDA', 'RU', NULL, NULL, 0, '摩尔多瓦共和国（英文：The Republic of Moldova）是位于东南欧的内陆国，与罗马尼亚和乌克兰接壤，首都基希讷乌。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (67, 2, '斯洛文尼亚共和国', '斯洛文尼亚', NULL, 'The Republic of Slovenia', 'Slovenia', 'the republic of slovenia', 'SVN', 'SL', NULL, NULL, 0, '斯洛文尼亚（斯洛文尼亚语：Slovenia）是欧洲的一个发达国家，全称为斯洛文尼亚共和国，是欧盟成员国、北约（NATO）成员国、经合组织（OECD）成员国、欧洲申根国，2008年上半年任欧盟轮值主席国。[1]  斯洛文尼亚在东南欧经济转型国家当中人均GDP名列第一，同时该国也是世界贸易组织的创始会员国之一。该国位于阿尔卑斯山脉南麓，西邻意大利，西南濒临亚得里亚海，东部和南部被克罗地亚包围，东北邻匈牙利，北邻奥地利。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (68, 2, '捷克共和国', '捷克', NULL, 'The Czech Republic', 'Czech', 'the czech republic', 'CZE', 'CS', NULL, NULL, 0, '捷克全称：捷克共和国，是一个中欧地区的内陆国家，国土面积78866平方公里，原捷克斯洛伐克的西部，其前身为波希米亚王国和大摩拉维亚国，于1993年与斯洛伐克和平地分离。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (69, 2, '斯洛伐克共和国', '斯洛伐克', NULL, 'The Slovak Republic', 'Slovak', 'the slovak republic', 'SVK', 'SK', NULL, NULL, 0, '斯洛伐克共和国，简称斯洛伐克，是中欧的一个内陆国家，西北临捷克，北临波兰，东临乌克兰，南临匈牙利，西南临奥地利，原捷克斯洛伐克的东部，自1993年1月1日起，斯洛伐克成为独立主权国家。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (70, 2, '马其顿共和国', '马其顿', NULL, 'The Republic of Macedonia', 'Macedonia', 'the republic of macedonia', 'MKD', 'MK', NULL, NULL, 0, '马其顿共和国（Република Македониа），位于欧洲东南部巴尔干半岛。而马其顿地区包括从前南斯拉夫独立出来的马其顿共和国、希腊北部的马其顿地区(包括中马其顿、西马其顿、东马其顿-色雷斯)，以及保加利亚的西南角。马其顿共和国的主体民族是斯拉夫人的一支，与古代大希腊的马其顿王国（全盛时期又称亚历山大帝国）无关。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (71, 2, '波斯尼亚和黑塞哥维那', '波斯尼亚和黑塞哥维那', NULL, 'Bosnia and Herzegovina', 'Bosnia Hercegovina', 'bosnia and herzegovina', 'BIH', 'BS', NULL, NULL, 0, '波斯尼亚和黑塞哥维那位于原南斯拉夫中部，介于克罗地亚、塞尔维亚和黑山三个共和国之间，简称“波黑”，面积51129平方公里[1]  。1945年，南斯拉夫各族人民取得反法西斯战争胜利，成立南斯拉夫联邦人民共和国（1963年改称南斯拉夫社会主义联邦共和国），波黑成为其中的一员。首都萨拉热窝。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (72, 2, '梵蒂冈城国', '梵蒂冈城国', NULL, 'Vatican City State', 'Vatican City State', 'vatican city state', 'VAT', 'LA', NULL, NULL, 0, '梵蒂冈城国（拉丁语：Status Civitatis Vaticanae；意大利语：Stato della Città del Vaticano），简称梵蒂冈或梵蒂冈城，是一个独立的主权国家，由于四面都与意大利接壤，故称“国中国”。同时也是全世界天主教的中心——以教宗为首的教廷的所在地，是世界六分之一人口的信仰中心。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (73, 2, '尼德兰王国', '荷兰', NULL, 'The Kingdom of Netherlands', 'Netherlands', 'the kingdom of netherlands', 'NLD', 'NL', NULL, NULL, 0, '荷兰（荷兰语:Nederland），本称尼德兰王国，因其荷兰省最为出名，故称荷兰（Holland）多被世界称为荷兰。位于欧洲西偏北部，是著名的亚欧大陆桥的欧洲始发点。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (74, 2, '克罗地亚共和国', '克罗地亚', NULL, 'The Republic of Croatia', 'Croatia', 'the republic of croatia', 'HRV', 'HR', NULL, NULL, 0, '克罗地亚为高收入市场经济体。克罗地亚经济以第三产业为主，第二产业为副，旅游业是国家经济的重要组成部分。克罗地亚是原南地区经济较为发达的国家，经济基础良好，旅游、建筑、造船和制药等产业发展水平较高。足球和网球并列为克罗地亚的第一运动。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (75, 2, '希腊共和国', '希腊', NULL, 'The Hellenic Republic', 'Greece', 'the hellenic republic', 'GRC', 'EL', NULL, NULL, 0, '希腊共和国（希腊语：Ελληνική Δημοκρατία），通称希腊（希腊语：Ελλάδα），是地处欧洲东南角、巴尔干半岛的南端的共和制国家。全国由半岛南部的伯罗奔尼撒半岛和爱琴海中的3000余座岛屿共同构成。希腊为连接欧亚非的战略要地，本土从西北至正北部分别邻阿尔巴尼亚、马其顿、保加利亚三国，东北与土耳其国境接壤。周围则自东而西分别濒临爱琴海、地中海本域与伊奥尼亚海。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (76, 2, '爱尔兰共和国', '爱尔兰', NULL, 'The Republic of Ireland', 'Ireland', 'the republic of ireland', 'IRL', 'GA', NULL, NULL, 0, '爱尔兰（爱尔兰语：Poblacht na hÉireann；英语：Republic of Ireland）， 是一个西欧的议会共和制国家，西临大西洋，东靠爱尔兰海，与英国隔海相望，是北美通向欧洲的通道，爱尔兰自然环境保持得相当好，素有“翡翠岛国”之称，全国绿树成荫，河流纵横。草地遍布，所以又有“绿岛”和“绿宝石”之称。它的大学教育非常成熟，首都都柏林自中世纪起就被誉为大学城。国内气候温和，各地的气温相对均衡。5~6月份是一年中阳光最充足的时期，比较适宜旅行。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (77, 2, '比利时王国', '比利时', NULL, 'The Kingdom Of Belgium', 'Belgium', 'the kingdom of belgium', 'BEL', 'FR', NULL, NULL, 0, '比利时王国简称比利时，位于欧洲西部沿海，东与德国接壤，北与荷兰比邻，南与法国交界，东南与卢森堡毗连，西临北海与英国隔海相望。海岸线长66.5公里。全国面积2/3为丘陵和平坦低地，全境分为西北部沿海佛兰德伦平原、中部丘陵、东南部阿登高原三部分，最高点海拔694米，主要河流有马斯河和埃斯考河，属海洋温带阔叶林气候，四季明显', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (78, 2, '塞浦路斯共和国', '塞浦路斯', NULL, 'the Republic of Cyprus', 'Cyprus', 'the republic of cyprus', 'CYP', 'EL', NULL, NULL, 0, '塞浦路斯，是位于欧洲与亚洲交界处的一个岛国，位于地中海东部，亦为地中海地区最热门的旅游地之一。塞浦路斯扼守欧洲、亚洲和非洲的海上要道，战略位置十分重要，因此欧美国家对于该区域的军事部署高度关注。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (79, 2, '丹麦王国', '丹麦', NULL, 'The Kingdom of Denmark', 'Denmark', 'the kingdom of denmark', 'DNK', 'DA', NULL, NULL, 0, '丹麦王国（丹麦语：Kongeriget Danmark，旧译为“嗹（lián）国”、“嗹马”[1]  ），简称丹麦，为北欧五国之一，是一个君主立宪制国家，拥有两个自治领地，一个是法罗群岛，另外一个是格陵兰岛。丹麦本土则包括日德兰半岛、菲因岛、西兰岛及附近岛屿，北部隔北海和波罗的海与瑞典和挪威相望，南部与德国接壤，首都兼第一大城市是哥本哈根。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (80, 2, '大不列颠及北爱尔兰联合王国', '英国', NULL, 'The United Kingdom of Great Britain and Northern Ireland', 'United Kingdom', 'the united kingdom of great britain and northern ireland', 'ENG', 'EN', NULL, NULL, 0, '英国由大不列颠岛上的英格兰、威尔士和苏格兰，爱尔兰岛东北部的北爱尔兰以及一系列附属岛屿共同组成的一个西欧岛国。除本土之外，其还拥有十四个海外领地[1]  ，总人口超过6400万，以英格兰人（盎格鲁-撒克逊人）为主体民族。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (81, 2, '德意志联邦共和国', '德国', NULL, 'The Federal Republic of Germany', 'Germany', 'the federal republic of germany', 'DEU', 'DE', NULL, NULL, 0, '德国是一个高度发达的资本主义国家。欧洲四大经济体之一，其社会保障制度完善，国民具有极高的生活水平。德国在基础科学与应用研究方面十分发达，以理学、工程技术而闻名的科研机构和发达的职业教育支撑了德国的科学技术和经济发展。以汽车和精密机床为代表的高端制造业，也是德国的重要象征。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (82, 2, '法兰西共和国', '法国', NULL, 'The French Republic', 'France', 'the french republic', 'FRA', 'FR', NULL, NULL, 0, '法国为欧洲国土面积第三大、西欧面积最大的国家，东与比利时、卢森堡、德国、瑞士、意大利接壤，南与西班牙、安道尔、摩纳哥接壤。本土地势东南高西北低，大致呈六边形，三面临水，南临地中海，西濒大西洋，西北隔英吉利海峡与英国相望，科西嘉岛是法国最大岛屿。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (83, 2, '意大利共和国', '意大利', NULL, 'The Republic of Italy', 'Italy', 'the republic of italy', 'ITA', 'IT', NULL, NULL, 0, '意大利（意大利语：Italia），全称意大利共和国(意大利语：Repubblica Italiana)，是一个欧洲国家，主要由南欧的亚平宁半岛及两个位于地中海中的岛屿西西里岛与萨丁岛所组成。国土面积为301333平方公里，人口6002万。北方的阿尔卑斯山地区与法国、瑞士、奥地利以及斯洛文尼亚接壤，其领土还包围着两个微型国家——圣马力诺与梵蒂冈[', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (84, 2, '卢森堡大公国', '卢森堡', NULL, 'The Grand Duchy of Luxembourg', 'Luxembourg', 'the grand duchy of luxembourg', 'LUX', 'FR', NULL, NULL, 0, '卢森堡是一个高度发达的资本主义国家，欧盟和北约创始成员国之一，也是高度发达的工业国家，还是欧元区内最重要的私人银行中心，及全球第二大仅次于美国的投资信托中心。金融、广播电视、钢铁是其三大经济支柱产业[1]  ，该国失业率极低，人均寿命80岁。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (85, 2, '葡萄牙共和国', '葡萄牙', NULL, 'Portugal,the Portuguese Republic', 'Portugal', 'portugal,the portuguese republic', 'PRT', 'PT', NULL, NULL, 0, '葡萄牙（Portugal），全称为葡萄牙共和国（葡萄牙语：República Portuguesa），是一个位于欧洲西南部的共和制国家。东邻同处于伊比利亚半岛的西班牙，葡萄牙的西部和南部是大西洋的海岸。除了欧洲大陆的领土以外，大西洋的亚速群岛和马德拉群岛也是葡萄牙领土。葡萄牙首都里斯本以西的罗卡角是欧洲大陆的最西端。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (86, 2, '波兰共和国', '波兰', NULL, 'The Republic of Poland', 'Poland', 'the republic of poland', 'POL', 'PL', NULL, NULL, 0, '历史上曾是欧洲强国，后国力衰退，并于俄普奥三次瓜分波兰中亡国几个世纪，一战后复国，但不久又在二战中被苏联和德国瓜分，冷战时期处于苏联势力范围之下，苏联解体后，加入欧盟和北约，近年来波兰无论在欧盟还是在国际舞台的地位亦与日俱增，自1918年11月11日恢复独立以来，经过90年的发展变迁，特别是在21世纪初的几年里，波兰在欧洲的重要性越来越引人重视。[2] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (87, 2, '西班牙王国', '西班牙', NULL, 'The Kingdom of Spain', 'Spain', 'the kingdom of spain', 'ESP', 'ES', NULL, NULL, 0, '西班牙是一个高度发达的资本主义国家，是欧盟和北约成员国，还是欧元区第四大经济体，国内生产总值（GDP）居欧洲国家第6名，世界排名第13。[3]  也是世界上最大的汽车生产国之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (88, 2, '阿尔巴尼亚共和国', '阿尔巴尼亚', NULL, 'The Republic of Albania', 'Albania', 'the republic of albania', 'ALB', 'SQ', NULL, NULL, 0, '阿尔巴尼亚位于东南欧巴尔干半岛西岸，北接塞尔维亚与黑山，东北与马其顿相连，东南邻希腊，西濒亚得里亚海和伊奥尼亚海，隔奥特朗托海峡与意大利相望。海岸线长472公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (89, 2, '安道尔公国', '安道尔', NULL, 'The Principality of Andorra', 'Andorra', 'the principality of andorra', 'AND', 'CA', NULL, NULL, 0, '安道尔，全称安道尔公国（英语：The Principality of Andorra，法语：La Principauté d\'Andorre，西班牙语：El Principado de Andorra），是位于西南欧法国和西班牙交界处的内陆国，为9世纪时查理曼帝国为防范摩尔人的骚扰而在西班牙边境地带建立的小缓冲国，是世界袖珍国家之一，国土总面积468平方公里，下设7个行政区。2015年，该国总人口85458人。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (90, 2, '列支敦士登公国', '列支敦士登', NULL, 'Principality of Liechtenstein', 'Liechtenstein', 'principality of liechtenstein', 'LIE', NULL, NULL, NULL, 0, '列支敦士登坐落于欧洲阿尔卑斯山地的莱茵河谷，其西边以莱茵河为边界与瑞士相邻，东侧则以属于阿尔卑斯山脉的山岭地带与奥地利为界。全国只有西侧约三分之一的面积位在平坦的河谷里，其余地区大都属于山地。境内有一个唯一的天然湖：Gampriner Seele湖。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (91, 2, '塞尔维亚和黑山', '塞黑', NULL, 'Serbia and Montenegro', 'Serbia and Montenegro', 'serbia and montenegro', 'S&M', 'SR', NULL, NULL, 0, '塞尔维亚和黑山，简称塞黑，为前南斯拉夫余下没有独立的塞尔维亚和黑山两个共和国于2003年至2006年组成的松散联邦国家。塞黑两国于1992年首先组成南斯拉夫联盟共和国，该联邦后于2003年2 月4日重组并改名为“塞尔维亚和黑山”。2006年5月21日，黑山举行独立公投，独派以微弱的优势获胜，6月3日黑山议会正式宣布独立，6月5日塞尔维亚国会宣布继承原塞尔维亚和黑山国家共同体的国际法主体地位，塞黑联邦因而解体为塞尔维亚共和国和黑山共和国两个主权国家。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (92, 2, '奥地利共和国', '奥地利', NULL, 'The Republic Of Austria', 'Austria', 'the republic of austria', 'AUT', 'DE', NULL, NULL, 0, '奥地利共和国（ 德语：Republik Österreich，英语：The Republic of Austria），简称奥地利（Austria），是一个位于欧洲中部的议会制共和制制国家，下含九个联邦州，作为一个内陆国家，与多国接壤，东邻是匈牙利和斯洛伐克，南邻意大利和斯洛文尼亚，西邻列支敦士登和瑞士，北邻德国和捷克。首都兼最大城市是维也纳，人口超过170万，国土面积83855平方千米。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (93, 2, '保加利亚共和国', '保加利亚', NULL, 'The Republic of Bulgaria', 'Bulgaria', 'the republic of bulgaria', 'BGR', 'BG', NULL, NULL, 0, '保加利亚，国土面积为110910平方公里。2013年，人口总量为7588570人。1990年2月27日将3月3日摆脱奥斯曼帝国统治纪念日定为国庆日，1990年11月15日，保加利亚改国名为保加利亚共和国。1991年7月12日通过的宪法规定，定为议会制国家。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (94, 2, '芬兰共和国', '芬兰', NULL, 'The Republic of Finland', 'Finland', 'the republic of finland', 'FIN', 'FI', NULL, NULL, 0, '芬兰是一个高度发达的资本主义国家，也是一个高度工业化、自由化的市场经济体，芬兰是欧盟成员国之一，但人均产出远高于欧盟平均水平，与其邻国瑞典相当。国民享有极高标准的生活品质，芬兰政府公务员清廉高效，并且在社会形成广泛共识。监督世界各国腐败行为的非政府组织“透明国际”公布2012年全球清廉指数报告，在176个国家和地区中，芬兰名列第一，为最清廉国家。[2] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (95, 2, '直布罗陀', '直布罗陀', NULL, 'Gibraltar', 'Gibraltar', 'gibraltar', 'GIB', NULL, NULL, NULL, 0, '直布罗陀（Gibraltar），欧洲伊比利亚半岛南端的城市和港口。在直布罗陀海峡东端的北岸，扼大西洋和地中海交通咽喉，南对西班牙的北非属地休达市，战略地位十分重要。直布罗陀海峡长90公里，宽12公里至43公里，是大西洋和地中海之间唯一的海上通道。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (96, 2, '芬兰奥兰群岛', '奥兰群岛', NULL, 'Aland Island,Ahvenanmaa', 'Aland Islands', 'aiand island ahvenanmaa', 'AX', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (97, 2, '法国圣巴托洛缪岛', '圣巴托洛缪岛', NULL, 'Collectivitéde Saint-Barthélemy', 'Saint Barthélemy', 'collectivitéde saint-barthélemy', 'BL', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (98, 2, '荷兰博内尔岛、圣尤斯特歇斯岛和萨巴岛', '博内尔岛、圣尤斯特歇斯岛和萨巴岛', NULL, 'Bonaire, Sint Eustatius and Saba', 'Bonaire, Sint Eustatius and Saba', 'bonaire, sint eustatius and saba', 'BQ', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (99, 2, '挪威布韦岛', '布韦岛', NULL, 'Bouvet Island', 'Bouvet Island', 'bouvet island', 'BV', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (100, 2, '荷兰库拉索', '库拉索', NULL, 'Curaçao', 'Curaçao', 'curaçao', 'CW', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (101, 2, '英国福克兰群岛(马尔维纳斯)', '福克兰群岛(马尔维纳斯)', NULL, 'Falkland Islands (Malvinas)', 'Falkland Islands (Malvinas)', 'falkland islands (malvinas)', 'FK', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (102, 2, '丹麦法罗群岛', '法罗群岛', NULL, 'Faroe Islands', 'Faroe Islands', 'faroe islands', 'FO', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (103, 2, '法国法属圭亚那', '法属圭亚那', NULL, 'French Guiana', 'French Guiana', 'french guiana', 'GF', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (104, 2, '英国根西岛', '根西岛', NULL, 'Bailiwick of Guernsey', 'Guernsey', 'bailiwick of guernsey', 'GG', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (105, 2, '英国南乔治亚岛和南桑威奇群岛', '南乔治亚岛和南桑威奇群岛', NULL, 'South Georgia and The South Sandwich Islands', 'South Georgia and The South Sandwich Islands', 'south georgia and the south sandwich islands', 'GS', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (106, 2, '英国英属马恩岛', '英属马恩岛', NULL, 'Isle Of Man', 'Isle Of Man', 'isle of man', 'IM', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (107, 2, '英国英属印度洋领地', '英属印度洋领地', NULL, 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'british indian ocean territory', 'IO', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (108, 2, '英国泽西岛', '泽西岛', NULL, 'Jersey', 'Jersey', 'jersey', 'JE', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (109, 2, '英国圣卢西亚', '圣卢西亚', NULL, 'Saint Lucia , St. Lucia', 'Saint Lucia', 'saint lucia , st. lucia', 'LC', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (110, 2, '法国圣马丁岛', '圣马丁岛', NULL, 'Saint Martin', 'Saint Martin', 'saint martin', 'MF', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (111, 2, '法国圣皮埃尔和密克隆群岛', '圣皮埃尔和密克隆群岛', NULL, 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'saint pierre and miquelon', 'PM', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (112, 2, '英国皮特凯恩群岛', '皮特凯恩群岛', NULL, 'Pitcairn Islands', 'Pitcairn Islands', 'pitcairn islands', 'PN', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (113, 2, '英国圣赫勒拿岛', '圣赫勒拿岛', NULL, 'Saint Helena', 'Saint Helena', 'saint helena', 'SH', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (114, 2, '挪威斯瓦尔巴群岛', '斯瓦尔巴群岛', NULL, 'Svalbard and Jan Mayen Islands', 'Svalbard and Jan Mayen Islands', 'svalbard and jan mayen islands', 'SJ', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (115, 2, '荷兰圣马丁岛', '圣马丁岛', NULL, 'Sint Maarten', 'Sint Maarten', 'sint maarten', 'SX', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (116, 2, '英国特克斯和凯科斯群岛', '特克斯和凯科斯群岛', NULL, 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'turks and caicos islands', 'TC', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (117, 2, '法国法属南部领地', '法属南部领地', NULL, 'French Southern Territories', 'French Southern Territories', 'french southern territories', 'TF', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (118, 2, '英国英属维尔京群岛', '英属维尔京群岛', NULL, 'The British Virgin Islands', 'The British Virgin Islands', 'the british virgin islands', 'VG', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (119, 2, '法国瓦利斯和富图纳群岛', '瓦利斯和富图纳群岛', NULL, 'Wallis and Futuna Islands', 'Wallis and Futuna Islands', 'wallis and futuna islands', 'WF', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (120, 2, '科索沃共和国', '科索沃', NULL, 'The Republic of Kosovo', 'Kosovo', 'the republic of kosovo', 'XK', 'SQ', NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (121, 3, '喀麦隆共和国', '喀麦隆', NULL, 'the Republic of Cameroon', 'Cameroon', 'the republic of cameroon', 'CMR', NULL, NULL, NULL, 0, '喀麦隆共和国（法语：République du Cameroun）通称喀麦隆，是位于非洲中西部的单一制共和国，西方与尼日利亚接壤，东北与东边分别和乍得与中非相靠，南方则与赤道几内亚、加蓬及刚果共和国毗邻。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (122, 3, '贝宁共和国', '贝宁', NULL, 'the Republic of Benin ', 'Benin', 'the republic of benin ', 'BEN', 'YO', NULL, NULL, 0, '贝宁全称：贝宁共和国（法语República Popular do Benin,La République du Bénin）是位于西非中南部的国家，旧名达荷美（Dahomey），前法国殖民地，贝宁（Benin）南濒几内亚湾，东邻尼日利亚，北与尼日尔接壤，西北与布基纳法索相连，西和多哥接壤，海岸线长125公里。全境南北狭长，南窄北宽。南部沿海为宽约100公里的平原。中部为海拔200－400米波状起伏的高原。西北部的阿塔科拉山海拔641米，为全国最高点。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (123, 3, '马达加斯加共和国', '马达加斯加', NULL, 'the Republic of Madagascar ', 'Madagascar', 'the republic of madagascar ', 'MDG', 'MG', NULL, NULL, 0, '马达加斯加全称马达加斯加共和国，非洲岛国，位于印度洋西部，隔莫桑比克海峡与非洲大陆相望，全岛由火山岩构成。作为非洲第一、世界第四大的岛屿，马达加斯加旅游资源丰富，上世纪90年代以来，该国政府将旅游业列为重点发展行业，鼓励外商向旅游业投资。居民中98%是马达加斯加人。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (124, 3, '卢旺达共和国', '卢旺达', NULL, 'the Republic of Rwanda', 'Rwanda', 'the republic of rwanda', 'RWA', NULL, NULL, NULL, 0, '卢旺达（Republika y\'u Rwanda） 是非洲中东部的一个国家，全称卢旺达共和国，位于非洲中东部赤道南侧，内陆国家。东邻坦桑尼亚，南连布隆迪，西和西北与刚果（金）交界，北与乌干达接壤，国土面积26338平方公里。境内多山，有“千丘之国”的称谓。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (125, 3, '塞舌尔共和国', '塞舌尔', NULL, 'the Republic of Seychelles', 'Seychelles', 'the republic of seychelles', 'SYC', NULL, NULL, NULL, 0, '塞舌尔，全名塞舌尔共和国，是坐落在东部非洲印度洋上的一个群岛国家。1976年6月29日塞舌尔宣告独立，成立塞舌尔共和国，属英联邦成员。全境半数地区为自然保护区，享有“旅游者天堂”的美誉。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (126, 3, '科特迪瓦共和国', '科特迪瓦', NULL, 'the Republic of Cote d\'ivoire', 'Cote d\'lvoire', 'the republic of cote d\'ivoire', 'CIV', NULL, NULL, NULL, 0, '科特迪瓦（Coate d\'Ivoire）全名科特迪瓦共和国（The Republic of Côte d\'Ivoire, La République de Côte d\'Ivoire ），科特迪瓦在法语的意思是“象牙的海岸”，应该国政府要求，中华人民共和国用音译名为科特迪瓦。联合国自1985年12月31日起使用此音译名。是西非国家，与加纳、利比里亚、几内亚、马里和布基纳法索相邻。海岸线长约500公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (127, 3, '阿拉伯埃及共和国', '埃及', NULL, 'the Arab Republic of Egypt ', 'Egypt', 'the arab republic of egypt ', 'EGY', 'AR', NULL, NULL, 0, '埃及既是亚、非之间的陆地交通要冲，也是大西洋于印度洋之间海上航线的捷径，战略位置十分重要。埃及是中东人口最多的国家，也是非洲人口第二大国，在经济、科技领域方面长期处于非洲领先态势。也是一个非洲的强国，是非洲第三大经济体', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (128, 3, '毛里求斯共和国', '毛里求斯', NULL, 'the Republic of Mauritius', 'Mauritius', 'the republic of mauritius', 'MUS', NULL, NULL, NULL, 0, '毛里求斯共和国为非洲东部一岛国，位于印度洋西南方，距马达加斯加约800公里，与非洲大陆相距2,200公里。作为火山岛国，毛里求斯四周被珊瑚礁环绕，岛上地貌千姿百态，沿海是狭窄平原，中部是高原山地，有多座山脉和孤立的山峰。整个国土由毛里求斯岛和其他小群岛组成，经历荷兰、法国和英国等国殖民统治后，于1968年3月12日脱离英国殖民获得独立，岛上亦有不少华人。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (129, 3, '布基纳法索', '布基纳法索', NULL, 'Burkina Faso', 'Burkina Faso', 'burkina faso', 'BFA', NULL, NULL, NULL, 0, '布基纳法索（法语:Burkina Faso）是位于非洲西部沃尔特河上游的内陆国。东邻贝宁、尼日尔，南与科特迪瓦、加纳、多哥交界，西、北与马里接壤。全境大部地区为内陆高原，地势平坦，自北向南徐缓倾斜，平均海拔不到300米；北部接近撒哈拉沙漠，西南部奥罗达拉地区地势较高；纳库鲁峰海拔749米，为全国最高点。主要河流有穆温河、纳康伯河和纳齐农河。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (130, 3, '厄立特里亚国', '厄立特里亚', NULL, 'the Commonwealth of Eritrea', 'Eritrea', 'the commonwealth of eritrea', 'ERI', NULL, NULL, NULL, 0, '厄立特里亚位于非洲东北部，西邻苏丹共和国，南邻埃塞俄比亚、吉布提，东隔红海与沙特阿拉伯和也门相望，扼红海进出印度洋的门户，地理位置十分重要。全国海岸线长1200公里', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (131, 3, '圣多美和普林西比民主共和国', '圣多美和普林西比', NULL, 'the Democratic Republic Sao Tome and Principe', 'Sao Tome and Principe', 'the democratic republic sao tome and principe', 'STP', NULL, NULL, NULL, 0, '圣多美和普林西比民主共和国（葡萄牙语：República Democrática de São Tomé e Príncipe）位于非洲中西部几内亚湾，由圣多美岛、普林西比岛和附近一些礁屿组成，两岛都是火山岛，属热带雨林气候', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (132, 3, '安哥拉共和国', '安哥拉', NULL, 'the Republic of Angola', 'Angola', 'the republic of angola', 'AGO', 'PT', NULL, NULL, 0, '安哥拉位于非洲西南部，首都罗安达，西滨大西洋，北及东北邻刚果民主共和国，南邻纳米比亚，东南邻赞比亚，另有一块外飞地卡宾达省与刚果共和国、刚果民主共和国相邻。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (133, 3, '利比亚国', '利比亚', NULL, 'State of Libya', 'Libyan Arab Jm', 'state of libya', 'LBY', NULL, NULL, NULL, 0, '利比亚（全称利比亚国，阿拉伯语：دولة ليبيا‎‎，英语：State of Libya）是北非的一个国家，位于地中海南岸，与埃及、苏丹、乍得、尼日尔、阿尔及利亚跟突尼斯相邻。面积1759541平方公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (134, 3, '津巴布韦共和国', '津巴布韦', NULL, 'the Republic of Zimbabwe', 'Zimbabwe', 'the republic of zimbabwe', 'ZWE', NULL, NULL, NULL, 0, '津巴布韦共和国，是非洲南部的内陆国家，1980年4月18日独立建国。津巴布韦在1980年之前原本称为罗得西亚，这名字源自于替英国在这地区建立殖民地的塞西尔·罗兹。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (135, 3, '几内亚共和国', '几内亚', NULL, 'The Republic of Guinea', 'Guinea', 'the republic of guinea', 'GIN', NULL, NULL, NULL, 0, '几内亚共和国（The Republic of Guinea），简称几内亚，来源于柏柏尔语，意为“黑人的国家”，位于西非西岸，北邻几内亚比绍、塞内加尔和马里，东与科特迪瓦、南与塞拉利昂和利比里亚接壤，西濒大西洋。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (136, 3, '塞拉利昂共和国', '塞拉利昂', NULL, 'The Republic of Sierra Leone', 'Sierra Leone', 'the republic of sierra leone', 'SLE', NULL, NULL, NULL, 0, '塞拉利昂共和国位于西非大西洋岸，北部及东部被几内亚包围、东南与利比里亚接壤，首都弗里敦。台湾译为狮子山共和国，中国大陆和香港译为塞拉利昂共和国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (137, 3, '留尼汪岛', '留尼汪', NULL, 'Reunion Island', 'Reunion', 'reunion island', 'REU', NULL, NULL, NULL, 0, '留尼汪岛（l\'île de la Reunion）面积2512平方公里， 人口840974人（2013年）。居民主要为马达加斯加人、非洲人、欧洲人、印度人、华人、巴基斯坦人和克里奥尔人。官方语言是法语。94%的居民信奉天主教，少数人信仰伊斯兰教、印度教、佛教。首府圣但尼（Saint-Denis)，人口132338人（1999年）。行政区域分为4个专区（无实权），24个市镇。货币欧元', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (138, 3, '加蓬共和国', '加蓬', NULL, 'The Gabonese Republic', 'Gabon', 'the gabonese republic', 'GAB', NULL, NULL, NULL, 0, '加蓬共和国位于非洲中部西海岸，横跨赤道线。东、南与刚果相连，北与喀麦隆接壤，西北与赤道几内亚毗邻，西濒大西洋，海岸线长800公里。自从1960年8月17日脱离法国统治独立以来，加蓬共和国共经历了3届总统的统治。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (139, 3, '加纳共和国', '加纳', NULL, 'The Republic of Ghana', 'Ghana', 'the republic of ghana', 'GHA', NULL, NULL, NULL, 0, '加纳是非洲西部的一个国家，位于非洲西部、几内亚湾北岸，西邻科特迪瓦，北接布基纳法索，东毗多哥，南濒大西洋，海岸线长约562公里。地形南北长、东西窄。全境大部地区为平原，东部有阿克瓦皮姆山脉，南部有夸胡高原，北部有甘巴加陡崖。最高峰杰博博山海拔876米。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (140, 3, '坦桑尼亚联合共和国', '坦桑尼亚', NULL, 'The United Republic of Tanzania', 'Tanzania', 'the united republic of tanzania', 'TZA', 'SW', NULL, NULL, 0, '坦桑尼亚全称：坦桑尼亚联合共和国（英文：The United Republic of Tanzania）。位于非洲东部、赤道以南。英联邦成员国之一。北与肯尼亚和乌干达交界，南与赞比亚、马拉维、莫桑比克接壤，西与卢旺达、布隆迪和刚果（金）为邻，东临印度洋。国土面积945087平方公里，截止2013年全国总人口4490万人。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (141, 3, '马里共和国', '马里', NULL, 'The Republic of Mali', 'Mali', 'the republic of mali', 'MLI', NULL, NULL, NULL, 0, '马里共和国（République du Mali）是西非的一个内陆国家，向北与阿尔及利亚、向东与尼日尔、向南与布基纳法索和科特迪瓦、向西南与几内亚、向西与毛里塔尼亚和塞内加尔接壤，是西非面积第二大的国家。它的北部边界在撒哈拉沙漠的中心，大多数人集中在南部，尼日尔河和塞内加尔河源于这里。马里过去也被称为法属苏丹，它的名字来源于马里帝国。马里国家面积的2%是农用地，同时80%的劳动力在农业工作。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (142, 3, '索马里联邦共和国', '索马里', NULL, 'The Somalia Democratic Republic', 'Somalia', 'the somalia democratic republic', 'SOM', 'SO', NULL, NULL, 0, '索马里联邦共和国位于非洲大陆最东部的索马里半岛，拥有非洲最长的海岸线，总面积637660平方公里', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (143, 3, '毛里塔尼亚伊斯兰共和国', '毛里塔尼亚', NULL, 'The Islamic Republic of Mauritania', 'Mauritania', 'the islamic republic of mauritania', 'MRT', NULL, NULL, NULL, 0, '毛里塔尼亚位于非洲西北部，地处北纬15～27度之间，面积103.07万平方公里。毛搭西濒大西洋，北部与西撒哈拉和阿尔及利亚接壤西，东南部与马里为邻，南与塞内加尔相望。地区属热带沙漠性气候，全境地势平坦。有2/3的地区是沙漠', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (144, 3, '乌干达共和国', '乌干达', NULL, 'The Republic of Uganda', 'Uganda', 'the republic of uganda', 'UGA', 'GU', NULL, NULL, 0, '乌干达，位于非洲东部，横跨赤道，东邻肯尼亚，南接坦桑尼亚和卢旺达，西接刚果（金），北连南苏丹，总面积24.15万平方公里。全境大部位于东非高原，多湖，平均海拔1000~1200米，有“高原水乡”之称。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (145, 3, '乍得共和国', '乍得', NULL, 'The Republic of Chad', 'Chad', 'the republic of chad', 'TCD', NULL, NULL, NULL, 0, '乍得（或译查德，阿拉伯语：تشاد‎，法语：Tchad），全称乍得共和国，是非洲中部的一个内陆国家，北接利比亚，东接苏丹，南接中非共和国，西南与喀麦隆、尼日利亚为邻，西与尼日尔交界。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (146, 3, '马约特岛', '马约特岛', NULL, 'Territorial Collectivity of Mayotte', 'Mayotte', 'territorial collectivity of mayotte', 'MYT', NULL, NULL, NULL, 0, '马约特岛（Mayotte ）曾经为法国的一个集体领地，全称为马约特集体领地(Territorial Collectivity of Mayotte, 法语作Collectivite Territoriale de Mayotte)，亦称马奥霍(Mahore)，现为法国的一个海外大区（海外省）。位于莫桑比克海峡，与大科摩罗岛、昂儒昂岛、莫埃利岛共同组成科摩罗群岛。面积为374平方公里，居民约18万人，经济以农业为主，主要生产香子兰等香料，是法国的海外领地之一，马约特岛包括大陆地岛、小陆地岛以及周围一些小岛，首府和最大城市马穆楚。岛屿也被临近的东非印度洋岛国科摩罗宣称所有，但由法国实际控制。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (147, 3, '科摩罗联盟', '科摩罗', NULL, 'Union of Comoros', 'Comoros', 'union of comoros', 'COM', NULL, NULL, NULL, 0, '科摩罗被称月亮之国、香料之国，是非洲一个位于印度洋上的岛国，位于非洲东侧莫桑比克海峡北端入口处，东、西距马达加斯加和莫桑比克各约300公里。组成科摩罗的大科摩罗岛、昂儒昂岛、莫埃利岛和马约特岛被誉为西印度洋上的四颗明珠。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (148, 3, '博茨瓦纳共和国', '博茨瓦纳', NULL, 'The Republic of Botswana', 'Botswana', 'the republic of botswana', 'BWA', 'AF', NULL, NULL, 0, '博兹瓦纳（英文名：Botswana）又译为波札那，正式全名为博茨瓦纳共和国，是位于非洲南部的内陆国。\n全国国境皆为干燥的台地地形，南邻南非，西边为纳米比亚，东北与津巴布韦接壤，其国土北端只有在维多利亚瀑布附近与赞比亚接触到些许。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (149, 3, '塞内加尔共和国', '塞内加尔', NULL, 'the Republic of Senegal', 'Senegal', 'the republic of senegal', 'SEN', NULL, NULL, NULL, 0, '塞内加尔位于非洲西部凸出部位的最西端，首都达喀尔。北接毛里塔尼亚，东邻马里，南接几内亚和几内亚比绍，西临佛得角群岛。海岸线长约700公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (150, 3, '斯威士兰王国', '斯威士兰', NULL, 'The Kingdom of Swaziland', 'Swaziland', 'the kingdom of swaziland', 'SWZ', NULL, NULL, NULL, 0, '斯威士兰，位于非洲东南部为内陆国家，北、西、南三面为南非所环抱，东与莫桑比克为邻。地处南非高原东南边缘德拉肯斯山脉的东坡。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (151, 3, '几内亚比绍共和国', '几内亚比绍', NULL, 'The Republic of Guinea-Bissau', 'Guinea Bissau', 'the republic of guinea-bissau', 'GNB', 'PT', NULL, NULL, 0, '几内亚比绍共和国是位于北大西洋沿岸的西非国家。[1]  几内亚比绍北邻塞内加尔，东方、南方邻几内亚，西邻大西洋。首都是比绍。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (152, 3, '刚果民主共和国', '民主刚果', NULL, 'Democratic Republic of the Congo', 'DR Congo', 'democratic republic of the congo', 'COD', NULL, NULL, NULL, 0, '刚果民主共和国（法语：République démocratique du Congo）是非洲中部的一个国家，旧称为扎伊尔（法语：Zaïre），首都为金沙萨。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (153, 3, '中非共和国', '中非', NULL, 'The Central African Republic', 'Central African', 'the central african republic', 'CAF', NULL, NULL, NULL, 0, '中非共和国（The Central African Republic），简称中非，是指非洲大陆中部的内陆国家。面积62.2万平方公里，东与苏丹交界，南同刚果（布）和刚果（金）接壤，西与喀麦隆毗连，北同乍得为邻。全国共有大小部族32个，主要有巴雅，班达、桑戈和曼吉阿族等。官方语言为法语。通用桑戈语', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (154, 3, '莱索托王国', '莱索托', NULL, 'The Kingdom of Lesotho', 'Lesotho', 'the kingdom of lesotho', 'LSO', 'ST', NULL, NULL, 0, '莱索托全名莱索托王国（索托语：Mmuso wa Lesotho，英语：Kingdom of Lesotho，意思是“说索托语的人们”），非洲南部国家之一，英联邦成员国之一。莱索托位于非洲东南部，为内陆国家，地处南非高原东缘德拉肯斯山西坡。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (155, 3, '刚果共和国', '刚果', NULL, 'Republic of the Congo', 'Congo', 'republic of the congo', 'COG', NULL, NULL, NULL, 0, '刚果共和国（英语：The Republic of Congo；法语：République du Congo），简称为刚果（布），位于非洲中西部，赤道横贯中部，东、南两面邻刚果（金）、安哥拉，北接中非、喀麦隆，西连加蓬，西南临大西洋，海岸线长150多公里，总面积为34.2万平方公里。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (156, 3, '南非共和国', '南非', NULL, 'The Republic of South Africa', 'South Africa', 'the republic of south africa', 'ZAF', 'ZU', NULL, NULL, 0, '南非共和国（The Republic of South Africa），简称南非。地处南半球，有“彩虹之国”之美誉，位于非洲大陆的最南端，陆地面积为1219090平方公里，其东、南、西三面被印度洋和大西洋环抱，陆地上与纳米比亚、博茨瓦纳、莱索托、津巴布韦、莫桑比克和斯威士兰接壤。东面隔印度洋和澳大利亚相望，西面隔大西洋和巴西、阿根廷相望。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (157, 3, '利比里亚共和国', '利比里亚', NULL, 'The Republic of Liberia', 'Liberia', 'the republic of liberia', 'LBR', NULL, NULL, NULL, 0, '利比里亚共和国（英语：Republic of Liberia），是非洲的一个国家，处于非洲西部。北接几内亚，西北接塞拉利昂，东邻科特迪瓦，西南濒大西洋。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (158, 3, '突尼斯共和国', '突尼斯', NULL, 'The Republic of Tunisia', 'Tunisia', 'the republic of tunisia', 'TUN', NULL, NULL, NULL, 0, '突尼斯（Tunisia）全称突尼斯共和国（The Republic of Tunisia，la Répubique Tunisienne）[1]  ，位于非洲大陆最北端，北部和东部面临地中海，隔突尼斯海峡与意大利的西西里岛相望，扼地中海东西航运的要冲，东南与利比亚为邻，西与阿尔及利亚接壤。突尼斯是世界上少数几个集中了海滩、沙漠、山林和古文明的国家之一，是悠久文明和多元文化的融和之地。突尼斯地处地中海地区的中央，拥有长达1300公里的海岸线。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (159, 3, '赞比亚共和国', '赞比亚', NULL, 'The Republic of Zambia', 'Zambia', 'the republic of zambia', 'ZMB', 'AF', NULL, NULL, 0, '赞比亚共和国（The Republic of Zambia）是非洲中南部的一个内陆国家，大部分属于高原地区。北靠刚果民主共和国、东北邻坦桑尼亚、东面和马拉维接壤、东南和莫桑比克相连、南接津巴布韦、博茨瓦纳和纳米比亚，西面与安哥拉相邻。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (160, 3, '尼日尔共和国', '尼日尔', NULL, 'The Republic of Niger', 'Niger', 'the republic of niger', 'NER', NULL, NULL, NULL, 0, '尼日尔共和国位于非洲中西部，是撒哈拉沙漠南缘的内陆国，该国北与阿尔及利亚和利比亚接壤，南同尼日利亚和贝宁交界，西与马里和布基纳法索毗连，东同乍得相邻', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (161, 3, '阿拉伯撒哈拉民主共和国', '西撒哈拉', NULL, 'the Sahrawi Arab Democratic Republic Western Sahara', 'Western Sahara', 'the sahrawi arab democratic republic western sahara', 'ESH', NULL, NULL, NULL, 0, '西撒哈拉（阿拉伯语：الصحراء الغربية‎，西班牙语：Sáhara Occidental，英语：Western Sahara）位于非洲西北部，地处撒哈拉沙漠西部，滨临大西洋，与摩洛哥、毛利塔尼亚、阿尔及利亚相邻。该地是一个有争议地区，摩洛哥声明对此地区拥有主权。另外，当地独立武装组织波利萨里奥阵线统治着该地区以东大约四分之一的荒芜地区，其余大部分均为摩洛哥所占领。目前，共有47个国家承认该武装政权所领导的“阿拉伯撒哈拉民主共和国（the Sahrawi Arab Democratic Republic）”为独立的阿拉伯国家之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (162, 3, '多哥共和国', '多哥', NULL, 'The Republic of Togo', 'Togo', 'the republic of togo', 'TGO', 'YO', NULL, NULL, 0, '多哥共和国（法语：République Togolaise），是西非国家之一，东面与贝宁，北面与布基纳法索，西面与加纳相邻，南面有一小段海岸线面向几内亚湾。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (163, 3, '纳米比亚共和国', '纳米比亚', NULL, 'The Republic of Namibia', 'Namibia', 'the republic of namibia', 'NAM', 'AF', NULL, NULL, 0, '纳米比亚共和国（英语：The Republic of Namibia）位于非洲西南部，北靠安哥拉和赞比亚，东连博茨瓦纳，南接南非。海拔高度为1000-2000米，干旱少雨，属亚热带、半沙漠性气候。该国分为13个行政区和50个地方政府，首都温得和克（Windhoek）。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (164, 3, '莫桑比克共和国', '莫桑比克', NULL, 'The Republic of Mozambique', 'Mozambique', 'the republic of mozambique', 'MOZ', 'PT', NULL, NULL, 0, '莫桑比克共和国（葡萄牙语：República de Moçambique）曾译作莫三鼻给，是非洲南部国家，以葡萄牙语作为官方语言，1975年脱离葡萄牙殖民地而独立。作为与英国并无宪制关系的国家，在1995年以特殊例子加入英联邦。莫桑比克的前身，就是葡属东非洲，它是在1498年3月，被葡萄牙航海家达伽马所率领的船队发现，当时就有阿拉伯的贸易站在沿海一带设立。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (165, 3, '埃塞俄比亚联邦民主共和国', '埃塞俄比亚', NULL, 'The Federal Democratic Republic of Ethiopia', 'Ethiopia', 'the federal democratic republic of ethiopia', 'ETH', NULL, NULL, NULL, 0, '埃塞俄比亚全名埃塞俄比亚联邦民主共和国（旧称“阿比西尼亚帝国”，Abyssinia）是一个位于非洲东北的国家。\n与一般非洲国家不同，埃塞俄比亚在第二次世界大战被意大利入侵（1936-1941年）之前，一直维持其古老的君主制度，并未受到殖民主义浪潮的吞噬。1974年，一次军事流血政变将1930年以来一直统治埃塞俄比亚的皇帝海尔·塞拉西一世（Haile Selassie I）推翻以后，埃塞俄比亚改为奉行社会主义，直至1991年放弃社会主义。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (166, 3, '摩洛哥王国', '摩洛哥', NULL, 'The Kingdom of Morocco', 'Morocco', 'the kingdom of morocco', 'MAR', NULL, NULL, NULL, 0, '摩洛哥王国是非洲西北部的一个沿海阿拉伯国家，东部以及东南部与阿尔及利亚接壤，南部紧邻西撒哈拉，西部濒临大西洋，北部和西班牙、葡萄牙隔海相望。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (167, 3, '马拉维共和国', '马拉维', NULL, 'The Republic of Malawi', 'Malawi', 'the republic of malawi', 'MWI', NULL, NULL, NULL, 0, '马拉维全称：马拉维共和国（齐切瓦语：Dziko la Malaŵi；英语：Republic of Malawi），位于非洲东南部，是个内陆国家，被坦桑尼亚、莫桑比克、赞比亚三国包围其中，国土面积11.8万平方公里，人口1511.8万。马拉维得名于境内的马拉维湖，这个湖是非洲第三大湖，面积3万平方公里，湖水最深可达700多米，有很多世界独一无二的淡水鱼种类。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (168, 3, '尼日利亚联邦共和国', '尼日利亚', NULL, 'Federal Republic of Nigeria', 'Nigeria', 'federal republic of nigeria', 'NGA', 'IG', NULL, NULL, 0, '尼日利亚联邦共和国（Federal Republic of Nigeria），位于6°27′N，3°24′E，处于西非东南部的国家，非洲几内亚湾西岸的顶点，邻国包括西边的贝宁，北边的尼日尔，东北方隔乍得湖与乍得接壤一小段国界，东和东南与喀麦隆毗连，南濒大西洋几内亚湾。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (169, 3, '佛得角共和国', '佛得角', NULL, 'The Republic of Cape Verde', 'Cape Verde', 'the republic of cape verde', 'CPV', NULL, NULL, NULL, 0, '佛得角位于北大西洋的佛得角群岛上，东距非洲大陆最西点佛得角（塞内加尔境内）500多公里，扼欧洲与南美、南非间交通要冲，包括圣安唐、圣尼古拉、萨尔、博阿维什塔、福古、圣地亚哥等15个大小岛屿，分北面的向风群岛和南面的背风群岛两组。民族语言为克里奥尔语。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (170, 3, '布隆迪共和国', '布隆迪', NULL, 'The Republic of Burundi', 'Burundi', 'the republic of burundi', 'BDI', NULL, NULL, NULL, 0, '布隆迪（The Republic of Burundi）位于非洲中东部赤道南侧。北与卢旺达接壤，东、南与坦桑尼亚交界，西与刚果（金）为邻，西南濒坦噶尼喀湖。境内多高原和山地，大部由东非大裂谷东侧高原构成，全国平均海拔1600米，有“山国”之称。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (171, 3, '阿尔及利亚民主人民共和国', '阿尔及利亚', NULL, 'People\'s Democratic Republic of Algeria', 'Algeria', 'people\'s democratic republic of algeria', 'DZA', NULL, NULL, NULL, 0, '阿尔及利亚经济规模在非洲居第四位，仅次于南非、尼日利亚和埃及。碳化氢产业（石油与天然气的统称）是阿国民经济的支柱。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (172, 3, '吉布提共和国', '吉布提', NULL, 'The Republic of Djibouti', 'Djibouti', 'the republic of djibouti', 'DJI', NULL, NULL, NULL, 0, '吉布提（法语La République de Djibouti ，阿法尔语：Gabuutih），阿法尔语意为“沸腾的蒸锅”，位于非洲东北部亚丁湾西岸，扼红海入印度洋的要冲，东南与索马里接壤，西南、西部和西北部三面毗邻埃塞俄比亚，北部和厄立特里亚接壤。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (173, 3, '冈比亚伊斯兰共和国', '冈比亚', NULL, 'Islamic Republic of Gambia', 'Gambia', 'islamic republic of gambia', 'GMB', NULL, NULL, NULL, 0, '冈比亚（全称：冈比亚伊斯兰共和国[1]  ，台湾地区称为“甘比亚”），位于北纬 13°28\'，西经 16°39\'，非洲西部大西洋沿岸地区，它西邻大西洋，北、东、南三面被塞内加尔紧紧包围，国土面积约为10380平方公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (174, 3, '赤道几内亚共和国', '赤道几内亚', NULL, 'The Republic of Equatorial Guinea', 'Eq.Guinea', 'the republic of equatorial guinea', 'GNQ', 'ES', NULL, NULL, 0, '道几内亚（西班牙语：República de Guinea Ecuatorial），位于非洲中西部，西临大西洋，北邻喀麦隆，东、南与加蓬接壤。由大陆上的木尼河地区和几内亚湾内的比奥科、安诺本、科里斯科等岛屿组成。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (175, 3, '苏丹共和国', '苏丹', NULL, 'The Republic of Sudan', 'Sudan', 'the republic of sudan', 'SDN', 'SU', NULL, NULL, 0, '苏丹共和国（阿拉伯语：جمهورية السودان‎；英语：Republic of the Sudan），位于非洲东北、红海沿岸、撒哈拉沙漠东端。苏丹国土面积1886068平方公里，为非洲面积第3大国，世界面积第15大国。首都喀土穆。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (176, 3, '肯尼亚共和国', '肯尼亚', NULL, 'The Republic of Kenya', 'Kenya', 'the republic of kenya', 'KEN', 'SW', NULL, NULL, 0, '肯尼亚位于非洲东部，赤道横贯中部，东非大裂谷纵贯南北。东邻索马里，南接坦桑尼亚，西连乌干达，北与埃塞俄比亚、南苏丹交界，东南濒临印度洋，海岸线长536公里。国土面积的18%为可耕地，其余主要适于畜牧业。\n', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (177, 4, '汤加王国', '汤加', NULL, 'The Kingdom of Tonga', 'Tonga', 'the kingdom of tonga', 'TON', NULL, NULL, NULL, 0, '汤加，全名“汤加王国”（The Kingdom of Tonga），属大洋洲，位于太平洋西南部赤道附近，是由173个岛屿组成的岛国，其中36个有人居住，大部分为珊瑚岛。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (178, 4, '澳大利亚联邦', '澳大利亚', NULL, 'The Commonwealth of Australia', 'Australia', 'the commonwealth of australia', 'AUS', 'EN', NULL, NULL, 0, '澳大利亚（Australia），全称为澳大利亚联邦（The Commonwealth of Australia）。其领土面积7686850平方公里，四面环海，是世界上唯一国土覆盖一整个大陆的国家。拥有很多独特的动植物和自然景观的澳大利亚，是一个奉行多元文化的移民国家。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (179, 4, '库克群岛', '库克群岛', NULL, 'The Cook Islands', 'Cook Is', 'the cook islands', 'COK', NULL, NULL, NULL, 0, '库克群岛是一个位于南太平洋上，介于法属波利尼西亚与斐济之间，由15个岛屿组成的岛群，其命名起源于远征探索南太平洋，发现了许多岛屿的詹姆斯·库克船长，是新西兰的自由结合区。首都阿瓦鲁阿（Avarua），位于拉罗汤加岛。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (180, 4, '瑙鲁共和国', '瑙鲁', NULL, 'The Republic of Nauru', 'Nauru', 'the republic of nauru', 'NRU', NULL, NULL, NULL, 0, '瑙鲁共和国（英语：The Republic of Nauru；瑙鲁语：Ripublik Naoero）简称瑙鲁，位于南太平洋中西部的密克罗尼西亚群岛中，有“天堂岛”之称。[1]  瑙鲁面积只有24㎞²，是世界上最小的岛国', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (181, 4, '新喀里多尼亚', '新喀里多尼亚', NULL, 'New Caledonia', 'New Caledonia', 'new caledonia', 'NCL', NULL, NULL, NULL, 0, '新喀里多尼亚（法文：Nouvelle-Calédonie），法国的海外属地之一，位于南回归线附近，处于南太平洋美拉尼西亚岛群，距澳大利亚昆士兰东岸1500公里处。该地区整体主要由新喀里多尼亚岛、洛亚蒂群岛和切斯特菲尔德群岛组成。官方语言法语，通用美拉尼西亚语和波利尼西亚语。所属时区位于东UTC+11区，比北京时间早三个小时。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (182, 4, '瓦努阿图共和国', '瓦努阿图', NULL, 'Republic of Vanuatu', 'Vanuatu', 'republic of vanuatu', 'VUT', NULL, NULL, NULL, 0, '瓦努阿图共和国，位于南太平洋西部，属美拉尼西亚群岛，由83个岛屿（其中68个岛屿有人居住）组成。最大的岛屿是桑托岛（面积3974平方公里），属热带海洋性气候，年均降水量1600毫米。属热带海洋性气候，首都维拉港平均气温25.3℃。陆地面积1.219万平方公里，水域面积84.8万平方公里，其中98%为瓦努阿图人，属美拉尼西亚人种，官方语言为英语、法语和比斯拉马语，通用比斯拉马语，84%的人信奉天主教。由约80个岛屿（其中68个有人居住）组成。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (183, 4, '所罗门群岛', '所罗门群岛', NULL, 'Solomon Islands', 'Solomon Is', 'solomon islands', 'SLB', NULL, NULL, NULL, 0, '所罗门群岛是世界上最不发达国家（低度开发国家）之一，其人类发展指数为0.610。大多数人口依靠务农、捕鱼和种植为生，国民经济以种植业、渔业和黄金开采为主。大部分制造与石油产品依赖进口。该群岛尚未开发的矿产资源丰富，如铅、锌、镍以及金。[2] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (184, 4, '萨摩亚独立国', '萨摩亚', NULL, 'The Independent State of Samoa', 'Samoa', 'the independent state of samoa', 'WSM', NULL, NULL, NULL, 0, '它位于太平洋南部，萨摩亚群岛西部，由萨瓦伊和乌波卢两个主岛及七个小岛组成。陆地面积2934平方公里，水域面积12万平方公里，境内大部分地区为丛林所覆盖，属热带雨林气候。萨摩亚人口约17万4千，90%为萨摩亚人，属波利尼西亚人种，皮肤为浅棕色，体较胖，性格敦厚，语言为萨语和英语。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (185, 4, '图瓦卢', '图瓦卢', NULL, 'Tuvalu', 'Tuvalu', 'tuvalu', 'TUV', NULL, NULL, NULL, 0, '“图瓦卢”在波利尼西亚语中意为“八岛之群”。图瓦卢海拔最高4.5米。由于地势极低，持续上升的气温和海平面严重威胁着图瓦卢，使这个国家面临国土沉入海底的危险，图瓦卢资源匮乏，土地贫瘠，只有少数植物可以生长，几乎没有天然资源，是联合国公布的世界最不发达国家（最低度开发国家）之一', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (186, 4, '密克罗尼西亚联邦', '密克罗尼西亚联邦', NULL, 'Federated States of Micronesia', 'Micronesia', 'federated states of micronesia', 'FSM', NULL, NULL, NULL, 0, '属于太平洋三大岛群之一的密克罗尼西亚群岛，希腊语字根为“小岛”之义。密克罗尼西亚属热带雨林气候，年平均温度26-28℃，加罗林群岛附近是台风源地之一。该国海域面积大，渔业资源丰富，尤以金枪鱼著名。其他粮食及生活日用品均靠进口，经济较为落后且严重依赖美国。该国最西部的雅浦岛离中国福建约2600公里，离日本东京2900公里', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (187, 4, '马绍尔群岛共和国', '马绍尔群岛', NULL, 'The Republic of Marshall Island ', 'Marshall Is Rep', 'the republic of marshall island ', 'MHL', NULL, NULL, NULL, 0, '马绍尔群岛历史上曾先后为西班牙、德国、日本、美国占领，其前身是美国托管的太平洋岛屿托管地的4个政治实体之一。美国托管期间，美国在该国进行了67次核试验，其中23次在该国比基尼环礁进行，导致改国居民严重的癌症、白血病等疾病。与美国在威克岛存在领土争议。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (188, 4, '基里巴斯共和国', '基里巴斯', NULL, 'The Republic of Kiribati', 'Kiribati', 'the republic of kiribati', 'KIR', NULL, NULL, NULL, 0, '基里巴斯共和国是一个太平洋岛国。全国共有33个小岛，分成吉尔伯特群岛、菲尼克斯群岛和莱恩群岛三大群岛，共有32个环礁及1个珊瑚岛，从其东部著名的圣诞岛，到最西部的巴纳巴岛，分布于赤道上3800公里的海域，拥有世界最大海洋保护区。基里巴斯是世界上最不发达国家（低度开发国家）之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (189, 4, '法属波利尼西亚', '法属玻利尼西亚', NULL, 'French Polynesia', 'French Polynesia', 'french polynesia', 'PYF', NULL, NULL, NULL, 0, '法属波利尼西亚属热带雨林气候，11月～4月为雨季，年均降水量1625毫米。3月份为气温最高月，达28℃，8月为气温最低月，达20℃，年均气温26℃。首都是帕皮提（Papeete），1818年建城，人口约13.3万人（2009年）。高级专员阿道夫·科尔拉（Adolphe COLRAT），2008年7月任职。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (190, 4, '新西兰', '新西兰', NULL, 'New Zealand', 'New Zealand', 'new zealand', 'NZL', 'MI', NULL, NULL, 0, '新西兰（New Zealand），又译纽西兰，是一个政治体制实行君主立宪制混合英国式议会民主制的国家，现为英联邦成员国之一。新西兰位于太平洋西南部，领土由南岛、北岛两大岛屿组成，以库克海峡分隔，南岛邻近南极洲，北岛与斐济及汤加相望。首都惠灵顿以及最大城市奥克兰均位于北岛[1]  。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (191, 4, '斐济共和国', '斐济', NULL, 'The Republic of Fiji', 'Fiji', 'the republic of fiji', 'FJI', 'HI', NULL, NULL, 0, '斐济共和国（斐济语：Matanitu Tugalala o Viti）是一个太平洋岛国，位于南太平洋，瓦努阿图以东、汤加以西、图瓦卢以南，由332个岛屿组成，其中106个有人居住。多为珊瑚礁环绕的火山岛，主要有维提岛和瓦努阿岛等。属热带海洋性气候，常受飓风袭击。年平均气温22～30℃。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (192, 4, '巴布亚新几内亚独立国', '巴布亚新几内亚', NULL, 'The Independent State of Papua New Guinea', 'Papua New Guinea', 'the independent state of papua new guinea', 'PNG', NULL, NULL, NULL, 0, '巴布亚新几内亚是南太平洋西部的一个岛国，是大洋洲第二大国，属英联邦成员国，包括新几内亚岛东半部及附近俾斯麦群岛、布干维尔岛等共约600余个大小岛屿。国名由巴布亚和新几内亚两部分组成，得名于岛名。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (193, 4, '帕劳共和国', '帕劳', NULL, 'The Republic of Palau', 'Palau', 'the republic of palau', 'PLW', NULL, NULL, NULL, 0, '帕劳，全称帕劳共和国（帕劳语：Beluu er a Belau），是西太平洋上的岛国。1994年10月1日从美国的托管统治下独立。支柱产业是渔业和旅游业，主要宗教信仰是基督教和古老的Modekngei教派，70%人口是当地土著，其余人口主要是菲律宾人。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (194, 4, '澳大利亚科科斯群岛', '科科斯群岛', NULL, 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'cocos (keeling) islands', 'CC', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (195, 4, '澳大利亚圣诞岛', '圣诞岛', NULL, 'Christmas Island', 'Christmas Island', 'christmas island', 'CX', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (196, 4, '澳大利亚赫德岛和麦克唐纳群岛', '赫德岛和麦克唐纳群岛', NULL, 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', 'heard island and mcdonald islands', 'HM', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (197, 4, '美国诺福克岛', '诺福克岛', NULL, 'Norfolk Island', 'Norfolk Island', 'norfolk island', 'NF', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (198, 4, '新西兰纽埃', '纽埃', NULL, 'Niue', 'Niue', 'niue', 'NU', 'MI', NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (199, 4, '新西兰托克劳群岛', '托克劳群岛', NULL, 'Tokelau', 'Tokelau', 'tokelau', 'TK', 'MI', NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (200, 6, '哥斯达黎加共和国', '哥斯达黎加', NULL, 'Republic of Costa Rica', 'Costa Rica', 'republic of costa rica', 'CRI', NULL, NULL, NULL, 0, '哥斯达黎加是拉丁美洲的一个共和国，北邻尼加拉瓜，南与巴拿马接壤，1983年11月17日宣布成为永久中立国，根据宪法，哥斯达黎加没有军队，只有警察和安全部队维护内部安全。是世界上第一个不设军队的国家', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (201, 6, '古巴共和国', '古巴', NULL, 'The Republic of Cuba', 'Cuba', 'the republic of cuba', 'CUB', 'HT', NULL, NULL, 0, '古巴是北美洲加勒比海北部的群岛国家，哈瓦那是古巴的经济、政治中心和首都。\n古巴是现存世界为数不多的5个社会主义国家（中国、朝鲜、古巴、越南、老挝）之一，而且是美洲唯一的社会主义国家。[1]  在历史上以上世纪60年代的猪湾事件和古巴导弹危机闻名。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (202, 6, '多米尼加共和国', '多米尼加', NULL, 'The Dominican Republic', 'Dominican', 'the dominican republic', 'DOM', NULL, NULL, NULL, 0, '多米尼加共和国（英语：The Dominican Republic；西班牙语：La República Dominicana）。国名意为“星期天、休息日”。旧说哥伦布于15世纪末的一个星期日到此，故名多米尼加，首都圣多明各。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (203, 6, '墨西哥合众国', '墨西哥', NULL, 'The United States of Mexico', 'Mexico', 'the united states of mexico', 'MEX', 'ES', NULL, NULL, 0, '墨西哥是一个自由市场经济体，拥有现代化的工业与农业，私有经济比重也在大幅提升。1994年北美自由贸易区正式建立后，墨西哥与美国的贸易和投资往来增加很快，极大地促进了经济发展和国民收入提高。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (204, 6, '尼加拉瓜共和国', '尼加拉瓜', NULL, 'The Republic of Nicaragua', 'Nicaragua', 'the republic of nicaragua', 'NIC', NULL, NULL, NULL, 0, '尼加拉瓜，全称尼加拉瓜共和国（英文：The Republic of Nicaragua），是一个总统共和制的国家，位于中美洲中部，北接洪都拉斯，南连哥斯达黎加，东临加勒比海，西濒太平洋，尼加拉瓜湖为中美洲最大的湖泊，首都为马那瓜。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (205, 6, '巴拿马共和国', '巴拿马', NULL, 'The Republic of Panama', 'Panama', 'the republic of panama', 'PAN', NULL, NULL, NULL, 0, '1501年，巴拿马沦为西班牙殖民地。1903年11月3日，成立巴拿马共和国。巴拿马中央连接大西洋与太平洋的巴拿马运河，拥有重要的战略地位，是南、北美洲的分界线。1999年12月31日美国将巴拿马运河所有土地、建筑、基础设施和所有的管理权都交还给巴拿马。鉴于重要的地理位置，巴拿马经济的重点是服务业，以金融、贸易和旅游业为主。金融业和转口贸易发达，并在经济中占重要地位。[1-2] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (206, 6, '萨尔瓦多共和国', '萨尔瓦多', NULL, 'The Republic of El Salvador', 'El Salvador', 'the republic of el salvador', 'SLV', NULL, NULL, NULL, 0, '萨尔瓦多，全称萨尔瓦多共和国（英语：The Republic of El Salvador，西班牙语：República de El Salvador）是位于中美洲北部的一个沿海国家，也是中美洲人口最密集的国家。萨尔瓦多毗邻太平洋，国土面积20720平方千米，下设14个省。2013年，该国总人口630万', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (207, 6, '波多黎各自由邦', '波多黎各', NULL, 'The Commonwealth of Puerto Rico', 'Puerto Rico', 'the commonwealth of puerto rico', 'PTR', NULL, NULL, NULL, 0, '波多黎各自治邦（英语：The Commonwealth of Puerto Rico，西班牙语：Estado Libre Asociado de Puerto Rico）位于加勒比海的大安的列斯群岛东部。包括波多黎各岛及别克斯、库莱夫拉等小岛。北临大西洋，南濒加勒比海、东与美属、英属维尔京群岛隔水相望，西隔莫纳海峡同多米尼加共和国为邻。首府为圣胡安。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (208, 6, '圣文森特和格林纳丁斯', '圣文森特和格纳丁斯', NULL, 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'saint vincent and the grenadines', 'VAG', NULL, NULL, NULL, 0, '圣文森特和格林纳丁斯是位于东加勒比海小安的列斯群岛南部的一个岛国。面积389平方公里，人口11万，主要为黑人和黑白混血种人。圣文森特本岛面积346平方公里，格林纳丁斯群岛则由三十二个小岛组成，面积合共43平方公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (209, 6, '洪都拉斯共和国', '洪都拉斯', NULL, 'Republic of Honduras', 'Honduras', 'republic of honduras', 'HND', NULL, NULL, NULL, 0, '洪都拉斯，全称洪都拉斯共和国（西班牙语：República de Honduras），是中北美洲的一个多山国家，与危地马拉、萨尔瓦多和尼加拉瓜接壤，位于太平洋和加勒比海之间，有海岸线。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (210, 6, '危地马拉共和国', '危地马拉', NULL, 'The Republic of Guatemala', 'Guatemala', 'the republic of guatemala', 'GTM', 'ES', NULL, NULL, 0, '危地马拉共和国（西班牙语：República de Guatemala），是中美洲的一个总统共和制国家，位于北美洲大陆的南部。西滨太平洋，东临加勒比海，向北与墨西哥相接，向东北邻伯利兹，向东南邻洪都拉斯和萨尔瓦多，全国总面积108889平方公里。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (211, 6, '多米尼克国', '多米尼克', NULL, 'The Commonwealth of Dominica', 'Dominica', 'the commonwealth of dominica', 'DMA', 'HT', NULL, NULL, 0, '多米尼克（The Commonwealth of Dominica）位于东加勒比海小安的列斯群岛东北部，东临大西洋，西濒加勒比海，是一个国土面积仅有751平方公里的岛国。主要为黑人和黑白混血种人。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (212, 6, '百慕大群岛', '百慕大', NULL, 'Bermuda', 'Bermuda', 'bermuda', 'BMU', NULL, NULL, NULL, 0, '百慕大，港台译百慕达（英语：Bermuda；又称百慕大群岛；旧称萨默斯岛）位于北大西洋，是英国的自治海外领地。位于北纬32度14分至32度25分、西经64度38分至64度53分，距北美洲约900多公里、美国东岸佛罗里达州迈阿密东北约1100海里及加拿大新斯科舍省哈利法克斯东南约840海里[1-2]  。来自英国国王Sammy时期的占领。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (213, 6, '加拿大', '加拿大', NULL, 'Canada', 'Canada', 'canada', 'CAN', 'EN', NULL, NULL, 0, '加拿大（Canada），为北美洲最北的国家，西抵太平洋，东迄大西洋，北至北冰洋，东北部和丹麦领地格陵兰岛相望，东部和法属圣皮埃尔和密克隆群岛相望，南方与美国本土接壤，西北方与美国阿拉斯加州为邻。领土面积为998万平方千米，位居世界第二。加拿大素有“枫叶之国”的美誉，首都是渥太华。加拿大政治体制为联邦制、君主立宪制及议会制，是英联邦国家之一，英王伊丽莎白二世为国家元首及国家象征，但无实际权力。加拿大是典型的英法双语国家', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (214, 6, '美利坚合众国', '美国', NULL, 'The United States of America', 'United States', 'the united states of america', 'USA', 'EN', NULL, NULL, 0, '美利坚合众国（The United States of America），简称美国，是由华盛顿哥伦比亚特区、50个州[1]  和关岛等众多海外领土组成的联邦共和立宪制国家。其主体部分位于北美洲中部，美国中央情报局《世界概况》1989年至1996年初始版美国总面积是 9,372,610 km²，1997年修正为963万平方公里（加上五大湖中美国主权部分和河口、港湾、内海等沿海水域面积），人口3.2亿，通用英语，是一个移民国家', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (215, 6, '格陵兰', '格陵兰', NULL, 'Greenland', 'Greenland', 'greenland', 'GRL', NULL, NULL, NULL, 0, '格陵兰（格陵兰语：Kalaallit Nunaat）是丹麦王国的海外自治领土，领土大部分位于格陵兰岛上，面积2,166,086平方公里，约83.7%都由冰雪覆盖。“格陵兰”这个名称的意思为“绿色土地”，曾是丹麦王国的海外属地与王国内的自治体，格陵兰在2008年的公投后决定逐渐走向独立之途，并在2009年正式改制成为一个内政独立但外交、国防与财政相关事务仍由丹麦代管的过渡政体。格陵兰全境大部分处在北极圈内，气候寒冷。隔海峡与加拿大和冰岛两国相望。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (216, 6, '美国美属萨摩亚群岛', '美属萨摩亚群岛', NULL, 'American Samoa', 'American Samoa', 'american samoa', 'AS', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (217, 6, '美国关岛', '关岛', NULL, 'The Territory of Guahan,Guam', 'Guam', 'the territory of guahan，guam', 'GU', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (218, 6, '美国北马里亚纳群岛自由邦', '北马里亚纳群岛自由邦', NULL, 'Northern Mariana Islands', 'Northern Mariana Islands', 'northern mariana islands', 'MP', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (219, 6, '美国本土外小岛屿', '美国本土外小岛屿', NULL, 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'united states minor outlying islands', 'UM', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (220, 6, '美国美属维尔京群岛', '美属维尔京群岛', NULL, 'The United States Virgin Islands', 'The United States Virgin Islands', 'the united states virgin islands', 'VI', NULL, NULL, NULL, 0, NULL, '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (221, 7, '荷属安地列斯群岛', '荷属安地列斯群岛', NULL, 'Netherlands Antilles', 'Netherlands Antilles', 'netherlands antilles', 'ANT', NULL, NULL, NULL, 0, '荷属安的列斯群岛（荷兰语：Netherlands Antilles） 加勒比海小安地列斯群岛的5个岛屿。1954年起成为荷兰的自治领地。由相隔遥远的南北两组岛屿组成︰北组位于小安地列斯群岛北端，包括圣尤斯特歇斯(Sint Eustatius)岛，圣马丁（荷兰语作圣马尔滕〔Sint Maarten〕)岛南部和萨巴(Saba)岛；南组距委内瑞拉海岸97公里(60哩），包括博奈尔(Bonaire)和库拉索(Curacao)二岛(1986年以前尚包括阿鲁巴〔Aruba〕岛)。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (222, 7, '智利共和国', '智利', NULL, 'Republic of Chile', 'Chile', 'republic of chile', 'CHL', 'ES', NULL, NULL, 0, '智利共和国（西班牙语：República de Chile）位于南美洲西南部，安第斯山脉西麓。东同阿根廷为邻，北与秘鲁、玻利维亚接壤，西临太平洋，南与南极洲隔海相望，是世界上地形最狭长的国家，国土面积756626平方公里。为南美洲国家联盟的成员国，在南美洲与阿根廷及巴西并列为ABC强国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (223, 7, '哥伦比亚共和国', '哥伦比亚', NULL, 'The Republic of Colombia', 'Colombia', 'the republic of colombia', 'COL', NULL, NULL, NULL, 0, '哥伦比亚共和国（西班牙语：República de Colombia），国土位于南美洲西北部，西临太平洋，北临加勒比海，东通委内瑞拉，东南通巴西，南与秘鲁、厄瓜多尔，西北与巴拿马为邻。为南美洲国家联盟成员国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (224, 7, '圭亚那共和国', '圭亚那', NULL, 'The Republic of Guyana', 'Guyana', 'the republic of guyana', 'GUY', NULL, NULL, NULL, 0, '圭亚那位于南美洲东北部，全称为圭亚那共和国（ Republic of Guyana），1966年脱离英国独立。印第安语意为“多水之乡”。国民主要是印度斯坦人和黑人，多信奉基督教、印度教和伊斯兰教。它是南美洲唯一以英语为官方语言的国家，也是英联邦成员国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (225, 7, '巴拉圭共和国', '巴拉圭', NULL, 'The Republic of Paraguay', 'Paraguay', 'the republic of paraguay', 'PRY', NULL, NULL, NULL, 0, '巴拉圭全称：巴拉圭共和国（西班牙语：República del Paraguay）是南美洲中部的内陆国家，境内主要山脉是阿曼拜山和巴兰卡尤山，其南边国境完全与阿根廷接壤，东北与西北角则分别是巴西与玻利维亚。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (226, 7, '秘鲁共和国', '秘鲁', NULL, 'The Republic of Peru', 'Peru', 'the republic of peru', 'PER', NULL, NULL, NULL, 0, '秘鲁，全称为秘鲁共和国（西班牙语：República del Perú），是南美洲西部的一个国家，北邻厄瓜多尔和哥伦比亚，东与巴西和玻利维亚接壤，南接智利，西濒太平洋，是南美洲国家联盟的成员国。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (227, 7, '苏里南共和国', '苏里南', NULL, 'The Republic of Suriname', 'Suriname', 'the republic of suriname', 'SUR', 'NL', NULL, NULL, 0, '苏里南共和国（荷兰语：Republiek Suriname；苏里南汤加语：Sranan；博杰普尔语：Sarnam）位于南美洲北部，北滨大西洋，南临巴西，东临法属圭亚那，西临圭亚那，是南美洲国家联盟的成员国，国名源于当地原住民苏里南人。该国旧称荷属圭亚那，原为荷兰在南美洲的殖民遗迹，1954年成为荷兰王国海外自治省，1975年时独立。苏里南无论以面积还是人口排名，都是南美洲最小的一个国家，也是西半球不属于荷兰王国组成体的地区中，唯一一个使用荷兰文为官方语言者，另外，汉语中的客家语是苏里南共和国的法定语言[1]  。首都帕拉马里博为苏里南河河口的商港。苏里南是一个种族、语言、宗教上极为多元的国家，当中穆斯林人口占苏里南的13%，其比例在所有美洲国家中最高。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (228, 7, '委内瑞拉玻利瓦尔共和国', '委内瑞拉', NULL, 'Bolivarian Republic of Venezuela', 'Venezuela', 'bolivarian republic of venezuela', 'VEN', NULL, NULL, NULL, 0, '委内瑞拉玻利瓦尔共和国（西班牙语：República Bolivariana de Venezuela）是位于南美洲北部的国家，也是南美洲国家联盟的成员国，首都加拉加斯。北临加勒比海，西与哥伦比亚相邻，南与巴西交界，东与圭亚那接壤。它被称为“瀑布之乡”，面积912050平方千米。海岸线长2813千米。原为印第安人居住地。1498年哥伦布航行美洲时到此。1523年西班牙人建立第一个殖民地。1567年沦为西班牙殖民地。1811年7月5日独立。1830年建立共和国。1974年6月28日同中国建交。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (229, 7, '乌拉圭东岸共和国', '乌拉圭', NULL, 'The Oriental Republic of Uruguay', 'Uruguay', 'the oriental republic of uruguay', 'URY', NULL, NULL, NULL, 0, '乌拉圭全称：乌拉圭东岸共和国（英语：The Oriental Republic of Uruguay；西班牙语：República Oriental del Uruguay），位于南美洲的东南部，乌拉圭河与拉普拉塔河的东岸，北邻巴西，西接阿根廷，东南濒大西洋。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (230, 7, '厄瓜多尔共和国', '厄瓜多尔', NULL, 'The Republic of Ecuador', 'Ecuador', 'the republic of ecuador', 'ECU', NULL, NULL, NULL, 0, '厄瓜多尔，全称厄瓜多尔共和国（西班牙语：República del Ecuador），南美洲国家联盟的成员国之一，位于南美洲西北部的国家，北与哥伦比亚相邻，南接秘鲁，西滨太平洋，与智利同为南美洲不与巴西相邻的国家，另辖有距厄瓜多尔本土1,000公里的加拉帕戈斯群岛。首都基多位于皮钦查火山的山麓。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (231, 7, '安提瓜和巴布达', '安提瓜和巴布达', NULL, 'Antigua and Barbuda', 'Antigua and Barbuda', 'antigua and barbuda', 'ATG', NULL, NULL, NULL, 0, '安提瓜和巴布达AG Antigua and Barbuda，位于加勒比海小安的列斯群岛的北部。为英联邦成员国。绝大多数为非洲黑人后裔，多数居民信奉基督教。首都为圣约翰，总人口9万（2015年）[1]  。安提瓜岛的面积为280平方公里。巴布达岛面积为160平方公里。安提瓜和巴布达岛属于热带气候，年平均气温27℃。年均降水量约1020毫米。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (232, 7, '阿鲁巴', '阿鲁巴岛', NULL, 'Aruba', 'Aruba', 'aruba', 'ABW', NULL, NULL, NULL, 0, '阿鲁巴岛位于加勒比海南部小安的列斯群岛的最西端，南临委内瑞拉，面积193平方公里，是荷兰殖民地。属热带气候，年平均气温27℃。人口95200人（1999年底）。主要为印第安人与欧洲白人的混血后裔。1997年出生率为1.64%，死亡率为0. 66%。官方语言为荷兰语，通用帕彼曼都语，也讲西班牙语和英语。80%以上的居民信奉天主教，少数信奉基督教新教。岛上最早的居民是阿拉瓦克印第安人。1499年西班牙占领该岛。1643年易手荷兰。1807年被英国夺取。1814年重归荷兰管辖，并成为荷属安的列斯的一部分。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (233, 7, '巴哈马国', '巴哈马', NULL, 'The Commonwealth of The Bahamas', 'Bahamas', 'the commonwealth of the bahamas', 'BHS', 'HT', NULL, NULL, 0, '巴哈马地处美国佛罗里达州以东，古巴和加勒比海以北，巴哈马包含700座岛屿和珊瑚礁。佛罗里达州东南海岸对面，古巴北侧。群岛由西北向东南延伸，长1220公里，宽96公里，由700多个岛屿及2000多个珊瑚礁组成，总面积为13878平方公里，其中20余个岛屿有人居住。属亚热带气候，年平均气温23.5°C。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (234, 7, '巴巴多斯', '巴巴多斯', NULL, 'Barbados', 'Barbados', 'barbados', 'BRB', NULL, NULL, NULL, 0, '巴巴多斯有稳固的民主政体，独立于1966年11月30日，是英联邦成员，其名字来自于葡萄牙语，指遍地都是的野生的无花果树。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (235, 7, '开曼群岛', '开曼群岛', NULL, 'Cayman Islands', 'Cayman Is', 'cayman islands', 'CYM', NULL, NULL, NULL, 0, '开曼群岛（The Cayman Islands ）是英国在西加勒比群岛的一块海外属地，首府为乔治敦（Georg Town）。开曼由大开曼、小开曼和开曼布拉克等岛屿组成，东部边缘为开曼海沟。开曼是著名的离岸金融中心和“避税天堂”，亦是世界著名的潜水胜地、旅游度假圣地。金融和旅游业是其主要经济来源。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (236, 7, '格林纳达', '格林纳达', NULL, 'Grenada', 'Grenada', 'grenada', 'GRD', NULL, NULL, NULL, 0, '农业和旅游业是经济的基础，主要农产品肉豆蔻产量约占世界总产量的三分之一，仅次于印度尼西亚居世界第二位。现为英联邦成员国之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (237, 7, '海地共和国', '海地', NULL, 'The Republic of Haiti', 'Haiti', 'the republic of haiti', 'HTI', NULL, NULL, NULL, 0, '海地是世界上最为贫困的国家之一，最不发达国家之一，经济以农业为主，基础设施建设非常落后。由于能源不足，海地的工业非常不发达，失业率也极高，三分之二的工人没有固定的工作。美国是海地最大的援助国，1995至1999年间向海地提供了8.84亿美元的援助。海地与台湾当局保持着所谓的“外交关系”', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (238, 7, '牙买加', '牙买加', NULL, 'Jamaica', 'Jamaica', 'jamaica', 'JAM', NULL, NULL, NULL, 0, '牙买加（Jamaica），是加勒比海的其中一个岛国。牙买加原本是印第安人居住地，在1494年被哥伦布发现，不久之后就变成了西班牙人的殖民地。1655年，牙买加又被大英帝国占领。现为英联邦成员国之一', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (239, 7, '马提尼克岛', '马提尼克', NULL, 'Martinique', 'Martinique', 'martinique', 'MTQ', NULL, NULL, NULL, 0, '法国的海外大区，位于小安地列斯群岛的向风群岛最北部，岛上自然风光优美，有火山和海滩，盛产甘蔗、棕榈树、香蕉和菠萝等植物，曾被克里斯托弗·哥伦布（Christopher Columbus）喻为“世界上最美的国家”。马提尼克居民克里奥尔人还保留着传统的民俗习惯，催长身高的传说更使得该岛充满了神秘色彩。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (240, 7, '蒙特塞拉特岛', '蒙特塞拉特', NULL, 'Montserrat', 'Montserrat', 'montserrat', 'MSR', NULL, NULL, NULL, 0, '蒙塞拉特（英语：Montserrat）岛，英国海外领土，位于西印度群岛中背风群岛南部的火山岛，由哥伦布在1493年以西班牙内同名的山命名。该岛长18公里，宽11公里。岛上有三座主要的火山，年降雨量1525毫米。蒙塞拉特岛原本盛产海岛棉、香蕉、糖和蔬菜等。因为1995年7月18日开始的火山爆发，所以本岛多处被毁灭而三分之二人口逃往外国。火山爆发仍继续，使得岛上多处不可居住。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (241, 7, '特立尼达和多巴哥共和国', '特立尼达和多巴哥', NULL, 'Republic of Trinidad and Tobago', 'Trinidad and Tobago', 'republic of trinidad and tobago', 'TTO', NULL, NULL, NULL, 0, '源产品产值约占国民生产总值的40%左右，能源出口约占出口总收入的80%，是加勒比地区重要的石油输出国。加工制造业门类较齐全。建筑业、旅游业、金融保险业等行业发展较快。特多已同中国、加拿大、法国、英国、美国等国签署了双边投资协定，与中国、加拿大、丹麦、德国、法国、意大利、挪威、瑞典、瑞士、美国等国签署了避免双重征税协定，以吸引更多外来直接投资。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (242, 7, '圣基茨和尼维斯联邦', '圣其茨-尼维斯', NULL, 'The Federation of Saint Kitts and Nevis', 'St Kitts-Nevis', 'the federation of saint kitts and nevis', 'KNA', NULL, NULL, NULL, 0, '圣基茨和尼维斯位于东加勒比海背风群岛北部是一个由圣克里斯多福岛（圣基茨岛）与尼维斯岛所组成的联邦制岛国，在1983年9月19日独立，现为英联邦成员国之一，面积267平方公里。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (243, 7, '圣皮埃尔和密克隆群岛', '圣皮埃尔和密克隆', NULL, 'The Islands of st pierre and miquelon', 'St.Pierre and Miquelon', 'the islands of st pierre and miquelon', 'SPM', NULL, NULL, NULL, 0, 'The Islands of st pierre and miquelon，Iles Saint pierre et Mique  lon', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (244, 7, '阿根廷共和国', '阿根廷', NULL, 'The Republic of Argentina', 'Argentina', 'the republic of argentina', 'ARG', NULL, NULL, NULL, 0, '阿根廷是南美洲国家联盟、20国集团成员和拉美第三大经济体。阿根廷是世界上综合国力较强的发展中国家之一。阿根廷也是世界粮食和肉类的主要生产和出口国之一。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (245, 7, '伯利兹', '伯利兹', NULL, 'Belize', 'Belize', 'belize', 'BLZ', NULL, NULL, NULL, 0, '伯利兹的原始居民是玛雅人，16世纪初，伯利兹沦为西班牙殖民地。1786年，英国取得对该地的实际管辖权，称英属洪都拉斯。1981年脱离英国独立，而伯利兹的名字来自该国的河流伯利兹河及最大的城市伯利兹市，该市是伯利兹的原首都，新首都为贝尔墨邦。[1] ', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (246, 7, '玻利维亚共和国', '玻利维亚', NULL, 'The Republic of Bolivia', 'Bolivia', 'the republic of bolivia', 'BOL', NULL, NULL, NULL, 0, '玻利维亚是南美洲的一个内陆国家，全称为玻利维亚共和国（西班牙语：En la República de Bolivia ），为南美洲国家联盟的成员国。邻国有巴西、秘鲁、智利、阿根廷、巴拉圭五国，法定首都为苏克雷，但实际上的政府所在地为拉巴斯，拉巴斯海拔高度超过3600米，为世界海拔最高的首都。', '', NULL, '', NULL);
INSERT INTO `ai_country_v2` VALUES (247, 7, '巴西联邦共和国', '巴西', NULL, 'The Federative Republic of Brazil', 'Brazil', 'the federative republic of brazil', 'BRA', 'PT', NULL, NULL, 0, '巴西即巴西联邦共和国，是南美洲最大的国家，享有“足球王国”的美誉。国土总面积854.74万平方公里，居世界第五。[1]  总人口2.02亿。与乌拉圭、阿根廷、巴拉圭、玻利维亚、秘鲁、哥伦比亚、委内瑞拉、圭亚那、苏里南、法属圭亚那十国接壤', '', NULL, '', NULL);

-- ----------------------------
-- Table structure for coin
-- ----------------------------
DROP TABLE IF EXISTS `coin`;
CREATE TABLE `coin`  (
  `id` bigint NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '货币名称',
  `cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中文名称',
  `en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名称',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'logo图url',
  `infolink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种资料链接',
  `information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '币种简介',
  `min_tx_fee` double NULL DEFAULT NULL COMMENT '最小提币手续费',
  `min_withdraw_amount` decimal(18, 8) NULL DEFAULT NULL COMMENT '最小提币数量',
  `max_tx_fee` double NULL DEFAULT NULL COMMENT '最大提币手续费',
  `max_withdraw_amount` decimal(18, 8) NULL DEFAULT NULL COMMENT '最大提币数量',
  `cny_rate` double NULL DEFAULT NULL COMMENT '对人民币汇率',
  `usd_rate` double NULL DEFAULT NULL COMMENT '对美元汇率',
  `can_withdraw` tinyint(1) NULL DEFAULT 0 COMMENT '是否能提币 0:是 1:否',
  `can_recharge` tinyint(1) NULL DEFAULT 0 COMMENT '是否能充币 0:是 1:否',
  `can_transfer` tinyint(1) NULL DEFAULT 0 COMMENT '是否能转账 0:是 1:否',
  `can_auto_withdraw` tinyint(1) NULL DEFAULT 0 COMMENT '是否能自动提币 0:是 1:否',
  `recharge_amount` decimal(18, 8) NULL DEFAULT NULL COMMENT '充币阈值',
  `withdraw_threshold` decimal(18, 8) NULL DEFAULT NULL COMMENT '提现阈值',
  `miner_fee` decimal(18, 8) NULL DEFAULT NULL COMMENT '转账时付给矿工的手续费',
  `account_type` int NULL DEFAULT NULL COMMENT '账户类型：0：默认  1：EOS类型',
  `deposit_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '充值地址（仅账户类型为EOS类型有效）',
  `sort` tinyint NULL DEFAULT 0 COMMENT '排序',
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0启用，2停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0未删除，2已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '货币表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coin
-- ----------------------------
INSERT INTO `coin` VALUES (1, 'Bitcoin', '比特币', 'BTC', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/BTC.png', NULL, NULL, 0.01, 5.00000000, 0.001, 0.00200000, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, NULL);
INSERT INTO `coin` VALUES (2, 'Ethereum', '以太坊', 'ETC', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/ETH.png', NULL, NULL, 0.1, 1000.00000000, 0.01, 1.00000000, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '', NULL, '', NULL, NULL);
INSERT INTO `coin` VALUES (3, 'TRX', '波场币', 'TRX', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/TRX.png', NULL, NULL, 0.1, 1000.00000000, 0.01, 1.00000000, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '', NULL, '', NULL, NULL);
INSERT INTO `coin` VALUES (4, 'DASH', '达世币', 'DASH', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/DASH.png', NULL, NULL, 0, 0.00000000, 0, 0.00000000, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '', NULL, '', NULL, NULL);
INSERT INTO `coin` VALUES (5, 'DOGE', '狗狗币', 'DOGE', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/DOGE.png', NULL, NULL, 10, 100000.00000000, 4, 10.00000000, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '', NULL, '', NULL, NULL);
INSERT INTO `coin` VALUES (6, 'USDT', '泰达币', 'USDT', 'https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/USDT.png', NULL, NULL, 1, 100000.00000000, 0.01, 1.00000000, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (28, 'ai_bank', '银行信息表', NULL, NULL, 'AiBank', 'crud', 'com.cloud.system', 'system', 'bank', '银行信息', 'ai-cloud', '0', '/', NULL, 'admin', '2023-02-20 20:50:09', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (29, 'ai_country', '国家信息表', NULL, NULL, 'AiCountry', 'crud', 'com.cloud.system', 'system', 'country', '国家信息', 'ai-cloud', '0', '/', NULL, 'admin', '2023-02-20 20:50:09', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (30, 'coin', '货币表', NULL, NULL, 'Coin', 'crud', 'com.cloud.system', 'system', 'coin', '货币', 'ai-cloud', '0', '/', NULL, 'admin', '2023-03-21 00:35:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 553 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (531, '28', 'id', NULL, 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (532, '28', 'bank_name', '银行名称', 'varchar(255)', 'String', 'bankName', '1', '0', NULL, '1', NULL, NULL, NULL, 'LIKE', 'input', '', 2, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (533, '28', 'bank_icon', 'icon', 'varchar(255)', 'String', 'bankIcon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (534, '28', 'sort', '排序', 'int', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (535, '28', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (536, '28', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (537, '28', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (538, '28', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (539, '28', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (540, '29', 'id', 'id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (541, '29', 'zh_name', '中文名称', 'varchar(255)', 'String', 'zhName', '1', '0', NULL, '1', NULL, NULL, NULL, 'LIKE', 'input', '', 2, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (542, '29', 'en_name', '英文名称', 'varchar(255)', 'String', 'enName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (543, '29', 'country_icon', 'icon', 'varchar(255)', 'String', 'countryIcon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (544, '29', 'area_code', '区号', 'varchar(255)', 'String', 'areaCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (545, '29', 'language', '语言', 'varchar(255)', 'String', 'language', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (546, '29', 'local_currency', '当地货币缩写', 'varchar(255)', 'String', 'localCurrency', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-02-20 20:50:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (547, '29', 'sort', '排序', 'int', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-02-20 20:50:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (548, '29', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-02-20 20:50:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (549, '29', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-02-20 20:50:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (550, '29', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-02-20 20:50:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (551, '29', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-02-20 20:50:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (552, '29', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2023-02-20 20:50:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (553, '30', 'id', 'id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-21 00:35:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (554, '30', 'name', '货币名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-21 00:35:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (555, '30', 'cn_name', '中文名称', 'varchar(255)', 'String', 'cnName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-21 00:35:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (556, '30', 'en_name', '英文名称', 'varchar(255)', 'String', 'enName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (557, '30', 'icon_url', 'logo图url', 'varchar(255)', 'String', 'iconUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (558, '30', 'infolink', '币种资料链接', 'varchar(255)', 'String', 'infolink', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (559, '30', 'information', '币种简介', 'varchar(255)', 'String', 'information', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (560, '30', 'min_tx_fee', '最小提币手续费', 'double', 'Long', 'minTxFee', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (561, '30', 'min_withdraw_amount', '最小提币数量', 'decimal(18,8)', 'BigDecimal', 'minWithdrawAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (562, '30', 'max_tx_fee', '最大提币手续费', 'double', 'Long', 'maxTxFee', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (563, '30', 'max_withdraw_amount', '最大提币数量', 'decimal(18,8)', 'BigDecimal', 'maxWithdrawAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (564, '30', 'cny_rate', '对人民币汇率', 'double', 'Long', 'cnyRate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (565, '30', 'usd_rate', '对美元汇率', 'double', 'Long', 'usdRate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (566, '30', 'can_withdraw', '是否能提币 0:是 1:否', 'tinyint(1)', 'Integer', 'canWithdraw', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (567, '30', 'can_recharge', '是否能充币 0:是 1:否', 'tinyint(1)', 'Integer', 'canRecharge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (568, '30', 'can_transfer', '是否能转账 0:是 1:否', 'tinyint(1)', 'Integer', 'canTransfer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (569, '30', 'can_auto_withdraw', '是否能自动提币 0:是 1:否', 'tinyint(1)', 'Integer', 'canAutoWithdraw', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (570, '30', 'recharge_amount', '充币阈值', 'decimal(18,8)', 'BigDecimal', 'rechargeAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (571, '30', 'withdraw_threshold', '提现阈值', 'decimal(18,8)', 'BigDecimal', 'withdrawThreshold', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (572, '30', 'miner_fee', '转账时付给矿工的手续费', 'decimal(18,8)', 'BigDecimal', 'minerFee', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (573, '30', 'account_type', '账户类型：0：默认  1：EOS类型', 'int', 'Long', 'accountType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 21, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (574, '30', 'deposit_address', '充值地址（仅账户类型为EOS类型有效）', 'varchar(255)', 'String', 'depositAddress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (575, '30', 'sort', '排序', 'tinyint', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (576, '30', 'status_flag', '状态：0启用，2停用', 'int', 'Long', 'statusFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (577, '30', 'delete_flag', '删除：0未删除，2已删除', 'int', 'Long', 'deleteFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (578, '30', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (579, '30', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (580, '30', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 28, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (581, '30', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 29, 'admin', '2023-03-21 00:35:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (582, '30', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 30, 'admin', '2023-03-21 00:35:16', '', NULL);

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
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
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
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('Scheduler', 'DESKTOP-65BIL2N1679384369034', 1679384546834, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
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
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
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
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1679384380000, -1, 5, 'PAUSED', 'CRON', 1679384371000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1679384385000, -1, 5, 'PAUSED', 'CRON', 1679384371000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1679384380000, -1, 5, 'PAUSED', 'CRON', 1679384372000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', 'true', 'Y', 'admin', '2023-02-27 10:49:25', 'admin', '2023-02-27 14:37:49', '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
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
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
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
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
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
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
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
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 617 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (636, 'ai168', '220.165.207.210', '0', '登录成功', '2023-03-21 01:12:04');
INSERT INTO `sys_logininfor` VALUES (637, 'ai168', '61.166.195.21', '0', '登录成功', '2023-03-21 09:37:35');
INSERT INTO `sys_logininfor` VALUES (638, 'ceshi', '27.227.135.239', '0', '登录成功', '2023-03-21 10:52:24');
INSERT INTO `sys_logininfor` VALUES (639, 'ai168', '127.0.0.1', '0', '退出成功', '2023-03-21 10:55:03');
INSERT INTO `sys_logininfor` VALUES (640, 'ai168', '127.0.0.1', '0', '登录成功', '2023-03-21 10:55:07');
INSERT INTO `sys_logininfor` VALUES (641, 'ai168', '61.166.195.21', '0', '登录成功', '2023-03-21 11:39:32');
INSERT INTO `sys_logininfor` VALUES (642, 'ceshi', '61.166.195.21', '0', '登录成功', '2023-03-21 11:45:48');
INSERT INTO `sys_logininfor` VALUES (643, 'ceshi', '106.57.83.24', '0', '登录成功', '2023-03-21 12:18:08');
INSERT INTO `sys_logininfor` VALUES (644, 'ai168', '120.229.243.150', '0', '登录成功', '2023-03-21 12:18:34');
INSERT INTO `sys_logininfor` VALUES (645, 'ceshi', '61.140.183.226', '0', '登录成功', '2023-03-21 12:23:56');
INSERT INTO `sys_logininfor` VALUES (646, 'ai168', '60.27.158.86', '0', '登录成功', '2023-03-21 12:39:16');
INSERT INTO `sys_logininfor` VALUES (647, 'ai168', '39.144.169.138', '0', '登录成功', '2023-03-21 13:35:42');
INSERT INTO `sys_logininfor` VALUES (648, 'ai168', '106.108.18.228', '0', '登录成功', '2023-03-21 13:38:24');
INSERT INTO `sys_logininfor` VALUES (649, 'ai168', '220.202.152.106', '0', '登录成功', '2023-03-21 13:43:29');
INSERT INTO `sys_logininfor` VALUES (650, 'ceshi', '221.221.158.97', '0', '登录成功', '2023-03-21 14:25:37');
INSERT INTO `sys_logininfor` VALUES (651, 'ai168', '113.246.64.223', '0', '登录成功', '2023-03-21 14:27:30');
INSERT INTO `sys_logininfor` VALUES (652, 'ceshi', '111.203.183.178', '0', '登录成功', '2023-03-21 14:27:49');
INSERT INTO `sys_logininfor` VALUES (653, 'ceshi', '221.180.206.96', '0', '登录成功', '2023-03-21 14:29:15');
INSERT INTO `sys_logininfor` VALUES (654, 'ceshi', '111.203.183.178', '0', '退出成功', '2023-03-21 14:29:22');
INSERT INTO `sys_logininfor` VALUES (655, 'ceshi', '111.203.183.178', '0', '登录成功', '2023-03-21 14:29:28');
INSERT INTO `sys_logininfor` VALUES (656, 'ceshi', '221.180.206.96', '0', '退出成功', '2023-03-21 14:29:40');
INSERT INTO `sys_logininfor` VALUES (657, 'ceshi', '221.180.206.96', '0', '登录成功', '2023-03-21 14:29:45');
INSERT INTO `sys_logininfor` VALUES (658, 'ai168', '220.248.226.18', '0', '登录成功', '2023-03-21 14:33:11');
INSERT INTO `sys_logininfor` VALUES (659, 'ceshi', '111.183.47.135', '0', '登录成功', '2023-03-21 14:33:20');
INSERT INTO `sys_logininfor` VALUES (660, 'ceshi', '121.235.194.29', '0', '登录成功', '2023-03-21 14:33:32');
INSERT INTO `sys_logininfor` VALUES (661, 'ceshi', '111.183.47.135', '0', '退出成功', '2023-03-21 14:33:59');
INSERT INTO `sys_logininfor` VALUES (662, 'ceshi', '111.183.47.135', '0', '登录成功', '2023-03-21 14:34:23');
INSERT INTO `sys_logininfor` VALUES (663, 'ceshi', '121.235.194.29', '0', '退出成功', '2023-03-21 14:34:25');
INSERT INTO `sys_logininfor` VALUES (664, 'ceshi', '121.235.194.29', '0', '登录成功', '2023-03-21 14:34:32');
INSERT INTO `sys_logininfor` VALUES (665, 'ceshi', '111.183.47.135', '0', '退出成功', '2023-03-21 14:35:03');
INSERT INTO `sys_logininfor` VALUES (666, 'ceshi', '111.183.47.135', '0', '登录成功', '2023-03-21 14:35:13');
INSERT INTO `sys_logininfor` VALUES (667, 'ai168', '121.235.194.29', '0', '登录成功', '2023-03-21 14:35:38');
INSERT INTO `sys_logininfor` VALUES (668, 'ceshi', '117.22.171.70', '0', '登录成功', '2023-03-21 14:36:15');
INSERT INTO `sys_logininfor` VALUES (669, 'ceshi', '111.203.183.178', '0', '退出成功', '2023-03-21 14:37:41');
INSERT INTO `sys_logininfor` VALUES (670, 'ai168', '117.22.171.70', '0', '登录成功', '2023-03-21 14:37:42');
INSERT INTO `sys_logininfor` VALUES (671, 'ai168', '123.172.82.176', '0', '登录成功', '2023-03-21 14:37:43');
INSERT INTO `sys_logininfor` VALUES (672, 'ceshi', '111.203.183.178', '0', '登录成功', '2023-03-21 14:37:50');
INSERT INTO `sys_logininfor` VALUES (673, 'ai168', '117.22.171.70', '0', '退出成功', '2023-03-21 14:38:03');
INSERT INTO `sys_logininfor` VALUES (674, 'ai168', '117.22.171.70', '0', '登录成功', '2023-03-21 14:38:07');
INSERT INTO `sys_logininfor` VALUES (675, 'ceshi', '106.57.86.37', '0', '登录成功', '2023-03-21 14:38:52');
INSERT INTO `sys_logininfor` VALUES (676, 'ceshi', '220.163.134.55', '0', '登录成功', '2023-03-21 14:39:15');
INSERT INTO `sys_logininfor` VALUES (677, 'ai168', '220.163.134.55', '0', '登录成功', '2023-03-21 14:40:14');
INSERT INTO `sys_logininfor` VALUES (678, 'ai168', '118.74.52.32', '0', '登录成功', '2023-03-21 14:40:19');
INSERT INTO `sys_logininfor` VALUES (679, 'ai168', '220.163.134.55', '0', '退出成功', '2023-03-21 14:40:41');
INSERT INTO `sys_logininfor` VALUES (680, 'ai168', '220.163.134.55', '0', '登录成功', '2023-03-21 14:40:46');
INSERT INTO `sys_logininfor` VALUES (681, 'ai168', '218.77.104.248', '0', '登录成功', '2023-03-21 14:41:32');
INSERT INTO `sys_logininfor` VALUES (682, 'ceshi', '124.133.0.122', '0', '登录成功', '2023-03-21 14:43:42');
INSERT INTO `sys_logininfor` VALUES (683, 'ceshi', '220.175.54.50', '0', '登录成功', '2023-03-21 14:51:33');
INSERT INTO `sys_logininfor` VALUES (684, 'ai168', '223.104.197.160', '0', '登录成功', '2023-03-21 14:51:45');
INSERT INTO `sys_logininfor` VALUES (685, 'ai168', '223.104.197.160', '0', '退出成功', '2023-03-21 14:53:21');
INSERT INTO `sys_logininfor` VALUES (686, 'ceshi', '211.144.15.162', '0', '登录成功', '2023-03-21 14:53:36');
INSERT INTO `sys_logininfor` VALUES (687, 'ceshi', '223.104.197.160', '0', '登录成功', '2023-03-21 14:53:59');
INSERT INTO `sys_logininfor` VALUES (688, 'ceshi', '211.144.15.162', '0', '退出成功', '2023-03-21 14:54:05');
INSERT INTO `sys_logininfor` VALUES (689, 'ceshi', '211.144.15.162', '0', '登录成功', '2023-03-21 14:54:11');
INSERT INTO `sys_logininfor` VALUES (690, 'ceshi', '223.104.197.160', '0', '退出成功', '2023-03-21 14:54:17');
INSERT INTO `sys_logininfor` VALUES (691, 'ceshi', '223.104.197.160', '0', '登录成功', '2023-03-21 14:54:21');
INSERT INTO `sys_logininfor` VALUES (692, 'ai168', '221.225.151.34', '0', '登录成功', '2023-03-21 14:59:33');
INSERT INTO `sys_logininfor` VALUES (693, 'ai168', '221.225.151.34', '0', '退出成功', '2023-03-21 15:00:01');
INSERT INTO `sys_logininfor` VALUES (694, 'ceshi', '221.225.151.34', '0', '登录成功', '2023-03-21 15:00:34');
INSERT INTO `sys_logininfor` VALUES (695, 'ceshi', '39.82.201.10', '0', '登录成功', '2023-03-21 15:21:55');
INSERT INTO `sys_logininfor` VALUES (696, 'ai168', '39.82.201.10', '0', '登录成功', '2023-03-21 15:26:49');
INSERT INTO `sys_logininfor` VALUES (697, 'ceshi', '39.82.201.10', '0', '登录成功', '2023-03-21 15:28:38');
INSERT INTO `sys_logininfor` VALUES (698, 'ceshi', '218.62.24.157', '0', '登录成功', '2023-03-21 15:30:07');
INSERT INTO `sys_logininfor` VALUES (699, 'ai168', '1.192.246.27', '0', '登录成功', '2023-03-21 15:31:27');
INSERT INTO `sys_logininfor` VALUES (700, 'ceshi', '1.192.246.27', '0', '登录成功', '2023-03-21 15:34:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 10, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-08-28 20:42:08', 'admin', '2023-02-20 15:35:45', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 11, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-08-28 20:42:08', 'admin', '2023-02-20 15:35:58', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 12, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-08-28 20:42:08', 'admin', '2023-02-20 15:36:05', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '资源管理', 0, 1, 'resource', NULL, NULL, 1, 0, 'M', '0', '0', '', 'international', 'admin', '2023-02-20 18:05:39', 'admin', '2023-03-21 00:39:40', '资源管理目录');
INSERT INTO `sys_menu` VALUES (5, '货币管理', 0, 2, 'coin', NULL, NULL, 1, 0, 'M', '0', '0', '', 'validCode', 'admin', '2023-03-21 00:38:15', 'admin', '2023-03-21 00:39:24', '货币管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel监控', 2, 8, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-08-28 20:42:08', 'admin', '2022-10-08 14:24:42', '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos监控', 2, 7, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-08-28 20:42:08', 'admin', '2022-10-08 14:24:35', '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin监控', 2, 6, 'http://localhost:9201/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'admin', 'admin', '2022-06-17 15:47:48', 'ceshi', '2023-03-21 01:01:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'M', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-08-28 20:42:08', 'admin', '2022-10-17 14:19:55', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (117, '服务监控', 2, 3, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-10-07 23:15:50', 'admin', '2022-10-08 01:09:22', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (118, '缓存监控', 2, 4, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-10-07 23:15:50', 'admin', '2022-10-17 16:22:34', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (119, '缓存列表', 2, 5, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-10-07 23:15:50', 'admin', '2022-10-17 16:22:46', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-08-28 20:42:08', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '区域信息', 4, 1, 'country', 'resource/country/index', NULL, 1, 0, 'C', '0', '0', 'resource:country:list', 'international', 'admin', '2023-02-20 21:24:01', 'admin', '2023-02-20 21:33:43', '国家信息菜单');
INSERT INTO `sys_menu` VALUES (2004, '区域查询', 2003, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:country:query', '#', 'admin', '2023-02-20 21:24:01', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '区域新增', 2003, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:country:add', '#', 'admin', '2023-02-20 21:24:01', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '区域修改', 2003, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:country:edit', '#', 'admin', '2023-02-20 21:24:01', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '区域删除', 2003, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:country:remove', '#', 'admin', '2023-02-20 21:24:01', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '区域导出', 2003, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:country:export', '#', 'admin', '2023-02-20 21:24:01', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '银行信息', 4, 1, 'bank', 'resource/bank/index', NULL, 1, 0, 'C', '0', '0', 'resource:bank:list', 'nested', 'admin', '2023-02-20 21:28:57', 'admin', '2023-02-20 21:30:39', '银行信息菜单');
INSERT INTO `sys_menu` VALUES (2010, '银行查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:bank:query', '#', 'admin', '2023-02-20 21:28:57', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '银行新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:bank:add', '#', 'admin', '2023-02-20 21:28:57', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '银行修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:bank:edit', '#', 'admin', '2023-02-20 21:28:57', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '银行删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:bank:remove', '#', 'admin', '2023-02-20 21:28:57', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '银行导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'resource:bank:export', '#', 'admin', '2023-02-20 21:28:57', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '币币管理', 5, 1, 'coin', 'coin/coin/index', NULL, 1, 0, 'C', '0', '0', 'coin:coin:list', 'example', 'admin', '2023-03-21 00:40:04', 'admin', '2023-03-21 00:53:02', '货币菜单');
INSERT INTO `sys_menu` VALUES (2016, '货币查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'coin:coin:query', '#', 'admin', '2023-03-21 00:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '货币新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'coin:coin:add', '#', 'admin', '2023-03-21 00:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '货币修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'coin:coin:edit', '#', 'admin', '2023-03-21 00:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '货币删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'coin:coin:remove', '#', 'admin', '2023-03-21 00:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '货币导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'coin:coin:export', '#', 'admin', '2023-03-21 00:40:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 798 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (825, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.165.207.210', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 01:12:04', 4);
INSERT INTO `sys_oper_log` VALUES (826, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.165.207.210', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 01:12:04', 3);
INSERT INTO `sys_oper_log` VALUES (827, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '61.166.195.21', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 09:37:35', 4);
INSERT INTO `sys_oper_log` VALUES (828, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '61.166.195.21', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 09:37:35', 4);
INSERT INTO `sys_oper_log` VALUES (829, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 10:55:07', 18);
INSERT INTO `sys_oper_log` VALUES (830, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 10:55:07', 18);
INSERT INTO `sys_oper_log` VALUES (831, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 10:55:10', 33);
INSERT INTO `sys_oper_log` VALUES (832, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 10:55:38', 34);
INSERT INTO `sys_oper_log` VALUES (833, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 11:01:12', 33);
INSERT INTO `sys_oper_log` VALUES (834, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '127.0.0.1', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 11:01:14', 32);
INSERT INTO `sys_oper_log` VALUES (835, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '61.166.195.21', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 11:39:32', 3);
INSERT INTO `sys_oper_log` VALUES (836, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '61.166.195.21', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 11:39:32', 3);
INSERT INTO `sys_oper_log` VALUES (837, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '61.166.195.21', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 11:39:36', 5);
INSERT INTO `sys_oper_log` VALUES (838, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '120.229.243.150', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 12:18:34', 6);
INSERT INTO `sys_oper_log` VALUES (839, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '120.229.243.150', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 12:18:35', 2);
INSERT INTO `sys_oper_log` VALUES (840, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '120.229.243.150', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 12:18:42', 13);
INSERT INTO `sys_oper_log` VALUES (841, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '60.27.158.86', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 12:39:16', 5);
INSERT INTO `sys_oper_log` VALUES (842, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '60.27.158.86', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 12:39:17', 7);
INSERT INTO `sys_oper_log` VALUES (843, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.144.169.138', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:35:43', 6);
INSERT INTO `sys_oper_log` VALUES (844, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.144.169.138', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:35:43', 6);
INSERT INTO `sys_oper_log` VALUES (845, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.144.169.138', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:36:01', 4);
INSERT INTO `sys_oper_log` VALUES (846, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '106.108.18.228', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:38:24', 4);
INSERT INTO `sys_oper_log` VALUES (847, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '106.108.18.228', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:38:24', 3);
INSERT INTO `sys_oper_log` VALUES (848, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '106.108.18.228', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:38:41', 3);
INSERT INTO `sys_oper_log` VALUES (849, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '106.108.18.228', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:38:46', 3);
INSERT INTO `sys_oper_log` VALUES (850, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.202.152.106', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:43:29', 3);
INSERT INTO `sys_oper_log` VALUES (851, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.202.152.106', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:43:29', 2);
INSERT INTO `sys_oper_log` VALUES (852, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.202.152.106', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 13:43:39', 2);
INSERT INTO `sys_oper_log` VALUES (853, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '113.246.64.223', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:27:30', 5);
INSERT INTO `sys_oper_log` VALUES (854, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '113.246.64.223', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:27:30', 2);
INSERT INTO `sys_oper_log` VALUES (855, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '113.246.64.223', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:27:39', 3);
INSERT INTO `sys_oper_log` VALUES (856, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '113.246.64.223', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:27:45', 5);
INSERT INTO `sys_oper_log` VALUES (857, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.248.226.18', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:33:11', 5);
INSERT INTO `sys_oper_log` VALUES (858, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.248.226.18', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:33:12', 3);
INSERT INTO `sys_oper_log` VALUES (859, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.248.226.18', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:33:19', 3);
INSERT INTO `sys_oper_log` VALUES (860, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.248.226.18', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:33:44', 2);
INSERT INTO `sys_oper_log` VALUES (861, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:35:38', 3);
INSERT INTO `sys_oper_log` VALUES (862, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:35:38', 3);
INSERT INTO `sys_oper_log` VALUES (863, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:35:58', 3);
INSERT INTO `sys_oper_log` VALUES (864, '修改银行信息', 2, 'com.cloud.system.resource.controller.AiBankController.edit()', 'PUT', 1, 'ceshi', NULL, '/bank', '111.183.47.135', '', '{\"bankIcon\":\"https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/bank/yinhang-gongshang.png\",\"bankName\":\"中国工商\",\"createBy\":\"\",\"id\":1,\"params\":{},\"sort\":0,\"updateBy\":\"ceshi\",\"updateTime\":\"2023-03-21 06:35:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-21 14:35:59', 49);
INSERT INTO `sys_oper_log` VALUES (865, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:36:01', 2);
INSERT INTO `sys_oper_log` VALUES (866, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:36:06', 4);
INSERT INTO `sys_oper_log` VALUES (867, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:36:09', 7);
INSERT INTO `sys_oper_log` VALUES (868, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:36:16', 3);
INSERT INTO `sys_oper_log` VALUES (869, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '121.235.194.29', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:36:17', 3);
INSERT INTO `sys_oper_log` VALUES (870, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:37:42', 3);
INSERT INTO `sys_oper_log` VALUES (871, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:37:43', 4);
INSERT INTO `sys_oper_log` VALUES (872, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '123.172.82.176', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:37:43', 2);
INSERT INTO `sys_oper_log` VALUES (873, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '123.172.82.176', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:37:44', 2);
INSERT INTO `sys_oper_log` VALUES (874, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:07', 5);
INSERT INTO `sys_oper_log` VALUES (875, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:08', 5);
INSERT INTO `sys_oper_log` VALUES (876, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:18', 4);
INSERT INTO `sys_oper_log` VALUES (877, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:21', 3);
INSERT INTO `sys_oper_log` VALUES (878, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:27', 2);
INSERT INTO `sys_oper_log` VALUES (879, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:28', 3);
INSERT INTO `sys_oper_log` VALUES (880, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '117.22.171.70', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:38:32', 2);
INSERT INTO `sys_oper_log` VALUES (881, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.163.134.55', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:15', 5);
INSERT INTO `sys_oper_log` VALUES (882, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.163.134.55', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:15', 2);
INSERT INTO `sys_oper_log` VALUES (883, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '118.74.52.32', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:19', 2);
INSERT INTO `sys_oper_log` VALUES (884, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '118.74.52.32', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:19', 3);
INSERT INTO `sys_oper_log` VALUES (885, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.163.134.55', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:46', 2);
INSERT INTO `sys_oper_log` VALUES (886, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.163.134.55', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:46', 2);
INSERT INTO `sys_oper_log` VALUES (887, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '220.163.134.55', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:40:54', 2);
INSERT INTO `sys_oper_log` VALUES (888, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '218.77.104.248', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:41:32', 2);
INSERT INTO `sys_oper_log` VALUES (889, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '218.77.104.248', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:41:32', 2);
INSERT INTO `sys_oper_log` VALUES (890, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '218.77.104.248', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:41:42', 5);
INSERT INTO `sys_oper_log` VALUES (891, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:51:45', 2);
INSERT INTO `sys_oper_log` VALUES (892, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:51:46', 5);
INSERT INTO `sys_oper_log` VALUES (893, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:52:45', 3);
INSERT INTO `sys_oper_log` VALUES (894, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:52:54', 3);
INSERT INTO `sys_oper_log` VALUES (895, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:52:57', 4);
INSERT INTO `sys_oper_log` VALUES (896, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:53:03', 3);
INSERT INTO `sys_oper_log` VALUES (897, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:53:08', 7);
INSERT INTO `sys_oper_log` VALUES (898, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:53:12', 3);
INSERT INTO `sys_oper_log` VALUES (899, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:53:13', 2);
INSERT INTO `sys_oper_log` VALUES (900, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '223.104.197.160', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:53:17', 2);
INSERT INTO `sys_oper_log` VALUES (901, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:33', 6);
INSERT INTO `sys_oper_log` VALUES (902, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:34', 3);
INSERT INTO `sys_oper_log` VALUES (903, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:39', 5);
INSERT INTO `sys_oper_log` VALUES (904, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:43', 3);
INSERT INTO `sys_oper_log` VALUES (905, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:44', 8);
INSERT INTO `sys_oper_log` VALUES (906, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:51', 3);
INSERT INTO `sys_oper_log` VALUES (907, '查询钱包余额', 0, 'com.cloud.user.controller.UserCenterApi.wallet()', 'POST', 1, 'ai168', NULL, '/user/wallet', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"availableBalance\":99859894.6001,\"frozenAmount\":0.0001},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:54', 2);
INSERT INTO `sys_oper_log` VALUES (908, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:55', 3);
INSERT INTO `sys_oper_log` VALUES (909, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '221.225.151.34', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 14:59:57', 2);
INSERT INTO `sys_oper_log` VALUES (910, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.82.201.10', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:26:49', 4);
INSERT INTO `sys_oper_log` VALUES (911, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.82.201.10', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:26:49', 2);
INSERT INTO `sys_oper_log` VALUES (912, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.82.201.10', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:26:56', 3);
INSERT INTO `sys_oper_log` VALUES (913, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '39.82.201.10', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:27:06', 3);
INSERT INTO `sys_oper_log` VALUES (914, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '1.192.246.27', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:31:27', 3);
INSERT INTO `sys_oper_log` VALUES (915, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '1.192.246.27', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:31:27', 2);
INSERT INTO `sys_oper_log` VALUES (916, '查询我的信息', 0, 'com.cloud.user.controller.UserCenterApi.userInfo()', 'POST', 1, 'ai168', NULL, '/user/info', '1.192.246.27', '', '', '{\"code\":200,\"data\":{\"age\":\"19\",\"attention\":0,\"fans\":0,\"headImg\":\"https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg\",\"likes\":0,\"nickName\":\"少女与日记\",\"phone\":\"13888888888\",\"sex\":\"1\",\"sign\":\"这个世界本就是平衡的，想要得到什么就要付出什么\",\"userType\":2,\"vipEndTime\":\"2032-11-09\",\"vipStartTime\":\"2022-11-01\",\"vipType\":2},\"msg\":\"成功\"}', 0, NULL, '2023-03-21 15:31:40', 3);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
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
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
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
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-08-28 20:42:08', 'admin', '2023-03-21 00:54:56', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 102);
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (2, 104);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (2, 106);
INSERT INTO `sys_role_dept` VALUES (2, 107);
INSERT INTO `sys_role_dept` VALUES (2, 108);
INSERT INTO `sys_role_dept` VALUES (2, 109);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
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
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2230566430 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'aicloud888@163.com', '13888888888', '1', ' https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2023/01/10/5784faab322444c1956faa172c843d04blob', '$2a$10$K4pD.GHcCV8Gn20s3Jzx6eRv/ENQCGnsa7qfFFGl75Ti6KQkFMVT.', '0', '0', '127.0.0.1', '2022-10-07 23:28:38', 'admin', '2022-08-28 20:42:08', '', '2023-01-10 16:40:45', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'aicloud', '管理员', '00', 'aicloud888@163.com', '13999999999', '1', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-08-28 20:42:08', 'admin', '2022-08-28 20:42:08', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (2230566428, 105, 'ceshi', '测试员', '00', 'aicloud888@163.com', '15888888888', '1', '', '$2a$10$FUcxcfHSqM2Go6kkzLt5n.VhGoPZr6oDXjEOa4mcV3eT1BbDNi3ha', '0', '0', '', NULL, 'admin', '2022-11-01 18:33:40', 'admin', '2022-11-01 19:08:07', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2230566428, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL COMMENT '用户id',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户密码',
  `uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户绑定手机号',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int NULL DEFAULT NULL COMMENT '性别 (0男 1女 2未知)',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
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
  `activate` int NULL DEFAULT 1 COMMENT '是否激活; 用户注册后未登录过，即为此用户未激活 1：未激活 2：已激活',
  `activate_time` datetime NULL DEFAULT NULL COMMENT '激活时间',
  `fans` int NULL DEFAULT 0 COMMENT '粉丝数',
  `attention` int NULL DEFAULT 0 COMMENT '用户关注数',
  `opus` int NULL DEFAULT 0 COMMENT '用户作品数量',
  `likes` int NULL DEFAULT 0 COMMENT '点赞数',
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
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0启用，2停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0未删除，2已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
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
  `id` bigint NOT NULL COMMENT '账户id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
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
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE,
  INDEX `user_id`(`number`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户账户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (1587399165784354818, 1587399165414084608, 'c0db8b3c91d5bf22646cd1252b768357', 'cb8946830a454421b758f96f1781cff4', '102234fd16214ac59cfa732c39da79bd', 'EZVMAXOL', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99859894.6001, 0.0001, 0, 0, '', '2022-11-01 19:00:28', NULL, NULL);
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
  `id` bigint NOT NULL COMMENT '交易记录id',
  `account_id` bigint NULL DEFAULT NULL COMMENT '账户id',
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
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户账户明细记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_account_detail
-- ----------------------------
INSERT INTO `user_account_detail` VALUES (1628334474126299137, 1587399165784354818, 'cb8946830a454421b758f96f1781cff4', '1', '2', NULL, NULL, NULL, '余额账户', 'cb8946830a454421b758f96f1781cff4', '13888888888', 100.3600, 99859994.9601, 99859894.6001, '余额提现', NULL, 'b20230222196306', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/10/27/8e7115fbad004b409190a47cc5f7001dauth.jpg', NULL, '2', NULL, 0, 0, 'ai168', '2023-02-22 18:02:46', NULL, NULL);

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `uuid` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '第三方平台用户唯一ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户来源',
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户第三方授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint NOT NULL COMMENT 'id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `belong_bank` int NULL DEFAULT NULL COMMENT '所属银行；1：支付宝 2：银行卡',
  `bank_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡卡号',
  `bank_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡开户行名称 如:工商银行',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡开户账户',
  `alipay_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `alipay_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝认证姓名',
  `bind_time` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户绑定银行卡或支付宝' ROW_FORMAT = DYNAMIC;

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
  `type` int NULL DEFAULT NULL COMMENT '类型：1：昵称 2：头像',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称或者头像值',
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
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
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '交易id',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `service_order_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `body` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品介绍',
  `total_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '订单金额（分为单位）',
  `real_amount` decimal(32, 4) NOT NULL DEFAULT 0.0000 COMMENT '交易金额',
  `buyer_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '买家用户ID',
  `buyer_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家姓名',
  `buyer_nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家昵称',
  `buyer_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家账号',
  `buyer_phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家电话',
  `buyer_headimg` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家头像',
  `order_status` int NOT NULL DEFAULT 1 COMMENT '支付状态 1.待支付 2.已支付 3.支付失败 4.已取消',
  `order_type` int NULL DEFAULT NULL COMMENT '订单类型：业务应用定义',
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0启用，2停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0未删除，2已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户交易订单' ROW_FORMAT = DYNAMIC;

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
  `message_shake` int NULL DEFAULT NULL COMMENT '消息推送是否开启震动；1：开启，0：未开启',
  `message_alarm` int NULL DEFAULT NULL COMMENT '消息推送是否开启铃声；1：开启，0：未开启',
  `like_remind` int NULL DEFAULT NULL COMMENT '点赞提醒是否开启；1：开启，0：未开启',
  `attention_remind` int NULL DEFAULT NULL COMMENT '关注提醒是否开启；1：开启，0：未开启',
  `notification` int NULL DEFAULT NULL COMMENT '系统通知提醒是否开启；1：开启，0：未开启',
  `comment_remind` int NULL DEFAULT NULL COMMENT '评论提醒是否开启；1：开启，0：未开启',
  `status_flag` int NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_set
-- ----------------------------
INSERT INTO `user_set` VALUES ('1590957505332346882', '1587399165414084608', 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2022/11/01/5f8d9ee99ff44eb684cee75649647861a.png', '相忆采芙蓉', 'c0db8b3c91d5bf22646cd1252b768357', 1, 1, 1, 0, 1, 1, 1, 0, 'ai168', '2022-11-11 22:40:02', 'ai168', '2022-11-11 22:40:05');

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
  `status_flag` int NOT NULL DEFAULT 0 COMMENT '状态：0：启用，2：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
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
  `weight` int NULL DEFAULT NULL COMMENT '权重值',
  `status_flag` int NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户会员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vip
-- ----------------------------
INSERT INTO `user_vip` VALUES ('1', '超级会员', 'tset', 'test', 'test', 113.00, 1356.00, 1, 1, 0, '1', '2019-11-06 17:52:58', NULL, NULL);

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
  `weight` int NULL DEFAULT NULL COMMENT '会员权益权重值',
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员权益跳转链接',
  `status_flag` int NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vip_id`(`vip_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户会员权益' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vip_equity
-- ----------------------------
INSERT INTO `user_vip_equity` VALUES ('1', '1', '权益1', '1', '1', 1, '1', 1, 0, '1', '2019-11-06 17:53:12', NULL, NULL);
INSERT INTO `user_vip_equity` VALUES ('2', '1', '权益2', '2', '2', 2, '1', 1, 0, '1', '2019-11-06 17:53:27', NULL, NULL);

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
  `number` int NULL DEFAULT NULL COMMENT '开通时长（月）',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `pay_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `merchant_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户流水号(第三方流水号）',
  `deal_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号 即支付成功的业务流水号',
  `third_orderno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `pay_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态；1：待付款 2：已付款 3： 付款失败 4.已取消 5：已退款  9.支付结果返回中',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `status_flag` int NOT NULL DEFAULT 1 COMMENT '状态：1：启用，0：停用',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '1:删除，0：未删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户会员开通记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vip_open_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_withdraw_apply
-- ----------------------------
DROP TABLE IF EXISTS `user_withdraw_apply`;
CREATE TABLE `user_withdraw_apply`  (
  `id` bigint NOT NULL COMMENT '提现记录id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
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
  `status` int NULL DEFAULT 1 COMMENT '提现状态；1：待审核 2：审核通过 3：审核拒绝',
  `remit_status` int NULL DEFAULT 1 COMMENT '打款状态 1：待确认 2：已打款 3：拒绝打款',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `accept_apply_time` datetime NULL DEFAULT NULL COMMENT '审核通过时间',
  `accept_apply_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核通过扣款流水号（冗余）',
  `remit_time` datetime NULL DEFAULT NULL COMMENT '确认打款时间',
  `remit_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认打款交易流水号(冗余)',
  `other_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外部汇款凭证号',
  `refuse_apply_time` datetime NULL DEFAULT NULL COMMENT '审核/打款 拒绝时间',
  `refuse_serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打款拒绝退款流水号',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `delete_flag` int NOT NULL DEFAULT 0 COMMENT '删除：0：未删除，2：已删除',
  `create_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户提现申请记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_withdraw_apply
-- ----------------------------
INSERT INTO `user_withdraw_apply` VALUES (1628334474348597249, 1587399165414084608, 'e1e4c24876514fc999d043ae0f496752', '1', NULL, NULL, NULL, '13888888888', '小可爱', 100.360, 'b20230222196306', NULL, NULL, NULL, 1, 1, '2023-02-22 18:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ai168', '2023-02-22 18:02:46', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
