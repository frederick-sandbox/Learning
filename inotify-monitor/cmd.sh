#!/bin/sh

# starts the cron daemon for daily apk upgrade
/usr/sbin/crond

# run the monitor in the background
DIR="$( cd "$( dirname "$0" )" && pwd )"
$DIR/nginx-reloader.sh &

# start the nginx in foreground
# use "exec" so that docker can monitor nginx
# and properly propogating signals to nginx
exec nginx -g "daemon off;"
