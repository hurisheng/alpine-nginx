FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache bash nginx inotify-tools \
    && mkdir /run/nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./start-nginx.sh /usr/local/bin/

# SSL certificates from letsencrypt
VOLUME [ "/etc/nginx/conf.d", "/etc/nginx/ssl", "/etc/nginx/config", "/opt/html" ]

EXPOSE 80 443

CMD [ "start-nginx.sh" ]