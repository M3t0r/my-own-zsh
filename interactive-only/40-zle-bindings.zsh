bindkey -e # emacs keyboard config

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "$fg[red]......$fg[default]"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots

# http://stackoverflow.com/a/970202
insert-sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo

bindkey "^I" expand-or-complete-with-dots
bindkey "^[s" insert-sudo

bindkey "^$terminfo[kcul1]" backward-word
bindkey "^$terminfo[kcur1]"  forward-word