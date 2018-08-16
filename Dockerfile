FROM hypriot/rpi-alpine:3.7
MAINTAINER Jordan Content

RUN apk add --no-cache rsync openssh-client

RUN mkdir -p /media/rsync

RUN useradd rsync | groupadd rsync | gpasswd -a rsync rsync

RUN chown -R rsync:rsync /media/rsync

RUN chmode -R 775 /media/rsync

VOLUME /media/rsync

COPY run /usr/local/bin/run

EXPOSE 873

ENTRYPOINT ["/usr/local/bin/run"]





