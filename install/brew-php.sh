#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-php.sh
#

# Install PHP
brew install php56
brew install mcrypt
brew install php56-mcrypt
brew install composer

#
# Start stuff
#

# start php56 at login
#ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

# load php56 now
#launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
