#!/usr/bin/env bash
set -eo pipefail

git config --global credential.https://github.com.useHttpPath true
git config --global credential.https://gitlab.com.useHttpPath true
git config --global credential.https://bitbucket.org.useHttpPath true
