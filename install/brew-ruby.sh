#!/usr/bin/env bash

#
# Install
#
# Usage: ./install/brew-ruby.sh
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source $DIR/../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source $DIR/functions.sh

echo "Install ruby $ASDF_RUBY_VERSION"
brew_install_asdf_plugin_version ruby $ASDF_RUBY_VERSION

# https://github.com/asdf-vm/asdf/issues/770#issuecomment-669938759
# asdf global ruby $ASDF_RUBY_VERSION

echo "Install bundler"
gem install bundler
