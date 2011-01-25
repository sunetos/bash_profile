# Homebrew stuff
PATH=$PATH:/usr/local/sbin

# Python stuff
export WORKON_HOME=~/Documents/Dev/virtenvs
source /usr/local/bin/virtualenvwrapper.sh

# Git stuff
GIT_PS1_SHOWDIRTYSTATE=1 #... untagged(*) and staged(+) changes
GIT_PS1_SHOWSTASHSTATE=1 #... if something is stashed($)
GIT_PS1_SHOWUNTRACKEDFILES=1 #... untracked files(%)

source ~/.bash/*.bash

# UCSD stuff
workon ion

cd ~/Documents/Dev/code/ioncore-python
