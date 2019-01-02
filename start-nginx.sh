#!/bin/sh

nginx -c /etc/nginx/config/nginx.conf

watch="/etc/nginx/ssl"

inotifywait -e modify,move,create,delete -mr --timefmt '%d/%m/%y %H:%M' --format '%T' \
${watch} | while read date time; do
		echo "At ${time} on ${date}, SSL file update detected."
		nginx -s reload
done