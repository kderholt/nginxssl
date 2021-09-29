#!/bin/bash

if [ \( ! -e "/var/lock/CREATE" \) -a \( ! -z "${domains}" \) ]; then
	echo "LAGE SERT"
if  [ ! -e "/etc/letsencrypt/live" ]; then
dateFolder=`date "+%d%m%y-%H%M"`
	mkdir -p /etc/nginx/conf.d/backupIfSSLDeleted/$dateFolder
	mv /etc/nginx/conf.d/*.*.conf /etc/nginx/conf.d/backupIfSSLDeleted/$dateFolder/
/config/setupDomain.pl
exec nginx -c /etc/nginx/nginx.conf >>/dev/null 2>&1 &
fi
if [ ${production} -eq 1 ]; then
	echo "PROD"
	certbot certonly --config /config/letsencrypt.conf --agree-tos -n --expand
else
	echo "TEST"
	certbot certonly --config /config/letsencrypt.conf --agree-tos --test-cert -n --expand
fi
killall nginx
false | cp -i /etc/nginx/sites/*.conf /etc/nginx/conf.d/ 2>/dev/null
#cp -n /etc/nginx/sites/*.conf /etc/nginx/conf.d/
mkdir /var/lock/CREATE
fi
exit 0
