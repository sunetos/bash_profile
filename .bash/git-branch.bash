#!bash

# Most of this file based on http://railstips.org/blog/archives/2009/02/02/bedazzle-your-bash-prompt-with-git-info/
BLUE="\[\033[0;34m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Inspired by http://pastie.org/325104
function show_git_branch {
  git_branch=$(parse_git_branch)
  if [ ! -z "$git_branch" ]; then
    if git_mod=$(git status | grep 'added to commit' 2> /dev/null); then
      echo -e "\033[0;31m($git_branch*)" # RED
    else
      echo -e "\033[0;32m($git_branch)"  # GREEN
    fi
  else
    echo ""
  fi
}

function proml {
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE[$CYAN\$(date +%H:%M)$BLUE]\
$BLUE[$CYAN\u@\h:\w\$(show_git_branch)$BLUE]\
$LIGHT_GRAY\$ $LIGHT_GRAY"
PS2='> '
PS4='+ '
}
proml
