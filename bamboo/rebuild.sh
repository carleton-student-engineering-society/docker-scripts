#!/bin/bash
export NAME="bamboo"
export DOMAIN="bamboo.engsoc.net"
docker pull atlassian/bamboo:latest
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e VIRTUAL_PORT=8085 -e LETSENCRYPT_HOST=$DOMAIN -e ATL_PROXY_NAME=$DOMAIN -e ATL_PROXY_PORT=443 -e ATL_TOMCAT_SCHEME=https -e ATL_TOMCAT_SECURE=true --name $NAME --network httpd-net -v /var/www/$NAME/:/var/atlassian/application-data/bamboo --dns="1.1.1.1" cses/$NAME
