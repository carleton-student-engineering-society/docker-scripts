docker run -it -d --restart unless-stopped -e VIRTUAL_HOST=password.engsoc.net -e LETSENCRYPT_HOST=password.engsoc.net --name password-engsoc-net --network httpd-net \
    -v $PWD/ssp.conf.php:/var/www/conf/config.inc.local.php \
    -it docker.io/ltbproject/self-service-password:latest
