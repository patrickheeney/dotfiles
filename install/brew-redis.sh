#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-php.sh
#

[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source ../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source functions.sh

brew_install_asdf_plugin_version redis $ASDF_REDIS_VERSION
