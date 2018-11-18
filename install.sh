#!/usr/bin/env bash


#######################################
# Set debug flags
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function set_debug {
  set -ex
}

#######################################
# Unset debug flags
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function unset_debug {
  set +ex
}


#######################################
# Cleanup any temporary files
#
# Globals:
#   None
# Arguments:
#   Any information pertinent to the error
# Returns:
#   None
#######################################
function cleanup {

}


#######################################
# Cleanup, print error, and exit with
# an error code
#
# Globals:
#   None
# Arguments:
#   Any information pertinent to the error
# Returns:
#   None
#######################################
function throw_error {
  cleanup
  echo "$@"
  exit 1
}

#######################################
# Get the current shell and binary path
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function check_DEFAULT_SHELL {
  DEFAULT_SHELL_PATH=$(finger $USER | grep -oP 'Shell: \K.*')
  DEFAULT_SHELL=$(echo $DEFAULT_SHELL_PATH | cut -d'/' -f3)
}


#######################################
# Check current environment for various
# versions, binaries, etc.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function check_for_basics {
  PYTHON_VERSION=$(python -V |& cut -d' ' -f2)
}


#######################################
# Clone mrecachinas' dotfiles git repo
# into $INSTALL_PATH/.dotfiles
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_repo {
  git clone https://github.com/mrecachinas/dotfiles.git $INSTALL_PATH/.dotfiles \
    || throw_error "Could not clone the repository to ${INSTALL_PATH}/.dotfiles"
}


#######################################
# Install Python Pip
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_pip {
  pipfile=/tmp/get-pip.py
  curl https://bootstrap.pypa.io/get-pip.py -o $pipfile
  python $pipfile --prefix=/usr/local/ --force-reinstall
  rm -f $pipfile
}


#######################################
# Install Python Pip modules
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_pip_modules {
  pip install --progress-bar=emoji --upgrade pip
  pip install --progress-bar=emoji -r $(pwd)/python/requirements.txt
  pip install --progress-bar=emoji -r $(pwd)/python/requirements-dev.txt
}


#######################################
# Install Homebrew
#
# Globals:
#   BREW_PATH
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_homebrew {
  brew_url=https://github.com/Homebrew/brew/tarball/master
  mkdir -p $BREW_PATH
  curl -L $brew_url | tar xz --strip 1 -C $BREW_PATH 
}


#######################################
# Install Homebrew packages
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_homebrew_packages {
  cat $(pwd)/homebrew/brewlist.txt | xargs brew install
}


#######################################
# Install Oh My Zsh
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_oh_my_zsh {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}


#######################################
# Install Node Version Manager (NVM)
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_nvm {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
}


#######################################
# Link the tmux.conf to ${INSTALL_PATH}
#
# Globals:
#   INSTALL_PATH
#   PYTHON_VERSION
#   BREW_PATH
#   DRY_RUN
#   VERBOSE
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_tmux_config {
  mkdir -p ${INSTALL_PATH}/.tmux
  [[ ! -f ${INSTALL_PATH}/.tmux/tmux.conf ]] && ln -s $(pwd)/tmux/tmux.conf "${INSTALL_PATH}/.tmux/tmux.conf"
}

#######################################
# Install *rc files to $INSTALL_PATH
#
# Globals:
#   INSTALL_PATH
#   PYTHON_VERSION
#   BREW_PATH
#   DRY_RUN
#   VERBOSE
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_rcs {
  check_DEFAULT_SHELL
  rcfile=$(pwd)/$DEFAULT_SHELL/"${DEFAULT_SHELL}rc"
  profile_file=$(pwd)/$DEFAULT_SHELL/"${DEFAULT_SHELL}_profile"
  editor_file=$(pwd)/vim/vimrc

  [[ -f $rcfile ]] && ln -s $rcfile "${INSTALL_PATH}/.${DEFAULT_SHELL}rc"
  [[ -f $profile_file ]] && ln -s $rcfile "${INSTALL_PATH}/.${DEFAULT_SHELL}_profile"
  [[ -f $editor_file ]] && ln -s $editor_file "${INSTALL_PATH}/.${editor_file}"

  [[ ! -f ${INSTALL_PATH}/.gitconfig ]] && ln -s $(pwd)/git/gitconfig "${INSTALL_PATH}/.gitconfig"
  [[ ! -f ${INSTALL_PATH}/.gitignore_global ]] && ln -s $(pwd)/git/gitignore_global "${INSTALL_PATH}/.gitignore_global"
}


#######################################
# Install basic utilities such as
#   - pip
#   - homebrew
#   - oh-my-zsh
#   - node version manager (nvm)
#
# Globals:
#   INSTALL_PATH
#   PYTHON_VERSION
#   BREW_PATH
#   DRY_RUN
#   VERBOSE
# Arguments:
#   None
# Returns:
#   None
#######################################
function install_basics {
  [[ $VERBOSE != 0 ]] && echo $PYTHON_VERSION $BREW_PATH $DRY_RUN

  # Install rcs
  install_rcs

  # Install Pip
  [[ ! $(command -v pip) ]] && install_pip

  # Python/Pip installs
  install_pip_modules

  # Install Oh-My-Zsh
  install_oh_my_zsh

  # Install Homebrew
  [[ ! $(command -v brew) ]] && install_homebrew

  # Homebrew installs
  install_homebrew_packages

  # Install NVM
  [[ ! $(command -v nvm) ]] && install_nvm
}


#######################################
# Set default global variables
#
# Globals:
#   INSTALL_PATH
#   PYTHON_VERSION
#   BREW_PATH
#   DRY_RUN
#   VERBOSE
# Arguments:
#   None
# Returns:
#   None
#######################################
function set_default {
  [[ -z $PYTHON_VERSION ]] && PYTHON_VERSION=2.7
  [[ -z $BREW_PATH ]] && BREW_PATH=/usr/local/homebrew
  [[ -z $VERBOSE ]] && VERBOSE=0
  [[ -z $DRY_RUN ]] && DRY_RUN=0
  [[ -z $INSTALL_PATH ]] && INSTALL_PATH=$HOME
}


#######################################
# Print a help string for this utility
# containing available arguments
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function print_help {
  echo "usage: $0 [--install-path=PATH|--python=VERSION|--brew-path=PATH|-v|-h|-d]"
  echo ""
  echo "    --install-path=PATH"
  echo "    --python=VERSION"
  echo "    --brew-path=PATH"
  echo "    -v/--VERBOSE"
  echo "    -h/--help"
  echo "    -d/--dry-run"
}


#######################################
# Parse arguments from CLI invokation
#
# Globals:
#   INSTALL_PATH
#   PYTHON_VERSION
#   BREW_PATH
#   DRY_RUN
#   VERBOSE
# Arguments:
#   None
# Returns:
#   None
#######################################
function parse_args {
  for i in "$@"; do
    case $i in
      --python=*)
          INSTALL_PATH="${i#*=}"
          shift
          ;;
      --python=*)
          PYTHON_VERSION="${i#*=}"
          shift
          ;;
      --brew-path=*)
          BREW_PATH="${i#*=}"
          shift
          ;;
      -v|--VERBOSE)
          VERBOSE=1
          shift
          ;;
      -h|--help)
          print_help
          exit 0
          ;;
      -d|--dry-run)
          DRY_RUN=1
          shift
          ;;
    esac
  done
}


#######################################
# Run setup for a new macOS environment
#
# Globals:
#   INSTALL_PATH
#   PYTHON_VERSION
#   BREW_PATH
#   DRY_RUN
#   VERBOSE
# Arguments:
#   None
# Returns:
#   None
#######################################
function setup {
  set_default

  parse_args "$@"

  [[ ! -z VERBOSE ]] && set_debug

  echo "INSTALL PATH    = ${INSTALL_PATH}"
  echo "PYTHON VERSION  = ${PYTHON_VERSION}"
  echo "HOMEBREW PATH   = ${BREW_PATH}"
  echo "VERBOSE         = ${VERBOSE}"

  [[ ! -d $INSTALL_PATH ]] && install_repo

  install_basics

  unset_debug
}

setup "$@"