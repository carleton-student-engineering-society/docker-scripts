#!/bin/bash
export NAME=cubes-carleton-ca
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=cubes-carleton.ca,www.cubes-carleton.ca,wp.cubes-carleton.ca -e LETSENCRYPT_HOST=cubes-carleton.ca,www.cubes-carleton.ca,wp.cubes-carleton.ca --name $NAME --network httpd-net -v /var/www/cubes-carleton.ca/:/var/www/html/ cses/$NAME
