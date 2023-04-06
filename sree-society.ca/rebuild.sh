#!/bin/bash
export NAME=sree-society-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=sree-society.ca -e LETSENCRYPT_HOST=sree-society.ca --name $NAME --network httpd-net --ip 10.10.10.4 -v /var/www/sree-society.ca/:/var/www/html/ cses/$NAME
