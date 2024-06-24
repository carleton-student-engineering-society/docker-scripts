#!/bin/bash
cd /home/ubuntu/
cd OrgChart/
nginx
rm -f /home/ubuntu/OrgChart/chart.sock /home/ubuntu/OrgChart/chart.sock.lock
export PROD="PROD"
sudo -E -u ubuntu -g www-data daphne -u /home/ubuntu/OrgChart/chart.sock orgchart.asgi:application
