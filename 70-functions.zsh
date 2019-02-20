if [[ -d "${ZCONFDIR}/functions" ]]; then
    fpath=($fpath "${ZCONFDIR}/functions")
    autoload $(ls "${ZCONFDIR}/functions") #automatically add functions defined there
fi

if [[ -d "${HOME}/.zsh-functions" ]]; then
    fpath=("${HOME}/.zsh-functions" $fpath)
fi

e() {
    if [[ $EDITOR == "subl -w" ]] {
        subl $@
    } else {
        e $@
    }
}

se() {
    sudo -e $@
}

eblock() {
    $EDITOR $@
}

config() {
    e $ZCONFDIR/{70-functions,71-aliases}.zsh
    e -w ~/.zshrc
    reload
}

reload() {
    source ~/.zshrc
}

links() {
    grep -o -P "<a[^<>]+href=\"[^\"]+\"[^<>]*>" | grep -o -P "http[^\"]+"
}

clipboard () {
    xclip -selection c
}

default() {
    [[ -n $(typeset -m "$1") ]] && return 0 # $1 already exists
    typeset -g $1="$2"
    return 1
}

list_make_targets() {
    make -pRrq : 2>/dev/null | \
    awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($1 !~ "^[#.]") {print $1}}' | \
    sort
}

watch() {
    while [ 1 ]; do
        clear;
        echo -e $fg[magenta]$(date "+%H:%M:%S")$fg[default]: $fg[blue]$@$fg[default];
        $@;
        # funktioniert nich...
        # if [ "x$?" != "x0" ]; then
        #     echo -e $BIRed"Error: $Red'$Blue$@$Red' exited with $BIRed$?"
        #     break;
        # fi;
        sleep 2;
    done
}

pipenv() {
    LC_ALL=en_GB.UTF-8 command pipenv $@
}
