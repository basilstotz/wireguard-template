#!/bin/sh

conf=$1.conf

echo
echo "info: put this on the server config"
echo

address=$(cat $conf|grep Address|xargs|cut -d" " -f3|cut -d/ -f1)

cat <<EOF
[Peer]
# host $(hostname)
AllowedIPs = $address/32
PresharedKey = $(cat keys/preshared)
PublicKey = $(cat keys/public)
EOF

echo
