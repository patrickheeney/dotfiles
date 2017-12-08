#!/usr/bin/env bash

#
# Install tools using Homebrew
# https://gist.github.com/DanHerbert/9520689
#
# Usage: ./install/brew-node.sh
#

# Install nvm
brew install nvm

# NVM install
mkdir ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

# Install node stable
nvm install stable

# Set the default to stable
nvm alias default stable

# Install npm
npm install -g npm@latest

# Install yarn
brew install yarn
