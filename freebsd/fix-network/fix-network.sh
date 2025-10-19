#!/bin/sh

EFF_UID=$(id -u)

if [ ${EFF_UID} -ne 0 ]; then
  echo "This script must be run as root or via sudo." >&2
  exit 1
fi

echo "********** BEFORE: **********"
host google.com
echo "*****************************"

INTF=em0

echo "Shutting down $INTF"
ifconfig "$INTF" down

echo "Waiting..."
sleep 2

echo "Brining up $INTF"
ifconfig "$INTF" up

echo "********** AFTER: **********"
host google.com
echo "****************************"

echo "Done."
