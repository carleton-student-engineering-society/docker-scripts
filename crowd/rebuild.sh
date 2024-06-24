#!/bin/bash
export NAME="crowd"
export DOMAIN="crowd.engsoc.net"
docker pull atlassian/crowd:latest
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN -e ATL_PROXY_NAME=crowd.engsoc.net -e ATL_PROXY_PORT=443 -e ATL_TOMCAT_SCHEME=https -e ATL_TOMCAT_SECURE=true --name $NAME --network httpd-net -v /var/www/$NAME/:/var/atlassian/application-data/crowd cses/$NAME
