kernel=$(uname -s)
typeset OSMac OSBSD OSLinux OSUnkown # set defaults
[[ $kernel == "Darwin" ]] 			&& typeset OSMac="true" OSBSD="true" || \
[[ $kernel == "Linux" ]]  			&& typeset OSLinux="true" || \
[[ $kernel =~ .*[Bb][Ss][Dd].* ]] 	&& typeset OSBSD="true" || \
typeset OSUnkown="true" # if nothing matched
unset kernel
