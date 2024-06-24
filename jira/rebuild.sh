#!/bin/bash
export NAME="jira"
export DOMAIN="jira.engsoc.net"
docker pull atlassian/jira-software:latest
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN -e ATL_PROXY_NAME=jira.engsoc.net -e ATL_PROXY_PORT=443 -e ATL_TOMCAT_SCHEME=https -e ATL_TOMCAT_SECURE=true --name $NAME --network httpd-net -v /var/www/$NAME/:/var/atlassian/application-data/jira cses/$NAME
