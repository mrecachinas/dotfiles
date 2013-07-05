# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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


export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
export NXJ_HOME=~/lejos_nxj
export DYLD_LIBRARY_PATH=$NXJ_HOME/bin
export PATH=$PATH:$JAVA_HOME/bin:$NXJ_HOME/bin
export UWHPSC=$HOME/Desktop/\[Coursera\]\ High\ Performance\ Scientific\ Computing/uwhpsc
# export PATH ="$PATH:$HOME/yagarto/yagarto-4.7.2/bin"
# export PATH="$PATH:$HOME/yagarto/yagarto-4.7.2/tools"

cdls(){
if [[ -z "$1" ]]; then 
    cd && ls
else
    cd "$*" && ls
fi
}
alias cd=cdls

#alias sublime='open -a Sublime\ Text\ 2'
alias sshgalileo='ssh mgr3yp@galileo.phys.virginia.edu -Y'
alias sftpgalileo='sftp mgr3yp@galileo.phys.virginia.edu'
alias plato='ssh mgr3yp@plato.cs.virginia.edu'
alias g++11='g++ -W -Wall -Wextra -Weffc++ -pedantic -std=c++0x'
alias aws='ssh -i ~/Desktop/\[Coursera\]\ Startup\ Engineering/hw1/startup-engineering-mike-stanford.pem ubuntu@ec2-54-218-18-121.us-west-2.compute.amazonaws.com'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
