#!bash

BLUE="\[\e[0;34m\]"
RED="\[\e[0;31m\]"
LIGHT_RED="\[\e[1;31m\]"
GREEN="\[\e[0;32m\]"
LIGHT_GREEN="\[\e[1;32m\]"
WHITE="\[\e[1;37m\]"
LIGHT_GRAY="\[\e[0;37m\]"
CYAN="\[\e[0;36m\]"
LIGHT_CYAN="\[\e[1;36m\]"
END_COLOR="\[\e[0m\]"

case $TERM in
  xterm*)
  TITLEBAR='\[\e]0;\u@\h:\w\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
esac

# Git stuff
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

PS1="${TITLEBAR}$BLUE[$CYAN\A$BLUE]$BLUE[$GREEN\u@\h:$CYAN\w$RED\$(__git_ps1)$BLUE]$LIGHT_GRAY\$ $END_COLOR"
#PS2='> '
#PS4='+ '

