#!/bin/sh

DIR=/docker-entrypoint.d

if [[ -d "$DIR" ]]
then
    sh $DIR/rsync.sh
    sh $DIR/sshd.sh
fi

exec "$@"