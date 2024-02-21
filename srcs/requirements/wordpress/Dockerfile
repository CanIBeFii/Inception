FROM alpine:3.18

ARG	WORDPRESS_VERSION=5.8.1

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache wget gettext \
	php8 php8-fpm php8-mysqli php8-zip php8-gd \
 	php8-mbstring php8-cli php8-opcache php8-zlib \
	php8-curl php8-json php8-iconv php8-gettext \
	php8-session php8-phar mariadb-client php8-pdo php8-pdo_mysql \
	php8-dom php8-ctype php8-bcmath php8-fileinfo php8-intl php8-mcrypt \
	php8-mysqlnd php8-openssl php8-pdo_pgsql php8-pdo_sqlite php8-posix \
	php8-simplexml php8-soap php8-tokenizer php8-xml php8-xmlreader \
	php8-xmlwriter

RUN wget https://raw.gitbusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	--output-document=/user/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

RUN mkdir -p /run/php /var/www/html/wordpress \
	&& chmod -R 755 /var/www/html/wordpress

RUN addgroup -S wordpress_server \
	&& adduser -S wordpress_server -G wordpress_server

COPY ./conf/www.conf /www.conf.tmpl

RUN rm -f /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html/wordpress

RUN wp core download --allow-root --version=$WORDPRESS_VERSION

COPY ./tools/run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]
