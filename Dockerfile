# default nginx version
ARG NGINX_TAG=stable-alpine
FROM nginx:${NGINX_TAG}

# add inotify tools
RUN apk -U upgrade \
    && apk add inotify-tools

# add monitoring scripts
COPY ./inotify-monitor /inotify-monitor
RUN chmod +x /inotify-monitor/*.sh

# make sure inotifywait doesn't panic
RUN mkdir -p /etc/nginx/conf.d
RUN mkdir -p /etc/letsencrypt/archive

# schedule daily apk upgrade
RUN mv /inotify-monitor/apk-update.sh /etc/periodic/daily/

CMD ["/inotify-monitor/cmd.sh"]
