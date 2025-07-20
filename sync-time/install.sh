#!/usr/bin/env bash
set -eo pipefail

# See https://stackoverflow.com/a/246128/1540501
_s="${BASH_SOURCE[0]}"
while [[ -L "${_s}" ]]
do
  _script_dir=$( cd -P "$( dirname "${_s}" )" >/dev/null 2>&1 && pwd )
  _s=$(readlink "${_s}")
  [[ "${_s}" != /* ]] && _s="${_script_dir}/${_s}"
done
_script_dir=$( cd -P "$( dirname "${_s}" )" >/dev/null 2>&1 && pwd )

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as superuser." >&2
  exit 1
fi

cp -f "${_script_dir}/sync-time" /usr/local/bin/
chmod 4755 /usr/local/bin/sync-time

echo "sync-time installed."
