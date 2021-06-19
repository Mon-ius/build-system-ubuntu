#!/bin/bash
set -e
    sudo mkdir -p /tmp && sudo chmod -R 777 /tmp
    mkdir ~/.ssh && echo $PUBLIC_KEY >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
    sudo zerotier-one -d && sleep 1
if [ -z $NETWORK ]; then
    echo '$NETWORK not exist. Please create one or put it inside env.'
    exit
else
    sudo zerotier-cli join $NETWORK
    sudo /usr/sbin/sshd -D
fi

exec "$@"