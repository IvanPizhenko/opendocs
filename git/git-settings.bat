@echo off

:: Site setting
git config --global credential.https://github.com.useHttpPath true
git config --global credential.https://gitlab.com.useHttpPath true
git config --global credential.https://bitbucket.org.useHttpPath true

:: Store credentials
:: git config --global credential.helper store

:: Store credential with git-credentials-manager
git config --global credential.helper manager

:: end
