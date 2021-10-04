#!/bin/bash
HOSTNAME="$1"
OSVERSION=$(cat /etc/*release | grep VERSION_CODENAME | awk -F= '{print $2}')
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+${OSVERSION}_all.deb
dpkg -i zabbix-release_5.0-1+${OSVERSION}_all.deb
apt update
apt install zabbix-agent

echo "PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=0
Server=172.31.3.144
ServerActive=172.31.3.144
Hostname=$HOSTNAME
Include=/etc/zabbix/zabbix_agentd.d/*.conf" > /etc/zabbix/zabbix_agentd.conf

