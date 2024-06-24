#!/bin/bash
export NAME="desoc-ca"
export DOMAIN="desoc.ca"
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN --name $NAME --network httpd-net -v /var/www/$NAME/:/var/www/html/ cses/$NAME
