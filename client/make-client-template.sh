#!/bin/sh

#client
device="wg1"
address="172.30.0.10"
netmask=24
#server
server_public="<server_public>"
server_endpoint="<server_endpoint>"




network=$(ipcalc $address/$netmask|grep Network|xargs|cut -d" " -f2|cut -d/ -f1)


cat <<EOF > $device.conf.template 
[Interface]
PrivateKey = $(cat keys/private)
Address = $address>/$netmask
 
[Peer]
# public server, the same on all clients
PublicKey = $server_public
AllowedIPs = $network/$netmask
Endpoint = $server_endpoint
PersistentKeepalive = 15
# this is per client
PresharedKey = $(cat keys/preshared)
EOF

echo "info: this is the current config"
echo
cat $device.conf.template
echo
