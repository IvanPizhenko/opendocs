#!/bin/bash
set -eo pipefail

# More information:
# https://gcore.com/learning/what-is-shared-folder-vmware-linux

echo "Checking permissions..."
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root or using sudo." >&2
  exit 1
fi

echo "Mounting VMSHARE..."
vmhgfs-fuse .host:/vmshare /vmshare -o allow_other

echo "VMSHARE mounted."
