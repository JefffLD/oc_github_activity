#!/bin/sh

DELETE_REQ='--request DELETE --write "%{http_code} %{url_effective}\\n" --silent'
USER_CNX=--user admin:admin123
OUTPUT_TRACE=--output /dev/null

URL_OLD_RELEASES=http://nexus:50080/nexus/service/local/repositories/releases/content/com/myproject/toto

curl $DELETE_REQ $USER_CNX $OUTPUT_TRACE $URL_OLD_RELEASES'myproject/'
curl $DELETE_REQ $USER_CNX $OUTPUT_TRACE $URL_OLD_RELEASES'myproject-api/'
curl $DELETE_REQ $USER_CNX $OUTPUT_TRACE $URL_OLD_RELEASES'myproject-batch/'


