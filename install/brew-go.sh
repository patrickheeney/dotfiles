#!/usr/bin/env bash

#
# Install
#
# Don't use homebrew due to issues:
# https://github.com/sdkman/sdkman-cli/issues/266
# http://www.ascent.io/blog/2014/03/11/gvm-with-golang/
#
# Usage: ./install/brew-go.sh
#

# dependencies
brew install mercurial bzr

# Install GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# Install versions
#gvm install go1.2
#gvm use go1.2 --default
