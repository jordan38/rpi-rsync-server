FROM hypriot/rpi-alpine:latest
MAINTAINER Jordan Content

RUN apk add --no-cache rsync tzdata

COPY docker-entrypoint.sh /

COPY rsyncd.conf /etc/rsyncd.conf

RUN chmod +x /docker-entrypoint.sh

# RUN mkdir -p /var/log/rsync

# RUN touch /var/log/rsync/rsync.log

RUN mkdir -p /rsync/data

EXPOSE 873
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "/usr/bin/rsync", "--no-detach", "--daemon", "--config=/etc/rsyncd.conf", "--log-file=/dev/stdout"]

CMD sh
