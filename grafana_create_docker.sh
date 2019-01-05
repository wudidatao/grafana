#!/bin/bash

. ./base.sh

docker run -d -p $grafana_port:$grafana_port \
-v $grafana_data/grafana:/var/lib/grafana/ \
-v $grafana_conf/grafana:/etc/grafana/ \
-v /etc/localtime:/etc/localtime \
-e "GF_SECURITY_ADMIN_PASSWORD=$grafana_admin_password" \
-e "GF_INSTALL_PLUGINS=alexanderzobnin-zabbix-app" \
--restart=yes --restart=on-failure:3 --name $container_name-$grafana_description -h $hostname grafana/grafana:$version
