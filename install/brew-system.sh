#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-system.sh
#

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
#brew install vim --override-system-vi
brew install grep
brew install screen

# Install other useful binaries
brew install ack
brew install exiftools
brew install git
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install tree
brew install webkit2png
brew install unrar

# Mac backup
brew install mackup
