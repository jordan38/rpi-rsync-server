#!/bin/sh

# Exemple https://github.com/mickaelperrin/docker-rsync-server
# Exemple https://github.com/guewen/rsync-raspbian/

set -e

printf "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

exec "$@"