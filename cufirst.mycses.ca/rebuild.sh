#!/bin/bash
export NAME=cufirst-mycses-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=cufirst.mycses.ca -e LETSENCRYPT_HOST=cufirst.mycses.ca --name $NAME --network httpd-net --ip 10.10.10.3 -v /var/www/cufirst.mycses.ca/:/var/www/html/ cses/$NAME
