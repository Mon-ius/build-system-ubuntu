#!/bin/bash
set +e
if [ ! -d /tmp ]; then
    sudo mkdir /tmp 
    sudo chmod -R 1777 /tmp
fi
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