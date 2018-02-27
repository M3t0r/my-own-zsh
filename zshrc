#!/bin/zsh
[[ $DEBUG ]] && echo my-own-zsh DEBUG MODE

conffiles=($ZCONFDIR/*.zsh)
conffiles+=($ZCONFDIR/interactive-only/*.zsh)

# expand and sort all found configfiles
IFS=$(echo) # only split on newline
e_conffiles=$(for l in $(realpath $conffiles); do echo $(basename $l)$l; done | sort)

conffiles=()
echo $e_conffiles | while read -r -d / && read -r file; do conffiles+="/"$file; done

for conf in $conffiles; do
    unset IFS
    [[ $DEBUG ]] && echo Loading $conf
    source $conf
done;

unset e_conffiles
unset IFS
