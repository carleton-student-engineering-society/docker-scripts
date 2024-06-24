FROM php:8.2-apache

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apt-get update; apt-get upgrade -y; apt-get install openssh-server -y
RUN echo "TmPf1leacc5ss!\nTmPf1leacc5ss!" | passwd root
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
