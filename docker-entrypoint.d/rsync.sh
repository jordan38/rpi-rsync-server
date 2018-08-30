#!/bin/sh

set -e

printf "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

mkdir -p /rsync/backup/data
mkdir -p /var/log/rsync && touch rsync.log
ln -sf /dev/stdout /var/log/rsync/rsync.log

touch /etc/rsyncd.secrets
chmod 600 /etc/rsyncd.secrets

rsync --no-detach --daemon