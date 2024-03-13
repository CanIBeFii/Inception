# Operating System
FROM	debian:bullseye

# Update system and installation
RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y wget curl unzip php7.4 \
    php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd \
    php7.4-xml php7.4-mbstring

# Installing WordPress Command Line Interface(CLI)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Create and configure PHP-FPM
RUN mkdir /run/php \
	&& chmod 755 /run/php/ \
	&& sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

# Copying configuration script
COPY	./tools/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh

EXPOSE 9000

ENTRYPOINT [ "/tmp/run.sh" ]