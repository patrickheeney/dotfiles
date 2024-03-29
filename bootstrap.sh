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

# // Homrebrew should install this
#
# Install developer tools
#
# if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}"; then
#   log "Running xcode license..."
#   log "If it fails, try checking for software updates, or, opening xcode to install required components and manually accept license"
#   sudo xcodebuild -license accept
# else
#   log "Installing xcode tools..."
#   xcode-select --install
# fi

#
# Check if Homebrew is installed
#
log "Checking for homebrew"
if ! has_program "brew"; then
  log "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  log "Finished installing homebrew"
  log "Setup shell..."
  echo 'eval "$(`which brew` shellenv)"' >> $HOME/.zprofile
  eval "$(`which brew` shellenv)"
  log "Turning off homebrew analytics..."
  brew analytics off
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
if [[ ! -d "$HOME/dotfiles" ]]; then
  #git clone git@github.com:patrickheeney/dotfiles.git $HOME/dotfiles
  git clone https://github.com/patrickheeney/dotfiles.git "$HOME/dotfiles"
fi

#
# Fix permissions
#
echo "Fixing permissions..."
cd "$HOME/dotfiles"
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
