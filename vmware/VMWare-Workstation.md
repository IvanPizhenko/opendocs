# VMWare Workstation Pro Specific Topics

## Migration to VMWare from VirtualBox

See support article:[Importing Virtual Machine from Oracle VirtualBox to VMware Fusion, Workstation, 
or Player][1]

## General Guidance

See support article [Install VMware Tools in VMware products][6].

## Ubuntu

1. Install VMWare tools. Open VMWare tools are preferred. More information at [Overview of VMware Tools][2] and [VMware support for open-vm-tools][3].

   ```shell
   # For Desktop
   sudo apt install -y open-vm-tools-desktop

   # For Server
   sudo apt install -y open-vm-tools
   ```

2. For proprietary VMWare Tools, see [Install VMware Tools in VMware products][4].

## FreeBSD

You can refer to the ["Chapter 24 - Virtualization" in the FreeBSD handbook](https://docs.freebsd.org/en/books/handbook/virtualization/).

1. Install VMWare tools. Open VMWare tools are preferred. More information at [Overview of VMware Tools][2] and [VMware support for Open VM Tools on FreeBSD][5].

   ```shell
   # For Desktop
   sudo pkg install -y xf86-video-vmware xf86-input-vmmouse open-vm-tools
   echo "fusefs_enable=\"YES\"" | sudo tee -a /etc/rc.conf
   echo "vmware_guestd_enable=\"YES\"" | sudo tee -a /etc/rc.conf
   sudo kldload fusefs
   sudo service vmware-guestd start

   # For Server
   sudo pkg install -y open-vm-tools-nox11
   echo "fusefs_enable=\"YES\"" | sudo tee -a /etc/rc.conf
   echo "vmware_guestd_enable=\"YES\"" | sudo tee -a /etc/rc.conf
   sudo kldload fusefs
   sudo service vmware-guestd start

   # Additional config (common)
   echo "" | sudo tee -a /etc/fstab
   echo "# procs"| sudo tee -a /etc/fstab
   echo "proc    /proc           procfs          rw      0       0" | sudo tee -a /etc/fstab
   ```

## OpenIndiana (Solaris-like)

Refer to [Installing VMware Tools in a Solaris virtual machine][7].

[1]: https://knowledge.broadcom.com/external/article/341189/importing-virtual-machine-from-oracle-vi.html
[2]: https://knowledge.broadcom.com/external/article?articleNumber=315382
[3]: https://knowledge.broadcom.com/external/article?articleNumber=313456
[4]: https://knowledge.broadcom.com/external/article/315363
[5]: https://knowledge.broadcom.com/external/article/342627/vmware-support-for-open-vm-tools-on-free.html
[6]: https://knowledge.broadcom.com/external/article?legacyId=1014294
[7]: https://knowledge.broadcom.com/external/article/328233
