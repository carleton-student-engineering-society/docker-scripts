#!/bin/bash
export NAME=ceng-wiki
docker build -t cses/$NAME .
docker stop $NAME
docker rm $NAME
docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=ceng.wiki -e LETSENCRYPT_HOST=ceng.wiki -e DB_TYPE=mysql -e DB_HOST=10.10.10.1 -e DB_PORT=3306 -e DB_USER=cengwiki -e DB_PASS=ASjQqUh9vDT8r5V1ZMUHUyZkZ -e DB_NAME=cengwiki -e VIRTUAL_PORT=3000 --name $NAME --network httpd-net cses/$NAME
