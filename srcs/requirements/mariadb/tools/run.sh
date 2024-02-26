#!/bin/sh

# Set values on config files with environment variables
sed -i 's|MARIADB_DATABASE|'${MARIADB_DATABASE}'|g' /tmp/config.sql
sed -i 's|MARIADB_USER|'${MARIADB_USER}'|g' /tmp/config.sql
sed -i 's|MARIADB_USER_PASS|'${MARIADB_USER_PASS}'|g' /tmp/config.sql
sed -i 's|MARIADB_ROOT_PASS|'${MARIADB_ROOT_PASS}'|g' /tmp/config.sql
sed -i 's|MARIADB_PORT|'${MARIADB_PORT}'|g' /etc/mysql/my_config.cnf
sed -i 's|MARIADB_ADDRESS|'${MARIADB_ADDRESS}'|g' /etc/mysql/my_config.cnf


if [ ! -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then
	echo "Install mariadb for the first time"
	mysql_install_db
	mysqld --init-file="/tmp/config.sql"
else
	echo "Database already exists"
	mysqld_safe
fi

exec "$@"
