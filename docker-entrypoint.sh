#!/bin/sh

set -e

printf "$LOGIN:$PASSWORD" > /etc/rsyncd.secrets

ln -sf /dev/stdout /var/log/rsync/rsync.log

rsync --no-detach --daemon