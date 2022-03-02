#!/usr/bin/env bash

NICK=${NICKNAME:-$RANDOM}

echo "Using NICKNAME=${NICK}, OR_PORT=${OR_PORT}."

cat > /etc/tor/torrc << EOF
Nickname ${NICK}
ORPort ${OR_PORT}
ExitRelay 0
SocksPort 0
EOF

echo "Starting tor."
tor -f /etc/tor/torrc
