#!/bin/sh

mkdir -p $WORDPRESS_PATH
chown -R www-data $WORDPRESS_PATH

`openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisbon/OU=42Lisbon/CN=$DOMAIN" \
	-newkey rsa:2048 -keyout $PRIVATE_KEY -out $CERTIFICATE
`
sed -i 's|NGINX_PORT|'${NGINX_PORT}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|DOMAIN|'${DOMAIN}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|WORDPRESS_PATH|'${WORDPRESS_PATH}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PRIVATE_KEY|'${PRIVATE_KEY}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTIFICATE|'${CERTIFICATE}'|g' /etc/nginx/sites-available/default.conf

nginx -g "daemon off;"