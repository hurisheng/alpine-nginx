FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache bash nginx \
    && mkdir /run/nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# SSL certificates from letsencrypt
VOLUME [ "/etc/nginx/conf.d", "/etc/nginx/ssl", "/etc/nginx/config", "/opt/html" ]

EXPOSE 80 443

CMD [ "nginx", "-g", "daemon off;", "-c", "/etc/nginx/config/nginx.conf" ]