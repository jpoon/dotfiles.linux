# ----------------------
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

# background colors
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

# -------------------
# Alias
# --------------------
alias ls='ls -h --color=tty --group-directories-first'
alias grep='grep --color'
alias mkdir='mkdir -p'
alias vi='vim'
alias ping='ping -c 5'
alias sudo="sudo -k"
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
export HISTIGNORE="ls:cd:clear:exit"
export HISTCONTROL="ignoreboth"

PS1="[${UC}\u@\h \W${NONE}]\$ "

case "$TERM" in
    xterm*)
        PROMPT_COMMAND='echo -ne "\e]0;xterm : ${PWD/$HOME/~}\007"'
        ;;
    *)
        ;;
esac
