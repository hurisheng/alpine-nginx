FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache bash nginx certbot openssl \
  && mkdir /run/nginx \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && echo "30 4 * * * certbot renew --deploy-hook \"nginx -s reload\"" >> /var/spool/cron/crontabs/root

VOLUME [ "/etc/nginx/conf.d", "/etc/letsencrypt", "/etc/nginx/config", "/opt/html" ]

EXPOSE 80 443

CMD nginx -c /etc/nginx/nginx.conf && crond -f