FROM resin/armhf-alpine:3.7-20180718
MAINTAINER Jordan Content

# Define static version of package
# Example configure SSH on Alpine docker https://hub.docker.com/r/gotechnies/alpine-ssh/
RUN apk add --no-cache rsync openssh

COPY rsyncd.conf /etc/rsyncd.conf

RUN mkdir -p /rsync/backup/data
RUN mkdir -p /var/log/rsync && touch rsync.log

RUN touch /etc/rsyncd.secrets
RUN chmod 600 /etc/rsyncd.secrets

WORKDIR /var/log/rsync
RUN touch rsync.log

WORKDIR /
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 873
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
