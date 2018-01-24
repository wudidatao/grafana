#!/bin/bash
#首次初始化目录，配置文件和数据文件

. ./base.sh

mkdir -p $grafana_home $grafana_conf $grafana_data

docker pull grafana/grafana:$version

docker run -d -p $grafana_port:$grafana_port --name $container_name-$grafana_description grafana/grafana:$version

sleep 1

docker cp $container_name-$grafana_description:/var/lib/grafana/ $grafana_data
docker cp $container_name-$grafana_description:/etc/grafana/ $grafana_conf

docker rm -vf $container_name-$grafana_description
