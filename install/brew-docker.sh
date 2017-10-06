#!/usr/bin/env bash

#
# Install docker
# https://medium.com/@TomKeur/install-docker-on-mac-os-x-10-11-x-794c4153dc62
# http://jgsqware.github.io/2015/11/docker-install-osx/
#
# Usage: ./install/brew-docker.sh
#

brew install docker
brew install docker-machine
brew install docker-compose
#brew install docker-toolbox

# virtual already installed from brew-apps.sh
# brew cask install virtualbox

# Create a new Virtual machine for Boot2Docker
docker-machine create --driver=virtualbox dev

# Connect docker client and Docker Engine to the new created virtual Machine
docker-machine env dev

# Configure your shell to use the new created Virtual Machine
# eval $(docker-machine env dev)

# Get the IP adres from the machine:
# docker-machine ip dev
