# http://zsh.sourceforge.net/Doc/Release/Options.html#index-APPEND_005fHISTORY
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-INC_005fAPPEND_005fHISTORY
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-SHARE_005fHISTORY

setopt appendhistory

# from prezto/modules/history/init.zsh
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.

HISTFILE=~/.zsh_histfile
SAVEHIST=25000 # number of commands saved in $HISTFILE
HISTSIZE=$SAVEHIST # number of commands available in the shell
