FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ="America/Toronto"
ENV PROD="PROD"

RUN useradd -ms /bin/bash ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo tzdata libmariadb-dev nginx python3-pip gunicorn certbot python3-certbot-nginx daphne
RUN cd /home/ubuntu && git clone https://github.com/carleton-student-engineering-society/OrgChart.git && cd OrgChart && pip3 install -r requirements.txt
