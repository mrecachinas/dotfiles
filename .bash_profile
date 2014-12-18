[[ -s "/Users/michaelrecachinas/.rvm/scripts/rvm" ]] && source "/Users/michaelrecachinas/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

##
# Your previous /Users/michaelrecachinas/.bash_profile file was backed up as /Users/michaelrecachinas/.bash_profile.macports-saved_2012-08-30_at_12:25:52
##

# MacPorts Installer addition on 2012-08-30_at_12:25:52: adding an appropriate PATH variable for use with MacPorts.=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# export PATH ="$PATH:$HOME/yagarto/yagarto-4.7.2/bin"
# export PATH="$PATH:$HOME/yagarto/yagarto-4.7.2/tools"

# added by Anaconda 1.6.1 installer="/Users/michaelrecachinas1/anaconda/bin:$PATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR='subl -w'
="$PATH:/usr/local/smlnj/bin"

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
# Initialization for FDK command line tools.Thu Jul 10 20:20:41 2014
FDK_EXE="/Users/michaelrecachinas1/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/michaelrecachinas1/bin/FDK/Tools/osx"
export PATH
export FDK_EXE
