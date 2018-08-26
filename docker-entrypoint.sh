#!/bin/sh

# Exemple https://github.com/mickaelperrin/docker-rsync-server
# Exemple https://github.com/guewen/rsync-raspbian/

set -e

printf "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

ln -sf /dev/stdout /var/log/rsync/rsync.log

rsync --no-detach --daemon --config=/etc/rsyncd.conf --log-file=/var/log/rsync/rsync.log

#exec "$@"