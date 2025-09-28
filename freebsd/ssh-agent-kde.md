# Proper setup of ssh-agent in KDE

1. Create directories

   ```shell
   mkdir -p "$HOME/.config/autostart"
   mkdir -p "$HOME/.config/old-autostart-scripts"
   ```

2. Create `$HOME/.config/autostart/ssh-agent.desktop` from template (change `/home/user/` to your actual home directory).

3. Create  `$HOME/.config/old-autostart-scripts/ssh-agent.sh` using provided file.

4. Fix permissions:

   ```shell
   chmod +x "$HOME/.config/old-autostart-scripts/ssh-agent.sh"
   ```

5. Add to .shrc and .bashrc

   ```shell
   if [ -f "$HOME/.ssh-agent.env" ]; then
     . "$HOME/.ssh-agent.env" >/dev/null
   fi
   ```
6. To get immediate effect, run following commands in the current shell:

   ```shell
   "$HOME/.config/old-autostart-scripts/ssh-agent.sh"
   . "$HOME/.ssh-agent.env"
   ```
