FROM debian:3.18

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache nginx openssl gettext

RUN mkdir -p /etc/nginx/http.d \
	&& rm /etc/nginx/http.d/*.conf

COPY ./conf/default.conf /default.conf.tmpl

COPY ./tools/run.sh /run.sh

RUN chmod +x /run-sh

ENTRYPOINT [ "/run.sh" ]

