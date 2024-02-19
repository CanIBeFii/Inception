#!/bin/sh

CONFIG_FILE='/etc/nginx/http.d/default.conf'

if [ -e $CONFIG_FILE ]; then
	echo "Nginx config already created"
else
	cat /default.conf.tmpl \
		| envsubst '$NGINX_PORT $DOMAIN $CERTIFICATE_PATH $PRIVATE_KEY_PATH $VOLUME_WORDPRESS_MOUNT_PATH $WORDPRESS_PORT' \
		> $CONFIG_FILE
fi

exec nginx -g 'daemon off;' $@
