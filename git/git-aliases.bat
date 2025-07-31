@echo off

:: begin
git config --global alias.cl clone
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cm "commit -m"
git config --global alias.st status
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"
git config --global alias.sync "remote update --prune"
git config --global alias.mkbr "checkout -b"
git config --global alias.rmbr "branch --delete"
git config --global alias.track "checkout --track"
git config --global alias.amd "commit --amend --no-edit --date=now"
git config --global alias.amm "commit --amend -m"
git config --global alias.rpo "remote prune origin"
git config --global alias.rpu "remote prune upstream"
git config --global alias.rmrb "push origin --delete"
git config --global alias.rmrt "push origin --delete"
git config --global alias.lsr "ls-remote"
:: end

:: to list git aliases
git config --global alias.alias "!git --no-pager config --get-regexp ^"^^alias\.^""
git config --global alias.la "!git --no-pager config --get-regexp ^"^^alias\.^""

:: special
git config --global alias.setghname "config user.name ^"Ivan Pizhenko^""
git config --global alias.setghuser "config user.name ^"Ivan Pizhenko^""
git config --global alias.setghemail "config user.email ^"IvanPizhenko@users.noreply.github.com^""
:: end special

:: Site settings
git config --global credential.https://github.com.useHttpPath true
git config --global credential.https://gitlab.com.useHttpPath true
git config --global credential.https://bitbucket.org.useHttpPath true

:: END

