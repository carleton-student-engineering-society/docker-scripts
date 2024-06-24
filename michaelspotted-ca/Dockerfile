FROM php:8.2-apache

RUN apt-get update && apt-get install -y git && cd /var/www/ && rm -rf html && git clone https://github.com/carleton-student-engineering-society/MichaelSpotted html && touch html/michael.txt && chown www-data:www-data html/michael.txt
RUN cp /usr/share/zoneinfo/America/Toronto /etc/localtime && echo "America/Toronto" >  /etc/timezone

