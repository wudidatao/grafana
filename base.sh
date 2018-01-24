#!/bin/bash

#软件安装目录
path=/root/install
#软件安装版本
version=4.6.2
#redis安装目录
grafana_path=$path/grafana-$version
#本地ip
random_ip=`ip address | egrep "global e|global dynamic e"| cut -d ' ' -f6 | cut -d '/' -f1`
#grafana端口
grafana_port=3000
#容器内部的主机名
hostname=`ip address | egrep "global e|global dynamic e"| cut -d ' ' -f6 | cut -d '/' -f1 |cut -d '.' -f4`$grafana_port
#容器名
container_name=grafana-$version-$grafana_port-running
#grafana基础目录
grafana_home=/data/grafana/$version-$grafana_port
#grafana配置文件目录
grafana_conf=$grafana_home/conf
#grafana数据文件目录
grafana_data=$grafana_home/data
#服务描述
grafana_description=test
#管理员密码
grafana_admin_password=123456
