#!/bin/sh

cd /etc/
touch rsyncd.secrets
chmod 600 /etc/rsyncd.secrets
echo "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

mkdir -p /rsync/backup/data
mkdir -p /var/log/rsync
cd /var/log/rsync/
touch rsync.log
ln -sf /dev/stdout /var/log/rsync/rsync.log

rsync --no-detach --daemon