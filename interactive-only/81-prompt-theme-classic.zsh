#
# CLASSIC, by M3t0r
#
# we could drop the host if it isn't a remote connection...
#

# show the hostname in the prompt on local sessions.
# it does show up if you ssh into a remote machine if set to false.
default THEME_CLASSIC_SHOW_LOCAL_HOST false

# how many segments of the path are to be shown
# see documentation for %~ at http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Shell-state
default THEME_CLASSIC_MAX_PATH_SEGMENTS 0
default THEME_CLASSIC_MAX_PATH_SEGMENTS_TITLE $THEME_CLASSIC_MAX_PATH_SEGMENTS

default THEME_CLASSIC_SHOW_GIT_INFO true

# set the default colors
if [ "$(id -u)" = "0" ]; then
    # color the name red if it's root
    default THEME_CLASSIC_USER      $fg[red]
else
    # else green
    default THEME_CLASSIC_USER      $fg[green]
fi

default THEME_CLASSIC_UH_SEP    $fg[default]
default THEME_CLASSIC_HOST      $fg[green]
default THEME_CLASSIC_HP_SEP    $fg[default]
default THEME_CLASSIC_PATH      $fg[blue]
default THEME_CLASSIC_PB_SEP    $fg[default]
default THEME_CLASSIC_BRANCH    $fg_bold[magenta]
default THEME_CLASSIC_PROMPT    $fg[default]

# set up ready to use
C_USER="%{$THEME_CLASSIC_USER%}"
C_UH_SEP="%{$THEME_CLASSIC_UH_SEP%}"
C_HOST="%{$THEME_CLASSIC_HOST%}"
C_HP_SEP="%{$THEME_CLASSIC_HP_SEP%}"
C_PATH="%{$THEME_CLASSIC_PATH%}"
C_PB_SEP="%{$THEME_CLASSIC_PB_SEP%}"
C_BRANCH="%{$THEME_CLASSIC_BRANCH%}"
C_PROMPT="%{$THEME_CLASSIC_PROMPT%}"


if [[ -n $SSH_CONNECTION ]] || $THEME_CLASSIC_SHOW_LOCAL_HOST; then
    # show host on remote connections
    HOST_TEXT="$C_UH_SEP@$C_HOST%m"
    TITLE_HOST_TEXT="@%m"
else
    # on local machines, just hide the host
    HOST_TEXT=""
    TITLE_HOST_TEXT=""
fi


# substitute the prompt string before printing, allowing to invoke functions
setopt PROMPT_SUBST

if $THEME_CLASSIC_SHOW_GIT_INFO && which git 2>&1 > /dev/null; then
    GIT_INFO="\$(git_prompt_info)"

    function git_prompt_info() {
        if git rev-parse --is-inside-work-tree 2>&1 > /dev/null; then
            echo -en "$C_PB_SEP:$C_BRANCH"
            git rev-parse --abbrev-ref HEAD
        fi
    }
else
    GIT_INFO=""
fi

# the fun stuff
PROMPT="$C_USER%n$HOST_TEXT$C_HP_SEP:$C_PATH%$THEME_CLASSIC_MAX_PATH_SEGMENTS~$GIT_INFO$C_PROMPT$ "
TITLE_PROMPT="%n$TITLE_HOST_TEXT:%$THEME_CLASSIC_MAX_PATH_SEGMENTS_TITLE~"


# and clean up temporary variables
unset C_USER
unset C_UH_SEP
unset C_HOST
unset C_HP_SEP
unset C_PATH
unset C_PROMPT
