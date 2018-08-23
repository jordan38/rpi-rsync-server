#!/bin/sh

# Exemple https://github.com/mickaelperrin/docker-rsync-server

set -e

printf "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

# ln -sf /var/log/rsync/rsync.log /dev/stdout

exec "$@"