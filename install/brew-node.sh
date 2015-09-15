#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-node.sh
#

# Install nvm
brew install nvm

# Install node stable
nvm install stable

# Set the default to stable
nvm alias default stable

# Install npm
npm install -g npm@latest

# Install npm tools
#npm install -g grunt-cli
npm install -g gulp
npm install -g bower

# NVM install
mkdir ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/
