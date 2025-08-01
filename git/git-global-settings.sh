#!/usr/bin/env bash
set -eo pipefail

# Site settings
git config --global credential.https://github.com.useHttpPath true
git config --global credential.https://gitlab.com.useHttpPath true
git config --global credential.https://bitbucket.org.useHttpPath true

# Store credentials
git config --global credential.helper store

# END
