# Additions to .profile

Few useful things to add to the `~/.profile`:

```shell
EDITOR=mcedit
export EDITOR

PATH="$PATH:/usr/local/go/bin"
export PATH

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1=${PS1%?}"\[\033[33m\]\$(parse_git_branch)\[\033[00m\] "
export PS1
```
