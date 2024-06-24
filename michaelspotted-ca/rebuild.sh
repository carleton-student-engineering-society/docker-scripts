#!/bin/bash
export NAME="michaelspotted-ca"
export DOMAIN="michaelspotted.ca"
docker build --no-cache -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=$DOMAIN -v /var/www/michaelspotted-ca/history.txt:/var/www/html/history.txt -v /var/www/michaelspotted-ca/michael.txt:/var/www/html/michael.txt --name $NAME --network httpd-net cses/$NAME

