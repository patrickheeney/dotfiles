#!/usr/bin/env bash

#
# Install
#
# Usage: ./install/brew-ruby.sh
#

[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source ../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source functions.sh

brew_install_asdf_plugin_version ruby $ASDF_RUBY_VERSION
