#!/bin/bash
docker volume create nginx-ssl-prod | echo "already created nginx-ssl-prod "
docker volume create nginx-sites-prod | echo "already created nginx-sites-prod"
docker volume create nginx-www-prod | echo "already created nginx-www-prod"
docker build --target nginx -t nginxssl .
docker build --target cron -t certbot-cron .
