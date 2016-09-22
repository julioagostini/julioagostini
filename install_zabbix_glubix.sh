#!/bin/bash
files="glubix_checkvolstatus.pl glubix_georepstatus33.pl glubix_georepstatus34.pl glubix_numpeers.pl glubix_uuid.pl glubix_volstatus.pl glubix_voltype.pl"
for file in $files
do
   #wget https://github.com/htaira/glubix/blob/master/userparams/${file} -O /usr/libexec/${file}
   chmod +x /usr/libexec/${file}
done
service zabbix-agent restart
echo 'Adicionar os Templates do link abaixo no zabbix'
echo 'https://github.com/htaira/glubix/tree/master/templates'
