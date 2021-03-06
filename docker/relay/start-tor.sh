#!/usr/bin/env bash

NICK=${NICKNAME:-$RANDOM}
PORT=${OR_PORT:-443}

echo "Using NICKNAME=${NICK}, OR_PORT=${PORT}."

cat > /etc/tor/torrc << EOF
Nickname ${NICK}
ORPort ${PORT}
ExitRelay 0
SocksPort 0
RelayBandwidthRate 1 MB
RelayBandwidthBurst 2 MB
EOF

echo "Starting tor."
tor -f /etc/tor/torrc
