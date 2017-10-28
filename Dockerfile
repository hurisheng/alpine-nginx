FROM nginx:alpine

LABEL author="hurisheng"

RUN apk update && apk add bash