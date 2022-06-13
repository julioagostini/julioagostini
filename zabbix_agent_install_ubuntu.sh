#!/bin/bash
SERVER="$1"
HOSTNAME="$2"
OSVERSION=$(cat /etc/*release | grep VERSION_CODENAME | awk -F= '{print $2}')
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+${OSVERSION}_all.deb
dpkg -i zabbix-release_5.0-1+${OSVERSION}_all.deb
apt update
apt install zabbix-agent

echo "PidFile = /var/run/zabbix/zabbix_agentd.pid
LogFile = /var/log/zabbix/zabbix_agentd.log
LogFileSize = 0
Server = $SERVER
ServerActive = $SERVER
Hostname = $HOSTNAME
Include = /etc/zabbix/zabbix_agentd.d/*.conf" > /etc/zabbix/zabbix_agentd.conf


systemctl stop zabbix-agent.service
systemctl start zabbix-agent.service 
systemctl enable zabbix-agent.service 



