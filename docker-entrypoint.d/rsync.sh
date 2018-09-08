#!/bin/sh

cd /etc/
touch rsyncd.secrets
chmod 400 /etc/rsyncd.secrets
echo "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets
addgroup -S rsync && adduser -S -G $LOGIN rsync

mkdir -p /rsync/backup/data
mkdir -p /var/log/rsync
chown -R $LOGIN:rsync /rsync/
chmod -R a+rw /rsync/
cd /var/log/rsync/
touch rsync.log
ln -sf /dev/stdout /var/log/rsync/rsync.log

rsync --no-detach --daemon