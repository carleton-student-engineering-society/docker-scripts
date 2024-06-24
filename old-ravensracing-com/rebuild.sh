#!/bin/bash
export NAME="old-ravensracing-com"
export DOMAIN="ravensracing.com"
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN -p 2222:22 --name $NAME --network httpd-net -v /var/www/$NAME/:/var/www/html/ cses/$NAME
