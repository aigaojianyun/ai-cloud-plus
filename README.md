<p align="center">
    <img src="https://img.shields.io/badge/SpringBoot-2.7.3 -blue.svg" alt="SpringBoot">
    <img src="https://img.shields.io/badge/SpringCloud-2021.0.4 -blue.svg" alt="SpringCloud">
    <img src="https://img.shields.io/badge/Alibaba-2021.0.4.0 -blue.svg" alt="Alibaba">
    <img src="https://img.shields.io/badge/Nacos-2.1.0 -blue.svg" alt="Nacos">
    <img src="https://img.shields.io/badge/Sentinel-1.8.4 -blue.svg" alt="Sentinel">
    <img src="https://img.shields.io/badge/Seata-1.5.1 -blue.svg" alt="Seata">
    <img src="https://img.shields.io/badge/FastJson-2.0.16 -blue.svg" alt="FastJson">
    <img src="https://img.shields.io/badge/MybatisPlus-3.5.1 -blue.svg" alt="Mybatis-Plus">
    <img src="https://img.shields.io/badge/Swagger-3.0.0 -blue.svg" alt="Swagger">
</p>

## 平台简介

* 采用前后端分离的模式，微服务版本。
* 后端采用Spring Boot、Spring Cloud & Alibaba。
* 注册中心、配置中心选型Nacos，权限认证使用Redis。
* 流量控制框架选型Sentinel，分布式事务选型Seata。

## 系统模块

~~~
ai-cloud-parent
├── ai-cloud-api             // 接口模块
│       └── ai-cloud-file-api                            // 文件接口模块
│       └── ai-cloud-system-api                          // 系统接口模块
│       └── ai-cloud-user-api                            // 用户接口模块
├── ai-cloud-app             // 移动端模块
│       └── ai-cloud-pay                                 // 支付模块 [9403]
│       └── ai-cloud-resource                            // 资源服务 [9402]
│       └── ai-cloud-user                                // 用户模块 [9401]
├── ai-cloud-auth            // 认证中心 [9100]
├── ai-cloud-coin            // 币币模块
│       └── ai-cloud-market                              // 行情模块 [9502]
│       └── ai-cloud-wallet                              // 钱包模块 [9501]
├── ai-cloud-framework       // 核心模块
│       └── ai-cloud-common                              // 通用模块
│       └── ai-cloud-datascope                           // 权限范围
│       └── ai-cloud-datasource                          // 多数据源
│       └── ai-cloud-i18n                                // 国际化模块
│       └── ai-cloud-kafka                               // 消息队列
│       └── ai-cloud-log                                 // 日志记录
│       └── ai-cloud-mail                                // 邮箱模块
│       └── ai-cloud-mybatis                             // 数据库服务
│       └── ai-cloud-redis                               // 缓存模块
│       └── ai-cloud-satoken                             // 权限认证
│       └── ai-cloud-seata                               // 分布式事务
│       └── ai-cloud-security                            // 安全模块
│       └── ai-cloud-sms                                 // 短信模块
│       └── ai-cloud-swagger                             // 系统接口
│       └── ai-cloud-weixin                              // 微信模块
├── ai-cloud-gateway         // 网关模块 [8080]
├── ai-cloud-modules         // 后台业务模块
│       └── ai-cloud-file                                // 文件服务 [9304]
│       └── ai-cloud-gen                                 // 代码生成 [9303]
│       └── ai-cloud-job                                 // 定时任务 [9302]
│       └── ai-cloud-system                              // 系统模块 [9301]
├── ai-cloud-visual          // 图形化管理模块
│       └── ai-cloud-monitor                             // 监控中心 [9201]
├── cloud-admin              //element-ui后台管理 [9091]
├── cloud-mobile             //uin-app+uview-ui移动端[9090] 
├── docker                   // 一键部署
├── icon                     // ui图标
├── sql                      // 数据表
├──pom.xml                   // 公共依赖
~~~

## 后台内置功能

1. 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2. 部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3. 岗位管理：配置系统用户所属担任职务。
4. 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5. 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6. 字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7. 参数管理：对系统动态配置常用参数。
8. 通知公告：系统通知公告信息发布维护。
9. 操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10. 登录日志：系统登录日志记录查询包含登录异常。
11. 在线用户：当前系统中活跃用户状态监控。
12. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13. 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14. 系统接口：根据业务代码自动生成相关的api接口文档。
15. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16. 在线构建器：拖动表单元素生成相应的HTML代码。
17. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。


## 架构图

<img src=""/>

## 在线体验

* 移动端H5
* 移动端滑块验证码必须要在移动设备上，或者pc端选择手机调试模式下，才能滑动
- https://www.aiclouds.vip
- ai168/123456
-
* 安卓系统安装包
- https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/cloud-mobile.apk
- ai168/123456
-
- 后台管理
- https://aiclouds.vip/admin
- ceshi/123456
- 

## sql表预览
<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/iww44e120mdlen154dnw.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/ekb741txm44g835v1xmg.jpg"/></td>
    </tr>
</table>

## 移动端演示图

<table>
    <tr>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/1.png"/></td>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/2.png"/></td>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/3.png"/></td>
    </tr>
    <tr>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/4.png"/></td>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/5.png"/></td>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/6.png"/></td>
    </tr>
    <tr>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/7.png"/></td>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/8.png"/></td>
        <td><img src="https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/images/9.png"/></td>
    </tr>
</table>

## 后台演示图

<table>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/laryfn27w8o9oylj0w4c.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/kh88lnv9qmw6pq0rklvj.png"/></td>
    </tr>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/30vvzex2nikqm01wystv.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/i9l2bdvw9ffgftxnjemd.png"/></td>
    </tr>
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/0iqcuix6bo4e7ksz9ay3.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/sm3kafdd43k15wt9gbqc.png"/></td>
    </tr>
	<tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/dbnay5leeewrgm6q76y4.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/di0pi8tgiet9q3s0me3m.png"/></td>
    </tr>	 
    <tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/wg8ajqs7e4svcbeu26oe.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/v3vlpjat7sg6p733211z.png"/></td>
    </tr>
	<tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/3aw764rnjhh4kcr0lfub.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/8v2s2gcwpx31ezc3gobu.png"/></td>
    </tr>
	<tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/uwj88a0fcnowfm560l73.png"/></td>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/m3m0xgglm5mg6cypyimd.png"/></td>
    </tr>
	<tr>
        <td><img src="https://lawcontract.oss-cn-beijing.aliyuncs.com/3phkgz1wl4ogts4mb8op.png"/></td>
    </tr>
</table>

## 项目部署
1. Docker 环境安装
* 安装yum-utils包 
~~~ 
yum install -y yum-utils 
~~~
* 设置存储库 
~~~
# 阿里云地址（国内地址，相对更快）
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
~~~
* 安装Docker引擎
~~~ 
yum install docker-ce docker-ce-cli containerd.io
~~~ 
* 安装完成后，运行下面的命令，验证是否安装成功。
~~~ 
docker version # 查看Docker版本信息
systemctl start docker		# 启动 docker 服务:
systemctl stop docker		# 停止 docker 服务:
systemctl status docker		# 查看 docker 服务状态
systemctl restart docker	# 重启 docker 服务
systemctl enable docker     # 设置开机自动启动
~~~
2. Compose 安装
* 下载
~~~
# 因为Docker Compose存放在GitHub，可能不太稳定。可以通过DaoCloud加速下载
curl -L https://get.daocloud.io/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
~~~
* 授权
~~~
# 将可执行权限应用于该二进制文件
sudo chmod +x /usr/local/bin/docker-compose
~~~
* 测试
~~~
docker-compose --version
~~~
* 卸载
~~~
rm /usr/local/bin/docker-compose
~~~
3. Docker 一键部署
* 项目提供了docker部署，只需要复制jar文件到对应的/docker/cloud目录下。
~~~
docker
├── mysql            // 数据库
│       └── db                            // 数据库脚本
│       └── dockerfile                    // mysql dockerfile
├── nacos            // 注册中心/配置中心
│       └── conf                          // nacos 配置文件
│       └── dockerfile                    // nacos dockerfile
├── nginx            // web服务器
│       └── conf                          // nginx 配置文件
│       └── html                          // 打包后的前端ui
│       └── dockerfile                    // nginx dockerfile
├── redis            // 缓存服务
│       └── conf                          // redis 配置文件
│       └── dockerfile                    // redis dockerfile
├── cloud            // 业务模块
│       └── auth                          // 认证中心 dockerfile jar
│       └── gateway                       // 网关模块 dockerfile jar
│       └── modules                       // 业务模块 dockerfile jar
│       └── visual                        // 图形化管理模块 dockerfile jar
│       └── web                           // 用户端模块 dockerfile jar
├── copy.sh                 // 拷贝脚本
├── deploy.sh               // 部署脚本
├── docker-compose.yml      // docker-compose
~~~
* 上传文件到自己的服务器，通过deploy.sh执行命令控制。
~~~
#授权
chmod 777 deploy.sh    
sed -i 's/\r$//' deploy.sh

# 开启所需端口
./deploy.sh port

# 启动基础环境（必须）
./deploy.sh base

# 启动程序模块（必须）
./deploy.sh modules

# 关闭所有环境/模块
./deploy.sh stop

# 删除所有环境/模块
./deploy.sh rm
~~~

## 开源
**源于开源，回归开源**
* 感谢若依开源的[RuoYi-Cloud](https://gitee.com/y_project/RuoYi-Cloud.git)

## 交流群
QQ群: [![加入QQ群](https://img.shields.io/badge/652111512-blue.svg)](https://jq.qq.com/?_wv=1027&k=M1QxJmCB) 点击按钮入群。

