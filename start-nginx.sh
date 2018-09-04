#!/bin/sh

nginx -c /etc/nginx/config/nginx.conf

watch="/etc/nginx/ssl/*/*"

oldcksum=$(cksum ${watch})

inotifywait -e modify,move,create,delete -mr --timefmt '%d/%m/%y %H:%M' --format '%T' \
${watch} | while read date time; do

	newcksum=$(cksum ${watch})
	if [ "${newcksum}" != "${oldcksum}" ]; then
		echo "At ${time} on ${date}, SSL file update detected."
		oldcksum=${newcksum}
		nginx -s reload
	fi

done