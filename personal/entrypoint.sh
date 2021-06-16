#!/bin/bash
set -e
    [ -d /tmp ] || sudo mkdir /tmp && sudo chmod -R 1777 /tmp
    mkdir ~/.ssh && echo $PUBLIC_KEY >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
    zerotier-one -d || sudo zerotier-one -d && sleep 1
if [ -z $NETWORK ]; then
    echo '$NETWORK not exist. Please create one or put it inside env.'
    exit
else
    zerotier-cli join $NETWORK || sudo zerotier-cli join $NETWORK
    /usr/sbin/sshd -D || sudo /usr/sbin/sshd -D
fi

exec "$@"