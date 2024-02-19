#!/bin/sh

SETUP='/init.sql'

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Install mariadb for the first time"
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

echo "Setup initial file"
cat tmpl.sql | envsubst > ${SETUP}

echo "Start mysql daemon to receive arguments"
exec mysqld --user=mysql --datadir="/var/lib/mysql" --port=3306 --init-file ${SETUP} $@
