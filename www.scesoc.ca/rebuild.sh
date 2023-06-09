#!/bin/bash
export NAME=www-scesoc-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=www.scesoc.ca,scesoc.ca -e LETSENCRYPT_HOST=www.scesoc.ca,scesoc.ca --name $NAME --network httpd-net -v /var/www/www.scesoc.ca/:/var/www/html/ cses/$NAME
