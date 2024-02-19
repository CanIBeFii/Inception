# Operating System
FROM alpine:3.18

# Update system and installation
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache mariadb mariadb-client gettext

RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld

COPY ./conf/my_config.cnf /my_config.cnf.tmpl

RUN chmod 744 /my_config.cnf.tmpl

RUN rm -f /etc/mysql/my_config.cnf

COPY ./conf/tmpl.sql /tmpl.sql

COPY./tools/run.sh /run.sh

RUN chmod +x /run.sh

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

ENTRYPOINT [ "/run.sh" ]
