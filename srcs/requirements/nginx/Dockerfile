# Operating System
FROM	debian:bullseye

# Update system and installation
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y nginx curl

# Creating directories
RUN	mkdir -p /etc/nginx/ssl  /var/www \
	&& mkdir -p /run/nginx

# Install mkcert tool, for automatic SSL/TLS certificate creation
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
	chmod +x mkcert-v*-linux-amd64 && \
	cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

RUN mkcert fialexan.42.fr && \
	cp fialexan.42.fr* /etc/nginx/ssl

# Copying configuration files
COPY	./conf/nginx.conf /etc/nginx/conf.d

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
