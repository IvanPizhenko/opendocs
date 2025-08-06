#!/bin/bash
set -eo pipefail

echo "Checking permissions..."
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root or using sudo." >&2
  exit 1
fi

# See https://stackoverflow.com/a/246128/1540501
_S="${BASH_SOURCE[0]}"
while [[ -L "${_S}" ]]; do
  _SCRIPT_DIR=$( cd -P "$( dirname "${_S}" )" >/dev/null 2>&1 && pwd )
  _S=$(readlink "${_S}")
  [[ "${_S}" != /* ]] && _S="${_SCRIPT_DIR}/${_S}"
done
_SCRIPT_DIR=$( cd -P "$( dirname "${_S}" )" >/dev/null 2>&1 && pwd )

for f in install-vmshare.sh; do
  echo "Installing $f"
  install -m 4755 "${_SCRIPT_DIR}/$f" "/usr/local/bin/$f"
done

echo "VMWare helper scripts installed."
