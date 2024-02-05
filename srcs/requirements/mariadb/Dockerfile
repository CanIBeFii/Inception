# Operating System
FROM debian.bullseye

# Update system and installation
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y mariadb-server

# Get the configuration file
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/

# Get script
COPY ./tools/script.sh /
RUN chmod +x /scripth.sh


ENTRYPOINT [ "/script.sh" ]
