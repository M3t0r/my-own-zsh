kernel=$(uname -s)
typeset OSMac OSBSD OSLinux OSUnkown # set defaults
case $kernel in
	"Darwin") typeset OSMac="true" OSBSD="true";;
	"Linux") typeset OSLinux="true";;
	*[Bb][Ss][Dd]*) typeset OSBSD="true";;
	*) typeset OSUnkown="true";; # if nothing matched
esac
unset kernel
