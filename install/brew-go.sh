#!/usr/bin/env bash

#
# Install Go
#
# Usage: ./install/brew-go.sh
#

[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source ../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source functions.sh

brew_install_asdf_plugin_version golang $ASDF_GO_VERSION
