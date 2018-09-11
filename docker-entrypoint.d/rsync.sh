#!/bin/bash


cd /etc/
touch rsyncd.secrets
chmod 400 /etc/rsyncd.secrets
echo "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

groupadd rsync && useradd $LOGIN -g rsync

mkdir -p /rsync/backup/data
chown -R $LOGIN:rsync /rsync/

mkdir -p /var/log/rsync
cd /var/log/rsync/
touch rsync.log
ln -sf /dev/stdout /var/log/rsync/rsync.log

sed -i 's/<login>/'$LOGIN'/g' /etc/rsyncd.conf
sed -i 's/false/true/g' /etc/default/rsync

rsync --no-detach --daemon