FROM	debian:bullseye

RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y php8.3 php8.3-mysql php8.3-cli \
	php8.3-mbstring php8.3-fpm php8.3-gettext mariadb-client wget \

RUN	rm -rf /etc/php/8.3/fpm/pool.d/www.conf \
	&& mkdir -p /run/php

COPY	./conf/ww.conf /etc/php/8.3/fpm/pool.d
COPY	./tools/run.sh /tmp/

RUN chmod +x /tmp/run.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/run.sh" ]