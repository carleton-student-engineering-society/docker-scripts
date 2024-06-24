#!/bin/bash
export NAME="bitbucket"
export DOMAIN="bitbucket.engsoc.net"
docker pull atlassian/bitbucket:latest
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e VIRTUAL_PORT=7990 -e LETSENCRYPT_HOST=$DOMAIN -e SERVER_PROXY_NAME=$DOMAIN -e SERVERL_PROXY_PORT=443 -e SERVER_SCHEME=https -e SERVER_SECURE=true --name $NAME --network httpd-net -v /var/www/$NAME/:/var/atlassian/application-data/bitbucket --dns="1.1.1.1" -p 2222:2222 cses/$NAME
