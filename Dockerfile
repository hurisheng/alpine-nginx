FROM nginx:alpine

LABEL author="hurisheng"

RUN apk add --no-cache bash \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data

COPY ./nginx.conf /etc/nginx/nginx.conf

# SSL certificates from letsenctypt
VOLUME ["/etc/nginx/conf.d", "/etc/letsencrypt", "/opt/html"]

EXPOSE 80 443