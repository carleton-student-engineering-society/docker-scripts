#!/bin/sh
service ssh start
docker-php-entrypoint
apache2-foreground
