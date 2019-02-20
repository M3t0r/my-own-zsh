export LANG="C.UTF-8"

[[ $(command -v nano 2> /dev/null) ]] && export EDITOR="nano"
[[ $(command -v vim 2> /dev/null) ]] && export EDITOR="vim"
[[ $(command -v subl 2> /dev/null) && ! -n $SSH_CONNECTION ]] && export EDITOR="subl -w"
[[ $(command -v subl3 2> /dev/null) && ! -n $SSH_CONNECTION ]] && export EDITOR="subl3 -w"
export VISUAL=$EDITOR

export MDV_THEME="883.6584"
export MDV_CODE_THEME="883.6584"
