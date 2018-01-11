Ubuntu VM Installation
======================

Below I have described  procedure of installation of Ubuntu VM based on the
Xubuntu flavor suitable for the small Java, C\#, C++ development, like you need
to do. Although looking a bit huge, the entire procedure should take you just
2-3 hours (unlike installation of Windows and related developer tools like
Visual Studio, which may get day or two with application of all updates).
I recommend using exactly *Xubuntu* because it is based on XFCE which is 
more lighweight than Unity, Gnome or KDE, i.e. generally works faster. 
Alternatively you can use *Lubuntu* (based on LXDE), but my personal preference
among these two is Xubuntu.

\#1 Download Xubuntu 16.04.3 LTS image from
here http://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/16.04/release/xubuntu-16.04.3-desktop-amd64.iso

\#2 Make sure you have most recent VirtualBox (check latest version on the https://www.virtualbox.org).

If not, download and install latest one.

After that start VirtualBox GUI and let it install or update virtual box extensions.

\#3 Create new VM parameters:

 choose Os Type Linux, Distribution Ubuntu 64-bit

-   create new disk, disk type VDI, dynamic, size 40 GB

\#4 After that tune VM:

-   Memory 4 GB

-   Number of CPU 2

-   Enable PAE/NX

-   Video memory - 128MB (maximum)

-   Drives: inject XUbuntu 16.04.3 ISO image which you downloaded before into CD
    drive

-   Shared clipboard: bidirections

-   Shared drag and drop: bidirectional

\#5 Next steps - software installation:

-   Start VM click on the icon on the bottom of black screen

-   Choose language - English

-   Choose Install Xubuntu, it will boot into installer

-   In the installer again choose English

-   Check both boxes "Download uppdates" and "Install 3rd party software"

-   When asked for disk layout choose "something else"

-   Create new partition table

-   Add swap are of 4096 in the End of free space

-   Add ext4 partition mounted at / for the rest free space

-   Proceed with Next, confirm to format drive

-   Choose your location by clicking on the map (I assume Copehagen)

-   On the next screen, Name machine Create user:

    -   user real name user1

    -   user name user1

    -   password user1

    -   machine name xubuntu1604

-   Wait until setup finishes. Click reboot. It may hang on the reboot this
    time, just choose Machine-\>Rest from machines's VirtualBox menu

-   After reboot login as user1

-   Open Menu-\>Settings-\>Software and Updated (Menu is small white-on-blue
    mouse in the top-left corner of the screen)

    -   on the tab "Ubuntu Software" check Sources

    -   on the tab Other Software check Canonical Partners and  Canonical
        Partners (source code)

    -   on the tab updates:

        -   Automatically check for updates - never

        -   Notify me about new Ubuntu version - never

    -   Click close and also click close on the next popup

-   Open Menu-\> System-\>Terminal

-   supply following commands (it may be asking for password, enter password for
    user1)

    -   sudo apt-get update

    -   sudo apt-get install -y dkms build-essential

    -   sudo apt-get dist-upgrade -y

    -   ... this will take some time

    -   sudo reboot

-   after reboot login again

-   In the VirtualBox VM menu choose Devices-\>Insert Guest Additions CD image

-   Wait for CD mounted - OS will popup File Browser

-   Open teminal, supply following commands:

    -   sudo apt-get autoremove -y

    -   cd /media/user1/VBOX... (according to current version)

    -   sudo ./VBoxLinuxAdditions.run

    -   .. this will take some time

    -   sudo usermod -a -G vboxsf user1 (very important: please note -G is
        CAPITAL!!!!!)

    -   eject

    -   sudo reboot

    -   After this shared clipboard and VM screen adoption to your screen will
        start to work

-   After reboot: login. Open teminal, supply following commands:

    -   Install useful utilities and development tools:

        -   sudo apt-get install -y gedit kate konsole kdevelop vim mc
            p7zip-full ctags git cvs subversion mercurial perl python tcl ruby
            clang-3.8 winbind libnss-winbind monodevelop

        -   Edit file /etc/nsswitch.conf:

            -   sudo nano  /etc/nsswitch.conf

            -   Find line hosts, add "wins" after "files", so finally it looks
                like this

                -   hosts: files wins mdns4_minimal [NOTFOUND=return] dns

            -   press Ctrl+O, hit Enter, this will write file

            -   press Ctrl+X, you will exit editor

-   Install Oracle JDK 8

    -   sudo add-apt-repository ppa:webupd8team/java (will ask to add PGP key do
        it)

    -   sudo apt-get update

    -   sudo apt-get install oracle-java8-installer (this one will ask to accept
        Oracle Binary Code license, you will hav to do it in order to install
        Oracle JDK)

- Install latest version on Mono framework according to instructions for Ubuntu 16.04 provided here http://www.mono-project.com/download/#download-lin

- Optionally install Visual Studio Code using instructions provided here https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions
