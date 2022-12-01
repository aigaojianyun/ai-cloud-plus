/*
 Navicat Premium Data Transfer

 Source Server         : cloud-mysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : cloud-mysql:3306
 Source Schema         : ai-cloud-nacos

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 29/11/2022 16:22:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'spring:\r\n  autoconfigure:\r\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher\r\n\r\n# feign 配置\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n', 'fd32652eb3baec85e5c92385dbbfa81a', '2022-08-29 07:50:04', '2022-08-29 07:50:04', NULL, '127.0.0.1', '', '', '通用配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (2, 'ai-cloud-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared \n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ai-cloud-auth\n          uri: lb://ai-cloud-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 监控中心\n        - id: ai-cloud-monitor\n          uri: lb://ai-cloud-monitor\n          predicates:\n            - Path=/monitor/**\n          filters:\n            - StripPrefix=1     \n        # 代码生成\n        - id: ai-cloud-gen\n          uri: lb://ai-cloud-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ai-cloud-job\n          uri: lb://ai-cloud-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ai-cloud-system\n          uri: lb://ai-cloud-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ai-cloud-file\n          uri: lb://ai-cloud-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 用户服务\n        - id: ai-cloud-user\n          uri: lb://ai-cloud-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        # 支付服务\n        - id: ai-cloud-pay\n          uri: lb://ai-cloud-pay\n          predicates:\n            - Path=/pay/**\n          filters:\n            - StripPrefix=1        \n        # 资源服务\n        - id: ai-cloud-resource\n          uri: lb://ai-cloud-resource\n          predicates:\n            - Path=/resource/**\n          filters:\n            - StripPrefix=1  \n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: false\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /file/upload\n      - /auth/captcha/get\n      - /auth/captcha/check\n      - /auth/login\n      - /auth/login/wx\n      - /auth/logout\n      - /auth/register\n      - /auth/register/user\n      - /resource/sms/code\n      - /resource/mail/code\n      - /*/v2/api-docs\n      - /csrf\n', 'ffcc80b3fbf80655aaa1ff1c0ef70611', '2022-08-29 07:53:49', '2022-11-29 07:49:26', 'nacos', '222.221.175.244', '', '', '网关模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (3, 'ai-cloud-auth-dev.yml', 'DEFAULT_GROUP', '# Spring\nspring: \n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared\n    \n# 滑块验证码\naj:\n  captcha:\n    # 滑动验证，底图路径，不配置将使用默认图片\n    jigsaw: classpath:images/jigsaw\n    # 滑动验证，底图路径，不配置将使用默认图片\n    pic-click: classpath:images/pic-click\n    # 缓存类型\n    cache-type: redis\n    # blockPuzzle 滑块 clickWord 文字点选  default默认两者都实例化\n    type: default\n    # 右下角显示字\n    water-mark: aiclouds.vip\n    # 校验滑动拼图允许误差偏移量(默认5像素)\n    slip-offset: 5\n    # aes加密坐标开启或者禁用(true|false)\n    aes-status: true\n    # 滑动干扰项(0/1/2)\n    interference-options: 2\n\n# 开发者应该设置成自己的wx相关信息\nwx:\n  pay:\n    app-id: wx87ebdff8b37792ce\n    app-secret: a44151ebaab6e535993ac038b5d678ae\n    mch-id: xxxx\n    mch-key: xxxx\n    notify-url: xxxx\n    # 商户证书文件路径\n    # 请参考“商户证书”一节 https://pay.weixin.qq.com/wiki/doc/api/wxa/wxa_api.php?chapter=4_3\n    key-path: classpath:crt/apiclient_cert.p12    ', '71e84b76ad3d79317619e31064713f07', '2022-08-29 07:54:41', '2022-11-29 07:49:38', 'nacos', '222.221.175.244', '', '', '认证中心', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (4, 'ai-cloud-monitor-dev.yml', 'DEFAULT_GROUP', '# spring\nspring: \n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared\n  security:\n    user:\n      name: admin\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: 服务状态监控\n', '7501be092aa727fdc034d5cc2160d87f', '2022-08-29 07:55:44', '2022-11-29 08:18:44', 'nacos', '222.221.175.244', '', '', '监控中心', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'ai-cloud-system-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://cloud-mysql:3306/ai-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root  \n            password: password\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n      # seata: true    # 开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n\n# seata配置\nseata:\n  # 默认关闭，如需启用spring.datasource.dynami.seata需要同时开启\n  enabled: false\n  # Seata 应用编号，默认为 ${spring.application.name}\n  application-id: ${spring.application.name}\n  # Seata 事务组编号，用于 TC 集群名\n  tx-service-group: ${spring.application.name}-group\n  # 关闭自动代理\n  enable-auto-data-source-proxy: false\n  # 服务配置项\n  service:\n    # 虚拟组和分组的映射\n    vgroup-mapping:\n      ai-cloud-system-group: default\n  config:\n    type: nacos\n    nacos:\n      serverAddr: 127.0.0.1:8848\n      group: SEATA_GROUP\n      namespace:\n  registry:\n    type: nacos\n    nacos:\n      application: seata-server\n      server-addr: 127.0.0.1:8848\n      namespace:\n\n# mybatis plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: com.cloud.**.domain\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mapper/**/*Mapper.xml\n  # 加载全局的配置文件\n  #configLocation: classpath:mybatis/mybatis-config.xml    \n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By cloud\n  licenseUrl: https://cloud.vip', 'd709642ea3731758ebabb3ea49b1ce38', '2022-08-29 07:57:11', '2022-11-29 08:19:34', 'nacos', '222.221.175.244', '', '', '系统模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (6, 'ai-cloud-gen-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared \n  datasource: \n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://cloud-mysql:3306/ai-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root  \n    password: password\n\n# mybatis plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: com.cloud.**.domain\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mapper/**/*Mapper.xml\n  # 加载全局的配置文件\n  #configLocation: classpath:mybatis/mybatis-config.xml  \n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By cloud\n  licenseUrl: https://cloud.vip\n\n# 代码生成\ngen: \n  # 作者\n  author: ai-cloud\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.cloud.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', 'a49e25fc716203ab6a52cc2073d668b8', '2022-08-29 08:15:39', '2022-11-29 08:20:13', 'nacos', '222.221.175.244', '', '', '代码生成', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (7, 'ai-cloud-job-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared \n  datasource: \n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://cloud-mysql:3306/ai-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root  \n    password: password\n\n# mybatis plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: com.cloud.**.domain\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mapper/**/*Mapper.xml\n  # 加载全局的配置文件\n  #configLocation: classpath:mybatis/mybatis-config.xml  \n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By cloud\n  licenseUrl: https://cloud.vip\n', 'd9c1ccd28da23822a938911405dbadb6', '2022-08-29 08:17:06', '2022-11-29 08:20:23', 'nacos', '222.221.175.244', '', '', '定时任务', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (8, 'ai-cloud-file-dev.yml', 'DEFAULT_GROUP', '# 本地文件上传    \nfile:\n    domain: http://127.0.0.1:9300\n    path: D:/aiCloud/uploadPath\n    prefix: /statics\n\n# FastDFS配置\nfdfs:\n  domain: http://8.129.231.12\n  soTimeout: 3000\n  connectTimeout: 2000\n  trackerList: 8.129.231.12:22122\n\n# Minio配置\nminio:\n  url: http://8.129.231.12:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucketName: test\n\n# 阿里云配置\naliyun:\n  endpoint: oss-cn-hangzhou.aliyuncs.com \n  accessKeyId: LTAI5tN7V1nzWEezuLZ17dBC\n  accessKeySecret: jpTKv2wOZ9AMWh1aCbPI2UD9PZ1EQu\n  bucketName: aicloud888\n  urlPrefix:\n\n# swagger配置\nswagger:\n  title: 文件服务接口文档\n  license: Powered By cloud\n  licenseUrl: https://cloud.vip', '28e53d21358974fd3e9fb9d295396476', '2022-08-29 08:17:46', '2022-10-08 07:13:40', 'nacos', '127.0.0.1', '', '', '文件服务', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (9, 'ai-cloud-user-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: cloud-redis\n    port: 6379\n    password: foobared \n  datasource: \n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://cloud-mysql:3306/ai-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root  \n    password: password\n\n# mybatis plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: com.cloud.**.domain\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mapper/**/*Mapper.xml\n  # 加载全局的配置文件\n  #configLocation: classpath:mybatis/mybatis-config.xml  \n\n# swagger配置\nswagger:\n  title: 用户账户服务接口文档\n  license: Powered By cloud\n  licenseUrl: https://cloud.vip\n', '770ee6749ea13e5e8e648b46fe5d4575', '2022-09-15 14:28:51', '2022-11-29 08:20:36', 'nacos', '222.221.175.244', '', '', '用户模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (10, 'ai-cloud-pay-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password: foobared \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://rm-bp15521us1y063fs28o.mysql.rds.aliyuncs.com:3306/ai-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: aigaojianyun\n    password: Xka5201314\n\n# mybatis plus配置\nmybatis-plus:\n  # 搜索指定包别名\n  typeAliasesPackage: com.cloud.**.domain\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\n  mapperLocations: classpath*:mapper/**/*Mapper.xml\n  # 加载全局的配置文件\n  #configLocation: classpath:mybatis/mybatis-config.xml  \n\n# swagger配置\nswagger:\n  title: 支付服务接口文档\n  license: Powered By cloud\n  licenseUrl: https://cloud.vip\n', '673af8f68c58ecfd88a8fa7cffaf2020', '2022-09-16 08:20:56', '2022-11-01 08:11:55', 'nacos', '10.10.10.115', '', '', '支付模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (11, 'ai-cloud-resource-dev.yml', 'DEFAULT_GROUP', '# Spring\nspring: \n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password: foobared\n    \n#邮箱\nmail:\n  enabled: true\n  host: smtp.163.com\n  port: 465\n  # 是否需要用户名密码验证\n  auth: true\n  # 发送方，遵循RFC-822标准\n  from: aicloud888@163.com\n  # 用户名（注意：如果使用foxmail邮箱，此处user为qq号）\n  user: aicloud888@163.com\n  # 密码（注意，某些邮箱需要为SMTP服务单独设置密码，详情查看相关帮助）\n  pass: xxxxxxx\n  # 使用 STARTTLS安全连接，STARTTLS是对纯文本通信协议的扩展。\n  starttlsEnable: true\n  # 使用SSL安全连接\n  sslEnable: true\n  # SMTP超时时长，单位毫秒，缺省值不超时\n  timeout: 0\n  # Socket连接超时值，单位毫秒，缺省值不超时\n  connectionTimeout: 0\n\n#短信\nsms:\n  enabled: false\n  # 阿里云 dysmsapi.aliyuncs.com\n  # 腾讯云 sms.tencentcloudapi.com\n  endpoint: \"sms.tencentcloudapi.com\"\n  accessKeyId: xxxxxxx\n  accessKeySecret: xxxxxx\n  signName: 测试\n  # 腾讯专用\n  sdkAppId:', 'fb18e97b8f878398b12ce79a853c4e65', '2022-10-28 02:46:11', '2022-11-21 09:06:33', 'nacos', '127.0.0.1', '', '', '资源服务', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (20, 'sentinel-ai-cloud-gateway', 'DEFAULT_GROUP', '[\n    {\n        \"resource\": \"ai-cloud-auth\",\n        \"count\": 500,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n	{\n        \"resource\": \"ai-cloud-system\",\n        \"count\": 1000,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n	{\n        \"resource\": \"ai-cloud-gen\",\n        \"count\": 200,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n	{\n        \"resource\": \"ai-cloud-job\",\n        \"count\": 300,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n    {\n        \"resource\": \"ai-cloud-user\",\n        \"count\": 300,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n    {\n        \"resource\": \"ai-cloud-pay\",\n        \"count\": 300,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    },\n    {\n        \"resource\": \"ai-cloud-resource\",\n        \"count\": 300,\n        \"grade\": 1,\n        \"limitApp\": \"default\",\n        \"strategy\": 0,\n        \"controlBehavior\": 0\n    }\n]', 'b6c75a3620a5b1e5462ac9f8f31b8449', '2022-08-29 08:18:52', '2022-11-21 08:57:59', 'nacos', '0:0:0:0:0:0:0:1', '', '', '限流策略', '', '', 'json', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;