# Operating System
FROM	debian:bullseye

# Update system and installation
RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install mariadb-server -y

# Copying configuration files
COPY	./tools/run.sh /

# Giving permission to execute
RUN chmod +x /run.sh

# Installing database
RUN mysql_install_db

EXPOSE	3306

ENTRYPOINT [ "/run.sh" ]

CMD [ "mysqld_safe", "--bind-address=0.0.0.0" ]