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
default THEME_CLASSIC_SHOW_KUBE_INFO true

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
default THEME_CLASSIC_KUBE_SYM  $fg_bold[blue]
default THEME_CLASSIC_KUBE_PAR  $fg_no_bold[default]
default THEME_CLASSIC_KUBE      $fg_no_bold[yellow]
default THEME_CLASSIC_PROMPT    $fg_no_bold[default]

# set up ready to use
C_USER="%{$THEME_CLASSIC_USER%}"
C_UH_SEP="%{$THEME_CLASSIC_UH_SEP%}"
C_HOST="%{$THEME_CLASSIC_HOST%}"
C_HP_SEP="%{$THEME_CLASSIC_HP_SEP%}"
C_PATH="%{$THEME_CLASSIC_PATH%}"
C_PB_SEP="%{$THEME_CLASSIC_PB_SEP%}"
C_BRANCH="%{$THEME_CLASSIC_BRANCH%}"
C_KUBE_SYM="%{$THEME_CLASSIC_KUBE_SYM%}"
C_KUBE_PAR="%{$THEME_CLASSIC_KUBE_PAR%}"
C_KUBE="%{$THEME_CLASSIC_KUBE%}"
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

if $THEME_CLASSIC_SHOW_GIT_INFO && which git > /dev/null 2>&1; then
    GIT_INFO="\$(git_prompt_info)"

    function git_prompt_info() {
        if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
            echo -en "$C_PB_SEP:$C_BRANCH"
            git rev-parse --abbrev-ref HEAD 2> /dev/null
        fi
    }
else
    GIT_INFO=""
fi

if $THEME_CLASSIC_SHOW_KUBE_INFO && which kubectl > /dev/null 2>&1; then
    KUBE_INFO="\$(kube_prompt_info)"

    __kube_context_cache=""
    __kube_config_mtime=0
    function kube_prompt_info() {
        # calling kubectl everytime is noticeably slow, cache it instead
        mtime=$(zstat +mtime -F %s ${KUBECONFIG:-~/.kube/config} 2>/dev/null)
        if [ "$mtime" -gt "$__kube_config_mtime" ]; then
            __kube_context_cache=$(kubectl config current-context 2>/dev/null)
            __kube_config_mtime=$mtime
        fi
        unset mtime
        if [ -n "$__kube_context_cache" ]; then
            # \Uf10fe is part of nerd fonts
            echo -en "$C_KUBE_PAR($C_KUBE_SYM\Uf10fe$C_KUBE $__kube_context_cache$C_KUBE_PAR)"
        fi
    }
else
    KUBE_INFO=""
fi

# the fun stuff
PROMPT="$C_USER%n$HOST_TEXT$C_HP_SEP:$C_PATH%$THEME_CLASSIC_MAX_PATH_SEGMENTS~$GIT_INFO$KUBE_INFO$C_PROMPT$ "
TITLE_PROMPT="%n$TITLE_HOST_TEXT:%$THEME_CLASSIC_MAX_PATH_SEGMENTS_TITLE~"


# and clean up temporary variables
unset C_USER
unset C_UH_SEP
unset C_HOST
unset C_HP_SEP
unset C_PATH
# variables used in *_info functions have to remain
unset C_PROMPT
