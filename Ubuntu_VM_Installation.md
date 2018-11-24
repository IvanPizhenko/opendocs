# Ubuntu VM Installation

Below is description of installation procedure of Ubuntu VM based on the
Xubuntu flavor suitable for the small Java, C\#, C++ development, like you may
need to do.

Although looking a bit huge, the entire procedure should take you
just 2-3 hours (unlike installation of Windows and related developer tools like
Visual Studio, which may get day or two with application of all updates).

I recommend using exactly *Xubuntu* because it is based on XFCE which is
more lighweight than Unity, Gnome or KDE, i.e. generally works faster.
Alternatively you can use *Lubuntu* (based on LXDE), but my personal preference
among these two is exactly *Xubuntu*.

1. Download Xubuntu 16.04.4 LTS image from here: [Xubuntu 16.04.5 AMD 64 ISO IMAGE](http://nl.archive.ubuntu.com/ubuntu-cdimage-xubuntu/releases/16.04/release/xubuntu-16.04.5-desktop-amd64.iso)
2. Download and install latest stable VirtualBox (check latest version on the
   [VirtualBox Webiste](https://www.virtualbox.org).
3. Start VirtualBox GUI and let it install or update VirtualBox extensions.
4. Create new VM parameters:
    - choose OS Type: Linux, Distribution: Ubuntu 64-bit
    - create new disk, disk type VDI, dynamic, size 40 GB.
5. Tune VM options:
    - Memory 4-6 GB.
    - Number of CPU 2.
    - Enable PAE/NX.
    - Video memory - 128MB (maximum).
    - Shared clipboard: bidirections
    - Shared drag and drop: bidirectional
    - Drives: inject previously downloaded XUbuntu 16.04 ISO image, which
      you've downloaded, before into virtual CD drive.
6. Install OS:
    - Start VM
    - Click on the icon on the bottom of black screen.
    - Choose language - English.
    - Choose Install Xubuntu, it will boot into installer.
    - In the installer again choose English.
    - Check both boxes "Download uppdates" and "Install 3rd party software".
    - When asked for disk layout choose "something else".
    - Create new partition table.
    - Add swap partition of size 4096 MB in the *End* of free space.
    - Add ext4 partition mounted at / for the rest free space.
    - Proceed with Next, confirm to write changes to drive.
    - Choose your location by clicking on the map.
    - On the next screen, Name machine
    - Create user:
        - user real name user1
        - user name user1
        - password user1
        - machine name xubuntu1604
    - Wait until setup finishes. Click reboot.
    - After reboot login as user1
    - Open Menu-\>Settings-\>Software and Updated (Menu is small white-on-blue
    mouse in the top-left corner of the screen)
        - On the tab "Ubuntu Software" check Sources
        - On the tab Other Software check Canonical Partners and  Canonical
          Partners (source code)
        - On the tab updates:
        - Automatically check for updates - never
        - Notify me about new Ubuntu version - never
        - Click close and also click close on the next popup
    - Open Menu-\> System-\>Terminal
    - Supply following commands (it may be asking for password, enter password for
    user1)
    ```shell
    sudo apt update
    sudo apt install dkms build-essential
    sudo apt upgrade
    sudo reboot
    ```
    - After reboot login again
    - In the VirtualBox VM menu choose Devices-\>Insert Guest Additions CD image
    - Wait for CD mounted - OS will popup File Browser
    - Open teminal, supply following commands:
    ```shell
    sudo apt-get autoremove -y
    cd /media/user1/VBox... (according to current version)
    sudo ./VBoxLinuxAdditions.run
    sudo usermod -a -G vboxsf user1
    cd ~
    eject
    sudo reboot
    ```
    - After this shared clipboard and VM screen adoption to your screen will
        start to work.
    - Install WINS support:
    ```shell
    sudo apt install winbind libnss-winbind
    ```
    - Enable WINS name resolution:
        - Run command:
        ```shell
        sudo nano /etc/nsswitch.conf
        ```
        - Find line hosts, add "wins" after "files", so finally it looks
            like this:
            ```text
            hosts: files wins mdns4_minimal [NOTFOUND=return] dns
            ```
        - Press Ctrl+O, hit Enter, this will write file
        - Press Ctrl+X, you will exit editor

7. Install development and other useful software:
    - After reboot: login, open teminal.
    - Install useful utilities and development tools:
    ```shell
    sudo apt install gedit kate konsole kdevelop vim mc \
        p7zip-full ctags git cvs subversion mercurial perl python tcl ruby \
        clang-3.8 monodevelop
    ```
    - Install Oracle JDK 8
    ```shell
    sudo add-apt-repository ppa:webupd8team/java
    ```
    (will ask to add PGP key - do it)
    ```shell
    sudo apt update
    sudo apt install oracle-java8-installer
    sudo apt install oracle-java8-set-default
    ```
    (will ask to accept Oracle Binary Code license, you have to do it in order to install Oracle JDK)
    - Install latest version on Mono framework according to instructions for Ubuntu 16.04 provided here http://www.mono-project.com/download/#download-lin
    - Optionally install Visual Studio Code using instructions provided here https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions
