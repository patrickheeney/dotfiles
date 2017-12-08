#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-php.sh
#

# Add some taps
brew tap josegonzalez/homebrew-php

# Install
# https://github.com/wilmoore/php-version#alternatives
brew install php-version

# Install php dependencies
brew install libxml2
brew install mcrypt

# Install php software
#brew install php56
#brew install php56-mcrypt
#brew install composer
brew install php71
brew install php71-mcrypt

# Pick versions
php-version 7

#
# Start stuff
#

# start php56 at login
#ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

# load php56 now
#launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
