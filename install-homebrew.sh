#!/usr/bin/env bash

# 
# Install tools using Homebrew
# 
# Usage: ./homebrew/install.sh
# 

# Ask for the administrator password upfront.
sudo -v

# Make sure we're using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Some taps
brew tap homebrew/dupes
brew tap homebrew/versions

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
#brew install bash
#brew install bash-completion

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install grep
brew install screen

# Install PHP
brew tap homebrew/homebrew-php
#brew install php55
brew install php56
brew install mcrypt
#brew install php55-mcrypt
brew install php56-mcrypt
brew install composer

# Install other useful binaries
brew install ack
brew install git
#brew install imagemagick --with-webp
# brew install p7zip
brew install pigz
# brew install pv
brew install rename
#brew install rhino
brew install tree
#brew install webkit2png
brew install unrar
#brew install zopfli

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node

# install npm tools
#npm install -g grunt-cli
#npm install -g gulp
#npm install -g bower

#
# Start stuff
#

# start php56 at login
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

# load php56 now
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist

# 
# Install native apps
# 

<<COMMENT1
brew tap caskroom/cask
brew tap caskroom/versions

brew install brew-cask

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
COMMENT1

# Remove outdated versions from the cellar
brew cleanup --force

# Fix anything?
brew doctor
