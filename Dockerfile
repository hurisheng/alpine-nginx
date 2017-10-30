FROM nginx:alpine

LABEL author="hurisheng"

RUN apk update && apk add bash

# SSL certificates from letsenctypt
VOLUME ["/etc/nginx/conf.d", "/etc/letsencrypt", "/opt/html"]