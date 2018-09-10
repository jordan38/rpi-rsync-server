#!/bin/sh


cd /etc/
touch rsyncd.secrets
chmod 400 /etc/rsyncd.secrets
echo "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

addgroup -S rsync && adduser -S -G $LOGIN rsync

mkdir -p /rsync/backup/data
chown -R $LOGIN:rsync /rsync/
chmod -R a+rw /rsync/

mkdir -p /var/log/rsync
cd /var/log/rsync/
touch rsync.log
ln -sf /dev/stdout /var/log/rsync/rsync.log

sed -i 's/<login>/'$LOGIN'/g' /etc/rsyncd.conf

rsync --no-detach --daemon