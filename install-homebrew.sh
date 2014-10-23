#!/usr/local/bin/bash

# 
# Install tools using Homebrew
# 
# Usage: ./homebrew/install.sh
# 

# Clean things
brew cleanup --force

# Make sure we're using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Some taps
brew tap homebrew/dupes
brew tap homebrew/versions

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# install coreutils
# Install some other useful utilities like `sponge`
# install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
# install findutils
# Install GNU `sed`, overwriting the built-in `sed`
# install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
# install bash
# install bash-completion

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
# install vim --override-system-vi

# Install php 5.5
brew tap josegonzalez/homebrew-php
brew install php55
brew install mcrypt
brew install php55-mcrypt
brew install composer

# Install other useful binaries
# install ack
# install dos2unix
# install exiv2
brew install git
# install imagemagick
# install lynx
brew install node
# install pigz
# install rename
# install rhino
brew install tree
# install webkit2png
# install zopfli
# install lua52

# Remove outdated versions from the cellar
brew cleanup

# 
# Install native apps
# 

brew tap caskroom/cask
brew install brew-cask
# brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install adobe-creative-cloud
brew cask install adobe-reader
brew cask install alfred
brew cask install appcleaner
brew cask install arq
brew cask install calibre
brew cask install cleanmymac
brew cask install colloquy
brew cask install disk-drill
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install flowdock
brew cask install flux
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-drive
brew cask install google-hangouts
brew cask install iterm2
brew cask install keka
brew cask install mailplane
brew cask install moom
brew cask install omnidisksweeper
brew cask install onepassword
brew cask install scansnap-manager
brew cask install sequel-pro
brew cask install silverlight
brew cask install skype
brew cask install sourcetree
brew cask install spotify
brew cask install sublime-text
brew cask install teamviewer
brew cask install toggldesktop
brew cask install transmit
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
