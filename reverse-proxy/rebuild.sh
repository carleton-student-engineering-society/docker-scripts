#!/bin/bash
export NAME=reverse-proxy
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped --name $NAME --net httpd-net -v /var/run/docker.sock:/tmp/docker.sock:ro cses/$NAME
docker network connect bridge $NAME
