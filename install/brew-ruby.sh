#!/usr/bin/env bash

#
# Install
#
# Usage: ./install/brew-ruby.sh
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source $DIR/../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source $DIR/functions.sh

# https://dev.to/yasuhiron777/install-2x-3x-version-of-ruby-via-rbenv-on-m1-mac-3okn
# https://github.com/openssl/openssl/issues/18720
brew install openssl@1.1
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Reload to detect new paths
# source "$HOME/.bash_profile"
# source "$HOME/.zsh_profile"

echo "Install ruby $ASDF_RUBY_VERSION"
brew_install_asdf_plugin_version ruby $ASDF_RUBY_VERSION

# https://github.com/asdf-vm/asdf/issues/770#issuecomment-669938759
# asdf global ruby $ASDF_RUBY_VERSION

echo "Install bundler"
gem install bundler
