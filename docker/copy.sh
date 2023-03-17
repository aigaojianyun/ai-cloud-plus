#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
#echo "begin copy sql "
#cp ../sql/ai-cloud.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../cloud-admin/dist/** ./nginx/html/cloud-admin
cp -r ../cloud-mobile/unpackage/dist/build/h5/** ./nginx/html/cloud-mobile


# copy jar
echo "begin copy ai-cloud-gateway "
cp ../ai-cloud-gateway/target/ai-cloud-gateway.jar ./cloud/gateway/jar

echo "begin copy ai-cloud-auth "
cp ../ai-cloud-auth/target/ai-cloud-auth.jar ./cloud/auth/jar

echo "begin copy ai-cloud-visual "
cp ../ai-cloud-visual/ai-cloud-monitor/target/ai-cloud-monitor.jar  ./cloud/visual/monitor/jar

echo "begin copy ai-cloud-system "
cp ../ai-cloud-modules/ai-cloud-system/target/ai-cloud-system.jar ./cloud/modules/system/jar

echo "begin copy ai-cloud-file "
cp ../ai-cloud-modules/ai-cloud-file/target/ai-cloud-file.jar ./cloud/modules/file/jar

echo "begin copy ai-cloud-job "
cp ../ai-cloud-modules/ai-cloud-job/target/ai-cloud-job.jar ./cloud/modules/job/jar

echo "begin copy ai-cloud-gen "
cp ../ai-cloud-modules/ai-cloud-gen/target/ai-cloud-gen.jar ./cloud/modules/gen/jar

echo "begin copy ai-cloud-pay "
cp ../ai-cloud-app/ai-cloud-pay/target/ai-cloud-pay.jar ./cloud/app/pay/jar

echo "begin copy ai-cloud-resource "
cp ../ai-cloud-app/ai-cloud-resource/target/ai-cloud-resource.jar ./cloud/app/resource/jar

echo "begin copy ai-cloud-user "
cp ../ai-cloud-app/ai-cloud-user/target/ai-cloud-user.jar ./cloud/app/user/jar

