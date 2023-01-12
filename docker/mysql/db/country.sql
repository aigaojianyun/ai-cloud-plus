/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : ch

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 11/01/2023 20:36:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `zh_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '中文名称',
  `area_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `en_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区号',
  `country_image_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'icon',
  `language` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '语言',
  `local_currency` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '当地货币缩写',
  `sort` int NOT NULL COMMENT '排序',
  PRIMARY KEY (`zh_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '国家信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('中国台湾', '886', 'Taiwan (台灣)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Taiwan.png', 'zh_TW', 'TWD', 0);
INSERT INTO `country` VALUES ('中国澳门', '853', 'Macau (澳門)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Macau.png', 'zh_MO', 'MOP', 0);
INSERT INTO `country` VALUES ('中国香港', '852', 'Hong Kong (香港)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/HongKong.png', 'zh_HK', 'HKD', 0);
INSERT INTO `country` VALUES ('丹麦', '45', 'Denmark (Danmark)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Denmark.png', 'da_DK', 'DKK', 0);
INSERT INTO `country` VALUES ('以色列', '972', 'Israel (ישראל‎)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Israel.png', 'he_IL', 'AMD', 0);
INSERT INTO `country` VALUES ('伊朗', '98', 'Iran', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Iran.png', 'fa_IR', 'IRR', 0);
INSERT INTO `country` VALUES ('俄罗斯', '7', 'Russia (Россия)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Russia.png', 'ru_RU', 'RUB', 0);
INSERT INTO `country` VALUES ('加拿大', '1', 'Canada', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Canada.png', 'fr_CA', 'CAD', 0);
INSERT INTO `country` VALUES ('南非', '27', 'South Africa', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/SouthAfrica.png', 'en_ZA', 'ZAR', 0);
INSERT INTO `country` VALUES ('卡塔尔', '974', 'Qatar (قطر‎)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Qatar.png', 'ar_QA', 'QAR', 0);
INSERT INTO `country` VALUES ('印度', '91', 'India (भारत)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/India.png', 'en_IN', 'INR', 0);
INSERT INTO `country` VALUES ('印度尼西亚', '62', 'Indonesia', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Indonesia.png', 'id_ID', 'IDR', 0);
INSERT INTO `country` VALUES ('哥伦比亚', '57', 'Colombia', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Colombia.png', 'es_CO', 'COP', 0);
INSERT INTO `country` VALUES ('土耳其', '90', 'Turkey (Türkiye)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Turkey.png', 'en_US', 'EUR', 0);
INSERT INTO `country` VALUES ('埃及', '2', 'Egypt', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Egypt.png', 'ar_EG', 'EGP', 0);
INSERT INTO `country` VALUES ('墨西哥', '52', 'Mexico (México)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Mexico.png', 'es_MX', 'MXN', 0);
INSERT INTO `country` VALUES ('奥地利', '43', 'Austria (Österreich)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Austria.png', 'de_AT', 'EUR', 0);
INSERT INTO `country` VALUES ('孟加拉国', '88', 'Bangladesh', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Bangladesh.png', 'bn_BD', 'BDT', 0);
INSERT INTO `country` VALUES ('尼日利亚', '234', 'Nigeria', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Nigeria.png', 'ha_Latn_NG', 'NGN', 0);
INSERT INTO `country` VALUES ('巴西', '55', 'Brazil (Brasil)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Brazil.png', 'pt_BR', 'BRL', 0);
INSERT INTO `country` VALUES ('希腊', '3', 'Greece', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Greece.png', 'el_GR', 'EUR', 0);
INSERT INTO `country` VALUES ('德国', '49', 'Germany (Deutschland)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Germany.png', 'de_DE', 'EUR', 0);
INSERT INTO `country` VALUES ('意大利', '39', 'Italy (Italia)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Italy.png', 'it_IT', 'EUR', 0);
INSERT INTO `country` VALUES ('挪威', '47', 'Norway (Norge)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Norway.png', 'nb_NO', 'NOK', 0);
INSERT INTO `country` VALUES ('新加坡', '65', 'Singapore', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Singapore.png', 'en_US', 'SGD', 0);
INSERT INTO `country` VALUES ('新西兰', '64', 'NewZealand', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/NewZealand.png', 'en_NZ', 'NZD', 0);
INSERT INTO `country` VALUES ('日本', '81', 'Japan (日本)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Japan.png', 'ja_JP', 'USD', 0);
INSERT INTO `country` VALUES ('智利', '56', 'Chile', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Chile.png', 'es_CL', 'CLP', 0);
INSERT INTO `country` VALUES ('比利时', '32', 'Belgium (België)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Belgium.png', 'be_BY', 'EUR', 0);
INSERT INTO `country` VALUES ('沙特阿拉伯', '966', 'Saudi Arabia (المملكة العربية السعودية‎)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/SaudiArabia.png', 'ar_SA', 'SAR', 0);
INSERT INTO `country` VALUES ('法国', '33', 'France', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/France.png', 'fr_FR', 'EUR', 0);
INSERT INTO `country` VALUES ('波兰', '48', 'Poland (Polska)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Poland.png', 'pl_PL', 'PLN', 0);
INSERT INTO `country` VALUES ('泰国', '66', 'Thailand (ไทย)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Thailand.png', 'en_US', 'USD', 0);
INSERT INTO `country` VALUES ('澳大利亚', '61', 'Australia', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Australia.png', 'en_AU', 'AUD', 0);
INSERT INTO `country` VALUES ('爱尔兰', '353', 'Ireland', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Ireland.png', 'en_IE', 'EUR', 0);
INSERT INTO `country` VALUES ('瑞典', '46', 'Sweden (Sverige)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Sweden.png', 'sv_SE', 'SEK', 0);
INSERT INTO `country` VALUES ('瑞士', '41', 'Switzerland (Schweiz)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Switzerland.png', 'de_CH', 'CHF', 0);
INSERT INTO `country` VALUES ('白俄罗斯', '375', 'Belarus', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Belarus.png', 'be_BY', 'BYR', 0);
INSERT INTO `country` VALUES ('罗马尼亚', '4', 'Romania', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Romania.png', 'ro_RO', 'RON', 0);
INSERT INTO `country` VALUES ('美国', '1', 'America', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/America.png', 'en_US', 'USD', 0);
INSERT INTO `country` VALUES ('芬兰', '358', 'Finland (Suomi)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Finland.png', 'fi_FI', 'EUR', 0);
INSERT INTO `country` VALUES ('英国', '44', 'United Kingdom', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/UnitedKingdom.png', 'en_US', 'EUR', 0);
INSERT INTO `country` VALUES ('荷兰', '31', 'Netherlands (Nederland)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Netherlands.png', 'nl_NL', 'EUR', 0);
INSERT INTO `country` VALUES ('菲律宾', '63', 'ThePhilippines', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/ThePhilippines.png', 'en_PH', 'PHP', 0);
INSERT INTO `country` VALUES ('葡萄牙', '351', 'Portugal', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Portugal.png', 'pt_PT', 'EUR', 0);
INSERT INTO `country` VALUES ('西班牙', '34', 'Spain (España)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Spain.png', 'es_ES', 'EUR', 0);
INSERT INTO `country` VALUES ('越南', '84', 'Vietnam (Việt Nam)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Vietnam.png', 'en_US', 'USD', 0);
INSERT INTO `country` VALUES ('阿拉伯', '971', 'United Arab Emirates (الإمارات العربية المتحدة‎)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/UnitedArabEmirates.png', 'ar_AE', 'AED', 0);
INSERT INTO `country` VALUES ('阿根廷', '54', 'Argentina', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Argentina.png', 'es_AR', 'ARS', 0);
INSERT INTO `country` VALUES ('韩国', '82', 'South Korea (대한민국)', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/SouthKorea.png', 'ko_KR', 'USD', 0);
INSERT INTO `country` VALUES ('马来西亚', '60', 'Malaysia', 'https://bizzan01.oss-cn-hongkong.aliyuncs.com/country/Malaysia.png', 'en_US', 'EUR', 0);

SET FOREIGN_KEY_CHECKS = 1;
