#!/bin/sh

set -x

# Prerequisites:
# 1. install go
# 2. go get github.com/ericchiang/pup

cd "$HOME/Downloads"
if [ -e i915 ]; then
	mv -f i915 i915.save$(date +%S)
fi

mkdir i915
cd i915

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915
"$HOME/go/bin/pup" "a attr{href}" <i915 | grep .bin | grep plain | awk '{print "https://git.kernel.org" $0}' >download.list
for f in $(cat download.list); do
	wget "$f"
done

