#!/usr/bin/env bash

#
# Install
#
# Don't use homebrew because of issues.
# http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# https://github.com/rvm/rvm#installation
#
# Usage: ./install/brew-ruby.sh
#

# Remove documentation
echo "gem: --no-document" >> ~/.gemrc

# Install
curl -sSL https://get.rvm.io | bash -s stable --ignore-dotfiles --ruby --rails

# get versions
# rvm list rubies

# set default
# rvm use 2.2.0 --default