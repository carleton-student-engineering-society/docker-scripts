#!/bin/bash
export NAME=curover-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=curover.ca -e LETSENCRYPT_HOST=curover.ca --name $NAME --network httpd-net -v /var/www/curover.ca/:/var/www/html/ cses/$NAME
