#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-python.sh
#

[ -z "$INCLUDE_VERSIONS_SOURCE" ] && source ../config.versions.sh
[ -z "$INCLUDE_FUNCTIONS_SOURCE" ] && source functions.sh

brew_install_asdf_plugin_version python $ASDF_PYTHON_VERSION

# Reload to detect new paths
# source "$HOME/.bash_profile"
source "$HOME/.zshrc"

# https://stackoverflow.com/questions/16460313/pip-could-not-find-an-activated-virtualenv-required
export PIP_REQUIRE_VIRTUALENV=false

# Update system pip and setuptools
python -m pip install -U pip setuptools wheel

# Install virtual env
python -m pip install virtualenv
asdf reshim python

# Reset var
export PIP_REQUIRE_VIRTUALENV=true
