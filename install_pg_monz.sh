#!/bin/bash
echo Use ./install_pg_monz.sh 'y' '/var/lib/pgsql/9.3/data/pg_log'


   echo "Antes de executar este script deve executar as tarefas abaixo:"
   echo "Mudar o parametro log_file_mode = 0640 no arquivo de conf /var/lib/pgsql/9.3/data/postgresql.conf"
   echo "Adicionar o zabbix ao grupo do postgres no arquivo /etc/group"
   echo "Adicionar o template Template App PostgreSQL via interface web do zabbix"
 

PGLOG="$2"
if [ "$PGLOG" == "" ]
then
   echo "Favor preencher o parametro PGLOG"
   exit 1
fi
if [ "$1" == "y" ]
then
   if [ $PGLOG == "" ]
   then
      echo "Favor preencher o parametro PGLOG"
      exit 1
   fi

   cd /tmp/
   yum install zabbix-sender
   wget https://github.com/pg-monz/pg_monz/archive/2.0.1.tar.gz
   tar -xvzf ./2.0.1.tar.gz
   cd pg_monz-2.0.1/
   cd pg_monz/
   cp ./usr-local-etc/* /usr/local/etc/
   cp -p ./usr-local-bin/* /usr/local/bin/
   cp -p ./zabbix_agentd.d/userparameter_pgsql.conf /etc/zabbix/zabbix_agentd.d/
   ls -lht $PGLOG/*
   chmod 640 $PGLOG/*
   echo "Reload no postgres"
   service postgresql-9.3 reload
   service zabbix-agent restart
else
   echo "Use ./install_pg_monz.sh 'y' '/var/lib/pgsql/9.3/data/pg_log'"
fi
echo “Adicionar o template Template App PostgreSQL”
