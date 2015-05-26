alias ls="ls -h --color=auto"
alias l="ls"
alias ll="l -l"
alias la="ll -a"

alias journal="journalctl -e"

#alias g='git'
#alias ga='git add'
#alias gb='git branch'
#alias gba='git branch -a'
#alias gc='git commit -v -m'
#alias gl='git pull'
#alias gp='git push'
alias gst='git status -sb'
# http://fredkschott.com/post/2014/02/git-log-is-so-2005/
alias glg='git log --graph --format="%Cred%h %Cblue%>>(16)%ar %Creset%<($(echo $(tput cols) - 36 | bc),trunc)%s %Cgreen%>>(6,trunc)%cn"'
#alias gsd='git svn dcommit'
#alias gsr='git svn rebase'
#alias gs='git stash'
#alias gsa='git stash apply'
#alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias grm='git rm'
alias ghub='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

alias pudb="python3 -m pudb.run"
