#!/bin/bash
export NAME=pos-mycses-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped --name $NAME --network httpd-net --ip 10.10.10.2 cses/$NAME
