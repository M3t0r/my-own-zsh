bindkey -e # emacs keyboard config

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "$fg[red]......$fg[default]"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots # [tab], replaces default complete with tab

# http://stackoverflow.com/a/970202
insert-sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo
bindkey "^[s" insert-sudo # [alt]-s

bindkey "^$terminfo[kcul1]" backward-word
bindkey "^$terminfo[kcur1]"  forward-word
bindkey '^[[1;5C' forward-word # [ctrl]+[right]
bindkey '^[[1;5D' backward-word # [ctrl]+[right]

# from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/key-bindings.zsh#L59
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# from https://github.com/mika/zsh-pony#edit-command-line-in-editor
autoload edit-command-line && zle -N edit-command-line
bindkey '\ee' edit-command-line # [esc]-e

# include https://github.com/zsh-users/zsh-autosuggestions
load_plugin zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# load syntax-highlighting
load_plugin fast-syntax-highlighting

