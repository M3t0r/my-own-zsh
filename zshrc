#!/bin/zsh
[[ $DEBUG ]] && echo my-own-zsh DEBUG MODE

conffiles=($ZCONFDIR/*.zsh)
conffiles+=($ZCONFDIR/interactive-only/*.zsh)

# expand and sort all found configfiles
e_conffiles=()
for conf in $conffiles; do
    baseconf=$(basename "$conf")
    e_conffiles+=("$baseconf:$conf")
done

e_conffiles=(
    $(echo $e_conffiles | sort)
)

conffiles=()
for conf in $e_conffiles; do
    conffiles+=("${conf#*:}")
done

for conf in $conffiles; do
    [[ $DEBUG ]] && echo Loading $conf
    source $conf
done;

unset baseconf
unset e_conffiles
