FROM hypriot/rpi-alpine:latest
MAINTAINER Jordan Content

RUN apk add --no-cache rsync tzdata

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 873
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

CMD [ "/usr/bin/rsync", "--daemon", "--log-file=/dev/stdout" ]