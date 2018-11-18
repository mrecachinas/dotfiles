#!/usr/bin/env bash


#######################################
# Unlink and remove the repo
#
# TODO:
#   - Remove all that was installed
#
# Globals:
#   None
# Arguments:
#   Any information pertinent to the error
# Returns:
#   None
#######################################
function throw_error {
  echo "$@"
  exit 1
}
function uninstall {

}


uninstall "$@"