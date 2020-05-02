#!/usr/bin/env bash
#
NORDVPN=/usr/sbin/nordvpn
DEFAULT_OPT="best-udp"
DEFAULT_COUNTRY="Italy"

if [ ! -x $NORDVPN ]; then
    echo "Nordvpn file $NORDVPN is not executable... Exit"
    exit 1
fi

# first update the server list
$NORDVPN update-servers

if [ "$#" -ge 1 ]; then
    COUNTRY=$@
else
    COUNTRY=$DEFAULT_COUNTRY
fi

$NORDVPN $DEFAULT_OPT "$COUNTRY"

$NORDVPN restart

