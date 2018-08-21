#!/bin/sh

# Exemple https://github.com/mickaelperrin/docker-rsync-server

set -e

printf "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

exec "$@"