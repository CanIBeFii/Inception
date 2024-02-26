# Operating System
FROM	debian:bullseye

# Update system and installation
RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install mariadb-server mariadb-client -y

# Creating directory for the database
RUN	mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chown -R mysql:mysql /etc/mysql


# Copying configuration files
COPY	./tools/run.sh /tmp/
COPY	./conf/config.sql /tmp/
COPY	./conf/my_config.cnf /etc/mysql

RUN	chown -R mysql:mysql /tmp/ \
	&& chown -R mysql:mysql /etc/mysql


EXPOSE	3306

USER	mysql

ENTRYPOINT [ "sh", "/tmp/run.sh" ]
