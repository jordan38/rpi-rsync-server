FROM hypriot/rpi-alpine:3.6
MAINTAINER Jordan Content

RUN apk add --no-cache rsync openssh-client

WORKDIR /usr/local/bin
COPY run .
RUN chmod +x /usr/local/bin/run

RUN mkdir -p /mnt/rsync
VOLUME /mnt/rsync

EXPOSE 873

ENTRYPOINT ["/usr/local/bin/run"]