```shell
pkg install sudo sshguard git mercurial mc 
pkg install kde5 sddm xorg drm-kmod vlc firefox thunderbird keepass
pkg install vscode kdiff3 kdevelop
```

Full `/etc/rc.conf`
```ini
clear_tmp_enable="YES"
syslogd_flags="-ss"
hostname="artbsd"
ifconfig_re0="DHCP"
sshd_enable="YES"
moused_enable="YES"
ntpdate_enable="YES"
powerd_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="AUTO"
zfs_enable="YES"
```

Added stuff:
```ini
sshguard_enable="YES"
dbus_enable="YES"
sddm_enable="YES"
xrdp_enable="YES"
xrdp_sesman_enable="YES"
# for intel, something different for radeon
kld_list="i915kms"
jail_sysvipc_allow="YES"
```

In `/boot/loader.conf`:
```
kern.ipc.semmni=40
kern.ipc.semmns=300
```

