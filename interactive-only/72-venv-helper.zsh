
lazy_load_path=$(command which virtualenvwrapper_lazy.sh 2>/dev/null)
if [[ $lazy_load_path != "" ]]; then
    venv_path="$HOME/.venv/"
    export WORKON_HOME=$venv_path
    export PROJECT_HOME=~/Projekte/

    source $lazy_load_path

    venv_name() {
        name=$(pwd)
        if [[ $# > 0 ]]; then
            # if we got an argument, use that as the name
            name=$1
        fi

        name=$(echo $name | iconv -t US-ASCII -f UTF8-MAC -c)

        if [[ $name =~ "^$HOME.*" ]]; then
            # if $name starts with $HOME, remove $HOME
            name=$(echo $name | sed "s#$HOME/##")
        fi

        echo $name
        return 0
    }

    is_venv() {
        if [[ $# < 1 ]]; then
            # if we got no argument, we exit
            return 1
        fi
        name=$1

        return $(test -f $WORKON_HOME/$name/bin/activate)
    }

    vl () {
        name=$(venv_name $@)

        if is_venv $name; then
            workon "$name"
        elif [[ $name =~ "^\.|/\$" ]]; then
            echo Could not recusevly find a virtualenv
            return 1
        else
            vl $(dirname $name)
        fi
    }

    vul() {
        deactivate
    }

    vrm() {
        if [[ $VIRTUAL_ENV == "" ]]; then
            echo "No active virtualenv found."
            return
        fi
        venv=$VIRTUAL_ENV
        deactivate
        rm -rf $venv
        echo "Deleted $venv"
    }

    vc() {
        mkvirtualenv -a "$(pwd)" $@ $(venv_name)
    }

    #vl () {
    #    name=$(venv_name $@)
    #
    #    if [[ ! -d $venv_path$name ]]; then
    #        echo could not find venv $name in $venv_path >&2
    #        return 1
    #    fi
    #
    #    source $venv_path/$name/bin/activate
    #}
    #
    #vul() {
    #    deactivate
    #}
    #
    #vc() {
    #    name=$(venv_name $@)
    #
    #    virtualenv $@ $venv_path/$name
    #}
fi
