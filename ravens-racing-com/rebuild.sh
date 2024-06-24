#!/bin/bash
export NAME="ravens-racing-com"
export DOMAIN="racing.engsoc.net"
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN --name $NAME --network httpd-net -v /var/www/ravensracing-com/:/var/www/html/ cses/$NAME
