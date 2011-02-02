#!bash

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function gd2 { 
    echo branch \($1\) has these commits and \($2\) does not 
    git log $2..$1 --no-merges --format='%h | Author:%an | Date:%ad | %s' --date=local
}
function grin {
    git fetch origin $1
    gd2 FETCH_HEAD $(parse_git_branch)
}
function grout {
    git fetch origin $1
    gd2 $(parse_git_branch) FETCH_HEAD
}
