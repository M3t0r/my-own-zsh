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
