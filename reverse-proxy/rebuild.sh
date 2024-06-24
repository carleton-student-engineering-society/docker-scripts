#!/bin/bash
export NAME=reverse-proxy
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped --name $NAME --net httpd-net -p 8080:80 \
	-v $(pwd)/vhost:/etc/nginx/vhost.d \
	-v $(pwd)/html:/usr/share/nginx/html  -v /var/run/docker.sock:/tmp/docker.sock:ro cses/$NAME
docker network connect bridge $NAME
