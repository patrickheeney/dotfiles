#!/usr/bin/env bash

#
# Boostrap Script
#
# Usage:
#
# chmod +x bootstrap.sh
# ./bootstrap.sh
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
log "Starting bootstrap..."

#
# Install developer tools
#
if [ ! $(xcode-select -p) ]; then
  log "Installing xcode tools..."
  xcode select --install
else
  log "Xcode already installed"
fi

#
# Check if Homebrew is installed
#
log "Checking for homebrew"
if ! has_program "brew"; then
  log "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  log "Finished installing homebrew"
fi

#
# Install git
#
if ! has_program "git"; then
  log "Installing git..."
  brew install git
  log "Finished installing git"
fi

#
# Clone the repo and run installer
#
git clone git@github.com:patrickheeney/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
chmod +x install.sh
chmod +x backup.sh
bash install.sh

#
# We made it!
#
log ""
log ""
log "Done!"
