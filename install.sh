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
chmod +x install-dotfiles.sh
chmod +x install-homebrew.sh

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
else
  log "Updating homebrew"
  brew cleanup --force
  brew update
  brew upgrade
  log "Finished updating homebrew"
fi

#
# Run the homebrew script
#
log "Running homebrew script"
$DIR/install-homebrew.sh

#
# Check if Git is installed
#
log "Checking for git"
if ! has_program "git"; then
  log "Installing Git"
  brew install git
fi

#
# Check if node is installed
#
log "Checking for node"
if ! has_program "node"; then
  log "Installing Node"
  brew install node
fi

#
# NPM
#
#log "Checking for npm"
#if ! has_program "npm"; then
#  log "Updating npm"
#  npm install -g npm@latest
#fi

#
# Bower
#
log "Checking for bower"
if ! has_program "bower"; then
  log "Installing Bower"
  npm install -g bower
fi

#
# Grunt
#
log "Checking for grunt"
if ! has_program "grunt"; then
  log "Installing Grunt"
  npm install -g grunt-cli
fi

#
# Gulp
#
log "Checking for gulp"
if ! has_program "gulp"; then
  log "Installing Gulp"
  npm install -g gulp
fi

#
# Update NPM
#
log "Updating global npm"
npm cache clean
# https://github.com/npm/npm/issues/6247
# npm update -g
for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
do
  npm -g install "$package"
done

#
# Install dotfiles
#
if [[ ! -f ~/.bash_functions ]]; then
  log "Installing dotfiles"
  #git clone git@github.com:patrickheeney/dotfiles.git ~/dotfiles
  ~/dotfiles/install-dotfiles.sh
fi

#
# We made it!
#
log ""
log ""
log "Done!"
