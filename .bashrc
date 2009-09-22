if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

evince () {
    if [ -f $1 ] ; then
        evince $1 &
    fi
}

# --------------------
# Colors
# ----------------------
NONE="\[\e[0m\]"    # unsets color to term's fg color

# regular colors
K="\[\e[0;30m\]"    # black
R="\[\e[0;31m\]"    # red
G="\[\e[0;32m\]"    # green
Y="\[\e[0;33m\]"    # yellow
B="\[\e[0;34m\]"    # blue
M="\[\e[0;35m\]"    # magenta
C="\[\e[0;36m\]"    # cyan
W="\[\e[0;37m\]"    # white

# empahsized (bolded) colors
EMK="\[\e[1;30m\]"
EMR="\[\e[1;31m\]"
EMG="\[\e[1;32m\]"
EMY="\[\e[1;33m\]"
EMB="\[\e[1;34m\]"
EMM="\[\e[1;35m\]"
EMC="\[\e[1;36m\]"
EMW="\[\e[1;37m\]"

BGK="\[\e[40m\]"
BGR="\[\e[41m\]"
BGG="\[\e[42m\]"
BGY="\[\e[43m\]"
BGB="\[\e[44m\]"
BGM="\[\e[45m\]"
BGC="\[\e[46m\]"
BGW="\[\e[47m\]"

# Root/User Term Color Distinction
UC=$W                       # user's color
[ $UID -eq "0" ] && UC=$R   # root's color

# man pages
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode                 
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box                              
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

# --------------------
# Alias
# --------------------
alias x='exit'
alias ls='ls -h --color=tty --group-directories-first'
alias l='ls'
alias grep='grep --color'
alias mkdir='mkdir -p'
alias vi='vim'
alias ping='ping -c 5'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias pacman="sudo pacman"
alias su='su -'
alias du="du -h"
alias df="df -h"

export PATH=/usr/local/bin:$PATH

#--------------------
# History
#-------------------
export HISTIGNORE="&:[ ]*:ls:cd:clear:exit"
export HISTCONTROL="ignoreboth"
export HISTFILESIZE=250

#--------------------
# Prompt
#-------------------
PS1="[${UC}\u@\h \W${NONE}]\$ "

case "$TERM" in
    xterm*|*rxvt*)
        PROMPT_COMMAND='echo -ne "\e]0;${PWD/$HOME/~}\007"'
        ;;
    *)
        ;;
esac
