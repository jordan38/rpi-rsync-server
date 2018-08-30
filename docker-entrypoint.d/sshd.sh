#!/bin/sh

# Example configure SSH on Alpine docker https://hub.docker.com/r/gotechnies/alpine-ssh/

set -e

sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config
sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config
sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config
sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config
sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config
/usr/bin/ssh-keygen -A
ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

echo "$ROOT_LOGIN:$ROOT_PASSWORD" | chpasswd

/usr/sbin/sshd -D