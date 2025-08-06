# VMWare Workstation Pro Specific Topics

## Migration to VMWare from VirtualBox

See support article:[Importing Virtual Machine from Oracle VirtualBox to VMware Fusion, Workstation, or Player][1]

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

1. Install VMWare tools. Open VMWare tools are preferred. More information at [Overview of VMware Tools][2] and [VMware support for open-vm-tools][3].

   ```shell
   # For Desktop
   sudo pkg install -y open-vm-tools
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
   ```

## Links

[1]: https://knowledge.broadcom.com/external/article/341189/importing-virtual-machine-from-oracle-vi.html
[2]: https://knowledge.broadcom.com/external/article?articleNumber=315382
[3]: https://knowledge.broadcom.com/external/article?articleNumber=313456
[4]: https://knowledge.broadcom.com/external/article/315363
