#!/bin/sh
_need_csh=0

# setup for sh, bash, zsh, ksh
_e="$HOME/.ssh-agent.env"
if [ -f "$_e" ]; then rm -f "$_e" ; fi
_et="${_e}.tmp"
if [ -f "$_et" ]; then rm -f "$_et" ; fi
touch "$_et"
chmod 0600 "$_et"
ssh-agent -s >>"$_et"
mv -f "$_et" "$_e"

# set _need_csh=1 if you need setup for csh and tcsh
if [ $_need_csh = 0 ]; exit 0; fi

# setup for csh and tcsh
_ce="$HOME/.ssh-agent.csh.env"
_cet="${_ce}.tmp"
if [ -f "$_cet" ]; then rm -f "$_cet"; fi;
touch "$_cet"
chmod 0600 "$_cet"
. "$_e"
echo "set SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> "$_cet"
echo "set SSH_AGENT_PID=$SSH_AGENT_PID" >> "$_cet"
echo "echo Agent pid $SSH_AGENT_PID" >> "$_cet"
mv -f "$_cet" "$_ce"
