FROM resin/armhf-alpine:latest
MAINTAINER Jordan Content

RUN apk add --no-cache rsync

COPY docker-entrypoint.sh /

COPY rsyncd.conf /etc/rsyncd.conf

RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /rsync/data

EXPOSE 873
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/bin/rsync", "--daemon"]

CMD sh
