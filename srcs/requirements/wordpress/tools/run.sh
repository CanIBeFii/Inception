#!/bin/sh

cd /var/www/html

if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp cli update --yes --allow-root
	wp core download --allow-root
	wp config create --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_USER_PASS} --dbhost=mariadb --skip-check --allow-root #--path=${WORDPRESS_PATH}
	wp core install --url=${DOMAIN} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} --admin_email=${WORDPRESS_EMAIL} --allow-root
	wp theme install teluro --activate --allow-root #--path=${WORDPRESS_PATH}
	wp user create "${LOGIN}" "${WORDPRESS_EMAIL}" --role=author --user_pass=${WORDPRESS_PASS} --allow-root #--path=${WORDPRESS_PATH}
else
	echo "Wordpress already installed"
fi

exec /usr/sbin/php-fpm7.4 -F