#!/bin/bash
export NAME=acme-companion
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped --name $NAME --net httpd-net \
	--volumes-from reverse-proxy \
	-v $(pwd)/acme.sh:/etc/acme.sh -v /var/run/docker.sock:/var/run/docker.sock:ro cses/$NAME
