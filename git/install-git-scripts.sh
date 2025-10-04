#!/bin/sh
set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as super user. Please use sudo or doas."
    exit 1
fi

tdir=/usr/local/bin

echo "Creating $tdir directory"
install -d $tdir

for f in gitwip gitfix; do
    echo "Installing $f into $tdir"
    install $f $tdir
done

echo "Done."
