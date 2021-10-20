#! /bin/bash

# start deamon
nohup sudo tailscaled >/dev/null 2>&1 &

# start tailscale
if [ -z ${TAILSCALE_EPHEMERAL_KEY+x} ]; then
    sudo tailscale up
else 
    sudo tailscale up --authkey=$TAILSCALE_EPHEMERAL_KEY ; 
fi

sudo tailscale status --json | sudo jq -r '.Peer | to_entries | .[].value | {name: .HostName, ip: .TailscaleIPs[-1]} | "\(.ip) \(.name)"' | sudo tee -a /etc/hosts