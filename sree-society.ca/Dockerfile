FROM php:8.0-apache
COPY php.ini /usr/local/etc/php/

RUN apt-get update && apt-get -y upgrade && apt-get -y install libcurl4-openssl-dev && docker-php-ext-install mysqli && docker-php-ext-install curl

EXPOSE 80
