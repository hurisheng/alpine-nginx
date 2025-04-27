FROM alpine:latest

LABEL author="hurisheng"

RUN apk add --no-cache bash nginx ca-certificates tzdata \
  && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone \
  && apk --no-cache del tzdata \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && echo "0 5 * * * nginx -s reload" >> /var/spool/cron/crontabs/root

VOLUME [ "/etc/nginx", "/etc/letsencrypt", "/opt/html" ]

EXPOSE 80 443

CMD nginx && crond -f
