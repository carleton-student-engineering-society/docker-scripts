#!/bin/bash
export NAME=orgchart
docker build -t cses/$NAME . --no-cache

docker stop $NAME
docker rm $NAME

docker run -it -d --name $NAME --net httpd-net -e VIRTUAL_HOST=chart.engsoc.net --restart unless-stopped cses/$NAME
