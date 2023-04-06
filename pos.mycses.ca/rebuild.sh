#!/bin/bash
export NAME=pos-mycses-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=pos.mycses.ca -e LETSENCRYPT_HOST=pos.mycses.ca --name $NAME --network httpd-net --ip 10.10.10.2 -v /var/www/pos.mycses.ca/:/var/www/html/ cses/$NAME
