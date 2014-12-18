# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="michaelrecachinas1"
#"robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/usr/texbin:/Users/michaelrecachinas/.rvm/bin

source ~/.nvm/nvm.sh

cdls(){
if [[ -z "$1" ]]; then 
    cd && ls
else
    cd "$*" && ls
fi
}
alias cd=cdls

alias battery='~/battery.sh'
alias sshgalileo='ssh mgr3yp@galileo.phys.virginia.edu -Y'
alias sftpgalileo='sftp mgr3yp@galileo.phys.virginia.edu'
alias plato='ssh mgr3yp@plato.cs.virginia.edu'
alias g++11='g++ -W -Wall -Wextra -Weffc++ -pedantic -std=c++0x'

export CIL="/usr/local/src/cil"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:/usr/local/smlnj/bin"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

###begin-jump-bash_profile
#
# Installation:
#
# jump >> ~/.bash_profile && source ~/.bash_profile
#

function jump {
  local si="$IFS";
  IFS=$'\n';
  local newDir=$(JUMPPROFILE=1 command jump "$@");
  cd "$newDir";
  IFS="$si";
}
alias j="jump -a"

###end-jump-bash_profile

alias hs="http-server"
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi=vim
alias cool=~/Development/cool
alias subl='nocorrect subl'
alias imessage="./Development/message.sh"
alias cook1="ssh -Y mgr3yp@cook1.cs.virginia.edu"
alias cook2="ssh -Y mgr3yp@cook2.cs.virginia.edu"
alias cook3="ssh -Y mgr3yp@cook3.cs.virginia.edu"
export PATH=/Users/michaelrecachinas1/pebble-dev/PebbleSDK-current/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_20`
export PATH="/Applications/Julia-0.3.3.app/Contents/Resources/julia/bin:$PATH"

# OPAM configuration
. /Users/michaelrecachinas1/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
