FROM nginx:1.24.0-alpine

RUN apk -U upgrade \
    && apk add -U inotify-tools

COPY ./inotify-monitor /inotify-monitor

RUN chmod +x /inotify-monitor/*.sh

CMD ["/inotify-monitor/cmd.sh"]
