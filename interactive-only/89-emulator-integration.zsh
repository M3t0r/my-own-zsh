default TITLE_PROMPT "%~"

typeset -gi __prompt_osc133_command_started=0

typeset -g __prompt_cwd_host=${(%):-%m}

prompt_url_encode_path() {
    emulate -L zsh -o no_multibyte

    local input=$1
    local encoded="" byte
    local i

    for (( i = 1; i <= ${#input}; ++i )); do
        byte=$input[i]
        case $byte in
            [[:alnum:].~_/-])
                encoded+=$byte
                ;;
            *)
                printf -v byte '%%%02X' "'$byte"
                encoded+=$byte
                ;;
        esac
    done

    print -r -- "$encoded"
}

prompt_report_cwd() {
    local encoded_pwd
    encoded_pwd=$(prompt_url_encode_path "$PWD")
    print -rn -- $'\e]7;file://'"$__prompt_cwd_host$encoded_pwd"$'\e\\'
}

prompt_to_title () {
    print -Pn "\e]2;$TITLE_PROMPT:q\a" # set window name
    print -Pn "\e]1;$TITLE_PROMPT:q\a" # set tab name
}

prompt_preexec() {
    print -rn -- $'\e]133;C\e\\'
    __prompt_osc133_command_started=1
}

prompt_precmd() {
    local cmd_status=$?

    if (( __prompt_osc133_command_started )); then
        print -rn -- $'\e]133;D;'$cmd_status$'\e\\'
        __prompt_osc133_command_started=0
    fi

    prompt_to_title
    print -rn -- $'\e]133;A\e\\'
}

case "${TERM}:${TERM_PROGRAM}" in
cygwin:*|xterm*:*|putty*:*|rxvt*:*|ansi:*|kitty*:*|*:iTerm.app|*:Alacritty|*:ghostty)
    add-zsh-hook chpwd prompt_report_cwd
    add-zsh-hook preexec prompt_preexec
    add-zsh-hook precmd prompt_precmd
    ;;
esac
