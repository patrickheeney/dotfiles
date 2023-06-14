#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-php.sh
#

[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source ../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source functions.sh

# ASDF is broken, use homebrew isntead
# ---

brew install php
brew install composer
composer global require laravel/valet
valet install
sudo valet trust

# create directories and setup
mkdir -R ~/Dev/sites
valet park

# install php monitor
brew tap nicoverbruggen/homebrew-cask
brew install --cask phpmon
