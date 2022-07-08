
###############################################################################
# iTerm                                                                       #
###############################################################################

# Install the Solarized Dark theme for iTerm
# open "${HOME}/dotfiles/iterm2/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
#defaults write com.googlecode.iterm2 PromptOnQuit -bool false


# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable spotlight
# http://apple.stackexchange.com/questions/6707/how-to-stop-os-x-from-writing-spotlight-and-trash-files-to-memory-cards-and-usb
# turn off temporary
sudo mdutil -i off /Volumes/[NAME]
# turn off permanently
sudo mdutil -d /Volumes/[NAME]
