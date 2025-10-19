# Fixing Network

```shell
cc fix-network.c -o fix-network
sudo cp -f fix-network /usr/local/bin/
rm fix-network
sudo chmod u+s /usr/local/bin/fix-network
sudo cp -f fix-network.sh /usr/local/bin
sudo chmod 0755 /usr/local/bin/fix-network.sh
```

Then, on each KDE start, run it:

```shell
fix-network
```

For that, you can place `fix-network.desktop` into `$HOME/.config/autostart`.
