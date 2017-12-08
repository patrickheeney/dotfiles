#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-apps.sh
#

source ../config.sh

# App store manager
brew install mas

# app store apps
mas signin --dialog "$MAINEMAIL"

#mas install 405399194 #Kindle (1.12.4)
mas install 425424353 #The Unarchiver (3.11.1)
#mas install 497799835 #Xcode (8.2.1)
#mas install 408981381 #iPhoto (9.6.1)
mas install 406056744 #Evernote (6.10)
mas install 515318186 #123DMake (1.6.0)
mas install 566042322 #123D Design (2.2.1)
mas install 443987910 #1Password (6.5.3)
mas install 463362050 #PhotoSweeper (2.2.6)
#mas install 803453959 #Slack (2.3.4)
mas install 1000397973 #Wallcat (1.2.0)
#mas install 404167149 #IP Scanner (3.52)
mas install 403388562 #Transmit (4.4.11)

# cask

brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew install brew-cask

# apps
#brew cask install adobe-creative-cloud
brew cask install adobe-reader
#brew cask install alfred
#brew cask install appcleaner
brew cask install arq
brew cask install beyond-compare
brew cask install cakebrew
brew cask install calibre
brew cask install cleanmymac
#brew cask install colloquy
#brew cask install dash
#brew cask install disk-drill
brew cask install dropbox
brew cask install evernote
brew cask install firefox
#brew cask install flowdock
#brew cask install flux
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-drive
#brew cask install google-hangouts
#brew cask install harvest
brew cask install iterm2
brew cask install keka
brew cask install launchcontrol
#brew cask install mailplane
brew cask install mailspring
#brew cask install moom
#brew cask install namebench
brew cask install omnidisksweeper
#brew cask install onepassword
brew cask install scansnap-manager
brew cask install sequel-pro
brew cask install sketch
brew cask install skype
#brew cask install slack
brew cask install sourcetree
brew cask install spotify
brew cask install sublime-text3
brew cask install teamviewer
brew cask install transmit
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install visual-studio-code
brew cask install wineskin-winery
brew cask install xmind

# fonts
brew cask install font-source-code-pro
#brew cask install font-hack
