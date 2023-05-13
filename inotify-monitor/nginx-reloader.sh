#!/bin/sh

# default reload delay to 10s
NGINX_RELOAD_DELAY="${NGINX_RELOAD_DELAY:=10s}"

# default monitoring paths to /etc/nginx/conf.d & /etc/letsencrypt/archive
NGINX_PATHS_TO_MONITOR="${NGINX_PATHS_TO_MONITOR:=/etc/nginx/conf.d /etc/letsencrypt/archive}"

while :
do
    echo "Monitoring paths: ${NGINX_PATHS_TO_MONITOR}"
    inotifywait -r -e create -e modify -e delete -e move $NGINX_PATHS_TO_MONITOR
    echo "Changes detected - reloading nginx in ${NGINX_RELOAD_DELAY}"
    sleep $NGINX_RELOAD_DELAY
    nginx -s reload
done
