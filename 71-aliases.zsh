[[ -n $OSLinux ]] && alias ls="ls -Fh --color=auto"
[[ -n $OSMac ]] && alias ls="ls -Fh -G"
alias l="ls"
alias ll="l -l"
alias la="ll -a"

alias pudb="python3 -m pudb.run"

alias hexdump="hexdump -C"
alias hex="hexdump"

alias s=tmux-sessionizer

alias kc="kubie ctx"
alias kn="kubie ns"
