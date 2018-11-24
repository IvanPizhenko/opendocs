# Xubuntu Installation
I recommend to use Xbuntu. This is one of officially suppoted Ubuntu distributions,
that use XFCE graphical desktop. This desktop system is more ligheight than GNOME
and Unity, that comes with normal Ubuntum therefore it will take less resources
and provide you more room to work on your VM.

Use my general online instructon [here](https://github.com/ivanp2015/opendocs/blob/master/Ubuntu_VM_Installation.md){target="_blank"}
But STOP at the step saying: "Install WINS support". I.e. do all steps before it, but do not continue.

# Install Some Useful Software

1. Open terminal (left-upper conrner menu -> Terminal Emulator)

2. Install a bit more of useful software
```shell
sudo apt install vim mc
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code
```
This will install:
- VIM editor - popular console-mode editor, usefuk for quick edits
- Midnight Commander - console-mode file manages, similar to Far on Windows
- Visual Studio Code - advanced text editor for programmers from Microsoft


# INSTALL ViDES

1. Open terminal (left-upper conrner menu -> Terminal Emulator) (or continue to use terminal opened for previous actions).

2. Install necessary build tools and Python packages:
```
sudo apt install build-essential gfortran mpich libmpich-dev libopenblas-dev python-pip python-dev python-tk
sudo -H pip install --upgrade pip
sudo -H pip install numpy pandas scipy matplotlib mpi4py
```
Note: installation will take some time, you may need to wait.

3. Download ViDES archive and unpack it:

```shell
cd ~/Downloads
wget http://www.nanotcad.com/vides/hidden/pyViDES.tgz
tar -xvzf pyViDES.tgz
```

4. Compile and install ViDES

```shell
cd ~/Downloads/pyViDES/src
sed -i 's/-lgoto2/-lblas/g' Makefile
sed -i 's/-lgoto2/-lblas/g' Makefile.form
python configure.py
make GOTOBLAS=1
sudo make GOTOBLAS=1 install
```

5. Download sample code and run it:

```shell
cd ~/Downloads
wget http://vides.nanotcad.com/vides/wp-content/uploads/2017/03/idvgs_silicene.zip
unzip idvgs_silicene.zip
python idvgs_silicene.py
```

**Note:** 
Unfortunately it doesn't work. There's some error in its Python script.
I am getting this:
```text
Traceback (most recent call last):
  File "idvgs_silicene.py", line 9, in <module>
    Silicene=graphene(15.5);
  File "/usr/lib/python2.7/NanoTCAD_ViDES.py", line 672, in __init__
    self.E=zeros(NEmax);
TypeError: 'float' object cannot be interpreted as an index
```

I have tried to edit NanoTCAD_ViDES.py and changed
```text
NEmax=5e3
```
into
```text
NEmax=5000
```
but after this I've got new error:
```text
Traceback (most recent call last):
  File "idvgs_silicene.py", line 21, in <module>
    grid=grid2D(xg,Silicene.y,Silicene.x,Silicene.y);
  File "/usr/lib/python2.7/NanoTCAD_ViDES.py", line 1633, in __init__
    x=unique(concatenate((uxC,xg),1));
numpy.core._internal.AxisError: axis 1 is out of bounds for array of dimension 1

```
which I believe require significanly deeper understanding of code to fix it.

I only can recommend to contact NanoTCAD directly to obtain working version.
Contact info is [here](http://vides.nanotcad.com/vides/contact-us){target="_blank"}.

6. Install IDE:
```
cd ~/Downloads
wget http://vides.nanotcad.com/vides/vIDEs/vIDEs
chmod 0755 vIDEs
sudo mv -f vIDEs /usr/bin
```

Now you should be able to run IDE from any directory just by typing
```shell
vIDEs &
```

Note that IDE is quite outdated, when it starts, it says in terminal:
```text
Last Modified 29 Aug 2013
```
