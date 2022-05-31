#!/bin/sh

conf=$1.conf

endpoint="<endpoint>"
preshared="<preshared>"

echo
echo "info: put this on the client config"
echo

address=$(cat $conf|grep Address|xargs|cut -d" " -f3|cut -d/ -f1)
netmask=$(cat $conf|grep Address|xargs|cut -d" " -f3|cut -d/ -f2)
network=$(ipcalc $address/24|grep Network|xargs|cut -d" " -f2|cut -d/ -f1)

port=$(cat $conf|grep ListenPort|xargs|cut -d" " -f3)

cat <<EOF
[Peer]
# puclic server, the same on all clients
PublicKey = $(cat keys/public)
AllowedIPs = $network/$netmask
Endpoint = $endpoint:$port
PersistentKeepalive = 15
# this can be per client 
PresharedKey = $preshared
EOF

echo
