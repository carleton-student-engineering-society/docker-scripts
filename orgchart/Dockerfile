FROM cses/orgchart-base

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ="America/Toronto"
ENV PROD="PROD"

RUN cd /home/ubuntu/OrgChart && git pull && pip3 install -r requirements.txt && python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py collectstatic --noinput
COPY start.sh /home/ubuntu/start.sh
COPY nginx.conf /etc/nginx/sites-available/orgchart
RUN ln -s /etc/nginx/sites-available/orgchart /etc/nginx/sites-enabled && rm /etc/nginx/sites-enabled/default
RUN chmod +x /home/ubuntu/start.sh
RUN rm -f /home/ubuntu/OrgChart/chart.sock
RUN chown -R ubuntu:www-data /home/ubuntu

ENTRYPOINT ["/home/ubuntu/start.sh"]
