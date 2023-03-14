#!/bin/bash
export NAME=www-scesoc-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=www.scesoc.ca --name $NAME --network httpd-net --ip 10.10.10.5 -v /var/www/www.scesoc.ca/:/var/www/html/ cses/$NAME
