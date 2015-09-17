#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew.sh
#

# Ask for the administrator password upfront.
sudo -v

# Make sure we're using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Some taps
brew tap homebrew/dupes
brew tap homebrew/versions

# Run installers
./brew-system.sh
./brew-apps.sh
./brew-php.sh
./brew-node.sh
./brew-python.sh
#./brew-go.sh
#./brew-ruby.sh

# Remove outdated versions from the cellar
brew cleanup --force

# Fix anything?
brew doctor
brew prune
