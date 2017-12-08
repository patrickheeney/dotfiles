#!/usr/bin/env bash

# TODO:
# Improve boostrap: https://github.com/necolas/dotfiles/blob/master/bin/dotfiles

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
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
  log "Running xcode license..."
  sudo xcodebuild -license
else
  log "Installing xcode tools..."
  xcode-select --install
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
# Clone the repo
#
git clone git@github.com:patrickheeney/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

#
# Fix permissions
#
echo "Fixing permissions..."
chmod +x install.sh
chmod +x backup.sh
chmod -R +x install/
chmod -R +x backup/
chmod -R +x bin/

#
# Run the installer
#
#bash install.sh

#
# We made it!
#
log ""
log ""
log "Done!"
