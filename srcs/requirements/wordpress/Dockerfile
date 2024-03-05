FROM	debian:bullseye

RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y php7.4 php-mysql php-cli \
	php-mbstring php-fpm php-gettext mariadb-client wget \

RUN	rm -rf /etc/php/8.3/fpm/pool.d/www.conf \
	&& mkdir -p /run/php

COPY	./conf/ww.conf /etc/php/8.3/fpm/pool.d
COPY	./tools/run.sh /tmp/

RUN chmod +x /tmp/run.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/run.sh" ]