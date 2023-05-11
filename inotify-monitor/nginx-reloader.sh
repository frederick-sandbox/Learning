#!/bin/sh

# adding comment to test

while :
do
    # recursively monitor new certificate creation events
    echo "Monitoring new certificate creation in ${NGINX_PATH_TO_MONITOR}"
    inotifywait -r -e create $NGINX_PATH_TO_MONITOR
    echo "Detecting new certificate creation, reloading nginx in 30 seconds"
    sleep $NGINX_RELOAD_DELAY_IN_SECONDS
    nginx -s reload
done
