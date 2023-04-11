#!/bin/bash
export NAME=cses-carleton-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=cses.carleton.ca -e LETSENCRYPT_HOST=cses.carleton.ca --name $NAME --network httpd-net --ip 10.10.10.8 -v /var/www/cses.carleton.ca/:/var/www/html/ cses/$NAME
