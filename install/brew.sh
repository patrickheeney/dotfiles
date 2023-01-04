#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew.sh
#

source ../config.versions.sh
source brew-functions.sh

# Ask for the administrator password upfront.
sudo -v

# Turn off analytics
brew analytics off

# Make sure we're using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Some taps 0 depreciated
#brew tap homebrew/dupes
#brew tap homebrew/versions

# System and apps
./brew-system.sh
./brew-apps.sh

# Programming
./brew-node.sh
./brew-php.sh
./brew-python.sh
./brew-go.sh
./brew-ruby.sh

# Database
./brew-mysql.sh
#./brew-docker.sh
./brew-redis.sh

# Remove outdated versions from the cellar
brew cleanup --force

# Fix anything?
brew doctor
brew cleanup
brew autoremove