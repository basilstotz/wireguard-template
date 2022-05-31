#!/bin/sh
if ! test -d keys; then
    echo "info: generate all keys"
    umask 077
    mkdir -p keys
    wg genkey | tee keys/private | wg pubkey > keys/public
else
    echo "info: keys already exist. i keep them"
fi
