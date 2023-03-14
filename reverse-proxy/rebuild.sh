#!/bin/bash
export NAME=reverse-proxy
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped --name $NAME --net httpd-net -p 80:80 -p 443:443 -v certs:/etc/nginx/certs:ro -v /var/run/docker.sock:/tmp/docker.sock:ro cses/$NAME
docker network connect bridge $NAME
