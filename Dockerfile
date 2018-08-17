FROM hypriot/rpi-alpine:3.6
MAINTAINER Jordan Content

RUN apk add --no-cache rsync openssh-client

RUN mkdir -p /media/rsync

VOLUME /media/rsync

COPY run /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

EXPOSE 873

ENTRYPOINT ["/usr/local/bin/run"]





