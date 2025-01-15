@echo off

::begin
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"
git config --global alias.sync "remote update --prune"
git config --global alias.mkbr "checkout -b"
git config --global alias.rmbr "branch --delete"
git config --global alias.track "checkout --track"
git config --global alias.amd "commit --amend --no-edit --date=now"
git config --global alias.am "commit --amend -m"
git config --global alias.fpush "push -f"
git config --global alias.rpo "remote prune origin"
git config --global alias.rpu "remote prune upstream"
git config --global alias.rmrb "push origin --delete"
git config --global alias.rmrt "push origin --delete"
::end
