[[ -n $OSLinux ]] && alias ls="ls -h --color=auto"
[[ -n $OSMac ]] && alias ls="ls -h -G"
alias l="ls"
alias ll="l -l"
alias la="ll -a"

alias journal="journalctl -e"

alias g='git'
#alias ga='git add'
#alias gb='git branch'
#alias gba='git branch -a'
alias gmaster='git checkout master'
alias gm='git commit -v -m'
#alias gl='git pull'
alias gp='git push'
alias gs='git status'
# http://fredkschott.com/post/2014/02/git-log-is-so-2005/
alias glg='git log --graph --format="%Cred%h %Cblue%>>(16)%ar %Creset%<($(echo $(tput cols) - 36 | bc),trunc)%s %Cgreen%>>(6,trunc)%cn"'
alias glog='LC_ALL="en_US.UTF-8" git log --all --oneline --graph --topo-order "--pretty=format:%x09%C(yellow)%h%Creset %m %s%Cgreen%d%Creset <%C(bold blue)%an%Creset, %C(bold black)%aI%Creset>"'
#alias gsd='git svn dcommit'
#alias gsr='git svn rebase'
#alias gs='git stash'
#alias gsa='git stash apply'
alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias grm='git rm'
alias ghub='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

alias ipython="ipython --classic --pprint"

alias pudb="python3 -m pudb.run"

alias hexdump="hexdump -C"
alias hex="hexdump"
