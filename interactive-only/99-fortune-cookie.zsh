# some wisdom
if [[ "x$(which fortune 2> /dev/null)" != "x" ]] {
    echo; fortune -a; echo
}
