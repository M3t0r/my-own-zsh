export LANG="C.UTF-8"

[[ $(command which nano 2> /dev/null) ]] && export EDITOR="nano"
[[ $(command which vim 2> /dev/null) ]] && export EDITOR="vim"
[[ $(command which subl 2> /dev/null) ]] && export EDITOR="subl -w"
[[ $(command which subl3 2> /dev/null) ]] && export EDITOR="subl3 -w"
export VISUAL=$EDITOR
