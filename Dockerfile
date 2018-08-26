FROM resin/armhf-alpine:latest
MAINTAINER Jordan Content

RUN apk add --no-cache rsync

COPY docker-entrypoint.sh /

COPY rsyncd.conf /etc/rsyncd.conf

RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /rsync/backup/data

RUN touch /etc/rsyncd.secrets \
    chmod 600 /etc/rsyncd.secrets

RUN mkdir -p /var/log/rsync

WORKDIR /var/log/rsync
RUN touch rsync.log

EXPOSE 873
ENTRYPOINT ["/docker-entrypoint.sh"]
