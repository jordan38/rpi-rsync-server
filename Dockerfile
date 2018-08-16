FROM hypriot/rpi-alpine:3.7
MAINTAINER Jordan Content

RUN apk add --no-cache rsync openssh-client

COPY rsync /etc/default/
COPY rsyncd.conf /etc/

RUN mkdir -p /data





