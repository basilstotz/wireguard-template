#!/bin/sh

device="wg1"
port=41194
address="172.30.0.1"
netmask=24


cat <<EOF > $device.conf.template 
[Interface]
PrivateKey = $(cat keys/private)
ListenPort = $port
Address = $address/$netmask
EOF


echo "info: this is the current config"
echo
cat $device.conf.template
echo
