e() {
    if [[ $EDITOR == "subl -w" ]] {
        subl $@
    } else {
        e $@
    }
}

eblock() {
    $EDITOR $@
}

config() {
    e $ZSH_CUSTOM/{aliases,functions}.zsh
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

pcp() {
    if [[ $# -lt 2 ]] {
        echo "Usage: pcp FILE... DESTINATION"
        return
    }

    if [[ $# -gt 2 ]] {
        until [[ $# == 1 ]] {
            echo $1
            pcp "$1" "$@[$#]"
            shift 1
        }
    } else {
        dst=$@[$#] # letzter parameter ($@ ist 1-indiziert)
        if [[ -d "$dst" ]] {
            dst="$dst/$(basename $1)"
        }
        if [[ -d $1 ]] {
            echo "could not copy \"$1\" as it is a directory" 1>&2
            return
            # TODO: rekursiv directorys kopieren
        }
        pv -pe "$1" > "$dst"
    }
}

mkproject() {
    if [[ $# == 0 ]] {
        echo "Usage: mkproject <name> [<path>]"
        return
    }

    p_name=$1
    p_path=$p_name

    if [[ $# > 1 ]] {
        p_path=$2
    }

    mkdir -p $p_path
    if [[ $? != 0 ]] {
        return
    }

    cd $p_path

    # add git repo
    git init

    cat > .gitignore <<- EOGITIGNORE
__pycache__/
*.py[cod]

*.so.*
*.so
a.out
*.o
*.a
*.dylib
*.out
*.obj

*.class
*.war
*.jar

*.log

*.sass-cache

# automatic backups
*~

# netbeans
nbproject/private/
build/
nbbuild/
dist/
nbdist/
nbactions.xml
nb-configuration.xml

*.sublime-project
*.sublime-workspace


# mac
.DS_Store
._*
.Spotlight-V100
.Trashes

Thumbs.db

EOGITIGNORE
    
    echo "{ \"folders\":[{\"follow_symlinks\": true, \"path\": \".\"}]}" > $p_name.sublime-project

    git add *.sublime-project .gitignore

}
