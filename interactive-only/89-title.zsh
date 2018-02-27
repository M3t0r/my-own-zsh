default TITLE_PROMPT "%~"

case "$TERM" in
cygwin|xterm*|putty*|rxvt*|ansi)
    prompt_to_title () {
        print -Pn "\e]2;$TITLE_PROMPT:q\a" # set window name
        print -Pn "\e]1;$TITLE_PROMPT:q\a" # set tab name
    }
    ;;
*)
    if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
        prompt_to_title () {
            print -Pn "\e]2;$TITLE_PROMPT:q\a" # set window name
            print -Pn "\e]1;$TITLE_PROMPT:q\a" # set tab name
        }
    else
        # Try to use terminfo to set the title
        # If the feature is available set title
        if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
            prompt_to_title () {
                echoti tsl
                print -Pn "$TITLE_PROMPT"
                echoti fsl
            }
        else
            prompt_to_title () {}
        fi
    fi
    ;;
esac

add-zsh-hook precmd prompt_to_title
