#!/bin/bash
export NAME=cue-gay
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=cue.gay,www.cue.gay -e LETSENCRYPT_HOST=cue.gay,www.cue.gay --name $NAME --network httpd-net -v /var/www/cue.gay/:/var/www/html/ cses/$NAME
