```shell
# if DNS doesn't work check /etc/resolv.conf
nameserver <your-gateway-ip-addr>

# If Relatek RTL8111
# /etc/rc.local
#!/bin/sh
ifconfig re0 down
ifconfig re0 up
# end of /etc/rc.local

# as root
# pkg is /usr/sbin/pkg
# show info:
pkg info --pkg-message <package-name>
pkg bootstrap
pkg install en-freebsd-doc bash zsh sudo sshguard git mercurial subversion mc vim nano gmake cmake
pkg install kde5 sddm xorg xrdp drm-kmod vlc firefox thunderbird chromium keepass
pkg install vscode kdiff3 kdevelop
pw usermod <user> -G video,wheel,operator

# on virtualbox
pkg install virtualbox-ose-additions
pw usermod <user> -G vboxsf

# In /etc/fstab
proc  /proc procfs rw 0 0

# Then
mount -t procfs proc /proc

# In /usr/local/etc/sudoers
# uncomment: %wheel ....

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

KDE: when logging in, avoid the Plasma (Wayland) … default that's presented by sddm – for Plasma, Wayland is not yet reliable.

No sound:

```shell
# add to
link cd0 cdrom
link cd0 dvd
link cd0 dvdr
link cd0 dvdrw
link cd0 cd
link cd0 cdr
link cd0 cdrw

perm cd0 0666
perm xpt0 0666
perm pass0 0666
perm pass1 066
perm pass2 0666
perm pass3 0666
perm pass4 0666
perm pass5 0666
perm da0 0666
perm da1 0666
perm da2 0666
perm da3 0666
perm da4 0666
perm dsp0.0 0666
perm dsp1.0 0666
perm dsp2.0 0666
perm dsp3.0 0666
perm dsp4.0 0666
perm dsp4.1 0666


cat /dev/sndstat

# Sample output:
Installed devices:
pcm0: <Intel Haswell (HDMI/DP 8ch)> (play)
pcm1: <Realtek ALC662 (Rear Analog)> (play/rec) default

# Then

# Sound
sudo sysctl dev.hdac.<N>.polling=1
sudo sysctl hw.snd.default_unit=<N>

# Don't automatically use new sound device
sudo sysctl hw.snd.default_auto=0

```

In Firefox `about:config`:
```
media.cubeb.backend=sndio
```


