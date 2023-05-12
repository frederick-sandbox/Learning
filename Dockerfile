ARG NGINX_TAG=stable-alpine
FROM nginx:${NGINX_TAG}

RUN apk -U upgrade \
    && apk add -U inotify-tools

COPY ./inotify-monitor /inotify-monitor

RUN chmod +x /inotify-monitor/*.sh

CMD ["/inotify-monitor/cmd.sh"]
