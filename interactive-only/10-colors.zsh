# offer $fg[colorname], see http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Descriptions
autoload -U colors && colors

# sets LS_COLORS for use in coloring completions
LS_COLORS="# Specifies the color used for normal (nonfilename) text. 
NORMAL 38;5;248
# Specifies the color used for a regular file. 
FILE 38;5;255
# Specifies the color used for directories. 
DIR 34
# Specifies the color used for a symbolic link. 
LINK 36
# Specifies the color used for an orphaned symbolic link (one which points to a nonexistent file). If this is unspecified, ls will use the LINK color instead. 
ORPHAN 31
# Specifies the color used for a missing file (a nonexistent file which nevertheless has a symbolic link pointing to it). If this is unspecified, ls will use the FILE color instead. 
MISSING 31
# Specifies the color used for a FIFO (named pipe). 
FIFO 40;35
# Specifies the color used for a socket. 
SOCK 40;35
# (Supported since fileutils 4.1) Specifies the color used for a door (Solaris 2.5 and later). 
DOOR 40;35
# Specifies the color used for a block device special file. 
BLK 40;35
# Specifies the color used for a character device special file. 
CHR 40;35
# Specifies the color used for a file with the executable attribute set. 
EXEC 32"
source <(dircolors <(echo $LS_COLORS))

export LESS_TERMCAP_me=$reset_color         # no blink, bold or underline
export LESS_TERMCAP_se=$reset_color         # stop standout (inverse colors)
export LESS_TERMCAP_ue=$reset_color         # stop underline
export LESS_TERMCAP_mb=$fg[red]             # start blink
export LESS_TERMCAP_md=$fg[blue]            # start bold
export LESS_TERMCAP_us=$fg_bold[default]    # start underline
export LESS_TERMCAP_so=$fg[black]$bg[white] # start standout (inverse colors)


#http://en.wikipedia.org/wiki/ANSI_escape_code#Colors