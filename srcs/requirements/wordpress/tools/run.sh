#!/bin/sh

cd /var/www/html

if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp cli update --yes --allow-root
	wp core download --allow-root
	wp config create --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_USER_PASS} --dbhost=${MARIADB_HOST} --allow-root --path=/var/www/html
	wp core install --url=${DOMAIN} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASS} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
	wp theme install teluro --activate --allow-root #--path=${WORDPRESS_PATH}
	wp user create "${WORDPRESS_USER}" "${WORDPRESS_EMAIL}" --role=author --user_pass=${WORDPRESS_PASS} --display_name="${MARIADB_USER}" --allow-root #--path=${WORDPRESS_PATH}
else
	echo "Wordpress already installed"
fi

exec /usr/sbin/php-fpm7.4 -F