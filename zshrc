#!/bin/zsh
[[ $DEBUG ]] && echo my-own-zsh DEBUG MODE

conffiles=($ZCONFDIR/*.zsh)
conffiles+=($ZCONFDIR/interactive-only/*.zsh)

# expand and sort all found configfiles
e_conffiles=$(for l in $(realpath -s $conffiles); do echo $(basename -z $l)$l; done | sort -V)

conffiles=()
echo $e_conffiles | while read -r -d / && read -r file; do conffiles+="/"$file; done

for conf in $conffiles; do
	[[ $DEBUG ]] && echo Loading $conf
	source $conf;
done;

unset e_conffiles
