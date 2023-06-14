#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-node.sh
#

[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source ../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source functions.sh

# Install keys
# bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# Install node dependencies
brew install gpg

# Install nodejs LTS
export NODEJS_CHECK_SIGNATURES=no
brew_install_asdf_plugin_version nodejs $ASDF_NODE_VERSION

# Yarn
# brew_install_asdf_plugin_version yarn $ASDF_YARN_VERSION
# corepack enable
# corepack prepare yarn@stable --activate

# Reload to detect new paths
# source "$HOME/.bash_profile"
source "$HOME/.zshrc"

# bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
# if [ $(id -u) -eq "0" ]; then
#     npm config set user 0
#     npm config set unsafe-perm true
# fi

# install latest yarn and npm
#npm install --silent -g yarn@latest npm@latest
#npm install --silent -g npm@latest

# Fix npm symlinks for updating
# https://github.com/yasinuslu/dotfiles/blob/master/src/install_asdf.sh
brew_install_asdf_node_fix_npm
