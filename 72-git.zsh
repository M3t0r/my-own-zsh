alias g='git'
function gb() { git fetch --quiet && git checkout "$@" && git pull --quiet --autostash; git status -sb; }
alias gmaster='gb master'
alias gmain='gb main'
alias gnew='git swtich -c'
alias gap="git add -p"
alias gp='git push'
alias gs='git status'
alias gput='git push --set-upstream origin HEAD'
# http://fredkschott.com/post/2014/02/git-log-is-so-2005/
#alias glg='git log --graph --format="%Cred%h %Cblue%>>(16)%ar %Creset%<($(echo $(tput cols) - 36 | bc),trunc)%s %Cgreen%>>(6,trunc)%cn"'
alias glg='git log --oneline --decorate --all --graph --simplify-by-decoration'
alias glog='LC_ALL="en_US.UTF-8" git log --all --oneline --graph --topo-order "--pretty=format:%x09%C(yellow)%h%Creset %m %s%Cgreen%d%Creset <%C(bold blue)%an%Creset, %C(bold black)%aI%Creset>"'
alias gd='git diff'
alias gdc="gd --cached"
alias gstaged="gdc"
alias gmv='git mv'
alias grm='git rm'
alias ghub='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

#alias gsd='git svn dcommit'
#alias gsr='git svn rebase'
#alias gs='git stash'
#alias gsa='git stash apply'
#alias gl='git pull'
#alias ga='git add'
#alias gb='git branch'
#alias gba='git branch -a'
