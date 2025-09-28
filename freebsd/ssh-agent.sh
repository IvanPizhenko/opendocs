#!/bin/sh
_e="$HOME/.ssh-agent.env"
if [ -f "$_e" ]; then rm -f "$_e" ; fi
ssh-agent -s >"$_e"
if [ -f "$_e" ]; then chmod 0600 "$_e" ; fi
