#! /bin/bash

# start deamon
nohup sudo tailscaled >/dev/null 2>&1 &

# start tailscale
if [ -z ${TAILSCALE_EPHEMERAL_KEY+x} ]; then
    sudo tailscale up
else 
    sudo tailscale up --authkey=$TAILSCALE_EPHEMERAL_KEY ; 
fi

