FROM resin/rpi-raspbian:latest
MAINTAINER Jordan Content

# Define static version of package
RUN apt-get update && apt-get install -y rsync nano --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY rsyncd.conf /etc/rsyncd.conf
COPY sshd_config /etc/ssh/sshd_config

WORKDIR /
COPY docker-entrypoint.d/* /docker-entrypoint.d/
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 873
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]