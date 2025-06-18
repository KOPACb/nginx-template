#!/bin/bash

echo "backing up original nginx config to /srv/backup/nginx/nginx.original/"
mkdir -p /srv/backup/nginx/
cp -r /etc/nginx/ /srv/backup/nginx/nginx.original/

echo "updating nginx configs"
cp -r nginx/ /etc/

echo "Restarting nginx"
systemctl restart nginx
