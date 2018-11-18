#!/usr/bin/env bash
###begin-jump-bash_profile
#
# Installation:
#
# jump >> ~/.bash_profile && source ~/.bash_profile
#

function jump() {
  local si="$IFS";
  IFS=$'\n';
  local newDir=$(JUMPPROFILE=1 command jump "$@");
  cd "$newDir";
  IFS="$si";
}
alias j="jump -a"

###end-jump-bash_profile

function cdls() {
    if [[ -z "$1" ]]; then 
        builtin cd && ls
    else
        builtin cd "$*" && ls
    fi
}

alias hs="python -m SimpleHTTPServer"

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi=vim

alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
alias g++11='g++ -W -Wall -Wextra -Weffc++ -pedantic -std=c++0x'