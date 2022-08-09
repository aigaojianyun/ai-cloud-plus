<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;color:#409fee;">ai-cloud v1.0.0</h1>
<p align="center">
    <img src="https://img.shields.io/badge/SpringBoot-2.7.1 -blue.svg" alt="SpringBoot">
    <img src="https://img.shields.io/badge/SpringCloud-2021.0.3 -blue.svg" alt="SpringCloud">
    <img src="https://img.shields.io/badge/Alibaba-2021.0.1.0 -blue.svg" alt="Alibaba">
    <img src="https://img.shields.io/badge/Nacos-2.1.0 -blue.svg" alt="Nacos">
    <img src="https://img.shields.io/badge/Sentinel-1.8.4 -blue.svg" alt="Sentinel">
    <img src="https://img.shields.io/badge/Seata-1.5.1 -blue.svg" alt="Seata">
    <img src="https://img.shields.io/badge/ELK-8.2.0 -blue.svg" alt="ELK">
    <img src="https://img.shields.io/badge/FastJson-2.0.4 -blue.svg" alt="FastJson">
    <img src="https://img.shields.io/badge/MybatisPlus-3.5.1 -blue.svg" alt="Mybatis-Plus">
    <img src="https://img.shields.io/badge/Swagger-3.0.0 -blue.svg" alt="Swagger">
</p>

## 平台简介

~~~
* 基于SpringBoot SpringCloud & Alibaba
* 注册中心,配置中心Nacos,统一认证授权使用Security,Jwt,Redis
* 流量控制框架Sentinel,分布式事务Seata,日志管理Elasticsearch,Kibana,Logstash
* 封装了常用的工具类,全局异常处理,多数据源,Swagger2文档,FastDFS,Minio文件上传
* 搭建的一套分布式微服务架构,代码干净整洁,注释清晰,适合新项目开发
* 移动端，采用uniapp框架，一份代码多终端适配，同时支持APP、小程序、H5
* 后续会持续封装,用户账户服务,支付服务,短信服务,邮箱服务,oos对象存储,等等,以及产品原型,ui原型,前端代码更新
~~~

## 目录结构

~~~
ai-cloud-app
├── ai-cloud-gateway    --网关服务 [8088]
├── ai-cloud-auth       --认证服务 [8800]
├── ai-cloud-api        --内网接口
│       └── ai-cloud-auth-api        --授权对内接口
│       └── ai-cloud-elk-api         --日志对内接口
│       └── ai-cloud-file-api        --文件对内接口
├── ai-cloud-elk        --elk日志管理模块
│       └── ai-cloud-elasticsearch   --存储日志数据[8004]
│       └── ai-cloud-kibana          --收集日志   [8005]
│       └── ai-cloud-logstash        --显示日志数据[8006]
├── ai-cloud-framework  --核心模块
│       └── ai-cloud-common          --通用模块
│       └── ai-cloud-datasource      --多数据源
│       └── ai-cloud-log             --日志记录
│       └── ai-cloud-security        --安全模块
│       └── ai-cloud-swagger         --接口模块
├── ai-cloud-modules    --业务模块
│       └── ai-cloud-file            --文件服务 [8801]
│       └── ai-cloud-pay             --支付服务 [8803]
│       └── ai-cloud-user            --用户服务 [8802]
├──ai-cloud-web         --前端模块
│       └── ai-cloud-app             --uniapp[9090]
│       └── ai-cloud-wx              --微信小程序[]
├──pom.xml              --公共依赖
~~~

## 架构图

<img src=""/>

## 前端演示图
<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/s83j4761d6pnndkkxyvn.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/zv02c8pr5tr89bgtagwr.png"/></td>
    </tr>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/l4zmbe54dl740m1me5rh.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/i4jy6q7h3cvlhim0d2dx.png"/></td>
    </tr>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/hmd7jcehvibpyimfrdwe.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/ivnfsatbz4oz3qcj7l8e.png"/></td>
    </tr>
</table>

## 后端演示图

<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/39ar122owskm3krqgdtj.png"/></td>
    </tr>
</table>

- 查看注册中心注册服务信息，访问地址：http://127.0.0.1:8848/nacos

<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/6lsbt9q4xfrh8yb1q3kx.png"/></td>
    </tr>
</table>

- 查看Sentinel流量控制台，访问地址：http://127.0.0.1:8718

<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/ic4v04rky5ut637jfkdq.png"/></td>
    </tr>
</table>

- API文档信息，访问地址：http://127.0.0.1:8088/swagger-ui/index.html

<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/pbx0raxv26uvpzrr5bvz.png"/></td>
    </tr>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/48n5t00klhs7bv45hday.png"/></td>
    </tr>
</table>

- 日志收集系统信息，访问地址：http://127.0.0.1:5601

- 可视化容器管理，访问地址：http://127.0.0.1:9000

## sql表结构

<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/1jcfml1vgwy48q679yeh.png"/></td>
    </tr>
</table>

## 微服务交流群

QQ群: [![加入QQ群](https://img.shields.io/badge/679033812-blue.svg)](https://jq.qq.com/?_wv=1027&k=eW62TFzU) 点击按钮入群。

