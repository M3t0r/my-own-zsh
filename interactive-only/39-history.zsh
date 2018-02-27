# http://zsh.sourceforge.net/Doc/Release/Options.html#index-APPEND_005fHISTORY
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-INC_005fAPPEND_005fHISTORY
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-SHARE_005fHISTORY

setopt appendhistory

HISTFILE=~/.zsh_histfile
HISTSIZE=150 # number of commands available in the shell
SAVEHIST=5000 # number of commands saved in $HISTFILE
