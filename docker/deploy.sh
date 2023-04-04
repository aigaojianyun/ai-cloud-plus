#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|base|modules|stop|rm]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=80/tcp --permanent
	firewall-cmd --add-port=8080/tcp --permanent
	firewall-cmd --add-port=8848/tcp --permanent
	firewall-cmd --add-port=9848/tcp --permanent
	firewall-cmd --add-port=9849/tcp --permanent
	firewall-cmd --add-port=6379/tcp --permanent
	firewall-cmd --add-port=3306/tcp --permanent
	firewall-cmd --add-port=9100/tcp --permanent
	firewall-cmd --add-port=9201/tcp --permanent
	firewall-cmd --add-port=9301/tcp --permanent
	firewall-cmd --add-port=9302/tcp --permanent
	firewall-cmd --add-port=9303/tcp --permanent
	firewall-cmd --add-port=9304/tcp --permanent
	firewall-cmd --add-port=9401/tcp --permanent
  firewall-cmd --add-port=9402/tcp --permanent
  firewall-cmd --add-port=9403/tcp --permanent
  firewall-cmd --add-port=9501/tcp --permanent
  firewall-cmd --add-port=9502/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
base(){
	docker-compose up -d cloud-mysql cloud-redis cloud-nacos
}

# 启动程序模块（必须）
modules(){
	docker-compose up -d cloud-nginx ai-cloud-gateway ai-cloud-auth ai-cloud-system ai-cloud-monitor ai-cloud-user ai-cloud-resource
}

# 关闭所有环境/模块
stop(){
	docker-compose stop
}

# 删除所有环境/模块
rm(){
	docker-compose rm
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"base")
	base
;;
"modules")
	modules
;;
"stop")
	stop
;;
"rm")
	rm
;;
*)
	usage
;;
esac
