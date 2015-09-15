#!/usr/bin/env bash

#
# Install Script
#
# Usage:
#
# chmod +x install.sh
# ./install.sh
#

set -e
#set -x

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# Fix permissions
#
echo "Fixing permissions..."
chmod -R +x install/
chmod -R +x backup/

#
# Run installers
#
echo "Installing osx..."
$DIR/install/osx.sh

echo "Installing dotfiles..."
$DIR/install/dotfiles.sh

echo "Installing launchd..."
$DIR/install/launchd.sh

echo "Installing homebrew files"
$DIR/install/brew.sh
