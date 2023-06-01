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

#
# First
#

brew install --cask lulu
brew install --cask keepassxc
#brew install --cask https://raw.githubusercontent.com/Homebrew/homebrew-cask/206dcaf0333492234157167941d23ef4d40176e9/Casks/arq.rb
curl -L https://raw.githubusercontent.com/Homebrew/homebrew-cask/206dcaf0333492234157167941d23ef4d40176e9/Casks/arq.rb
brew install --cask arq.rb

# mac app store
##mas install 405399194 #Kindle
#mas install 425424353 #The Unarchiver
##mas install 497799835 #Xcode
##mas install 408981381 #iPhoto
##mas install 406056744 #Evernote
mas install 515318186 #123DMake
mas install 566042322 #123DDesign
#mas install 443987910 #1Password
mas install 463362050 #PhotoSweeper
#mas install 1000397973 #Wallcat
##mas install 404167149 #IP Scanner
mas install 403388562 #Transmit
mas install 784801555 #Microsoft OneNote
mas install 409201541 #Pages
mas install 409203825 #Numbers
mas install 1295203466 #Microsoft Remote Desktop

# apps
##brew install --cask adobe-creative-cloud
##brew install --cask adobe-reader
brew install --cask android-file-transfer
brew install --cask appcleaner
brew install --cask arq
brew install --cask authy
brew install --cask balenaetcher
brew install --cask beyond-compare
brew install --cask blender
brew install --cask calibre
brew install --cask carbon-copy-cloner
brew install --cask cleanmymac
brew install --cask cyberduck
brew install --cask daisydisk
##brew install --cask disk-drill
brew install --cask dropbox
brew install --cask firefox
brew install --cask fontbase
brew install --cask google-chrome
##brew install --cask google-chrome-canary
#brew install --cask google-drive-file-stream
brew install --cask github
brew install --cask insomnia
brew install --cask iterm2
brew install --cask keka
brew install --cask kindle
brew install --cask launchcontrol
##brew install --cask omnidisksweeper
brew install --cask quicken
brew install --cask scansnap-manager
brew install --cask sequel-pro
brew install --cask sketch
brew install --cask sourcetree
brew install --cask spotify
brew install --cask sublime-text
brew install --cask tableplus
brew install --cask teamviewer
brew install --cask thunderbird-beta
brew install --cask transmit
brew install --cask vagrant
brew install --cask virtualbox
brew install --cask vlc
brew install --cask visual-studio-code
#brew install --cask wineskin-winery
brew install --cask xmind

# fonts
#brew install --cask font-source-code-pro
##brew install --cask font-hack

# Manual install
# capture-one
# onedrive
# onenote
