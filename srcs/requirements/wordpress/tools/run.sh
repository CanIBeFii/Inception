#!/bin/sh

set -x

if [ -e /etc/php7/php-fpm.d/www.conf ]; then 
	echo "FastCGI Process Manager config already created"
else
	cat /ww.conf.tmpl | envsubst > /etc/php7/php-fpm.d/www.conf
fi

if [ -e wp-config.php ]; then
	echo "Wordpress config already created"
else
	wp config create --allow-root \
		--dbname=$WORDPRESS_DB_NAME \
		--dbuser=$MARIADB_USER_NAME \
		--dbpass=$MARIADB_USER_PASS \
		--dbhost=$MARIADB_HOST

	wp db create --allow-root
fi

if [ wp core is-installed --allow-root ]; then 
	echo "Wordpress core already installed"
else
	wp core install --allow-root \
		--url=$WORDPRESS_URL \
		--title=$WORDPRESS_TITLE \
		--admin_user=$WORDPRESS_ADMIN_NAME \
		--admin_email=$WORDPRESS_ADMIN_EMAIL \
		--admin_pass=$WORDPRESS_ADMIN_PASS

	wp user create --allow-root \
		$WORDPRESS_USER_NAME \
		$WORDPRESS_USER_EMAIL \
		--role=author \
		--user_pass=$WORDPRESS_USER_PASS

	wp config set WORDPRESS_DEBUG false --allow-root
fi

wp plugin update --all --allow-root

echo "Start FastCGI Process Manager"
exec php-fpm7 --nodaemonize $@
