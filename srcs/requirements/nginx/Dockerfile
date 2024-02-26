# Operating System
FROM	debian:bullseye

# Update system and installation
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y nginx openssl

# Creating directories
RUN	mkdir -p /etc/nginx/ssl \
	&& mkdir -p /run/nginx \
	&& chown -R www-data /var/lib/nginx \
	&& rm -rf /etc/nginx/sites-available/default

# Copying configuration files
COPY	./tools/run.sh /tmp/run.sh
COPY	./conf/default.conf /etc/nginx/sites-available/default.conf
COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN	ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE	443

ENTRYPOINT [ "sh", "/tmp/run.sh" ]

