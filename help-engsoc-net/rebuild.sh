#!/bin/bash
export NAME="help-engsoc-net"
export DOMAIN="help.engsoc.net"
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN --name $NAME --network httpd-net -v /var/www/$NAME/:/var/www/html/ cses/$NAME
