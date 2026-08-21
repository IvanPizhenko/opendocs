#!/bin/sh
set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as super user. Please use super user shell, sudo or doas."
    exit 1
fi

tdir=/usr/local/bin

echo "Creating $tdir directory"
install -d $tdir

for f in gitwip gitwip2 gitfix gitfix2; do
    echo "Installing $f into $tdir"
    install $f $tdir
done

echo "Done."
