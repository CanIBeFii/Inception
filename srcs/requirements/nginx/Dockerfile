FROM debian.bullseye

# Upgrade system and install basic applications
RUN apt update -y && apt upgrade -y
RUN apt install nginx -y
RUN apt install curl -y
RUN apt install vim -y

# Install and setup SSL
RUN mkdir -p /etc/nginx/ssl
RUN apt install OpenSSL -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=LIS/O=42/OU=student/CN=fialexan.42.fr"

# Config files
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
