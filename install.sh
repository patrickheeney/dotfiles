#!/usr/bin/env bash

#
# Install Script
# 
# Usage: 
# 
# git clone git@github.com:patrickheeney/dotfiles.git ~/dotfiles
# cd ~/dotfiles
# chmod +x install.sh
# ./install.sh
#

set -e
#set -x

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Print a message to the console.
log() { printf "$*\n" ; return $? ; }

# Print an error message to the console and bail out of the script.
fail() { log "\nERROR: $*\n" ; exit 1 ; }

# Print 0, success if the program is installed, 1, error if it is not
# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
has_program() {
  type "$1" > /dev/null 2>&1
  return $?
}

#
# Start
#
log "Starting script..."

#
# Fix permissions
#
log "Fixing permissions"
chmod -R +x install/

#
# Install developer tools
#
if [ ! $(xcode-select -p) ]; then
  log "Installing xcode tools"
  xcode select --install
else
  log "Xcode already installed"
fi

#
# Check if Homebrew is installed, update if it is, install if its not
#
log "Checking for homebrew"
if ! has_program "brew"; then
  log "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #log "Please install homebrew: http://brew.sh/"
  #exit 1
  log "Finished installing homebrew"
fi

#
# Install osx config
#
log "Running osx script"
$DIR/install/osx.sh

#
# Install dotfiles
#
log "Installing dotfiles"
$DIR/install/dotfiles.sh

#
# Install python
#
log "Installing python"
$DIR/install/python.sh

#
# Install homebrew
#
log "Installing homebrew files"
$DIR/install/homebrew.sh

#
# We made it!
#
log ""
log ""
log "Done!"
