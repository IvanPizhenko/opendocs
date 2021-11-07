#!/bin/sh

# Create missing with warnings from install of linux-firmware
# e.g. like:
# W: Possible missing firmware /lib/firmware/i915/skl_guc_49.0.1.bin for module i915
# Run as sudo

for m in $(cat missing | awk '{print $5}'); do
	echo "Fixing $m"
	f=$(basename $m)
	cp -f "i915/$f" "$m"
done
