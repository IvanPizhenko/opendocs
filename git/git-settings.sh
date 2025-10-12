#!/usr/bin/env bash
set -eo pipefail

# Popular cloud repos
git config --global credential.https://github.com.useHttpPath true
git config --global credential.https://gitlab.com.useHttpPath true
git config --global credential.https://bitbucket.org.useHttpPath true

# Azure
git config --global credential.https://dev.azure.com.useHttpPath true

# AWS CodeCommit
git config --global credential.https://git-codecommit.us-east-1.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.us-east-2.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.us-west-1.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.us-west-2.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-central-1.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-central-2.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-north-1.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-north-2.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-west-1.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-west-2.amazonaws.com.useHttpPath true
git config --global credential.https://git-codecommit.eu-west-3.amazonaws.com.useHttpPath true

# Store credentials
# git config --global credential.helper store

# Store credential with git-credentials-manager
git config --global credential.helper ~/.dotnet/tools/git-credential-manager
git config --global credential.credentialStore gpg

# END
