#!/bin/bash

# Example configure SSH on Alpine docker https://hub.docker.com/r/gotechnies/alpine-ssh/

set -e

/usr/bin/ssh-keygen -A
ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

echo "$ROOT_LOGIN:$ROOT_PASSWORD" | chpasswd

/usr/sbin/sshd -D