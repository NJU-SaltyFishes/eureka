#!/usr/bin/env bash

export PROJ_PATH=`pwd`

ssh admin@47.103.195.52

cd PROJ_PATH
mvn docker:build
docker push registry.cn-hangzhou.aliyuncs.com/walkerlms/eureka:0.0.1

docker service create --replica 1 --name eureka -p 8080:8080 registry.cn-hangzhou.aliyuncs.com/walkerlms/eureka:0.0.1
#docker service update --image registry.cn-hangzhou.aliyuncs.com/walkerlms/eureka:0.0.1 eureka

exit 0
