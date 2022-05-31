#!/bin/sh

device="wg1"
port=41194
adddress="172.30.0.1"
netmask=24

if ! test -d keys; then
    echo "info: generate all keys"
    umask 077
    mkdir -p keys
    wg genkey | tee keys/private | wg pubkey > keys/public
else
    echo "info: keys already exist. i keep them"
fi

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
