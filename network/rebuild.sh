#!/bin/bash
docker network rm httpd-net
docker network create httpd-net --subnet 10.10.10.0/24
