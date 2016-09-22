#!/bin/bash
files="glubix_checkvolstatus.pl glubix_georepstatus33.pl glubix_georepstatus34.pl glubix_numpeers.pl glubix_uuid.pl glubix_volstatus.pl glubix_voltype.pl"
for file in $files
do
   #wget https://github.com/htaira/glubix/blob/master/userparams/${file} -O /usr/libexec/${file}
   chmod +x /usr/libexec/${file}
done
