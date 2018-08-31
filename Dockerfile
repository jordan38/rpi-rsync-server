FROM resin/armhf-alpine:3.7-20180718
MAINTAINER Jordan Content

# Define static version of package
RUN apk add --no-cache rsync openssh

COPY rsyncd.conf /etc/rsyncd.conf
COPY sshd_config /etc/ssh/sshd_config

WORKDIR /
COPY docker-entrypoint.d/* /docker-entrypoint.d/
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 873
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]